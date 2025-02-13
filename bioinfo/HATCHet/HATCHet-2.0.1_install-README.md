HATCHet/2.0.1
========================

<https://github.com/raphael-group/hatchet>

Used under license:
BSD-3


Structure creating script (makeroom_HATCHet_2.0.1.sh) moved to /sw/bioinfo/HATCHet/makeroom_2.0.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "HATCHet" "-v" "2.0.1" "-d" "HATCHet (Holistic Allele-specific Tumor Copy-number Heterogeneity) is an algorithm that infers allele and clone-specific CNAs and WGDs jointly across multiple tumor samples from the same patient, and that leverages the relationships between clones in these samples." "-w" "https://github.com/raphael-group/hatchet" "-l" "BSD-3" "-s" "annotation"
    ./makeroom_HATCHet_2.0.1.sh

    # Load modules
    module load python/3.8.7
    module load gcc/9.3.0
    module load Gurobi/11.0.3
    module load cmake/3.26.3

    module load bioinfo-tools
    module load samtools/1.20
    module load bcftools/1.20
    module load SHAPEIT/v2.r904
    module load picard/3.1.1
    module load mosdepth/0.3.3

    # Download
    cd $SRCDIR
    wget https://github.com/raphael-group/hatchet/archive/refs/tags/v${VERSION}.tar.gz
    tar xfvz v${VERSION}.tar.gz
    cd `echo ${TOOL}-${VERSION} | awk '{print tolower($0)}'`
    
    # Comment out GUROBI versions in FindGUROBI.cmake. Set correct versions manually
    sed -r -i.bak "s/\(string( REGEX MATCH \"gurobi\[0-9\]\[0-9\]\[0-9\]\" GUROBI_VER_FULL \${GUROBI_HOME} )\)/#\1/" FindGUROBI.cmake
    sed -r -i.bak "s/\(string( REGEX MATCH \"\[0-9\]\[0-9\]\[0-9\]\" GUROBI_VER \${GUROBI_VER_FULL} )\)/#\1/" FindGUROBI.cmake
    sed -r "s/## set(GUROBI_VER \"XXX\")/set(GUROBI_VER \"110\")/" FindGUROBI.cmake 
    #Change #! to /usr/bin/env python
    sed -r -i '1s%.*%\#!/usr/bin/env python%' $PREFIX/bin/hatchet

    # Install
    PYTHONUSERBASE=$PREFIX pip install --user  .

    # Test https://github.com/raphael-group/hatchet/blob/master/examples/demo-complete/demo-complete.sh
    # Start gurobi token server
    export HATCHET_PATHS_PICARD=/sw/bioinfo/picard/3.1.1/rackham
    export PYTHONPATH=/sw/bioinfo/HATCHet/2.0.1/rackham/lib/python3.8/site-packages/:$PYTHONPATH
    export PATH=/sw/bioinfo/HATCHet/2.0.1/rackham/bin/:$PATH

    grb_ts
    hatchet check

    # Download test data
    # Creating data folder
    mkdir -p $PREFIX/test/data
    cd $PREFIX/test

    # Downloading matched-normal BAM file
    echo "Downloading matched-normal BAM file from Zenodo, please be patient as downloading time may vary."
    curl -L 'https://zenodo.org/record/4046906/files/normal.bam?download=1' > data/normal.bam &
    curl -L 'https://zenodo.org/record/4046906/files/normal.bam.bai?download=1' > data/normal.bam.bai &

    # Downloading BAM file of tumor sample 1
    echo "Downloading BAM file of tumor sample 1 from Zenodo, please be patient as downloading time may vary."
    curl -L 'https://zenodo.org/record/4046906/files/bulk_03clone1_06clone0_01normal.sorted.bam?download=1' > data/bulk_03clone1_06clone0_01normal.sorted.bam &
    curl -L 'https://zenodo.org/record/4046906/files/bulk_03clone1_06clone0_01normal.sorted.bam.bai?download=1' > data/bulk_03clone1_06clone0_01normal.sorted.bam.bai &

    # Downloading BAM file of tumor sample 2
    echo "Downloading BAM file of tumor sample 2 from Zenodo, please be patient as downloading time may vary."
    curl -L 'https://zenodo.org/record/4046906/files/bulk_08clone1_Noneclone0_02normal.sorted.bam?download=1' > data/bulk_08clone1_Noneclone0_02normal.sorted.bam &
    curl -L 'https://zenodo.org/record/4046906/files/bulk_08clone1_Noneclone0_02normal.sorted.bam.bai?download=1' > data/bulk_08clone1_Noneclone0_02normal.sorted.bam.bai &

    # Downloading BAM file of tumor sample 3
    echo "Downloading BAM file of tumor sample 3 from Zenodo, please be patient as downloading time may vary."
    curl -L 'https://zenodo.org/record/4046906/files/bulk_Noneclone1_09clone0_01normal.sorted.bam?download=1' > data/bulk_Noneclone1_09clone0_01normal.sorted.bam &
    curl -L 'https://zenodo.org/record/4046906/files/bulk_Noneclone1_09clone0_01normal.sorted.bam.bai?download=1' > data/bulk_Noneclone1_09clone0_01normal.sorted.bam.bai &

    echo "Downloading human reference genome, please be patient as downloading time may vary."
    curl -L https://hgdownload.soe.ucsc.edu/goldenPath/hg19/bigZips/hg19.fa.gz | gzip -d > data/hg19.fa &
    samtools faidx data/hg19.fa
    samtools dict data/hg19.fa > data/hg19.dict

    curl -L 'https://ftp.ncbi.nih.gov/snp/organisms/human_9606_b151_GRCh37p13/VCF/GATK/00-All.vcf.gz' > data/00-All.vcf.gz

    # Copy the example ini file
    cp $SRCDIR/hatchet-2.0.1/script/hatchet.ini $PREFIX/test
    
    # add the paths to $PREFIX/test/hatchet.ini file
    ## to [run]
    #chromosomes="chr22"
    #reference=/sw/bioinfo/HATCHet/2.0.1/rackham/test/data/hg19.fa
    #normal=/sw/bioinfo/HATCHet/2.0.1/rackham/test/data/normal.bam
    #bams=/sw/bioinfo/HATCHet/2.0.1/rackham/test/data/bulk_03clone1_06clone0_01normal.sorted.bam /sw/bioinfo/HATCHet/2.0.1/rackham/test/data/bulk_08clone1_Noneclone0_02normal.sorted.bam /sw/bioinfo/HATCHet/2.0.1/rackham/test/data/bulk_Noneclone1_09clone0_01normal.sorted.bam
    #samples=TumorSample1 TumorSample2 TumorSample3
    #processes=10
    #
    ## to [download_panel]
    #ref_panel = 1000GP_Phase3
    #refpaneldir = /sw/bioinfo/HATCHet/2.0.1/rackham/test/data/panel

    ## to [genotype_snps]
    #hatchet-2.0.1/script/hatchet.ini

    hatchet run $PREFIX/test/example.ini


