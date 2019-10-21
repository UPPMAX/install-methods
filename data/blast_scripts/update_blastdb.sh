#!/bin/bash

# See README.md

# The databases to fetch:
dbs=(
    cdd_delta env_nr env_nt human_genomic nr nt other_genomic pataa patnt
    pdbaa pdbnt refseq_genomic refseq_protein refseq_rna swissprot taxdb
)

# Resource restrictions:
LFTP_PARALLEL=${LFTP_PARALLEL:-4}
MD5SUM_JOBS=${MD5SUM_JOBS:-4}
TAR_JOBS=${TAR_JOBS:-4}

staging_dir='/sw/data/uppnex/blast_tmp'         # top staging dir
files_dir="$staging_dir/files-current"          # remote files fetched
blastdb_dir="$staging_dir/blastdb"              # final extracted databases

stamp_dir="$files_dir/stamp"                    # 0-length stamp files

fetch_files () {
    local include=()
    for db in "${dbs[@]}"; do
        include+=( --include-glob "$db*" )
    done

    for dir in db db/v5; do
        printf -- '-- %s\n' "$dir"
        lftp -c mirror --parallel="${LFTP_PARALLEL}" --continue --loop \
            --no-recursion --delete \
            --exclude-glob '*' \
            "${include[@]}" \
            "ftp://ftp.ncbi.nlm.nih.gov/blast/$dir/" \
            "$files_dir/"
    done
}

verify_md5 () {
    # Verify the MD5 checksums of all archives of the databases
    # transferred during this session.  Creates md5-report.txt.

    for pathname in "$files_dir"/{db,v5}/*.md5; do
        name=${pathname##*/}
        if [[ ! -e "$stamp_dir/$name" ]] ||
           [[ "$pathname" -nt "$stamp_dir/$name" ]]
        then
            printf '%s\n' "$pathname"
        fi
    done |
    xargs -L 10 -P "$MD5SUM_JOBS" sh -c '
        stamp_dir=$1; shift
        for pathname do
            name=${pathname##*/}
            (
                cd "${pathname%/*}" &&
                md5sum -c "$name" &&
                touch "$stamp_dir/$name"
            ) || printf "ERROR in %s\n" "$pathname"
        done' sh-md5sum "$stamp_dir" |
    tee -a "$staging_dir/md5-report.txt"
}

unpack_archives () {
    # Unpacks any database archive belonging to a database that was
    # fetched in this session.

    for pathname in "$files_dir"/{db,v5}/*.tar.gz; do
        name=${pathname##*/}
        if [[ ! -e "$stamp_dir/$name" ]] ||
           [[ "$pathname" -nt "$stamp_dir/$name" ]]
        then
            printf '%s\n' "$pathname"
        fi
    done |
    xargs -L 10 -P "$TAR_JOBS" sh -c '
        stamp_dir=$1; shift
        blastdb_dir=$1; shift
        for pathname do
            name=${pathname##*/}
            printf "Unpacking %s\n" "$name"
            tar -xzf "$pathname" -C "$blastdb_dir" &&
            touch "$stamp_dir/$name" &&
            date >"$blastdb_dir/${name%%.*}.timestamp"
        done' sh-tar "$stamp_dir" "$blastdb_dir"

    ## Unconditionally delete and recreate the symbolic links.
    #find "$staging_dir/blastdb" -type l -delete
    #find "$staging_dir/blastdb" -type f -name '*.[np]al' \
    #    -execdir sh -c 'ln -sf "$1" "${1%.*}"' sh-ln {} ';'
}

printf 'Started: %s\n' "$(date)" | tee "$staging_dir/timestamp"

mkdir -p "$blastdb_dir"
mkdir -p "$files_dir"
mkdir -p "$stamp_dir"

echo '### Syncing files'
fetch_files

echo '### Verifying checksums'
rm -f "$staging_dir/md5-report.txt"
verify_md5
if [ -s "$staging_dir/md5-report.txt" ] &&
    grep -qv 'OK$' "$staging_dir/md5-report.txt"
then
    printf 'There were MD5 errors: %s\n' "$staging_dir/md5-report.txt" >&2
    exit 1
fi

echo '### Unpacking database archives'
unpack_archives

echo '### Fixing permissions'
find "$files_dir" "$blastdb_dir" \
    -type f ! -perm 664 -exec chmod 664 {} +

printf 'Finished: %s\n' "$(date)" | tee -a "$staging_dir/timestamp"
