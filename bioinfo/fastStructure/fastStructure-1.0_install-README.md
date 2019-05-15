fastStructure/1.0
========================

<https://github.com/rajanil/fastStructure>

Used under license:
MIT, https://github.com/rajanil/fastStrucsource ture/blob/master/LICENSE

LOG
---

    TOOL=fastStructure
    VERSION=1.0
    CLUSTER=Rackham
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER

NOTE:  script generatged by makeroom(created by Jonas Söderberg)  which is located at /sw/bioinfo/fastStructure/makeroom_1.0.sh

    ./makeroom_fastStructure_1.0.sh
    cd /sw/bioinfo/$TOOL/$VERSION/src
    wget https://github.com/rajanil/fastStructure/archive/v1.0.tar.gz
    tar -xvf v1.0.tar.gz
    ml python/2.7.15
    ml gcc
    ml gsl
    export PYTHONUSERBASE=$PWD
    #Old build dependent on specific Cython, fastStructure has not been updated in several years
    pip install--user Cython==0.22
    cd fastStructure-1.0/vars/
    python setup.py build_ext --inplace
    cd ..
    python setup.py build_ext --inplace
    To fix the structure.py add #!/usr/env python so users 
