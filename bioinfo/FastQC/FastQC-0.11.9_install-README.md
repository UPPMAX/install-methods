FastQC/0.11.9
========================

<https://www.bioinformatics.babraham.ac.uk/projects/fastqc/>

Used under license:
GPL license
<>

Structure creating script (makeroom_FastQC_0.11.9.sh) moved to /sw/bioinfo/FastQC/makeroom_0.11.9.sh

LOG
---

    TOOL=FastQC
    VERSION=0.11.9
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/FastQC/0.11.9/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "FastQC" -v "0.11.9" -w "https://www.bioinformatics.babraham.ac.uk/projects/fastqc/" -c "bioinfo" -l "GPL license" -d "A quality control tool for high throughput sequence data." -x "INSTALL" -f
    ./makeroom_FastQC_0.11.9.sh
    cd $VERSION/src
    wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v${VERSION}.zip
    unzip fastqc_v${VERSION}.zip 
    cd FastQC/
    mv * $PREFIX
    cd ..
    rm -rf FastQC/
    cd $PREFIX
    chmod +x fastqc
    vi fastqc
    replace "#!/usr/bin/perl" in its first line to "#!/usr/bin/env perl"
    ./fastqc --version
