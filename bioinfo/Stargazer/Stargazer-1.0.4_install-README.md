Stargazer/1.0.4
========================

<https://stargazer.gs.washington.edu/stargazerweb/index.html>

Used under license:
GPLv3

LOG
---

    TOOL=Stargazer
    VERSION=1.0.4
    CLUSTER=rackham
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER

NOTE: I use my own script which is located at /sw/bioinfo/Stargazer/makeroom_1.0.4.sh

    ./makeroom_Stargazer_1.0.4.sh
    cd /sw/bioinfo/$TOOL/$VERSION/src
    wget https://stargazer.gs.washington.edu/docroot/versions/Stargazer_v1.0.4.zip
    unzip Stargazer_v1.0.4.zip
    cd Stargazer_v1.0.4
    mv * ../../rackham/

