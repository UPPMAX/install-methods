#!/bin/bash

# checks compabitility of databases with various versions of the diamond module

module load bioinfo-tools
module load gnuparallel/20230422

ROOT=/sw/data/diamond_databases

# The database query command 'getseq' didn't appear until diamond 0.8.x so don't check 0.7.x

for VERSION in 0.8.26 0.9.10 0.9.24 0.9.26 0.9.29 2.0.9 2.0.14 2.1.0 2.1.1 2.1.6 2.1.9; do
    module load diamond/$VERSION
    echo -e "\n$0: checking databases with $(diamond version)\n"
    find . -name '*.dmnd' | parallel -v --line-buffer -j 1 diamond getseq --db {} '|' head '>/dev/null' 
done


# If we need one, a test sequence that could be used is the first protein from RefSeq release 83,
# file complete.nonredundant_protein.1.protein.faa.gz, sequence 'WP_038491126.1 fumarylacetoacetate hydrolase [Collimonas arenae]'
#
# >WP_038491126.1 fumarylacetoacetate hydrolase [Collimonas arenae]
# MLLVQFKQADGQRRIGVLEDECRKIRVVEGYNSTYGLAQAAIAADSTLKALAAAGLGDTVLDYDTVAQARQLLPPLEHGD
# SAHCYVTGTGLTHLGSADGRDAMHKKISDVDTLTDSMKMFRMGLEGGKPAAGEAGVQPEWFYKGDGSIVRAAEQPLTMPH
# FALDGGEEPEIAALYVIGPDGDPYRLGFAIGNEFSDHVTERQNYLYLAHSKLRVCAVGPALLVGDLPAHVAGMSRIRDSQ
# GQVRWEKPFVSGEENMSHTVANLEYHHFKYPLFRRPGDVHIHFFGTATLSCSDGIQVAHGETFEIDVAAFGPPLRNRLAV
# ETLAAPRIHQL

