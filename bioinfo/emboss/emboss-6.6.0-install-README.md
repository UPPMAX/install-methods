SWROOT=/sw/apps/bioinfo
TOOL=emboss
VERSION=6.6.0
CLUSTER=rackham
OTHERCLUSTER="bianca irma"
mkdir -p $SWROOT/$TOOL/$VERSION $SWROOT/$TOOL/src
cd $SWROOT/$TOOL/src
wget ftp://emboss.open-bio.org/pub/EMBOSS/EMBOSS-6.6.0.tar.gz
tar xf EMBOSS-6.6.0.tar.gz
cd EMBOSS-6.6.0
./configure --prefix=$SWROOT/$TOOL/$VERSION/$CLUSTER
make
make install
cd ..
rm -rf EMBOSS-6.6.0
cd $SWROOT/$TOOL/$VERSION
for c in $OTHERCLUSTER; do
  ln -fs $CLUSTER $c
done
chgrp -R sw $SWROOT/$TOOL/$VERSION
chmod -R g+rwx $SWROOT/$TOOL/$VERSION

