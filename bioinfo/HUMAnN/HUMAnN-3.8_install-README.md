HUMAnN/3.8
========================

<https://github.com/biobakery/humann3>

Used under license:
MIT license


Structure creating script (makeroom_HUMAnN_3.8.sh) moved to /sw/bioinfo/HUMAnN/makeroom_3.8.sh

LOG
---

    TOOL=HUMAnN
    VERSION=3.8
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" $TOOL "-v" $VERSION "-w" "https://github.com/biobakery/humann3" "-c" "bioinfo" "-l" "MIT license" "-d" "\(the HMP Unified Metabolic Analysis Network\) is a method for efficiently and accurately profiling the abundance of microbial metabolic pathways and other molecular functions from metagenomic or metatranscriptomic sequencing data." "-s" "misc" "-x" "INSTALL" "-f"
    ./makeroom_HUMAnN_3.8.sh
    source /sw/bioinfo/HUMAnN/SOURCEME_HUMAnN_3.8 && cd $SRCDIR

    wget https://github.com/biobakery/humann/archive/refs/tags/v${VERSION}.tar.gz
    tar xzvf v${VERSION}.tar.gz
    cd humann-$VERSION
    PYTHONUSERBASE=$PREFIX python setup.py install --user --bypass-dependencies-install
    cp -r readme.md examples/ $PREFIX/
    
## Install glpk-5.0    
    cd $SRCDIR
    wget http://ftp.gnu.org/gnu/glpk/glpk-5.0.tar.gz
    tar xzvf glpk-5.0.tar.gz
    cd glpk-5.0/
    ml gcc/11.3.0
    ./configure --prefix=$PREFIX
    make
    make install


## Test after module is set
   humann_test --run-functional-tests-end-to-end
    
