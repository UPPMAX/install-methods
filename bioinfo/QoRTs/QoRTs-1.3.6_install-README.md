QoRTs/1.3.6
========================

<https://github.com/hartleys/QoRTs>

Used under license:
MIT

Structure creating script (makeroom_QoRTs_1.3.6.sh) moved to /sw/bioinfo/QoRTs/makeroom_1.3.6.sh

LOG
---

    TOOL=QoRTs
    VERSION=1.3.6
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/QoRTs/1.3.6/src
    makeroom -t QoRTs -v 1.3.6 -w https://github.com/hartleys/QoRTs -s misc -l MIT -d "The QoRTs software package is a fast, efficient, and portable multifunction toolkit designed to assist in the analysis, quality control, and data management of RNA-Seq and DNA-Seq datasets. Its primary function is to aid in the detection and identification of errors, biases, and artifacts produced by high-throughput sequencing technology."
    ./makeroom_QoRTs_1.3.6.sh
    cd $SRCDIR
    git clone https://github.com/hartleys/QoRTs.git
    mkdir $PREFIX/lib
    R CMD INSTALL -l $PREFIX/lib QoRTs/QoRTs_1.3.6.tar.gz
    cp -av QoRTs/QoRTs.jar $PREFIX/lib/
    mkdir bin
    echo '#!/bin/bash' > /sw/bioinfo/QoRTs/1.3.6/rackham/bin/QoRTs
    echo 'java -jar $QORTS_ROOT/lib/QoRTs.jar "$@"' >> /sw/bioinfo/QoRTs/1.3.6/rackham/bin/QoRTs
