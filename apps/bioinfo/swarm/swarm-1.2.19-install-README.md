TOOL=/sw/apps/bioinfo/swarm
VERSION=1.2.19
CLUSTER=rackham
OTHERCLUSTER="irma bianca"
mkdir -p $TOOL/{$VERSION/$CLUSTER/{bin,man/man1},src}
cd $TOOL/src
wget https://github.com/torognes/swarm/archive/$VERSION.tar.gz
tar xf $VERSION.tar.gz
cd swarm-$VERSION
make
gzip -c swarm.1 > swarm.1.gz
cp swarm ../../$VERSION/$CLUSTER/bin
cp -rf scripts ../../$VERSION/$CLUSTER
for file in swarm.1 swarm.1.gz; do
  cp $file ../../$VERSION/$CLUSTER/man/man1
done
cd ..
rm -rf swarm-$VERSION
cd $TOOL/$VERSION
for c in $OTHERCLUSTER; do
  ln -fs $CLUSTER $c
done
chgrp -R sw $TOOL/$VERSION
chmod -R g+rwx $TOOL/$VERSION

# Manually check the scripts directory for hard coded
# python shebangs
