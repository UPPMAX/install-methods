#!/bin/bash

# See README.md

# The databases to fetch.
# The release names for human_genome and mouse_genome are added to this
dbs=(
    16S_ribosomal_RNA
    18S_fungal_sequences
    28S_fungal_sequences
    Betacoronavirus
    cdd_delta
    env_nr
    env_nt
    human_genome
    ITS_eukaryote_sequences
    ITS_RefSeq_Fungi
    landmark
    LSU_eukaryote_rRNA
    LSU_prokaryote_rRNA
    mito
    mouse_genome
    nr
    nt
    pataa
    patnt
    pdbaa
    pdbnt
    ref_euk_rep_genomes
    ref_prok_rep_genomes
    ref_viroid_rep_genomes
    ref_viruses_rep_genomes 
    refseq_protein
    refseq_rna
    refseq_select_prot
    refseq_select_rna
    SSU_eukaryote_rRNA
    swissprot
    taxdb
    tsa_nr
    tsa_nt
)

# Resource restrictions:
LFTP_PARALLEL=${LFTP_PARALLEL:-4}
MD5SUM_JOBS=${MD5SUM_JOBS:-4}
TAR_JOBS=${TAR_JOBS:-4}

staging_dir='/sw/data/blast_tmp'         # top staging dir
files_dir="$staging_dir/files-current"          # remote files fetched
blastdb_dir="$staging_dir/blastdb"              # final extracted databases

stamp_dir="$files_dir/stamp"                    # 0-length stamp files

fetch_files () {
    local include=()
    for db in "${dbs[@]}"; do
        include+=( --include-glob "$db*" )
    done

    for dir in db ; do  # no longer download v4 DGS 2022-01-05
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

    for pathname in "$files_dir"/db/*.md5; do
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

    for pathname in "$files_dir"/db/*.tar.gz; do
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

stage_json () {
    # preserve-copy downloaded json files into the staging directory
    cd "$blastdb_dir"
    cp -pv "$files_dir"/db/*.json .
}

create_symlinks () {
    # a small list of dbs unpacks to a specific release, rather than the
    # general name they are downloaded wtih.  this determines what that root
    # name is, adds symlinks for each file, and creates a reverse symlink for
    # the json file and the timestamp
    symlink_dbs=(
        human_genome
        mouse_genome
    )
    cd "$blastdb_dir"
    for db in "${symlink_dbs[@]}" ; do
        release_name=$(tar tf "$files_dir"/db/${db}.00.tar.gz | grep '\.[np]al$')
        release_name=${release_name%.?al}
        echo "create_symlinks: basename for $db identified as $release_name"
        for F in ${release_name}* ; do
            symlink_name=${F/$release_name/$db}
            ln -sfv $F $symlink_name
        done
        for F in ${db}*json ; do
            symlink_name=${F/$db/$release_name}
            ln -sfv $F $symlink_name
        done
        ln -sfv $db.timestamp $release_name.timestamp
    done
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

echo '### Staging JSON files'
stage_json

echo '### Creating helpful symlinks for a few databases'
create_symlinks

echo '### Fixing permissions'
find "$files_dir" "$blastdb_dir" \
    -type f ! -perm 664 -exec chmod 664 {} +

printf 'Finished: %s\n' "$(date)" | tee -a "$staging_dir/timestamp"
