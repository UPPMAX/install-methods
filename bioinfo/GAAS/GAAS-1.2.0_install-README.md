GAAS/1.2.0
==========

<https://github.com/NBISweden/GAAS>

Used under license:
GPL v3


Structure creating script (makeroom_GAAS_1.2.0.sh) moved to /sw/bioinfo/GAAS/makeroom_1.2.0.sh

NBIS toolset


LOG
---

    PERLVERSION=5.26.2
    BIOPERLVERSION=1.7.2_Perl${PERLVERSION}

    makeroom.sh -t GAAS -v 1.2.0 -c bioinfo -s misc -w https://github.com/NBISweden/GAAS -l "GPL v3" -d "Suite of tools related to Genome Assembly Annotation Service tasks"
    ./makeroom_GAAS_1.2.0.sh 
    source /sw/bioinfo/GAAS/SOURCEME_GAAS_1.2.0 && cd $SRCDIR
    wget https://github.com/NBISweden/GAAS/archive/refs/tags/v1.2.0.tar.gz
    tar xf v1.2.0.tar.gz 
    cd GAAS-1.2.0/
    module load bioinfo-tools BioPerl/$BIOPERLVERSION
    perl Makefile.PL PREFIX=$PREFIX
    make 
    make test
    make install


In the mf file, add $modroot/bin to PATH, $modroot/lib/site_perl/5.26.2 to PERL5LIB and $modroot/share/man to MANPATH.

