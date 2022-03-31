metaSNV/2.0.1
========================

<https://github.com/metasnv-tool/metaSNV>

Used under license:
misc free software
<https://github.com/metasnv-tool/metaSNV/blob/master/LICENSE>

Structure creating script (makeroom_metaSNV_2.0.1.sh) moved to /sw/bioinfo/metaSNV/makeroom_2.0.1.sh

LOG
---

    TOOL=metaSNV
    VERSION=2.0.1

    makeroom.sh -t $TOOL -v $VERSION -w "https://github.com/metasnv-tool/metaSNV" -c "bioinfo" -l "misc free software" -L "https://github.com/metasnv-tool/metaSNV/blob/master/LICENSE" -d "a metagenomic SNV calling pipeline." -s "pipelines" -f

    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

    
    module load python/3.9.5
    module load boost/1.75.0-gcc9.3.0
    module load gcc/9.3.0
    module load  cmake/3.22.2
    module load bioinfo-tools
    module load htslib/1.14
    module load R_packages/4.1.1 #it uses gcc 9.3.0

    cd $SRCDIR
    wget https://github.com/metasnv-tool/metaSNV/archive/refs/tags/v2.0.1.tar.gz
    
    tar xvf v2.0.1.tar.gz 
    cd metaSNV-2.0.1
    make
    rmdir $PREFIX 
    mv metaSNV-2.0.1 $PREFIX 
