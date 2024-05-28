CLUSTER=rackham
OTHERCLUSTERS="irma bianca"
VERSION=1.1.4
TOOL=/sw/apps/bioinfo/InterOp
mkdir -p $TOOL/{$VERSION,src}
cd $TOOL/src
wget https://github.com/Illumina/interop/releases/download/v$VERSION/InterOp-$VERSION-Linux-GNU.tar.gz
tar xf InterOp-$VERSION-Linux-GNU.tar.gz
mv InterOp-1.1.4-Linux-GNU ../$VERSION/$CLUSTER
cd $TOOL/$VERSION
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done
chgrp -R sw $TOOL/$VERSION
chmod -R g+rwx $TOOL/$VERSION
