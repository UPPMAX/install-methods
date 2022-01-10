#!/bin/bash

IGEN=/sw/data/iGenomes
cd $IGEN

module load gnuparallel/20180822

# [[:upper:]]*/*/* represents the Genome/Source/Build directory for all iGenomes here.
#
# DO NOT create additional directories here beginning with uppercase letters

# single-threaded script, so max 10 cores at a time
#
parallel -j 10 $IGEN/iGenomes-genes.bed.sh       ::: [[:upper:]]*/*/*

# this script uses 10 cores, so max 20 cores at a time
#
parallel -j 2 $IGEN/iGenomes-STAR-2.7.x-index.sh ::: [[:upper:]]*/*/*

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
