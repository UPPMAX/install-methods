silva/138.1
=========

The silva database of ribosomal RNA clusters.

<https://www.arb-silva.de/>

Version 138.1

LOG
---

    VERSION=138.1
    cd /sw/data/silva

    mkdir $VERSION
    cd $VERSION

    SITE=https://www.arb-silva.de/fileadmin/silva_databases/release_${VERSION}/Exports
    WGET="wget --timestamping --continue"

    #
    # main directory
    #

    $WGET $SITE/LICENSE.txt
    $WGET $SITE/README.txt
    $WGET $SITE/SILVA_${VERSION}_LSUParc_tax_silva.fasta.gz
    $WGET $SITE/SILVA_${VERSION}_LSUParc_tax_silva.fasta.gz.md5
    $WGET $SITE/SILVA_${VERSION}_LSUParc_tax_silva_trunc.fasta.gz
    $WGET $SITE/SILVA_${VERSION}_LSUParc_tax_silva_trunc.fasta.gz.md5
    $WGET $SITE/SILVA_${VERSION}_LSURef_NR99_tax_silva.fasta.gz
    $WGET $SITE/SILVA_${VERSION}_LSURef_NR99_tax_silva.fasta.gz.md5
    $WGET $SITE/SILVA_${VERSION}_LSURef_NR99_tax_silva_full_align_trunc.fasta.gz
    $WGET $SITE/SILVA_${VERSION}_LSURef_NR99_tax_silva_full_align_trunc.fasta.gz.md5
    $WGET $SITE/SILVA_${VERSION}_LSURef_NR99_tax_silva_trunc.fasta.gz
    $WGET $SITE/SILVA_${VERSION}_LSURef_NR99_tax_silva_trunc.fasta.gz.md5
    $WGET $SITE/SILVA_${VERSION}_LSURef_tax_silva.fasta.gz
    $WGET $SITE/SILVA_${VERSION}_LSURef_tax_silva.fasta.gz.md5
    $WGET $SITE/SILVA_${VERSION}_LSURef_tax_silva_full_align_trunc.fasta.gz
    $WGET $SITE/SILVA_${VERSION}_LSURef_tax_silva_full_align_trunc.fasta.gz.md5
    $WGET $SITE/SILVA_${VERSION}_LSURef_tax_silva_trunc.fasta.gz
    $WGET $SITE/SILVA_${VERSION}_LSURef_tax_silva_trunc.fasta.gz.md5
    $WGET $SITE/SILVA_${VERSION}_SSUParc_tax_silva.fasta.gz
    $WGET $SITE/SILVA_${VERSION}_SSUParc_tax_silva.fasta.gz.md5
    $WGET $SITE/SILVA_${VERSION}_SSUParc_tax_silva_trunc.fasta.gz
    $WGET $SITE/SILVA_${VERSION}_SSUParc_tax_silva_trunc.fasta.gz.md5
    $WGET $SITE/SILVA_${VERSION}_SSURef_NR99_tax_silva.fasta.gz
    $WGET $SITE/SILVA_${VERSION}_SSURef_NR99_tax_silva.fasta.gz.md5
    $WGET $SITE/SILVA_${VERSION}_SSURef_NR99_tax_silva_full_align_trunc.fasta.gz
    $WGET $SITE/SILVA_${VERSION}_SSURef_NR99_tax_silva_full_align_trunc.fasta.gz.md5
    $WGET $SITE/SILVA_${VERSION}_SSURef_NR99_tax_silva_trunc.fasta.gz
    $WGET $SITE/SILVA_${VERSION}_SSURef_NR99_tax_silva_trunc.fasta.gz.md5
    $WGET $SITE/SILVA_${VERSION}_SSURef_tax_silva.fasta.gz
    $WGET $SITE/SILVA_${VERSION}_SSURef_tax_silva.fasta.gz.md5
    $WGET $SITE/SILVA_${VERSION}_SSURef_tax_silva_full_align_trunc.fasta.gz
    $WGET $SITE/SILVA_${VERSION}_SSURef_tax_silva_full_align_trunc.fasta.gz.md5
    $WGET $SITE/SILVA_${VERSION}_SSURef_tax_silva_trunc.fasta.gz
    $WGET $SITE/SILVA_${VERSION}_SSURef_tax_silva_trunc.fasta.gz.md5

    for F in *.md5 ; do
        md5sum -c $F
    done


    #
    # full_metadata subdirectory
    #

    SUBDIR=full_metadata
    mkdir $SUBDIR
    cd $SUBDIR

    $WGET $SITE/$SUBDIR/LICENSE.txt
    $WGET $SITE/$SUBDIR/SILVA_${VERSION}_LSUParc.full_metadata.gz
    $WGET $SITE/$SUBDIR/SILVA_${VERSION}_LSUParc.full_metadata.gz.md5
    $WGET $SITE/$SUBDIR/SILVA_${VERSION}_LSURef.full_metadata.gz
    $WGET $SITE/$SUBDIR/SILVA_${VERSION}_LSURef.full_metadata.gz.md5
    $WGET $SITE/$SUBDIR/SILVA_${VERSION}_LSURef_Nr99.full_metadata.gz
    $WGET $SITE/$SUBDIR/SILVA_${VERSION}_LSURef_Nr99.full_metadata.gz.md5
    $WGET $SITE/$SUBDIR/SILVA_${VERSION}_SSUParc.full_metadata.gz
    $WGET $SITE/$SUBDIR/SILVA_${VERSION}_SSUParc.full_metadata.gz.md5
    $WGET $SITE/$SUBDIR/SILVA_${VERSION}_SSURef.full_metadata.gz
    $WGET $SITE/$SUBDIR/SILVA_${VERSION}_SSURef.full_metadata.gz.md5
    $WGET $SITE/$SUBDIR/SILVA_${VERSION}_SSURef_Nr99.full_metadata.gz
    $WGET $SITE/$SUBDIR/SILVA_${VERSION}_SSURef_Nr99.full_metadata.gz.md5

    for F in *.md5 ; do
        md5sum -c $F
    done

    cd ..



    #
    # taxonomy subdirectory
    #

    SUBDIR=taxonomy
    mkdir $SUBDIR
    cd $SUBDIR

    $WGET $SITE/$SUBDIR/LICENSE.txt
    $WGET $SITE/$SUBDIR/taxmap_slv_lsu_parc_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/taxmap_slv_lsu_parc_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/taxmap_slv_lsu_ref_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/taxmap_slv_lsu_ref_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/taxmap_slv_lsu_ref_nr_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/taxmap_slv_lsu_ref_nr_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/taxmap_slv_ssu_parc_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/taxmap_slv_ssu_parc_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/taxmap_slv_ssu_ref_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/taxmap_slv_ssu_ref_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/taxmap_slv_ssu_ref_nr_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/taxmap_slv_ssu_ref_nr_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/tax_slv_lsu_${VERSION}.acc_taxid.gz
    $WGET $SITE/$SUBDIR/tax_slv_lsu_${VERSION}.acc_taxid.gz.md5
    $WGET $SITE/$SUBDIR/tax_slv_lsu_${VERSION}.diff.gz
    $WGET $SITE/$SUBDIR/tax_slv_lsu_${VERSION}.diff.gz.md5
    $WGET $SITE/$SUBDIR/tax_slv_lsu_${VERSION}.map.gz
    $WGET $SITE/$SUBDIR/tax_slv_lsu_${VERSION}.map.gz.md5
    $WGET $SITE/$SUBDIR/tax_slv_lsu_${VERSION}.tre.gz
    $WGET $SITE/$SUBDIR/tax_slv_lsu_${VERSION}.tre.gz.md5
    $WGET $SITE/$SUBDIR/tax_slv_lsu_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/tax_slv_lsu_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/tax_slv_ssu_${VERSION}.acc_taxid.gz
    $WGET $SITE/$SUBDIR/tax_slv_ssu_${VERSION}.acc_taxid.gz.md5
    $WGET $SITE/$SUBDIR/tax_slv_ssu_${VERSION}.diff.gz
    $WGET $SITE/$SUBDIR/tax_slv_ssu_${VERSION}.diff.gz.md5
    $WGET $SITE/$SUBDIR/tax_slv_ssu_${VERSION}.map.gz
    $WGET $SITE/$SUBDIR/tax_slv_ssu_${VERSION}.map.gz.md5
    $WGET $SITE/$SUBDIR/tax_slv_ssu_${VERSION}.tre.gz
    $WGET $SITE/$SUBDIR/tax_slv_ssu_${VERSION}.tre.gz.md5
    $WGET $SITE/$SUBDIR/tax_slv_ssu_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/tax_slv_ssu_${VERSION}.txt.gz.md5

    for F in *.md5 ; do
        md5sum -c $F
    done

    SUBSUBDIR=ncbi
    mkdir $SUBSUBDIR
    cd $SUBSUBDIR

    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_embl-ebi_ena_lsu_parc_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_embl-ebi_ena_lsu_parc_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_embl-ebi_ena_lsu_ref_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_embl-ebi_ena_lsu_ref_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_embl-ebi_ena_lsu_ref_nr99_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_embl-ebi_ena_lsu_ref_nr99_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_embl-ebi_ena_ssu_parc_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_embl-ebi_ena_ssu_parc_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_embl-ebi_ena_ssu_ref_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_embl-ebi_ena_ssu_ref_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_embl-ebi_ena_ssu_ref_nr99_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_embl-ebi_ena_ssu_ref_nr99_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_ncbi_lsu_parc_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_ncbi_lsu_parc_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_ncbi_lsu_ref_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_ncbi_lsu_ref_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_ncbi_lsu_ref_nr99_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_ncbi_lsu_ref_nr99_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_ncbi_ssu_parc_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_ncbi_ssu_parc_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_ncbi_ssu_ref_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_ncbi_ssu_ref_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_ncbi_ssu_ref_nr99_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/taxmap_ncbi_ssu_ref_nr99_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi-species_lsu_parc_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi-species_lsu_parc_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi-species_lsu_ref_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi-species_lsu_ref_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi-species_lsu_ref_nr99_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi-species_lsu_ref_nr99_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi-species_ssu_parc_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi-species_ssu_parc_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi-species_ssu_ref_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi-species_ssu_ref_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi-species_ssu_ref_nr99_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi-species_ssu_ref_nr99_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi_lsu_parc_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi_lsu_parc_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi_lsu_ref_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi_lsu_ref_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi_lsu_ref_nr99_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi_lsu_ref_nr99_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi_ssu_parc_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi_ssu_parc_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi_ssu_ref_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi_ssu_ref_${VERSION}.txt.gz.md5
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi_ssu_ref_nr99_${VERSION}.txt.gz
    $WGET $SITE/$SUBDIR/$SUBSUBDIR/tax_ncbi_ssu_ref_nr99_${VERSION}.txt.gz.md5

    for F in *.md5 ; do
        md5sum -c $F
    done

    cd ..

    cd ..



    #
    #
    # set up latest/ symlink
    #
    #

    cd ..

    test -L latest && rm -f latest
    ln -sf $VERSION latest

