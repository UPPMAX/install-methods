TOOL=/sw/apps/bioinfo/RAxML
VERSION=7.3.0
CLUSTER=rackham
OTHERCLUSTERS="irma bianca"

mkdir -p $TOOL/{$VERSION/$CLUSTER,src}
cd $TOOL/src
wget https://sco.h-its.org/exelixis/resource/download/software/RAxML-$VERSION.tar.bz2
tar xf RAxML-$VERSION.tar.bz2
cd RAxML-7.3.0
module load gcc
make -f Makefile.AVX.gcc
cp raxmlHPC-AVX ../../$VERSION/$CLUSTER
# Make a version "default"
cd $TOOL/$VERSION/$CLUSTER
ln -fs raxmlHPC-* raxmlHPC

# Make symlinks
cd $TOOL/$VERSION
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done
chgrp -R sw $TOOL/$VERSION
chmod -R g+rwx $TOOL/$VERSION
