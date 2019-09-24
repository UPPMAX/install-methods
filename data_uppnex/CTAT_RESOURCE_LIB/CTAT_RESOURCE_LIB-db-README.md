CTAT_RESOURCE_LIB
=================

Resource data for STAR-fusion fusion detection.

<https://data.broadinstitute.org/Trinity/CTAT_RESOURCE_LIB/>

There are currently three separate versions depending on STAR-fusion version in use.

* STAR-fusion 1.7.0 requires the versions in `2019-08`, downloaded from <https://data.broadinstitute.org/Trinity/CTAT_RESOURCE_LIB/__genome_libs_StarFv1.7/>
* STAR-fusion 1.6.0 (not currently installed at UPPMAX) uses a newer version available at `2019-03`, downloaded from <https://data.broadinstitute.org/Trinity/CTAT_RESOURCE_LIB/__genome_libs_StarFv1.6/>
* STAR-fusion 1.3.0 to 1.5.0 use the version `2018-02`, downloaded from <https://data.broadinstitute.org/Trinity/CTAT_RESOURCE_LIB/__genome_libs_StarFv1.3/>
* Pre-1.3.0 STAR-fusion versions require the processed format that is found in `2017-11`, downloaded from <https://data.broadinstitute.org/Trinity/CTAT_RESOURCE_LIB/__genome_libs_pre-StarFv1.3/>

These are readily downloaded from the above links.  We want the prebuilt
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
