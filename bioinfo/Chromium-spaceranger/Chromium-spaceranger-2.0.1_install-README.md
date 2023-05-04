Chromium-spaceranger/2.0.1
==========================

<https://support.10xgenomics.com/spatial-gene-expression/software/pipelines/latest/what-is-space-ranger>

Used under license:


Structure creating script (makeroom_Chromium-spaceranger_1.0.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/Chromium-spaceranger/makeroom_1.0.0.sh

The module name is spaceranger.


LOG
---

    TOOL=Chromium-spaceranger
    MODULENAME=spaceranger
    VERSION=2.0.1
    cd /sw/bioinfo/$TOOL

    makeroom.sh -f -t ${TOOL} -m ${MODULENAME} -v ${VERSION} -w https://support.10xgenomics.com/spatial-gene-expression/software/pipelines/latest/what-is-space-ranger -c bioinfo -s misc -d "set of analysis pipelines that process Visium spatial RNA-seq output and brightfield microscope images in order to detect tissue, align reads, generate feature-spot matrices, perform clustering and gene expression analysis, and place spots in spatial context on the slide image"
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd Chromium-spaceranger/
    source SOURCEME_${TOOL}_${VERSION} 

    cd $SRCDIR

    wget -O spaceranger-2.0.1.tar.gz "https://cf.10xgenomics.com/releases/spatial-exp/spaceranger-2.0.1.tar.gz?Expires=1682127373&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvc3BhdGlhbC1leHAvc3BhY2VyYW5nZXItMi4wLjEudGFyLmd6IiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNjgyMTI3MzczfX19XX0_&Signature=oaop-oxcCFT07jP-xnJLCGwrVQ9IYsHYYNKuuQMECajgkQvEoK2JhQzZVW2K6bnKq9UOrGEft-OLH-OMACxJ4V3Muhz1Fa4gvv0cKNJiuBfe3F-RSl89R6Z0ncLcpQs7jopy-EAFP1mDPIt5uhSDdDGr-HecxnYVaXq8V5LPnC-3tpbzXOUrR0ELdl-Bd9xAYDtdaC9QUxBNsW2ZRI7v5TjbvzSGXKwddHF5VXZvaEfq8Sm3x1pQJu9EXEQramlceLSlm~xlLGnsLpHu-4r8RxqAIVFoTJT33eaYcMkAD7xKGXCVqr2UzkFUETZOE4Wq-gLftA-NCex-nJXnSYqH2g__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"

    echo "md5 from download site is 26151804338ae4d4b44151232bd64b50"
    md5sum spaceranger-${VERSION}.tar.gz | tee spaceranger-${VERSION}.tar.gz.md5
    tar xf spaceranger-${VERSION}.tar.gz 
    rmdir $PREFIX
    mv ${MODULENAME}-${VERSION} $PREFIX

Now get additional data sources and add them. For `$PREFIX/probe_sets/`.

    cd $SRCDIR

    wget https://cf.10xgenomics.com/supp/spatial-exp/probeset/Visium_Human_Transcriptome_Probe_Set_v1.0_GRCh38-2020-A.csv
    wget https://cf.10xgenomics.com/supp/spatial-exp/probeset/Visium_Human_Transcriptome_Probe_Set_v1.0_GRCh38-2020-A.bed
    wget https://cf.10xgenomics.com/supp/spatial-exp/probeset/Visium_Human_Transcriptome_Probe_Set_v1.0_GRCh38-2020-A.offtarget.csv
    wget https://cf.10xgenomics.com/supp/spatial-exp/probeset/Visium_Human_Transcriptome_Probe_Set_v1.0_GRCh38-2020-A.probe_metadata.tsv
    wget https://cf.10xgenomics.com/supp/spatial-exp/probeset/Visium_Human_Transcriptome_Probe_Set_v1.0_GRCh38-2020-A.probe_metadata.xlsx
    wget https://cf.10xgenomics.com/supp/spatial-exp/probeset/Visium_Human_Transcriptome_Probe_Set_v2.0_GRCh38-2020-A.csv
    wget https://cf.10xgenomics.com/supp/spatial-exp/probeset/Visium_Human_Transcriptome_Probe_Set_v2.0_GRCh38-2020-A.bed
    wget https://cf.10xgenomics.com/supp/spatial-exp/probeset/Visium_Human_Transcriptome_Probe_Set_v2.0_GRCh38-2020-A.offtarget.csv
    wget https://cf.10xgenomics.com/supp/spatial-exp/probeset/Visium_Human_Transcriptome_Probe_Set_v2.0_GRCh38-2020-A.probe_metadata.tsv
    wget https://cf.10xgenomics.com/supp/spatial-exp/probeset/Visium_Human_Transcriptome_Probe_Set_v2.0_GRCh38-2020-A.probe_metadata.xlsx
    wget https://cf.10xgenomics.com/supp/spatial-exp/probeset/Visium_Mouse_Transcriptome_Probe_Set_v1.0_mm10-2020-A.csv
    wget https://cf.10xgenomics.com/supp/spatial-exp/probeset/Visium_Mouse_Transcriptome_Probe_Set_v1.0_mm10-2020-A.bed
    wget https://cf.10xgenomics.com/supp/spatial-exp/probeset/Visium_Mouse_Transcriptome_Probe_Set_v1.0_mm10-2020-A.offtarget.csv
    wget https://cf.10xgenomics.com/supp/spatial-exp/probeset/Visium_Mouse_Transcriptome_Probe_Set_v1.0_mm10-2020-A.probe_metadata.tsv
    wget https://cf.10xgenomics.com/supp/spatial-exp/probeset/Visium_Mouse_Transcriptome_Probe_Set_v1.0_mm10-2020-A.probe_metadata.xlsx
    rsync -Pa Visium_* $PREFIX/probe_sets/

For the new directory `$PREFIX/probe_sets/`.

    wget https://support.10xgenomics.com/sample_index_sets/Dual_Index_Kit_TT_Set_A.csv
    wget https://support.10xgenomics.com/sample_index_sets/Dual_Index_Kit_TT_Set_A.json
    wget https://support.10xgenomics.com/sample_index_sets/Dual_Index_Kit_TS_Set_A.csv
    wget https://support.10xgenomics.com/sample_index_sets/Dual_Index_Kit_TS_Set_A.json
    mkdir $PREFIX/index_kits
    rsync -Pa Dual_Index_Kit_T* $PREFIX/index_kits/

Add these to the mf file.
