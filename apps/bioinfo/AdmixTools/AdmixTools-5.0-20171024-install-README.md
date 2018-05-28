AdmixTools-5.0-20171024-install-README.md
=========================================

<https://github.com/DReichLab/AdmixTools>

LOG
---

No longer a need to adjust Makefile.  Load openblas/0.2.19 and gsl/2.3 modules
to provide needed libraries, and that should be it.

    cd /sw/apps/bioinfo/AdmixTools/
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    VERSION=5.0-20171024
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    PFX=$PWD/$CLUSTER
    cd src
    [[ -d AdmixTools ]] || git clone https://github.com/DReichLab/AdmixTools
    cd AdmixTools
    cd src/
    module load gcc/6.3.0
    module load openblas/0.2.19
    module load gsl/2.3
    make clobber
    make all
    make install

Installs into `../bin/`.

    cd ../bin

Make R scripts find R from PATH, but we needn't load R, this is just in case.

    cd bin
    chmod +x rexpfit.r 
    vi rexpfit.r 

Specific changes:

    $ diff ../../src/AdmixTools/src/rexpfit.r rexpfit.r
    1c1
    < #!/usr/bin/Rscript
    ---
    > #!/usr/bin/env Rscript

Do the same with the Perl script, and let it discover its `BIN` variable (the
`bin` of the module) using the `FindBin` module.

    vi wtjack.pl 

Specific changes:

    diff ../../src/AdmixTools/src/wtjack.pl wtjack.pl
    1c1
    < #!/usr/bin/perl
    ---
    > #!/usr/bin/env perl
    2a3
    > use FindBin;
    6c7,8
    < $BIN ="/groups/reich/pm82/dev/ADMIXTOOLS/bin";
    ---
    > #$BIN ="/groups/reich/pm82/dev/ADMIXTOOLS/bin";
    > $BIN = $FindBin::RealBin;

And finally, with the shell script expfit.sh.

    $ diff ../../src/AdmixTools/src/expfit.sh expfit.sh
    4c4
    < BIN=/sw/apps/bioinfo/AdmixTools/5.0-20171024/src/AdmixTools/src/../bin
    ---
    > BIN=/sw/apps/bioinfo/AdmixTools/5.0-20171024/${CLUSTER}/bin


Now copy over to CLUSTER directory.

    cd ..

    cp -av bin $PFX/

