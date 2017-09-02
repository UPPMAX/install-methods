Clustal Omega requires Argtable
===============================
module load gcc openmpi # openmpi not needed yet but used later
cd //////sw/apps/bioinfo/clustalo
mkdir argtable
wget http://prdownloads.sourceforge.net/argtable/argtable2-13.tar.gz
tar xzf argtable2-13.tar.gz
mv argtable2-13 src
cd src
./configure --prefix=//////sw/apps/bioinfo/clustalo/argtable
make make install
cd ..
mv src argtable2-13.tar.gz argtable
# NB: to reinstall, the src dir would probably need to be 
# moved out of the target dir (general rule)


Install Clustal Omaega 1.2
==========================
# module load gcc openmpi
# cd //////sw/apps/bioinfo/clustalo
mkdir -p 1.2/kalkyl
wget http://www.clustal.org/omega/clustal-omega-1.2.0.tar.gz
tar xzf clustal-omega-1.2.0.tar.gz  # or whatever the file is called
mv clustal-omega-1.2.0 src
cd src
# might not need to force MPI but seemed safer
# necessary to define argtable since it's in an odd location
./configure CFLAGS='-I//////sw/apps/bioinfo/clustalo/argtable/include \
-DHAVE_OPENMP' LDFLAGS='-L//////sw/apps/bioinfo/clustalo/argtable/lib' \
OPENMP_CFLAGS='-fopenmp' --prefix='//////sw/apps/bioinfo/clustalo/1.2/kalkyl'
make
make install
# mv or rm clustal-omega-1.2.0.tar.gz

Module
======
# Make usual module files with no special dependencies, not even argtable


# Wesley Schaal (wesleys)
# 2013-07-29
