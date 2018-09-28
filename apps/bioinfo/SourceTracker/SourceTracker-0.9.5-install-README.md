TOOL=/sw/apps/bioinfo/SourceTracker
VERSION=0.9.5
CLUSTER=rackham
OTHERCLUSTERS="irma bianca"
mkdir -p $TOOL/{$VERSION,src}
cd $TOOL/src
wget http://downloads.sourceforge.net/project/sourcetracker/sourcetracker-$VERSION.tar.gz
tar xf sourcetracker-$VERSION.tar.gz
mv sourcetracker-$VERSION ../$VERSION/$CLUSTER
cd $TOOL/$VERSION
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done
chgrp -R sw $TOOL/$VERSION
chmod g+rwx $TOOL/$VERSION
