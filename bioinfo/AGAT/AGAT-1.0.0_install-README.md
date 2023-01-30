AGAT/1.0.0
==========

<https://github.com/NBISweden/AGAT>

Used under license:
GPL v3


Structure creating script (makeroom_AGAT_1.0.0.sh) moved to /sw/bioinfo/AGAT/makeroom_1.0.0.sh

LOG
---

    cd /sw/bioinfo/
    makeroom.sh -t AGAT -v 1.0.0 -w https://github.com/NBISweden/AGAT -s misc -l "GPL v3" -d "Another Gtf/Gff Analysis Toolkit"
    ./makeroom_AGAT_1.0.0.sh 
    source /sw/bioinfo/AGAT/SOURCEME_AGAT_1.0.0 && cd $SRCDIR
    wget https://github.com/NBISweden/AGAT/archive/refs/tags/v1.0.0.tar.gz
    tar xf v1.0.0.tar.gz 
    cd AGAT-1.0.0/
    ml bioinfo-tools
    ml perl/5.26.2 perl_modules/5.26.2 BioPerl/1.7.2_Perl5.26.2
    echo $PREFIX
    perl Makefile.PL PREFIX=$PREFIX
    make
    make install

Load BioPerl from the mf file, it loads perl etc on its own.

Don't know how many directories i need to set, anything for PERL5LIB? LD_LIBRARY_PATH?
