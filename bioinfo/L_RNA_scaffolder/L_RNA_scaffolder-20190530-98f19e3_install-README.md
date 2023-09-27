L_RNA_scaffolder/20190530-98f19e3
=================================

<https://github.com/CAFS-bioinformatics/L_RNA_scaffolder>

Used under license:

None provided.

Structure creating script (makeroom_L_RNA_scaffolder_20190530-98f19e3.sh) moved to /sw/bioinfo/L_RNA_scaffolder/makeroom_20190530-98f19e3.sh

LOG
---

    makeroom.sh -f -t L_RNA_scaffolder -v 20190530-98f19e3 -c bioinfo -s assembly -w https://github.com/CAFS-bioinformatics/L_RNA_scaffolder -d "Use long transcriptome reads to scaffold genomes"
    ./makeroom_L_RNA_scaffolder_20190530-98f19e3.sh 
    source /sw/bioinfo/L_RNA_scaffolder/SOURCEME_L_RNA_scaffolder_20190530-98f19e3
    cd $SRCDIR
    ml git/2.34.1
    git clone https://github.com/CAFS-bioinformatics/L_RNA_scaffolder

Prepare the directory for overwriting PREFIX.

    cd L_RNA_scaffolder/
    git reset --hard 98f19e3
    sed -i '1i#!/usr/bin/env perl' *.pl
    chmod +x L_RNA_scaffolder.sh calculate-* convert* count_connection_frequency delete_* filter_scaffold.pl find_* form_* generate_* link_block order overlap route.pl search_guider select_nodes 

Change in two places the prefix 'sh `basename $0`' to remove the 'sh'.

    vi L_RNA_scaffolder.sh 

The L_RNA_scaffolder.sh script refers to the neighbour scripts using the `perl` interpreter. This will be OK, but I've made these changes so the tools can be run on their own.

Replace PREFIX with this directory.

    rmdir $PREFIX
    mv L_RNA_scaffolder $PREFIX

Within the mf file, load `BioPerl/1.7.2_Perl5.26.2` and `blat/36` and add $modroot to PATH.

    vi $TOOLDIR/mf/20190530-98f19e3

Wrap up.

    cd $TOOLDIR
    ./L_RNA_scaffolder-20190530-98f19e3_post-install.sh 
