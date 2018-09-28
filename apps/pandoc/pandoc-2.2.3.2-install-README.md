CLUSTER=rackham
OTHERCLUSTERS="irma snowy bianca"
VERSION=2.2.3.2
TOOL=/sw/apps/pandoc
mkdir -p $TOOL/$VERSION/src
cd $TOOL/$VERSION/src
wget https://github.com/jgm/pandoc/releases/download/2.2.3.2/pandoc-2.2.3.2-linux.tar.gz
tar xf pandoc-2.2.3.2-linux.tar.gz
mv pandoc-2.2.3.2 ../$CLUSTER
cd ..
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done
chgrp -R sw $TOOL/$VERSION
chmod -R g+rwx $TOOL/$VERSION
