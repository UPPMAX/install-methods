#!/bin/bash

# See README.md

module load gnuparallel/20170122

# The databases to fetch:
dbs=( env_nr env_nt human_genomic nr nt other_genomic pdbaa refseq_genomic
      refseq_protein refseq_rna swissprot taxdb )

# Resource restrictions:
RSYNC_JOBS=${RSYNC_JOBS:-4}
MD5SUM_JOBS=${MD5SUM_JOBS:-8}
TAR_JOBS=${TAR_JOBS:-4}

# How many times should we retry the rsync jobs?
RSYNC_RETRY_MAX=${RSYNC_RETRY_MAX:-10}

staging_dir='/sw/data/uppnex/blast_tmp'

get_remote_filelist () {
    # Creates the files.list file with database archives that should
    # be fetched.  Errors are written to rsync-errors.txt.

    printf '%s.*\n' "${dbs[@]}" |
    xargs -P 4 -I % rsync --no-motd \
            "rsync://ftp.ncbi.nlm.nih.gov/blast/db/%" | awk '{ print $NF }' \
        >"$staging_dir/files.list" 2>"$staging_dir/rsync-errors.txt"
}

rsync_filelist () {
    # Will fetch the files in files.list.  Distributes the list to four
    # rsync instances that will handle at most 100 files each before
    # they are respawned.  Errors are written to rsync-errors.txt and
    # the files that are actually fetched are logged to rsync-report.txt.

    sort -R "$staging_dir/files.list" |
    parallel --line-buffer --jobs "$RSYNC_JOBS" --pipe --cat -N 100 \
        nice rsync --no-motd --timeout=60 --archive --no-perms \
            --out-format='%t\ %i\ %b/%l\ %n' \
            --link-dest="$staging_dir/files-current" \
            --partial-dir=".rsync-partial" --files-from={} \
            "rsync://ftp.ncbi.nlm.nih.gov/blast/db/" "$staging_dir/files-new/" \
            2>>"$staging_dir/rsync-errors.txt" |
    tee -a "$staging_dir/rsync-report.txt"
}

verify_md5 () {
    # Verify the MD5 checksums of all archives of the databases
    # transferred during this session.  Creates md5-report.txt.

    for db in $(<"$staging_dir/updated.txt"); do
        find "$staging_dir/files-new" -type f \
            \( -name "$db.tar.gz.md5" -o -name "$db.*.tar.gz.md5" \) -print
    done | sort -rV |
    ( cd "$staging_dir/files-new" &&
      parallel --line-buffer --jobs "$MD5SUM_JOBS" nice md5sum -c ) |
    tee -a "$staging_dir/md5-report.txt"
}

remove_old () {
    # Removes outdated blastdb files (any blast database file belonging
    # to a transferred database whose archive files have been updated).

    for db in $(<"$staging_dir/updated.txt"); do
        find "$staging_dir/blastdb" -type f -name "$db.*" -print -delete
    done
}

unpack_new () {
    # Unpacks any database archive belonging to a database that was
    # fetched in this session.

    for db in $(<"$staging_dir/updated.txt"); do
        find "$staging_dir/files-new" -type f \
            \( -name "$db.tar.gz" -o -name "$db.*.tar.gz" \) -print
    done | sort -rV |
    parallel --line-buffer --jobs "${TAR_JOBS}" \
        nice tar -xvzf {} -C "$staging_dir/blastdb"

    ## Unconditionally delete and recreate the symbolic links.
    #find "$staging_dir/blastdb" -type l -delete
    #find "$staging_dir/blastdb" -type f -name '*.[np]al' \
    #    -execdir sh -c 'ln -sf "$1" "${1%.*}"' sh-ln {} ';'
}

printf 'Started: %s\n' "$(date)" >"$staging_dir/timestamp"

rm -f "$staging_dir/files.list"

if [ -d "$staging_dir/files-new" ]; then
    echo "### Detected interrupted run"
else
    rm -f "$staging_dir"/{md5,rsync}-{errors,report}.txt
fi

mkdir -p "$staging_dir"/{files-{new,current},blastdb}

echo '### Getting remote file list'
tries=$RSYNC_RETRY_MAX
while [ "$tries" -gt 0 ]; do
    rm -f "$staging_dir/rsync-errors.txt"
    get_remote_filelist
    [ ! -s "$staging_dir/rsync-errors.txt" ] && break
    echo 'Retrying...'
    tries=$(( tries - 1 ))
done
if [ -s "$staging_dir/rsync-errors.txt" ]; then
    printf 'There were rsync errors: %s\n' "$staging_dir/rsync-errors.txt" >&2
    exit 1
fi

echo '### Syncing file list'
tries=$RSYNC_RETRY_MAX
while [ "$tries" -gt 0 ]; do
    rm -f "$staging_dir/rsync-errors.txt"
    rsync_filelist
    [ ! -s "$staging_dir/rsync-errors.txt" ] && break
    echo 'Retrying...'
    tries=$(( tries - 1 ))
done
if [ -s "$staging_dir/rsync-errors.txt" ]; then
    printf 'There were rsync errors: %s\n' "$staging_dir/rsync-errors.txt" >&2
    exit 1
fi

awk '/tar\.gz$/ { sub(/\..*$/, "", $NF); print $NF }' \
    "$staging_dir/rsync-report.txt" |
sort -u -o "$staging_dir/updated.txt"

echo '### Verifying checksums'
rm -f "$staging_dir/md5-report.txt"
verify_md5
if [ -s "$staging_dir/md5-report.txt" ] &&
    grep -qv 'OK$' "$staging_dir/md5-report.txt"
then
    printf 'There were MD5 errors: %s\n' "$staging_dir/md5-report.txt" >&2
    exit 1
fi

echo '### Removing old database files'
remove_old

echo '### Unpacking new database files'
unpack_new

for db in $(<"$staging_dir/updated.txt"); do
    date >"$staging_dir/blastdb/$db.timestamp"
done

echo '### Fixing permissions'
find "$staging_dir/files-new" "$staging_dir/blastdb" \
    -type f ! -perm 664 -print |
xargs -r -P 4 -L 25 chmod 664

echo '### Cleaning up'
rm -rf "$staging_dir/files-current"
mv -f "$staging_dir/files-new" "$staging_dir/files-current"

printf 'Finished: %s\n' "$(date)" >>"$staging_dir/timestamp"
echo 'Done.'
date
