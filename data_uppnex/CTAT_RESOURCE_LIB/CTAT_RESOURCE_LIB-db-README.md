CTAT_RESOURCE_LIB
=================

Resource data for STAR-fusion fusion detection.

<https://data.broadinstitute.org/Trinity/CTAT_RESOURCE_LIB/>

There are two separate versions depending on STAR-fusion version in use.  At
UPPMAX (thus far) we have the modules star-fusion/1.0.0, star-fusion/1.2.0, and
star-fusion/1.5.0.  Pre-1.3.0 STAR-fusion versions require a different
processed format (the `Nov012017` version).

These are readily downloaded from the above link.  We want the prebuilt
'plug-n-play' versions.

A bash script for downloading and expanding the tarballs is in
`CTAT_RESOURCE_LIB-download-db.sh`.

Non-prebuilt versions can be built with a recipe
provided at the STAR-fusion repository.

<https://github.com/STAR-Fusion/STAR-Fusion/wiki>

    tar xvf CTAT_resource_lib.tar.gz
    cd CTAT_resource_lib/
    $STAR_FUSION_HOME/FusionFilter/prep_genome_lib.pl \
                         --genome_fa ref_genome.fa \
                         --gtf ref_annot.gtf \
                         --fusion_annot_lib CTAT_HumanFusionLib.dat.gz \
                         --annot_filter_rule AnnotFilterRule.pm \
                         --pfam_db PFAM.domtblout.dat.gz
