CLUSTER=rackham
OTHERCLUSTERS="irma bianca"
VERSION=1.1.4
TOOL=/sw/apps/bioinfo/MAnorm

mkdir -p $TOOL/$VERSION/$CLUSTER
cd $TOOL/$VERSION/$CLUSTER
module load python/2.7.11
PYTHONUSERBASE=$PWD pip install manorm==$VERSION --user
cd ..
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done
chgrp -R sw $TOOL/$VERSION
chmod -R g+rwx $TOOL/$VERSION

