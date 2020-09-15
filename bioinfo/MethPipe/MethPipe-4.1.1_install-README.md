MethPipe/4.1.1
========================

<http://smithlabresearch.org/software/methpipe/>

<https://github.com/smithlabcode/methpipe/>

Used under license:
GPL v3+

Structure creating script (makeroom_MethPipe_4.1.1.sh) moved to /sw/bioinfo/MethPipe/makeroom_4.1.1.sh

LOG
---

    TOOL=MethPipe
    VERSION=4.1.1
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w http://smithlabresearch.org/software/methpipe/ -l "GPL v3+" -d "computational pipeline for analyzing bisulfite sequencing data (WGBS and RRBS)" 
    ./makeroom_MethPipe_4.1.1.sh
    source SOURCEME_MethPipe_4.1.1 
    cd $VERSION
    cd src
    [[ -f methpipe-${VERSION}.tar.gz ]] || wget https://github.com/smithlabcode/methpipe/releases/download/v4.1.1/methpipe-4.1.1.tar.gz
    tar xzf methpipe-${VERSION}.tar.gz
    cd methpipe-${VERSION}
    module load gcc/6.3.0
    module load gsl/2.6
    module load libcurl/7.45.0
    module load zlib/1.2.11
    module load bioinfo-tools
    module load htslib/1.9
    make
    make install
    cp -av bin ../../$CLUSTER/
    9  cd ..

TOOL=MethPipe
VERSION=4.1.1
1005  ./makeroom_MethPipe_4.1.1.sh 
1006  ll
1008  history >> MethPipe-4.1.1_install-README.md
