#!/bin/bash

[[ $(uname -n) = 'milou-b.uppmax.uu.se' ]] || { echo "$0: This is a long multi-core process and must be run on milou-b"; exit 1; }

module load bioinfo-tools
module load blast/2.6.0+

# the staging directory used while testing the new databases
export BLASTDB=/sw/data/uppnex/blast_databases_new

echo -e "\n$0: using BLASTDB=$BLASTDB so waiting 10 seconds before proceeding...\n"
sleep 10

PROTEIN_DBS=(env_nr nr pdbaa refseq_protein swissprot uniprot_all uniprot_all.fasta uniprot_sptrembl uniprot_trembl uniprot_uniref100 uniprot_uniref50 uniprot_uniref90)

for D in ${PROTEIN_DBS[@]} ; do
    echo -e "\n$0: testing $D\n"
    blastp -db $D -query prots.fa -num_threads 16 -num_descriptions 4 -num_alignments 2 | tee ${D}.test.out
done

NUCLEOTIDE_DBS=(env_nt human_genomic nt other_genomic refseq_genomic refseq_rna)

for D in ${NUCLEOTIDE_DBS[@]} ; do
    echo -e "\n$0: testing $D\n"
    blastn -db $D -query nucls.fa -num_threads 16 -num_descriptions 4 -num_alignments 2 | tee ${D}.test.out
done

