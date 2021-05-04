snippy/4.6.0
========================

<https://github.com/tseemann/snippy>

Used under license:
GPL v2 license
<>

Structure creating script (makeroom_snippy_4.6.0.sh) moved to /sw/bioinfo/snippy/makeroom_4.6.0.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "snippy" -v "4.6.0" -w "https://github.com/tseemann/snippy" -c "bioinfo" -l "GPL v2 license" -d "finds SNPs between a haploid reference genome and your NGS sequence reads." -x "INSTALL" -f
    ./makeroom_snippy_4.6.0.sh
    cd /sw/bioinfo/snippy/
    . SOURCEME_snippy_4.6.0
    cd $SRCDIR    
    wget https://github.com/tseemann/snippy/archive/v$VERSION.tar.gz
    tar xf v$VERSION.tar.gz
    rm -rf $PREFIX
    mv snippy-$VERSION $PREFIX
    cd $PREFIX
#---testing module   
    snippy --check
#---install local any2fasta
    cd $SRCDIR
    git clone https://github.com/tseemann/any2fasta.git
    cp any2fasta/any2fasta $PREFIX/bin
