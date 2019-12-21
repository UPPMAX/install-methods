Chromium-spaceranger/1.0.0
========================

<https://support.10xgenomics.com/spatial-gene-expression/software/pipelines/latest/what-is-space-ranger>

Used under license:


Structure creating script (makeroom_Chromium-spaceranger_1.0.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/Chromium-spaceranger/makeroom_1.0.0.sh

The module name is spaceranger.


LOG
---

    TOOL=Chromium-spaceranger
    MODULENAME=spaceranger
    VERSION=1.0.0
    cd /sw/bioinfo

    makeroom.sh -f -t ${TOOL} -v ${VERSION} -w https://support.10xgenomics.com/spatial-gene-expression/software/pipelines/latest/what-is-space-ranger -c bioinfo -s misc -d "set of analysis pipelines that process Visium spatial RNA-seq output and brightfield microscope images in order to detect tissue, align reads, generate feature-spot matrices, perform clustering and gene expression analysis, and place spots in spatial context on the slide image"
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd Chromium-spaceranger/
    source SOURCEME_${TOOL}_${VERSION} 

    cd $VERSION/src
    wget -O spaceranger-${VERSION}.tar.gz "http://cf.10xgenomics.com/releases/spatial-exp/spaceranger-1.0.0.tar.gz?Expires=1576196668&Policy=XXXXX
    echo "md5 from download site is 5cc7fb86d0cbff7df687b11575efb7cb"
    md5sum spaceranger-1.0.0.tar.gz > spaceranger-1.0.0.tar.gz.md5
    tar xzf spaceranger-1.0.0.tar.gz 
    rmdir $PREFIX
    mv ${MODULENAME}-${VERSION} $PREFIX

MD5s match.  The reference data they are suggesting for GRCh38 and mm10 seems
to be the same as for `cellranger-data/3.0.0`.  Do the MD5s match?

    md5sum /sw/data/Chromium/cellranger-data/3.0.0/src/refdata-cellranger-GRCh38-3.0.0.tar.gz 
    md5sum /sw/data/Chromium/cellranger-data/3.0.0/src/refdata-cellranger-mm10-3.0.0.tar.gz 

Yes, MD5s match, so load `cellranger-data/3.0.0` with this module.  This is
installed like cellranger, longranger etc. so use the cellranger mf file as a
template.  Include mention of the reference data.

    cd /sw/bioinfo/${TOOL}/mf
    vi ${VERSION}

Rename module and and install mf files

    mv /sw/mf/common/bioinfo-tools/misc/${TOOL} /sw/mf/common/bioinfo-tools/misc/${MODULENAME}
    rsync -Pa ${VERSION} /sw/mf/common/bioinfo-tools/misc/${MODULENAME}/
    all_mflink -f $MODULENAME ${VERSION}

cd mf
vi 1.0.0 
1212  mfshow Chromium-spaceranger
1213  mv /sw/mf/common/bioinfo-tools/misc/Chromium-spaceranger /sw/mf/common/bioinfo-tools/misc/spaceranger
1214  cd ..
1215  ll
1216  cd 1.0.0/
1217  ll
1218  cd src/
1219  ll
1235  ml vim
1236  history >> ../../Chromium-spaceranger-1.0.0_install-README.md 
