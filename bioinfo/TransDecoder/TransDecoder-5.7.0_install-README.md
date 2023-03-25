TransDecoder/5.7.0
==================

<https://github.com/TransDecoder/TransDecoder/wiki>

Used under license:
Custom open-source 'AS IS'
<https://github.com/TransDecoder/TransDecoder/blob/master/LICENSE.txt>

Structure creating script (makeroom_TransDecoder_5.7.0.sh) moved to /sw/bioinfo/TransDecoder/makeroom_5.7.0.sh

LOG
---

    TOOL=TransDecoder
    VERSION=5.7.0
    makeroom.sh -f -t $TOOL -v $VERSION -w https://github.com/TransDecoder/TransDecoder/wiki -l "Custom open-source 'AS IS'" -L https://github.com/TransDecoder/TransDecoder/blob/master/LICENSE.txt -d "identifies candidate coding regions within transcript sequences"
    ./makeroom_TransDecoder_5.7.0.sh 
    source /sw/bioinfo/TransDecoder/SOURCEME_TransDecoder_5.7.0 
    cd $SRCDIR
    wget https://github.com/TransDecoder/TransDecoder/archive/TransDecoder-v5.7.0.tar.gz
    tar xf TransDecoder-v5.7.0.tar.gz 
    rmdir $PREFIX
    mv TransDecoder-TransDecoder-v5.7.0 $PREFIX
    cd $PREFIX

Run a test.

    module load perl_modules/5.26.2 bioinfo-tools blast/2.13.0+ hmmer/3.2.1
    make test
    make clean

In the mf file, load perl/5.26.2, perl_modules/5.26.2, blast/2.13.0+, hmmer/3.2.1.
Make sure that these are added to `PATH`:

* $modroot
* $modroot/util
* $modroot/util/misc
* $modroot/util/PWM

