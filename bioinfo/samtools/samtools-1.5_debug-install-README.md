VERSION=1.5
VERSIONUPPMAX=1.5_debug
CLUSTER=${CLUSTER:?CLUSTER must be set}
TOOL=/sw/apps/bioinfo/samtools/
cd $TOOL
mkdir $VERSIONUPPMAX
cd $VERSIONUPPMAX
mkdir src $CLUSTER
cd $CLUSTER
PFX=$PWD
cd ../src
[[ -f samtools-${VERSION}.tar.bz2 ]] || wget https://github.com/samtools/samtools/releases/download/${VERSION}/samtools-${VERSION}.tar.bz2
tar xjf samtools-${VERSION}.tar.bz2 
mv samtools-${VERSION} samtools-${VERSIONUPPMAX}-${CLUSTER}
# Apply patch to log and abort at IO-errors
cp $TOOL/patches/cne_bgzf.c samtools-${VERSIONUPPMAX}-${CLUSTER}/htslib-1.5/bgzf.c
cd samtools-${VERSIONUPPMAX}-${CLUSTER}/
./configure --prefix=$PFX
make
make test
make install

