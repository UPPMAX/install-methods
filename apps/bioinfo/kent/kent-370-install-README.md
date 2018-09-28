TOOL=/sw/apps/bioinfo/kent
VERSION=370 # You will need to check the URL below for its current version
CLUSTER=rackham
OTHERCLUSTERS="irma bianca"
mkdir -p $TOOL/$VERSION/$CLUSTER
cd $TOOL/$VERSION/$CLUSTER
rsync -aP rsync://hgdownload.soe.ucsc.edu/genome/admin/exe/linux.x86_64/ .
cd $TOOL/$VERSION
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done
chgrp -R sw $TOOL/$VERSION
chmod -R g+rwx $TOOL/$VERSION
