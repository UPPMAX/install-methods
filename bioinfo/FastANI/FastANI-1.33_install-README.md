FastANI/1.33
========================

<https://github.com/ParBLiSS/FastANI>

Used under license:
Apache2.0
<>

Structure creating script (makeroom_FastANI_1.33.sh) moved to /sw/bioinfo/FastANI/makeroom_1.33.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "FastANI" -v "1.33" -l "Apache2.0" -w "https://github.com/ParBLiSS/FastANI" -f""
    ./makeroom_FastANI_1.33.sh
    TOOL=FastANI
    version=1.33
    cd /sw/bioinfo/$TOOL
    source SOURCEME_${TOOL}_${version}

    module load gcc/9.3.0
    wget https://github.com/ParBLiSS/FastANI/archive/refs/tags/v1.33.tar.gz
    tar xfvz  v1.33.tar.gz  --strip=1 && rm v1.33.tar.gz
    ./bootstrap.sh
    ./configure
    make
    cp fastANI $PREFIX

