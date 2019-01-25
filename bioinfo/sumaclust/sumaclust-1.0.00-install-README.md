TOOL=/sw/apps/bioinfo/sumaclust
VERSION=1.0.00
CLUSTER=rackham
OTHERCLUSTERS="irma bianca"

mkdir -p $TOOL/{$VERSION/$CLUSTER,src}
cd $TOOL/src
wget ftp://ftp.microbio.me/pub/QIIME-v1.9.0-dependencies/suma_package_V_$VERSION.tar.gz
tar xf suma_package_V_$VERSION.tar.gz
(cd suma_package_V_$VERSION/sumatra && make)
(cd suma_package_V_$VERSION/sumaclust && make)
cp suma_package_V_$VERSION/sumatra/sumatra ../$VERSION/$CLUSTER
cp suma_package_V_$VERSION/sumaclust/sumaclust ../$VERSION/$CLUSTER
rm -rf suma_package_V_$VERSION
cd $TOOL/$VERSION
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done
chgrp -R sw $TOOL/$VERSION
chmod g+rwx $TOOL/$VERSION
