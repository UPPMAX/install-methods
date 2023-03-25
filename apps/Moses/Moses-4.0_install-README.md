Moses/4.0
========================

<https://www2.statmt.org/moses/>

Used under license:
LGPL v2.1


Structure creating script (makeroom_Moses_4.0.sh) moved to /sw/apps/Moses/makeroom_4.0.sh

LOG
---

    /home/matpiq/install-methods/makeroom.sh "-f" "-t" "Moses" "-v" "4.0" "-c" "apps" "-w" "https://www2.statmt.org/moses/" "-l" "LGPL v2.1" "-k" "NLP" "-d" "Moses is a statistical machine translation system that allows you to automatically train translation models for any language pair." "-k" "NLP"
    ./makeroom_Moses_4.0.sh


Download and compile Moses from source with boost
   
   cd $SRCDIR
   ml gcc/10.3.0 openmpi/4.1.1 boost/1.81.0-gcc10.3.0-mpi4.1.1
   wget https://github.com/moses-smt/mosesdecoder/archive/refs/tags/RELEASE-4.0.tar.gz
   tar xvfz RELEASE-4.0.tar.gz
   mv mosesdecoder-RELEASE-4.0 $PREFIX
   cd $PREFIX/mosesdecode-RELEASE-4.0
   ./bjam -j8 --with-boost=/sw/libs/boost/1.81.0-gcc10.3.0-mpi4.1.1/rackham/lib


