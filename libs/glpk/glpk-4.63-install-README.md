GLPK installation
=================

VERSION=4.63
cd /sw/libs/glpk/$VERSION
wget http://ftp.gnu.org/gnu/glpk/glpk-$VERSION.tar.gz
tar -xvzf glpk-$VERSION-tar.gz
mv glpk-$VERSION source
cd source
./configure --prefix=/sw/libs/glpk/$VERSION/$CLUSTER
make check && make install
