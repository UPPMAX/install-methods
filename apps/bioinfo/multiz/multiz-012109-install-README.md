multiz/012109
=============

Multiz 012109

Multiz and TBA : Threaded Block Aligner for multiple genome-scale alignment

<http://www.bx.psu.edu/miller_lab/>

LOG
---

    TOOL=/sw/apps/bioinfo/multiz
    VERSION=012109
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd $CLUSTER
    PFX=$PWD
    cd ../src_$CLUSTER
    # avoid problems using ip6
    [[ -f multiz-tba.${VERSION}.tar.gz ]] || wget -4 http://www.bx.psu.edu/miller_lab/dist/multiz-tba.${VERSION}.tar.gz
    tar xvzf multiz-tba.${VERSION}.tar.gz 
    cd multiz-tba.${VERSION}/

Now comment out the usage of `-Werror`, and enable compile-time optimisation.
I assume they were just being super-safe with `-O0`: 

    vi Makefile

    < CFLAGS = -Wall -Wextra -Werror
    < CFLAGS += -O0
    --
    > CFLAGS = -Wall -Wextra
    > CFLAGS += -O2

Note also that install is to INSTALLDIR, set this for installation.  Also, build with `gcc/6.3.0`.

    module load gcc/6.3.0
    make
    make INSTALLDIR=$PFX install

Everything is installed to `$PFX`, add to `PATH` in the mf file.

Do other clusters.

