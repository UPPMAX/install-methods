CLUSTER=rackham
OTHERCLUSTERS="irma bianca"
TOOL=sqlite
SWROOT=/sw/apps/$TOOL
VERSION=3.24.0

mkdir -p $SWROOT/$VERSION $SWROOT/src
cd $SWROOT/src
wget https://www.sqlite.org/2018/sqlite-autoconf-3240000.tar.gz
tar xf sqlite-autoconf-3240000.tar.gz
cd sqlite-autoconf-3240000
./configure --prefix=$SWROOT/$VERSION/$CLUSTER
make
make install
cd ..
rm -rf sqlite-autoconf-3240000

cd $SWROOT/$VERSION
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done
