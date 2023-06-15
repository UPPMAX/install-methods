vg/1.48.0
=========

<https://biostars.org/tag/vg/>
<https://github.com/vgteam/vg>

Used under license:
mixed
<https://raw.githubusercontent.com/vgteam/vg/master/LICENSE>

Structure creating script (makeroom_vg_1.48.0.sh) moved to /sw/bioinfo/vg/makeroom_1.48.0.sh

LOG
---

I tried to build this from source, but the developers use a rather odd custom
method of building the submodules rather than rely on the native build methods.
Then, I thought I'd go the same route Björn V went and singularity pull the
Docker image But then, I finally noticed the statically built `vg` executable
at the github release page.

    makeroom.sh -f -t "vg" -v "1.48.0" -w "https://biostars.org/tag/vg/" -l "mixed" -L https://raw.githubusercontent.com/vgteam/vg/master/LICENSE -d "tools for working with genome variation graphs"
    ./makeroom_vg_1.48.0.sh 
    source /sw/bioinfo/vg/SOURCEME_vg_1.48.0
    cd $SRCDIR

    wget https://github.com/vgteam/vg/releases/download/v1.48.0/vg

    mkdir -p $PREFIX/bin
    cp -av vg $PREFIX/bin/
    cd $PREFIX/bin

Test. Clone the whole repository, copy over the test directory, and do a little testing.

    cd $SRCDIR

    ml git/2.34.1
    mkdir git
    cd git

    git clone --recursive https://github.com/vgteam/vg
    cd vg
    cp -av test $PREFIX/

    cd $PREFIX/test
    ../bin/vg  construct -r small/x.fa -v small/x.vcf.gz >x.vg
    ../bin/vg  construct -r small/x.fa -v small/x.vcf.gz >x.vg
    ../bin/vg view x.vg >x.gfa
    ../bin/vg view -d x.vg >x.dot
    cp small/x-s1337-n1.gam x.gam
    ../bin/vg view -a x.gam >x.json

Note in the mf help that this test directory is there if further testing is desired.
