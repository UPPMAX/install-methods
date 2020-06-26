TOOL=rsem
SWROOT=/sw/apps/bioinfo
VERSION=1.3.1
CLUSTER=rackham
OTHERCLUSTERS="bianca irma"

mkdir -p $SWROOT/$TOOL/$VERSION/$CLUSTER $SWROOT/$TOOL/src

cd $SWROOT/$TOOL/src
wget https://github.com/deweylab/RSEM/archive/v$VERSION.tar.gz
tar xf v$VERSION.tar.gz
cd RSEM-$VERSION
make
make install DESTDIR=$SWROOT/$TOOL/$VERSION prefix=/$CLUSTER

cd $SWROOT/$TOOL/$VERSION
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done
