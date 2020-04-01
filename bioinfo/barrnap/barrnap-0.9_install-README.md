barrnap/0.9
========================

<https://github.com/tseemann/barrnap>

Used under license:
GPL v3

Structure creating script (makeroom_barrnap_0.9.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/barrnap/makeroom_0.9.sh

makeroom.sh invoked with:
/home/douglas/bin/makeroom.sh -t "barrnap" -v "0.9" -f" -w "https://github.com/tseemann/barrnap" -s "alignment" -l "GPL v3" -d "detect rRNA genes in diverse genomes"

barrnap
=======

BAsic Rapid Ribosomal RNA Predictor

<https://github.com/tseemann/barrnap>

Newer versions on GitHub

Download from https://github.com/tseemann/barrnap
Unpack and make cluster links


    cd /sw/bioinfo/barrnap/
    TOOL=barrnap
    VERSION=0.9
    makeroom.sh -t $TOOL -v $VERSION -f -w https://github.com/tseemann/barrnap -s alignment -l "GPL v3" -d "detect rRNA genes in diverse genomes"
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION} 
    vi ${TOOL}-${VERSION}_install-README.md
    cd $VERSION
    cd src/
    wget https://github.com/tseemann/$TOOL/archive/${VERSION}.tar.gz
    tar xzf ${VERSION}.tar.gz 
    rmdir $PREFIX
    mv ${TOOL}-${VERSION} $PREFIX

