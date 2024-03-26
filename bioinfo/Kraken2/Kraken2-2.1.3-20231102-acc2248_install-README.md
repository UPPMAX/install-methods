Kraken2/2.1.3-20231102-acc2248
==============================

<https://github.com/DerrickWood/kraken2>

Used under license:
MIT


Structure creating script (makeroom_Kraken2_2.1.3-20231102-acc2248.sh) moved to /sw/bioinfo/Kraken2/makeroom_2.1.3-20231102-acc2248.sh


Install a commits ahead of the 2.1.3 release because it contains several download fixes.


LOG
---

    COMMIT=acc2248

    makeroom.sh "-f" "-t" "Kraken2" "-v" "2.1.3-20231102-$COMMIT" "-w" "https://github.com/DerrickWood/kraken2" "-d" "a taxonomic classification system using exact k-mer matches to achieve high accuracy and fast classification speeds" "-l" "MIT"
    ./makeroom_Kraken2_2.1.3-20231102-$COMMIT.sh

    source /sw/bioinfo/Kraken2/SOURCEME_Kraken2_2.1.3-20231102-acc2248
    cd $SRCDIR

    module load git/2.34.1
    module load gcc/12.3.0
    module load zlib/1.3
    git clone https://github.com/DerrickWood/kraken2
    cd kraken2
    git reset --hard $COMMIT
    ./install_kraken2.sh $PREFIX
    cd $PREFIX

Check that all the perl scripts have proper `#!` lines.  They do.  Also check
that all required modules are included in the system perl.  They are.  These
should perform fine whether system perl or a module perl is used.

    grep -h '^use ' *.pl kraken2* | sort -Vu
    head -n 1 *.sh *.pl kraken2* | grep perl

Check the executables, that RPATH is saved.

    module purge
    for PROG in estimate_capacity build_db classify dump_table lookup_accession_numbers k2mask ; do
        echo "checking build robustness of $PROG ..."
        file $PROG
        ldd $PROG
        echo
        echo
    done

Now to update how Kraken2 databases are built.

Now to wrap up. Update to blast/2.14.1+ for dustmasker/segmasker.

    cd $PREFIX
    grep dustmasker *
    grep segmasker *
    vi mask_low_complexity.sh 
    cd $TOOLDIR/mf
    vi 2.1.3-20231102-acc2248 

The only difference between the mf of 2.1.2-* and 2.1.3-* should be the loaded blast version.

    diff 2.1.?-*

Wrap up.

    cd $TOOLDIR
    ./Kraken2-2.1.3-20231102-acc2248_post-install.sh
