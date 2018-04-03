#!/bin/sh

cd /sw/data/uppnex/blast_scripts || exit 1

now=$(date +%FT%T)
ncbi_log="logs/ncbi-blastdb-$now.log"
uniprot_log="logs/uniprot-blastdb-$now.log"

mkdir -p logs

./update_blastdb.sh >"$ncbi_log" 2>&1 &
./update_blastdb-uniprot.sh >"$uniprot_log" 2>&1 &

wait

gzip -f --best "$ncbi_log"
gzip -f --best "$uniprot_log"

printf '%s attached.\n' "$ncbi_log.gz" |
mailx -s 'BlastDB (NCBI) update report' \
    -r andreas.kahari@icm.uu.se \
    -a "$ncbi_log.gz" andreas.kahari@nbis.se

printf '%s attached.\n' "$uniprot_log.gz" |
mailx -s 'BlastDB (UniProt) update report' \
    -r andreas.kahari@icm.uu.se \
    -a "$uniprot_log.gz" andreas.kahari@nbis.se
