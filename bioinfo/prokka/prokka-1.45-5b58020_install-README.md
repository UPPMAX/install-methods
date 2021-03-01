prokka/1.45-5b58020
========================

<https://github.com/tseemann/prokka>

Used under license:
GPL-v3
<https://raw.githubusercontent.com/tseemann/prokka/master/doc/LICENSE.Prokka>

Structure creating script (makeroom_prokka_1.45-5b58020.sh) moved to /sw/bioinfo/prokka/makeroom_1.45-5b58020.sh

LOG
---

    TOOL=prokka
    VERSION=1.45-5b58020
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/prokka/1.45-5b58020/src
    /home/laekl991/scripts/install-methods/makeroom.sh -t "prokka" -v "1.45-5b58020" -c "bioinfo" -s "annotation" -w "https://github.com/tseemann/prokka" -l "GPL-v3" -L "https://raw.githubusercontent.com/tseemann/prokka/master/doc/LICENSE.Prokka" -d "Prokka is a software tool to annotate bacterial\, archaeal and viral genomes quickly and produce standards-compliant output files." -f"
    ./makeroom_prokka_1.45-5b58020.sh
prokka/1.12-12547ca
===================

Clone prokka 1.12 with some additional fixes, so version includes commit hash.
Since we are versioning with the hash, reset the head after cloning to the top
hash as of this installation.

After cloning, move the repository to the `$CLUSTER` directory.

Lots of prerequisites.


LOG
---

    COMMIT_HASH=12547ca979d0f43d041426c69358579867ec5fa2
    VERSION=1.12-${COMMIT_HASH:0:7}
    echo "VERSION being used is '$VERSION'"
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p /sw/apps/bioinfo/prokka
    cd /sw/apps/bioinfo/prokka
    mkdir -p $VERSION
    cd $VERSION
    PFX=$PWD/$CLUSTER
    rm -rf $CLUSTER
    [[ $CLUSTER == rackham ]] && { rm -f bianca irma ; ln -s $CLUSTER bianca ; ln -s $CLUSTER irma ; }
    mkdir src
    cd src
    module load git/2.16.1
    git clone https://github.com/tseemann/prokka.git
    cd prokka
    git reset --hard $COMMIT_HASH
    cd ..
    mv prokka $PFX

    module load bioinfo-tools

    module load gnuparallel/20170122
    module load perl/5.24.1
    module load perl_modules/5.24.1
    module load BioPerl/1.7.1_Perl5.24.1
    module load blast/2.6.0+
    module load hmmer/3.1b2
    module load aragorn/1.2.38
    module load prodigal/2.6.3
    module load tbl2asn/25.3
    module load SignalP/4.1f
    module load barrnap/0.8
    module load minced/0.2.0

    cd $PFX/bin
    ./prokka --setupdb

Load the above modules in the mf file (not `bioinfo-tools` obviously).
