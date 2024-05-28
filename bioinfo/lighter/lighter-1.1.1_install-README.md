SWROOT=/sw/apps/bioinfo
TOOL=lighter
VERSION=1.1.1
CLUSTER=rackham
OTHERCLUSTERS="bianca irma"


mkdir -p $SWROOT/$TOOL/$VERSION/$CLUSTER $SWROOT/$TOOL/src
cd $SWROOT/$TOOL/src
wget https://github.com/mourisl/Lighter/archive/v1.1.1.tar.gz
tar xzf v1.1.1.tar.gz
cd Lighter-1.1.1
make
cp lighter ../../$VERSION/$CLUSTER/
cd ../
rm -rf Lighter-1.1.1

cd $SWROOT/$TOOL/$VERSION
for c in $OTHERCLUSTERS; do
   ln -fs $CLUSTER $c
done
