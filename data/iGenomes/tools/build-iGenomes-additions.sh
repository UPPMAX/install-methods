#!/bin/bash

IGEN=/sw/data/iGenomes
cd $IGEN || exit 1

module load gnuparallel/20230422

# a couple of genomes don't have properly-named whole genome sequence files
#
cd $IGEN/Homo_sapiens/GATK/GRCh37/Sequence/WholeGenomeFasta
[[ -f genome.dict ]]   || ln -sf human_g1k_v37_decoy.dict            genome.dict
[[ -f genome.fa ]]     || ln -sf human_g1k_v37_decoy.fasta           genome.fa
[[ -f genome.fa.fai ]] || ln -sf human_g1k_v37_decoy.fasta.fai       genome.fa.fai

cd $IGEN/Homo_sapiens/GATK/GRCh38/Sequence/WholeGenomeFasta
[[ -f genome.dict ]]   || ln -sf Homo_sapiens_assembly38.dict        genome.dict
[[ -f genome.fa ]]     || ln -sf Homo_sapiens_assembly38.fasta       genome.fa
[[ -f genome.fa.fai ]] || ln -sf Homo_sapiens_assembly38.fasta.fai   genome.fa.fai


cd $IGEN

# [[:upper:]]*/*/* represents the Genome/Source/Build directory for all iGenomes here.
#
# DO NOT create additional directories here beginning with uppercase letters

# single-threaded script, so max 10 cores at a time
#
parallel -j 10 $IGEN/tools/iGenomes-genes.bed.sh       ::: [[:upper:]]*/*/*

# this script uses 10 cores, so max 20 cores at a time
#
parallel -j 2 $IGEN/tools/iGenomes-STAR-2.7.x-index.sh ::: [[:upper:]]*/*/*

# we have not created an entry for building bowtie1 Bismark indices.
#

# #for v in tes*/*/*
# #for v in [P-S]*/*/*
# #for v in A*/*/*
# for v in [[:upper:]]*/*/*
# do
#     echo $v
#     $IGEN/iGenomes-STAR-2.7.x-index.sh $v
#     #sleep 1
#     $IGEN/iGenomes-genes.bed.sh $v
#     #sleep 1
#     cd $IGEN
# done
