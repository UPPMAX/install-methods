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


2022-04-21
----------

Further adjustments to correct for download errors.  The error is

    + kraken2-build --use-ftp --standard --threads 20 --db /sw/data/Kraken2_data/20220404-131350
    Downloading nucleotide gb accession to taxon map... done.
    Downloading nucleotide wgs accession to taxon map... done.
    Downloaded accession to taxon map(s)
    Downloading taxonomy tree data... done.
    Uncompressing taxonomy data... done.
    Untarring taxonomy tree data... done.
    Step 1/2: Performing ftp file transfer of requested files
    Step 2/2: Assigning taxonomic IDs to sequences
    All files processed, cleaning up extra sequence files... done, library complete.
    Masking low-complexity regions of downloaded library... done.
    Step 1/2: Performing ftp file transfer of requested files
    Step 2/2: Assigning taxonomic IDs to sequences
    All files processed, cleaning up extra sequence files... done, library complete.
    Masking low-complexity regions of downloaded library... done.
    Step 1/2: Performing ftp file transfer of requested files
    Step 2/2: Assigning taxonomic IDs to sequences
    All files processed, cleaning up extra sequence files... done, library complete.
    Masking low-complexity regions of downloaded library... done.
    Downloading plasmid files from FTP...awk: fatal: cannot open file `.listing' for reading (No such file or directory)

Found solution, editing `download_genomic_library.sh` following

https://github.com/DerrickWood/kraken2/issues/543#issuecomment-1049987176

    cd /sw/bioinfo/Kraken2/2.1.2-20211210-4f648f5/rackham

Get the patch contents from 

https://github.com/DerrickWood/kraken2/issues/412#issuecomment-790593080

and create plasmid_fix.patch.  Then create backup:

    cp -av download_genomic_library.sh download_genomic_library.sh.orig

and apply patch:

    patch download_genomic_library.sh plasmid_fix.patch

Verify:

    diff download_genomic_library.sh.orig download_genomic_library.sh

shows

    65c65,70
    <     wget -q --no-remove-listing --spider $FTP_SERVER/genomes/refseq/plasmid/
    ---
    >     ## WR: fixing the broken wget
    >     # wget -q --no-remove-listing --spider $FTP_SERVER/genomes/refseq/plasmid/
    >     curl -s $FTP_SERVER/genomes/refseq/plasmid/ \
    >         | perl -nle 'print  "$1"  while (/<a\s+href\s*=\s*"([^"]+.gz)"/g)' \
    >         | sort -u \
    >         > .listing
