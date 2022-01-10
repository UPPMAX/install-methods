SWROOT=/sw/apps
VERSION=v2
TOOL=rfmix
CLUSTER=rackham
OTHERCLUSTERS="bianca irma"


mkdir -p $SWROOT/$TOOL/$VERSION $SWROOT/$TOOL/src

cd $SWROOT/$TOOL/src
wget https://codeload.github.com/slowkoni/rfmix/zip/master -O master.zip
unzip master.zip
cd rfmix-master
autoreconf --force --install
./configure --prefix=$SWROOT/$TOOL/$VERSION/$CLUSTER
make
make install
cd ..
rm -rf rfmix-master

cd $SWROOT/$TOOL/$VERSION
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c;
done
