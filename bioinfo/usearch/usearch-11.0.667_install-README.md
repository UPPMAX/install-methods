usearch/11.0.667
========================

<http://www.drive5.com/usearch/download.html>

Used under license:
Custom licence agreement

Structure creating script (makeroom_usearch_11.0.667.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/usearch/makeroom_11.0.667.sh



    TOOL=usearch
    VERSION=11.0.667
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w http://www.drive5.com/usearch/download.html -l "Custom licence agreement" -d "Versatile open source tool for metagenomics"
    ./makeroom_usearch_11.0.667.sh 
    source SOURCEME_usearch_11.0.667 
    cd $VERSION
    cd $PREFIX
    mkdir python_scripts
    cd python_scripts/
    wget https://drive5.com/python/python_scripts.tar.gz
    tar xzf python_scripts.tar.gz 
    chmod +x *.py
    sed -i -e 's,#!/usr/bin/python.*$,#!/usr/bin/env python,' $(file * | grep 'Python script' | cut -f1 -d:)
    mv python_scripts.tar.gz ../../src/
    cd ../../src
    wget https://drive5.com/cgi-bin/upload3.py?license=2019102111221031879
    mv upload3.py\?license\=2019102111221031879 usearch11.0.667_i86linux32
    cp -av usearch11.0.667_i86linux32 $PREFIX/
    cd $PREFIX
    ln -s usearch11.0.667_i86linux32 usearch
    ln -s usearch11.0.667_i86linux32 usearch11
    chmod +x usearch11.0.667_i86linux32 

