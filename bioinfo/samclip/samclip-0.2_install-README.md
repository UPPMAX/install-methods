SWROOT=/sw/apps/bioinfo
TOOL=samclip
VERSION=0.2
CLUSTER=rackham
OTHERCLUSTER="bianca irma"

mkdir -p $SWROOT/$TOOL/$VERSION $SWROOT/$TOOL/src

cd $SWROOT/$TOOL/src
wget https://github.com/tseemann/samclip/archive/v$VERSION.tar.gz
tar xzf v$VERSION.tar.gz
mv $TOOL-$VERSION/ ../$VERSION/$CLUSTER

cd $SWROOT/$TOOL/$VERSION
for c in $OTHERCLUSTER; do
  ln -fs $CLUSTER $c
done

chgrp sw -R $SWROOT/$TOOL
chmod g+rwx -R $SWROOT/$TOOL
