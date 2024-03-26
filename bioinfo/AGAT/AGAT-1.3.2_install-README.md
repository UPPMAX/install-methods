AGAT/1.3.2
==========

<https://github.com/NBISweden/AGAT>

Used under license:
GPL v3


Structure creating script (makeroom_AGAT_1.3.2.sh) moved to /sw/bioinfo/AGAT/makeroom_1.3.2.sh

LOG
---

    VERSION=1.3.2

    makeroom.sh -f -t AGAT -v ${VERSION} -w https://github.com/NBISweden/AGAT -s misc -l "GPL v3" -d "Another Gtf/Gff Analysis Toolkit"
    ./makeroom_AGAT_${VERSION}.sh 
    source /sw/bioinfo/AGAT/SOURCEME_AGAT_${VERSION}
    cd $SRCDIR
    wget https://github.com/NBISweden/AGAT/archive/refs/tags/v${VERSION}.tar.gz
    tar xf v${VERSION}.tar.gz 
    cd AGAT-${VERSION}/
    ml perl/5.32.1
    ml perl_modules/5.32.1
    ml bioinfo-tools
    ml BioPerl/1.7.8-perl5.32.1
    echo $PREFIX
    perl Makefile.PL PREFIX=$PREFIX
    make
    make install

Load BioPerl from the mf file, it loads perl etc on its own.

Don't know how many directories i need to set, anything for PERL5LIB? LD_LIBRARY_PATH?

AGAT/1.3.2
========================

<https://github.com/NBISweden/AGAT>

Used under license:
GPL v3


Structure creating script (makeroom_AGAT_1.3.2.sh) moved to /sw/bioinfo/AGAT/makeroom_1.3.2.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-t" "AGAT" "-v" "1.3.2" "-w" "https://github.com/NBISweden/AGAT" "-s" "misc" "-l" "GPL v3" "-d" "Another Gtf/Gff Analysis Toolkit"
    ./makeroom_AGAT_1.3.2.sh
