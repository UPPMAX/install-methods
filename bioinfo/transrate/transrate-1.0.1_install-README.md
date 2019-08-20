VERSION=1.0.1
CLUSTER=$CLUSTER
OTHERCLUSTERS="irma bianca snowy"
mkdir -p $VERSION/{$CLUSTER,src_$CLUSTER}
cd $VERSION/src_$CLUSTER
wget https://bintray.com/artifact/download/blahah/generic/transrate-$VERSION-linux-x86_64.tar.gz
tar xf *.tar.gz
mv transrate*/* ../$CLUSTER
rmdir transrate* 2>/dev/null # Ignore error about tar.gz not being a directory
cd ..
for c in $OTHERCLUSTERS; do
   ln -fs $CLUSTER $c
done

