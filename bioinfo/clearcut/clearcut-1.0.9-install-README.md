TOOL=/sw/apps/bioinfo/clearcut
VERSION=1.0.9
CLUSTER=rackham
OTHERCLUSTER="irma bianca"

mkdir -p $TOOL/{$VERSION/$CLUSTER,src}
cd $TOOL/src
wget http://www.mothur.org/w/images/9/91/Clearcut.source.zip
unzip Clearcut.source.zip
rm -rf __MACOSX
cd clearcut
make
cp clearcut ../../$VERSION/$CLUSTER
cd ..
rm -rf clearcut
cd $TOOL/$VERSION
for c in $OTHERCLUSTER; do
  ln -fs $CLUSTER $c
done
chgrp -R sw $TOOL/$VERSION
chmod -R g+rwx $TOOL/$VERSION
