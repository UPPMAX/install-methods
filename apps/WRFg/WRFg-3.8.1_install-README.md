WRFg/3.8.1
========================

<https://wrfg.net/>

Used under license:
Custom AS-IS
<https://wrfg.net/wrfg-binary-executable-for-64-bit-linux-x86-based-systems/>

Structure creating script (makeroom_WRFg_3.8.1.sh) moved to /sw/apps/WRFg/makeroom_3.8.1.sh

LOG
---

    TOOL=WRFg
    VERSION=3.8.1
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/apps/WRFg/3.8.1/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "WRFg" -v "3.8.1" -w "https://wrfg.net/" -c "apps" -l "Custom AS-IS" -d "WRFg is a community version of the WRF model that is accelerated on NVIDIA GPUs for faster simulation turnaround times." -L "https://wrfg.net/wrfg-binary-executable-for-64-bit-linux-x86-based-systems/" -u "rackham snowy" -x "INSTALL"
    ./makeroom_WRFg_3.8.1.sh
#	register https://wrfg.net/wrfg-binary-executable-for-64-bit-linux-x86-based-systems/
#	download file via received email
#
    cd $SRCDIR
#	upload .tar.gz file    
    tar xvf 
    make

