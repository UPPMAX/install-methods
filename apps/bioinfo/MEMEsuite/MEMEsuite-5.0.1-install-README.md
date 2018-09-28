# MEMEsuite-5.0.1-install-README.md

MEMEsuite/5.0.1
==================

The MEME Suite: Motif-based sequence analysis tools


<http://meme-suite.org/tools/meme>


LOG
---
CLUSTER=rackham
VERSION=5.0.1
mkdir  -p $VERSION/$CLUSTER/src
cd !$
wget http://meme-suite.org/doc/download.html/
tar zxf meme_5.0.1.tar.gz
cd meme-5.0.1

# I used latest gcc and MPI - and didnt feel too bad about it either.
# MPI is needed to be in the environment for configure to recognize it
module load gcc/8.2.0 openmpi
# Perl with lots of modules is needed as a requisites
module load perl_modules/5.18.4

# You check if dependencies are satisfied by running cd scripts; perl dependencies.pl

/configure prefix=/sw/apps/bioinfo/MEMEsuite/5.0.1/rackham --with-url=http://meme-suite.org
make && make test && make install
cd ../../
for $c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done

fixup -g

NOTE! I had 2 failed tests related to some diff with a .tsv table and .html. The rest PASSED.



