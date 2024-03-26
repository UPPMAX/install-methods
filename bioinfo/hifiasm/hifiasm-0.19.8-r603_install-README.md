hifiasm/0.19.8-r603
===================

<https://github.com/chhylp123/hifiasm>

Used under license:
MIT


Structure creating script (makeroom_hifiasm_0.19.8-r603.sh) moved to /sw/bioinfo/hifiasm/makeroom_0.19.8-r603.sh

LOG
---

    makeroom.sh -f -t hifiasm -v 0.19.8-r603   -w "https://github.com/chhylp123/hifiasm"  -c "bioinfo" -s "assembly" -l "MIT" -d  "Hifiasm is a fast haplotype-resolved de novo assembler for PacBio HiFi reads."
    ./makeroom_hifiasm_0.19.8-r603.sh 
    source /sw/bioinfo/hifiasm/SOURCEME_hifiasm_0.19.8-r603
    cd $SRCDIR
    wget https://github.com/chhylp123/hifiasm/archive/refs/tags/0.19.8.tar.gz
    tar xf 0.19.8.tar.gz 
    cd hifiasm-0.19.8/
    ml gcc/12.3.0
    ml zlib/1.3
    make -j10
    ml purge
    ldd hifiasm
    mkdir -p $PREFIX/{bin,share/man/man1}
    cp -av hifiasm.1 $PREFIX/share/man/man1/
    cp -av hifiasm $PREFIX/bin/

Add $modroot/bin to PATH and $modroot/share/man to MANPATH.

    cd $TOOLDIR/mf
    vi 0.19.8-r603

Wrap up.

    cd $TOOLDIR
    ./hifiasm-0.19.8-r603-install.sh
