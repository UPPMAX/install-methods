trinity/2.4.0
=============

RNA-seq de novo assembly.

<https://github.com/trinityrnaseq/trinityrnaseq/wiki>

LOG
---

Make it in place, in the `$CLUSTER` directory.

    VERSION=2.4.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/trinity
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    [[ -f Trinity-v${VERSION}.tar.gz ]] || wget https://github.com/trinityrnaseq/trinityrnaseq/archive/Trinity-v${VERSION}.tar.gz
    tar xzf Trinity-v${VERSION}.tar.gz 
    mv trinityrnaseq-Trinity-v${VERSION} ../$CLUSTER
    cd ../$CLUSTER
    module load gcc/6.3.0
    module load java/sun_jdk1.8.0_92
    module load bioinfo-tools bowtie2/2.3.2
    make
    make plugins

