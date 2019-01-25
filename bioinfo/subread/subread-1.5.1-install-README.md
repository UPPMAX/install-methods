subread 1.5.1
=============


<http://bioinf.wehi.edu.au/subread-package/>

LOG
---

    CLUSTER=${CLUSTER:?CLUSTER must be set}
    VERSION=1.5.1
    cd /sw/apps/bioinfo/subread
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p src_$CLUSTER
    mkdir $CLUSTER
    cd src_$CLUSTER
    wget http://sourceforge.net/projects/subread/files/subread-${VERSION}/subread-${VERSION}-source.tar.gz/download
    mv download subread-${VERSION}-source.tar.gz
    tar xzf subread-${VERSION}-source.tar.gz
    cd subread-${VERSION}-source/
    cd src
    module load gcc/5.4.0
    make -f Makefile.Linux 
    cd ..
    mv bin ../../$CLUSTER/

Make sure both `bin` and `bin/utilities` are in `PATH`.

