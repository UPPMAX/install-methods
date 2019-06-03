Yleaf/2.0
=========

<http://cluster15.erasmusmc.nl/fmb/Yleaf_v2/index.html>

Used under license:


LOG
---

    cd /sw/bioinfo
    TOOL=Yleaf
    VERSION=2.0
    CLUSTER=rackham
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_Yleaf_2.0.sh
    mv TMPFILE_Yleaf_2.0 Yleaf/

Structure creating script (makeroom_Yleaf_2.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/Yleaf/makeroom_2.0.sh

    cd /sw/bioinfo/$TOOL/$VERSION/src
    wget --timestamping http://cluster15.erasmusmc.nl/fmb/Yleaf_v2/Yleaf_v2.zip
    unzip Yleaf_v2.zip

    # Move the unzipped directory to be the cluster directory.

    rm -rf ../$CLUSTER
    mv Yleaf_v2 ../$CLUSTER
    cd ../$CLUSTER

    # Load needed modules, these will also be loaded by the mf file.

    module load python/3.6.8
    module load p7zip/16.02
    module load bioinfo-tools
    module load bwa/0.7.17
    module load samtools/1.9

    # Change #! lines to use python3 and make the tool scripts executable.
    # Do not change install.py to executable, it is for installing the human
    # genome indices only

    for F in *.py ; do
        sed -i -e 's:^#!/usr/bin.*python$:#!/usr/bin/env python3:'
    done
    chmod +x predict_haplogroup.py
    chmod +x Yleaf.py

    # Build the human genome indices required.

    python3 install.py   #  select hg19
    rm -f hg19.tar
    python3 install.py   #  select hg38

    # Get the documentation.

    wget --timestamping http://cluster15.erasmusmc.nl/fmb/Yleaf_v2/Readme.pdf

