TOOL=/sw/apps/bioinfo/msisensor
VERSION=0.5
CLUSTER=rackham
OTHERCLUSTERS="irma snowy bianca"
mkdir -p $TOOL/$VERSION/{$CLUSTER,src}
cd $TOOL/$VERSION/src
wget https://github.com/ding-lab/msisensor/archive/$VERSION.tar.gz
tar xf $VERSION.tar.gz
cd msisensor-$VERSION
module load gcc/6.3.0
make
cp msisensor ../../$CLUSTER
cd $TOOL/$VERSION
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done
cd $TOOL
chgrp -R sw $TOOL/$VERSION
chmod -R g+rwx $TOOL/$VERSION

