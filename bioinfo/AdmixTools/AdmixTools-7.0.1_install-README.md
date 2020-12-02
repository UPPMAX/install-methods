AdmixTools/7.0.1
========================

<https://github.com/DReichLab/AdmixTools>

Used under license:
Open-source as is

Structure creating script (makeroom_AdmixTools_7.0.1.sh) moved to /sw/bioinfo/AdmixTools/makeroom_7.0.1.sh

LOG
---

No longer a need to adjust Makefile.  Load openblas/0.2.20 and gsl/2.6 modules
to provide needed libraries, a new gcc, and that should be it.

    TOOL=AdmixTools
    VERSION=${VERSION}
    cd /sw/bioinfo/${TOOL}/
    makeroom.sh -f -t ${TOOL} -v ${VERSION} -w https://github.com/DReichLab/${TOOL} -d "implements five methods described in Patterson et al. (2012) Ancient admixture in human history" -l "Open-source as is"
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION} 
    vi ${TOOL}-${VERSION}_post-install.sh 
    cd ${VERSION}/
    cd src/
    wget https://github.com/DReichLab/${TOOL}/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz 
    cd ${TOOL}-${VERSION}/
    module load gsl/2.6
    module load openblas/0.2.20
    module load gcc/8.3.0

We built with gcc/8.3.0 but openblas/0.2.20 built with gcc/6.3.0 ... probably not an issue.

    cd src
    make clobber
    make all
    make TOP=$PREFIX/bin install
    cd $PREFIX/bin

Make R scripts find R from PATH, but we needn't load R, this is just in case.

    chmod +x rexpfit.r 
    vi rexpfit.r 

Specific changes:

    diff ../../src/${TOOL}-${VERSION}/src/rexpfit.r rexpfit.r >> ../../../${TOOL}-${VERSION}_install-README.md 
    1c1
    < #!/usr/bin/Rscript
    ---
    > #!/usr/bin/env Rscript


Do the same with the Perl script, and let it discover its `BIN` variable (the
`bin` of the module) using the `FindBin` module.

    vi wtjack.pl 

Specific changes:

    diff ../../src/${TOOL}-${VERSION}/src/wtjack.pl wtjack.pl >> ../../../${TOOL}-${VERSION}_install-README.md 

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


And finally, with the shell script expfit.sh.  Specific changes:

    diff ../../src/${TOOL}-${VERSION}/src/expfit.sh expfit.sh >> ../../../${TOOL}-${VERSION}_install-README.md 
    4c4
    < BIN=/sw/bioinfo/AdmixTools/7.0.1/src/AdmixTools-7.0.1/src/../bin
    ---
    > BIN=/sw/bioinfo/AdmixTools/7.0.1/${CLUSTER}/bin


Can the libraries be found?
