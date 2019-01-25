CLUSTER=rackham
OTHERCLUSTERS="irma bianca"
VERSION=20180829
TOOL=/sw/apps/bioinfo/imputor
mkdir -p $TOOL/{$VERSION/$CLUSTER/bin,src}
cd $TOOL/src
wget https://codeload.github.com/mjobin/Imputor/zip/master
unzip master
cd Imputor-master
cp -rf scripts ../../$VERSION/$CLUSTER
cp -rf examples ../../$VERSION/$CLUSTER
cp imputor.py ../../$VERSION/$CLUSTER/bin
# Install Python requirements
cd $TOOL/$VERSION/$CLUSTER
module load python/2.7.11
for i in biopython progressbar2; do
  PYTHONUSERBASE=$PWD pip install $i --user
done
# Fix shebangs
sed -i 's!/usr/bin/python!/usr/bin/env python!g' bin/*.py scripts/*.py
chmod a+x bin/*.py
cd $TOOL/$VERSION
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done
chgrp -R sw $TOOL/$VERSION
chmod -R g+rwx $TOOL/$VERSION


