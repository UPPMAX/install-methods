DosageConvertor/1.0.4
========================

<https://github.com/Santy-8128/DosageConvertor>

Used under license:
custom

Structure creating script (makeroom_DosageConvertor_1.0.4.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/DosageConvertor/makeroom_1.0.4.sh

LOG
---

    TOOL=DosageConvertor
    VERSION=1.0.4
    CLUSTER=rackham
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_DosageConvertor_1.0.4.sh
    cd /sw/bioinfo/$TOOL/$VERSION/src
    git clone https://github.com/Santy-8128/DosageConvertor.git
    ml cmake/3.13.2
    ml python3/3.7.2
    pip3 install cget --target CGET
    export PYTHONPATH=/sw/bioinfo/DosageConvertor/1.0.4/src/CGET/
    cd DosageConvertor
Edit the install.sh to get cget from /sw/bioinfo/$TOOL/$VERSION/src/CGET/bin/cget
    ./install.sh
    
