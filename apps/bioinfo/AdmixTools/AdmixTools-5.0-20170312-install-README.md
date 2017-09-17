AdmixTools-5.0-20170312-install-README.md
=========================================

<https://github.com/DReichLab/AdmixTools>

LOG
---

    cd /sw/apps/bioinfo/AdmixTools/
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    VERSION=5.0-20170312
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    cd src
    [[ -d AdmixTools ]] || git clone https://github.com/DReichLab/AdmixTools
    cd AdmixTools

Wes's instructions show that we should modify the makefile to point to local
openblas.  I'll copy over his Makefile.

    diff ../../../20160803/milou/src/Makefile src/Makefile
    mv src/Makefile src/Makefile.orig
    cp ../../../20160803/milou/src/Makefile src/Makefile

Any other makefiles?

    find . -name '*Makefile*'

Nope.

    cd src/
    module load gcc/6.3.0
    make clobber
    make all
    make install

Installs into `../bin/`.  It won't work to change `BIN` in the makefile, we just
move them later.

    cd ../

Make R scripts find R from PATH, but we needn't load R, this is just in case.

    cd bin
    vi rexpfit.r 
    chmod +x rexpfit.r 

Do the same with the Perl script, and let it discover its `BIN` variable (the
`bin` of the module) using the `FindBin` module.

    vi wtjack.pl 

Now copy over to CLUSTER directory.

    cd ..

    cp -av bin ../../$CLUSTER/

