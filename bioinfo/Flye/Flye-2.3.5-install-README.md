Flye/2.3.5
==========


TOOL=/sw/bioinfo/flye
CLUSTER=rackham
VERSION=2.3.5
OTHERCLUSTERS="irma bianca"
mkdir -p $TOOL/src $TOOL/$VERSION/$CLUSTER
cd src
wget https://github.com/fenderglass/Flye/archive/2.3.5.tar.gz
tar xf $VERSION.tar.gz
cd Flye-$VERSION
python setup.py build
PYTHONUSERBASE=$TOOL/$VERSION/$CLUSTER python setup.py install --user
cd $TOOL/$VERSION
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done

# After check bin/ so that all Python application uses
# /usr/bin/env python

chgrp -R sw $TOOL
chmod g+rwx -R $TOOL
