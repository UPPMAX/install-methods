hifiasm/0.16.1-r375
===================

<https://github.com/chhylp123/hifiasm>

Used under license:
MIT


Structure creating script (makeroom_hifiasm_0.16.1-r375.sh) moved to /sw/bioinfo/hifiasm/makeroom_0.16.1-r375.sh

LOG
---

Installed under the name Hifiasm with a hacked version, not useful. Recompiling
and reinstalling the same source as a properly named and versioned tool.

First stash old tool tree and remove module cache so makeroom doesn't bork the previously installed detection.

    cd /sw/bioinfo
    mv Hifiasm _hifiasm
    rm -rf /sw/mf/*/bioinfo-tools/assembly/Hifiasm
    rm -rf ~/.lmod.d

What is our actual version?

    _hifiasm/20210912-ab80851/rackham/bin/hifiasm --version

It is 0.16.1-r375. Now makeroom.

    makeroom.sh -t hifiasm -v 0.16.1-r375   -w "https://github.com/chhylp123/hifiasm"  -c "bioinfo" -s "assembly" -l "MIT" -d  "Hifiasm is a fast haplotype-resolved de novo assembler for PacBio HiFi reads."
    ./makeroom_hifiasm_0.16.1-r375.sh 
    source /sw/bioinfo/hifiasm/SOURCEME_hifiasm_0.16.1-r375
    cd $SRCDIR

Now set up and build from the previous git clone.

    mv /sw/bioinfo/_hifiasm .
    mv _hifiasm/20210912-ab80851/src/hifiasm .
    rm -rf _hifiasm
    cd hifiasm/
    make clean
    ml gcc/12.3.0
    make -j20
    mkdir -p $PREFIX/{bin,share/man/man1}
    cp -av hifiasm $PREFIX/bin/
    cp -av hifiasm.1 $PREFIX/share/man/man1/


Add $modroot/bin to PATH and $modroot/share/man to MANPATH.

    cd $TOOLDIR/mf
    vi 0.16.1-r375 

Wrap up.

    cd $TOOLDIR
    ./hifiasm-0.16.1-r375_post-install.sh
