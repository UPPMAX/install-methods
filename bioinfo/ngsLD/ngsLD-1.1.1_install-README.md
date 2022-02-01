ngsLD/1.1.1
===========

<https://github.com/fgvieira/ngsLD>

Used under license:
GPL-2.0


Structure creating script (makeroom_ngsLD_1.1.1.sh) moved to /sw/bioinfo/ngsLD/makeroom_1.1.1.sh

LOG
---

    makeroom.sh -c bioinfo -s misc -t ngsLD -v 1.1.1 -w https://github.com/fgvieira/ngsLD -d "Calculation of pairwise Linkage Disequilibrium (LD) under a probabilistic framework" -l "GPL-2.0"
    ./makeroom_ngsLD_1.1.1.sh 
    source /sw/bioinfo/ngsLD/SOURCEME_ngsLD_1.1.1 && cd $SRCDIR
    wget https://github.com/fgvieira/ngsLD/archive/refs/tags/v1.1.1.tar.gz
    tar xf v1.1.1.tar.gz 
    1010  cd ngsLD-1.1.1/
    module load zlib/1.2.11
    module load gsl/2.6
    module load gcc/9.3.0
    make


`make test` doesn't work, partially from needing perl_modules loaded (solvable)
but mostly from ngsLD needing to be installed within the
<https://github.com/mfumagalli/ngsTools> framework.

Check library paths and script paths and install.

    ml purge
    ldd ngsLD
    cp -av ngsLD $PREFIX
    cp -av scripts $PREFIX
    cd $PREFIX/scripts/
    head -n 1 *

For the mf, add `$modroot` and `$modroot/scripts` to `PATH`.  The auxiliary
scripts need perl modules, so issue a message to the user to load
`perl_modules/5.26.2` and `R_packages/4.1.1` to use them.


