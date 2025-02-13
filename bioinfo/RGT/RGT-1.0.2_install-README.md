RGT/1.0.2
========================

< https://github.com/CostaLab/reg-gen>

Used under license:
GPL v3


Structure creating script (makeroom_RGT_1.0.2.sh) moved to /sw/bioinfo/RGT/makeroom_1.0.2.sh

LOG
---

    TOOL=RGT
    VERSION=1.0.2
    makeroom.sh -t $TOOL -v $VERSION -w " https://github.com/CostaLab/reg-gen" -l "GPL v3" -d "RGT is an open source Python 3.6+ library for analysis of regulatory genomics. RGT is programmed in an oriented object fashion and its core classes provide functionality for handling regulatory genomics data."  -x install 
    ./makeroom_RGT_1.0.2.sh
    source /sw/bioinfo/RGT/SOURCEME_RGT_1.0.2 && cd $TOOLDIR
    cd $PREFIX
    git clone https://github.com/CostaLab/reg-gen.git
    ml python_ML_packages/3.9.5-cpu    
    ml biopython/1.80-py3.9.5
    ml pysam/0.17.0-python3.9.5
    virtualenv --system-site-packages RGT
    . RGT/bin/activate
    which python
    which pip
    pip install RGT
    mkdir bin
    cp -r RGT/bin/* bin/
    deactivate

## RGT data
When pip installing you will get a rgtdata folder in your HOME that contains some config files
Move or copy it to the module folder

    mkdir rgtdata
    cd rgtdata
    cp -av ~/rgtdata/* .
    python setupGenomicData.py --all

