#!/bin/bash

# Drawn from Wes's original script that built genes.bed files for each
# genes.gtf file.  It seems that iGenomes now includes genes.bed for each
# genes.gtf under Annotation/Genes/, so don't rebuild if genes.bed already
# exists.

IGEN=/sw/data/iGenomes
VICT=$IGEN/$1
echo -n "$VICT -- checking for genes.gtf ... "

[[ ! -e $VICT/Annotation/Genes/genes.gtf ]] && { echo "none"; exit 0; }
echo -n "genes.bed ... "
[[ -e $VICT/Annotation/Genes/genes.bed ]] && { echo "found"; exit 0; }

cd $VICT/Annotation/Genes
#echo -n "building ... "
CMD="$IGEN/tools/gtf2bed.pl genes.gtf > genes.bed"
echo -e "$CMD ..."
eval $CMD
echo "done"
