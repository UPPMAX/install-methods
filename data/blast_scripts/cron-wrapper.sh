#!/bin/sh

cd /sw/data/blast_scripts || exit 1

#EMAIL="lars.eklund@uppmax.uu.se"
#EMAIL2="lars.eklund@nbis.se"
EMAIL="douglas.scofield@uppmax.uu.se"
EMAIL2="douglas.scofield@uppmax.uu.se"

now=$(date +'%Y%m%d-%H%M%S')
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
    -r "$EMAIL" \
    -a "$ncbi_log.gz" "$EMAIL2"

printf '%s attached.\n' "$uniprot_log.gz" |
mailx -s 'BlastDB (UniProt) update report' \
    -r "$EMAIL" \
    -a "$uniprot_log.gz" "$EMAIL2"
