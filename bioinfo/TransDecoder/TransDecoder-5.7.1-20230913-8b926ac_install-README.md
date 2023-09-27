TransDecoder/5.7.1-20230913-8b926ac
===================================

<https://github.com/TransDecoder/TransDecoder/wiki>

Used under license:
Custom open-source 'AS IS'
<https://github.com/TransDecoder/TransDecoder/blob/master/LICENSE.txt>

Structure creating script (makeroom_TransDecoder_5.7.1-20230913-8b926ac.sh) moved to /sw/bioinfo/TransDecoder/makeroom_5.7.1-20230913-8b926ac.sh

The versioning reflects that we take version 5.7.1 but include everything up to
the latest commit after that version was set, as of 2023-Sep-22, which includes
some nice fixes that it would be good to have.

LOG
---

    makeroom.sh -f -t TransDecoder -v 5.7.1-20230913-8b926ac -w https://github.com/TransDecoder/TransDecoder/wiki -l "Custom open-source 'AS IS'" -L https://github.com/TransDecoder/TransDecoder/blob/master/LICENSE.txt -d "identifies candidate coding regions within transcript sequences"
    ./makeroom_TransDecoder_5.7.1-20230913-8b926ac.sh 
    source /sw/bioinfo/TransDecoder/SOURCEME_TransDecoder_5.7.1-20230913-8b926ac
    cd $SRCDIR
    ml git/2.34.1
    git clone --recursive https://github.com/TransDecoder/TransDecoder
    cd TransDecoder/
    git reset --hard 8b926ac
    rmdir $PREFIX
    mv TransDecoder $PREFIX
    cd $PREFIX

Test.

    ml bioinfo-tools perl_modules/5.26.2 blast/2.14.1+ hmmer/3.3.2
    make test
    make clean

Get one error using `sudo`, why? so find it, remove it, and re-clean.

    find . -type f -print0 | xargs -0 grep -Hn sudo
    vi ./sample_data/simple_transcriptome_target/cleanme.pl
    make clean

Load these in the mf file: perl_modules/5.26.2 blast/2.14.1+ hmmer/3.3.2
Make sure that these are added to `PATH` with `prepend-path` in this order:

* $modroot/util/PWM
* $modroot/util/misc
* $modroot/util
* $modroot


    vi $TOOLDIR/mf/5.7.1-20230913-8b926ac

Wrap up.

    cd $TOOLDIR
    ./TransDecoder-5.7.1-20230913-8b926ac_post-install.sh

