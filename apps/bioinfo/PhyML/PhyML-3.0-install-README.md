CLUSTER=rackham
OTHERCLUSTERS="irma bianca"
VERSION=3.1
TOOL=/sw/apps/bioinfo/PhyML

mkdir -p $TOOL/{$VERSION/$CLUSTER,src}
cd $TOOL/src
wget http://www.atgc-montpellier.fr/download/binaries/phyml/PhyML-$VERSION.zip
unzip PhyML-$VERSION.zip
# Pre-compiled binaries
cp PhyML-$VERSION/PhyML-${VERSION}_linux64 $TOOL/$VERSION/$CLUSTER/
rm -rf PhyML-$VERSION
cd $TOOL/$VERSION/$CLUSTER
ln -s PhyML-${VERSION}_linux64 phyml
cd ..
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done
chgrp -R sw $TOOL/$VERSION
chmod -R g+rwx $TOOL/$VERSION
