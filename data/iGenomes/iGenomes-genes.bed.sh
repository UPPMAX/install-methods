#!/bin/bash

# Drawn from Wes's original script that built genes.bed files for each
# genes.gtf file.  It seems that iGenomes now includes genes.bed for each
# genes.gtf under Annotation/Genes/, so don't rebuild if genes.bed already
# exists.

IGEN=/sw/data/iGenomes
VICT=$IGEN/$1
echo "$VICT -- checking for genes.gtf and genes.bed"

if [[ -e $VICT/Annotation/Genes/genes.gtf && ! -e $VICT/Annotation/Genes/genes.bed ]]
then
    cd $VICT/Annotation/Genes
    echo -e "\nworking directory  -- $PWD\n"
    CMD="$IGEN/gtf2bed.pl genes.gtf > genes.bed"
    echo "$CMD"
    eval $CMD
fi

