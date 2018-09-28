TOOL=/sw/apps/bioinfo/pong
VERSION=1.4.7
CLUSTER=rackham
OTHERCLUSTERS="irma bianca"
mkdir -p $TOOL/$VERSION/$CLUSTER
module load python/2.7.11
PYTHONUSERBASE=$TOOL/$VERSION/$CLUSTER pip install pong --user
cd $TOOL/$VERSION
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done
chgrp -R sw $TOOL/$VERSION
chmod -R g+rwx $TOOL/$VERSION
