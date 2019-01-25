paraview/5.6
========================

<https://www.paraview.org/>

LOG
---

    TOOL=paraview
    VERSION=5.6
    CLUSTER=rackham
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER

    ./makeroom.sh

NOTE: I used the  script which is located at /sw/apps/paraview/makeroom_5.6.sh
    ./makeroom_paraview_5.6.sh
    cd /sw/apps/$TOOL/$VERSION/src
    wget https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v5.6&type=binary&os=Linux&downloadFile=ParaView-5.6.0-MPI-Linux-64bit.tar.gz

