TOOL=pigz
SWROOT=/sw/apps
VERSION=2.4
CLUSTER=rackham
OTHERCLUSTERS="bianca irma"

mkdir -p $SWROOT/$TOOL/$VERSION/$CLUSTER $SWROOT/$TOOL/src

cd $SWROOT/$TOOL/src
wget https://zlib.net/pigz/pigz-2.4.tar.gz
tar xzf pigz-2.4.tar.gz
cd pigz-2.4
make
cp pigz ../../$VERSION/$CLUSTER/
cp unpigz ../../$VERSION/$CLUSTER/
cd ../
rm -rf pigz-2.4
cd $SWROOT/$TOOL/$VERSION
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done
