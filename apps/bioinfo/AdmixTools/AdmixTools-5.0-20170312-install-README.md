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

    diff src/Makefile ../../../20160803/milou/src/Makefile

Which produces

    16a17
    > BLASLIB= -L/sw/libs/openblas/0.2.14a/$(CLUSTER)/lib
    25c26
    < QCC =  -Wl,-Bdynamic -lgsl -Wl,-Bstatic -l$(BLAS) -Wl,-Bdynamic -lgfortran  -lm
    ---
    > QCC =  -Wl,-Bdynamic -lgsl -Wl,-Bstatic $(BLASLIB) -l$(BLAS) -Wl,-Bdynamic -lgfortran  -lm
    136c137
    <     gcc -I$(IDIR) $(DEBUG_OPTIONS) -l$(BLAS) -fopenmp $(M8O) $(NLIB) $(QCC) -o $(M8)
    ---
    >     gcc -I$(IDIR) $(DEBUG_OPTIONS) $(BLASLIB) -l$(BLAS) -fopenmp $(M8O) $(NLIB) $(QCC) -o $(M8)
    139c140
    <     gcc -I$(IDIR) $(DEBUG_OPTIONS) -l$(BLAS) -fopenmp $(M9O) $(NLIB) $(QCC) -o $(M9)
    ---
    >     gcc -I$(IDIR) $(DEBUG_OPTIONS) $(BLASLIB) -l$(BLAS) -fopenmp $(M9O) $(NLIB) $(QCC) -o $(M9)
    170c171
    <
    ---
    >
    208c209
    <     gcc -I$(IDIR) $(DEBUG_OPTIONS) -lgsl -lopenblas -lm -llapack -o $(M9F2) $(M9F2O) $(NLIB)
    ---
    >     gcc -I$(IDIR) $(DEBUG_OPTIONS) -lgsl $(BLASLIB) -l$(BLAS) -lm -llapack -o $(M9F2) $(M9F2O) $(NLIB)

So use the new Makefile.

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

