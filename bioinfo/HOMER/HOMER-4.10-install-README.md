#!/bin/bash

SWROOT=/sw/apps/bioinfo
TOOL=HOMER
TOOLROOT=$SWROOT/$TOOL
VERSION=4.10
CLUSTER=rackham
OTHERCLUSTER="bianca irma"
INSTALLDIR=$TOOLROOT/$VERSION/$CLUSTER
genomes="mm10"

mkdir -p $TOOLROOT/$VERSION/src $INSTALLDIR
cd $INSTALLDIR
wget http://homer.ucsd.edu/homer/configureHomer.pl
perl configureHomer.pl -install
for genom in $genomes; do
  perl configureHomer.pl --install $genom
done
mv configureHomer.pl ../src/configureHomer_$VERSION.pl
cd $TOOLROOT/$VERSION
for c in $OTHERCLUSTER; do
  ln -s $CLUSTER $c
done
