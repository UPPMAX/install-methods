TOOL=/sw/apps/bioinfo/rtax
VERSION=0.984
CLUSTER=rackham
OTHERCLUSTERS="irma bianca"
mkdir -p $TOOL/{$VERSION,src}
cd $TOOL/src
wget http://static.davidsoergel.com/rtax-0.984.tgz
tar xf rtax-$VERSION.tgz
mv rtax-$VERSION ../$VERSION/$CLUSTER
# Always check perl shebangs for hardcoded perl interpretaors
# /usr/bin/perl needs to become /usr/bin/env perl etc.
cd $TOOL/$VERSION
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done
chgrp -R sw $TOOL/$VERSION
chmod -R g+rwx $TOOL/$VERSION
