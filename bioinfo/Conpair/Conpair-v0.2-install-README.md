TOOL=/sw/apps/bioinfo/Conpair
CLUSTER=rackham
OTHERCLUSTERS="snowy irma bianca"
VERSION=0.2
mkdir -p $TOOL/$VERSION/src
cd $TOOL/$VERSION/src
wget https://github.com/nygenome/Conpair/archive/v$VERSION.tar.gz
tar xf v$VERSION.tar.gz
mv Conpair-$VERSION ../$CLUSTER
cd $TOOL/$VERSION
for c in $OTHERCLUSTERS; do 
  ln -fs $CLUSTER $c
done
chgrp -R sw $TOOL/$VERSION
chmod -R g+rwx $TOOL/$VERSION

# Ensure the shebangs is correct - mine were!
