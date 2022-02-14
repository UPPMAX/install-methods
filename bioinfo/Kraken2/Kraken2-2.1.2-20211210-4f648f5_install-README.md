Kraken2/2.1.2-20211210-4f648f5
==============================

<https://github.com/DerrickWood/kraken2>

Used under license:
MIT


Structure creating script (makeroom_Kraken2_2.1.2-20211210-4f648f5.sh) moved to /sw/bioinfo/Kraken2/makeroom_2.1.2-20211210-4f648f5.sh


Use a couple commits ahead of the 2.1.2 release because they contain necessary updates for the database download scripts.



LOG
---

    makeroom.sh "-f" "-t" "Kraken2" "-v" "2.1.2-20211210-4f648f5" "-w" "https://github.com/DerrickWood/kraken2" "-d" "a taxonomic classification system using exact k-mer matches to achieve high accuracy and fast classification speeds" "-l" "MIT"
    ./makeroom_Kraken2_2.1.2-20211210-4f648f5.sh
    source /sw/bioinfo/Kraken2/SOURCEME_Kraken2_2.1.2-20211210-4f648f5
    cd $SRCDIR
    module load git/2.34.1
    module load gcc/9.3.0
    git clone https://github.com/DerrickWood/kraken2
    cd kraken2
    git reset --hard 4f648f5
    ./install_kraken2.sh $PREFIX
    cd $PREFIX

Check that all the perl scripts have proper `#!` lines.  They do.  Also check
that all required modules are included in the system perl.  They are.  These
should perform fine whether system perl or a module perl is used.

    grep -h '^use ' *.pl kraken2* | sort -Vu
    head -n 1 *.sh *.pl kraken2* | grep perl

Check the executables, that RPATH is saved.

    module unload gcc
    file build_db
    ldd build_db
    file classify
    ldd classify

Now to update how Kraken2 databases are built.

