RegScan/0.5
===========

<https://www.geenivaramu.ee/en/tools/regscan>

Used under license:


Structure creating script (makeroom_RegScan_0.5.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/RegScan/makeroom_0.5.sh

LOG
---

Systemexperten har installerat compat-libtiff3.  Att kompilera källa är inte
nödvändig.  Ladda ner manual och testfilen ochså.

    TOOL=RegScan
    VERSION=0.5
    CLUSTER=rackham
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_RegScan_0.5.sh
    cd /sw/bioinfo/$TOOL/$VERSION/src

    wget https://www.geenivaramu.ee/sites/default/files/geenivaramu/64bit_sci_unix.zip
    unzip -q 64bit_sci_unix.zip 
    file REGSCAN 
    chmod +x REGSCAN 
    ldd REGSCAN 
    wget https://www.geenivaramu.ee/sites/default/files/geenivaramu/regscan_manual_0.zip
    cd $PREFIX
    unzip ../src/regscan_manual_0.zip 

