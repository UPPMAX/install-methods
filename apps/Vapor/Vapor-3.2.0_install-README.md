Vapor/3.2.0
========================

<https://www.vapor.ucar.edu/>

Used under license:
Apache v2.0 license
<>

Structure creating script (makeroom_Vapor_3.2.0.sh) moved to /sw/apps/Vapor/makeroom_3.2.0.sh

LOG
---

    TOOL=Vapor
    VERSION=3.2.0
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/apps/Vapor/3.2.0/src
    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "Vapor" -v "3.2.0" -w "https://www.vapor.ucar.edu/" -c "apps" -l "Apache v2.0 license" -d "VAPOR is the Visualization and Analysis Platform for Ocean\, Atmosphere\, and Solar Researchers. VAPOR provides an interactive 3D visualization environment that can also produce animations and still frame images." -u "rackham snowy" -x "INSTALL"
    ./makeroom_Vapor_3.2.0.sh
    cd $SRCDIR
    wget https://github.com/NCAR/VAPOR/releases/download/3.2.0/VAPOR3-3.2.0-CentOS7.sh
    cp VAPOR3-3.2.0-CentOS7.sh ../rackham/
    sh VAPOR3-3.2.0-CentOS7.sh 
    

