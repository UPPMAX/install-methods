PCAngsd/0.982
=============

<https://github.com/Rosemeis/pcangsd>

Used under license:
GPL v3

Structure creating script (makeroom_PCAngsd_0.982.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/PCAngsd/makeroom_0.982.sh

LOG
---

Two points:

* This is built in place
* The main script gets a #! line added and is made executable


    TOOL=PCAngsd
    VERSION=0.982

    cd /sw/bioinfo
    makeroom.sh -f -t ${TOOL} -s misc -v ${VERSION} -w https://github.com/Rosemeis/pcangsd -d "framework for analyzing low depth NGS data in heterogeneous populations using PCA" -l "GPL v3"
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd ${TOOL}/
    cd ${VERSION}/
    rmdir $PREFIX
    cd src/
    ml git
    ml python/3.7.2
    ml gcc/8.3.0
    git clone https://github.com/Rosemeis/pcangsd.git
    mv pcangsd $PREFIX
    cd $PREFIX
    PYTHONUSERBASE=$PREFIX pip install --user --verbose -r requirements.txt 
    python3 setup.py build_ext --inplace
    python3 pcangsd.py -h

Need to update RPATH info for one of the shared libraries.

    ml patchelf/0.10
    patchelf --set-rpath "$LD_RUN_PATH:$(patchelf --print-rpath reader.cpython-37m-x86_64-linux-gnu.so)" reader.cpython-37m-x86_64-linux-gnu.so

Now to add `#!` line and make executable.

    vi pcangsd.py 
    chmod +x pcangsd.py 

Add a note about this to the module load.

    pcangsd.py -h
