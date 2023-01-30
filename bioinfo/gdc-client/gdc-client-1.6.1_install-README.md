gdc-client/1.6.1
================

<https://gdc.cancer.gov/access-data/gdc-data-transfer-tool>

Used under license:
Public domain


Structure creating script (makeroom_gdc-client_1.6.1.sh) moved to /sw/bioinfo/gdc-client/makeroom_1.6.1.sh

LOG
---

    makeroom.sh -c bioinfo -s misc -t gdc-client -v 1.6.1 -w https://gdc.cancer.gov/access-data/gdc-data-transfer-tool -d "A standard client-based mechanism supporting high-performance data downloads and submission" -l "Public domain"
    ./makeroom_gdc-client_1.6.1.sh 
    source /sw/bioinfo/gdc-client/SOURCEME_gdc-client_1.6.1 && cd $SRCDIR
    wget https://gdc.cancer.gov/files/public/file/gdc-client_v1.6.1_Ubuntu_x64.zip
    unzip gdc-client_v1.6.1_Ubuntu_x64.zip 
    mv gdc-client $PREFIX
    cd $PREFIX
    file gdc-client 
    ldd gdc-client 
    ./gdc-client 
