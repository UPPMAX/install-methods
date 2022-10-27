abricate/1.0.1-20200512-955d402
========================

<https://github.com/tseemann/abricate>

Used under license:
GPL v2.0


Structure creating script (makeroom_abricate_1.0.1-20200512-955d402.sh) moved to /sw/bioinfo/abricate/makeroom_1.0.1-20200512-955d402.sh

Installed any2fasta/0.4.2


LOG
---

    makeroom.sh -f -t abricate -v 1.0.1-20200512-955d402 -w https://github.com/tseemann/abricate -l "GPL v2.0" -d "Mass screening of contigs for antimicrobial and virulence genes"
    ./makeroom_abricate_1.0.1-20200512-955d402.sh 
    source /sw/bioinfo/abricate/SOURCEME_abricate_1.0.1-20200512-955d402 && cd $SRCDIR

    module load git/2.34.1
    module load bioinfo-tools
    module load any2fasta/0.4.2
    module load blast/2.12.0+
    module load perl/5.26.2
    module load perl_modules/5.26.2
    module load BioPerl/1.7.2_Perl5.26.2


    git clone https://github.com/tseemann/abricate
    rmdir $PREFIX
    mv abricate $PREFIX
    cd $PREFIX
    cd bin/
    ./abricate --check
    ./abricate --list

Download the local databases.

    ./abricate --setupdb
