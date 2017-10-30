#!/bin/sh

now=$(date +%FT%T)
cd /sw/data/uppnex/blast_scripts || exit 1

mkdir -p logs

./update_blastdb.sh >"logs/nbci-blastdb-$now.log" 2>&1 &
./update_blastdb-uniprot.sh >"logs/uniprot-blastdb-$now.log" 2>&1 &

wait

printf '%s/%s attached.\n' "$PWD" "logs/nbci-blastdb-$now.log" |
mailx -s "BlastDB (NCBI) update report" -a "logs/nbci-blastdb-$now.log" andrek@localhost
printf '%s/%s attached.\n' "$PWD" "logs/uniprot-blastdb-$now.log" |
mailx -s "BlastDB (UniProt) update report" -a "logs/uniprot-blastdb-$now.log" andrek@localhost
