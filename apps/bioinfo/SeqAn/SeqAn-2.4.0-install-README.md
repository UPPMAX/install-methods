CLUSTER=rackham
OTHERCLUSTERS="irma bianca"
VERSION=2.4.0
TOOL=/sw/apps/bioinfo/SeqAn

mkdir -p $TOOL/{$VERSION/$CLUSTER/python_packages,src}
cd $TOOL/src

wget https://github.com/seqan/seqan/releases/download/seqan-v2.4.0/seqan-library-2.4.0.tar.xz
# Install include headers
tar xf seqan-library-2.4.0.tar.xz
cp -rf seqan-library-2.4.0/* ../$VERSION/$CLUSTER

# Build applications
wget http://packages.seqan.de/seqan-src/seqan-src-2.4.0.tar.gz
tar xf seqan-src-2.4.0.tar.gz
cd seqan-seqan-v2.4.0

# Prepare to build
module load cmake
module load gcc
module load python/2.7.11 # For sphinx

# Install requirements
# I used system boost and zlib (no complaints)
req="sphinx"
PUB=$TOOL/$VERSION/$CLUSTER/python_packages
for r in $req; do
  PYTHONUSERBASE=$PUB pip install $r --user
done
export PYTHONPATH=$PUB/lib/python2.7/site-packages:$PYTHONPATH
mkdir -p build 
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$TOOL/$VERSION/$CLUSTER -DSPHINX_EXECUTABLE=$PUB/bin/sphinx-build
make -j 20
make install
cd $TOOL/$VERSION
for c in $OTHERCLUSTERS; do
  ln -fs $CLUSTER $c
done
chgrp -R sw $TOOL/$VERSION
chmod -R g+rwx $TOOL/$VERSION
