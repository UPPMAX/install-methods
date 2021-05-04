SMC++/1.15.2
============

<https://github.com/popgenmethods/smcpp>

Used under license:
GPL v3

Structure creating script (makeroom_SMC++_1.15.2.sh) moved to /sw/bioinfo/SMC++/makeroom_1.15.2.sh


LOG
---

Build with system gcc, mpfr, gsl, gmp, and python/3.8.7.


    TOOL=SMC++
    VERSION=1.15.2
    cd /sw/bioinfo
    makeroom.sh -f -s misc -t $TOOL -v $VERSION -w https://github.com/popgenmethods/smcpp -d "infers population history from whole-genome sequence data" -l "GPL v3"
    ./makeroom_SMC++_1.15.2.sh 
    cd SMC++/
    source SOURCEME_SMC++_1.15.2 
    cd $SRCDIR
    ml git/2.28.0
    git clone https://github.com/popgenmethods/smcpp
    cd smcpp
    ml python/3.8.7
    PYTHONUSERBASE=$PREFIX pip install --user .
