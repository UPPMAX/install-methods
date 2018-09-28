CLUSTER=rackham
OTHERCLUSTERS="irma bianca"
VERSION=1.0.2
TOOL=/sw/apps/bioinfo/infernal
mkdir -p $TOOL/{$VERSION,src}
cd $TOOL/src
wget http://eddylab.org/software/infernal/infernal-$VERSION.tar.gz
tar xf infernal-$VERSION.tar.gz
cd infernal-$VERSION
./configure --prefix=$TOOL/$VERSION/$CLUSTER
make -j 8
make install
cd ..
rm -rf infernal-$VERSION
cd $TOOL/$VERSION
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done
chgrp -R sw $TOOL/$VERSION
chmod -R g+rwx $TOOL/$VERSION
