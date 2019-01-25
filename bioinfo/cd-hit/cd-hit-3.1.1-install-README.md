TOOL=/sw/apps/bioinfo/cd-hit
VERSION=3.1.1
CLUSTER=rackham
OTHERCLUSTERS="irma bianca"

mkdir -p $TOOL/{$VERSION/$CLUSTER,src}
cd $TOOL/src
wget http://www.bioinformatics.org/download/cd-hit/cd-hit-2007-0131.tar.gz
tar xf cd-hit-2007-0131.tar.gz
cd cd-hit
make
cp cd-hit ../../$VERSION/$CLUSTER
cp *.pl ../../$VERSION/$CLUSTER
cd ..
rm -rf cd-hit

cd $TOOL/$VERSION/$CLUSTER
sed -i 's!/usr/bin/perl!/usr/bin/env perl!g' *.pl

cd ..
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done
