#trinity/2.8.2
#=============

#RNA-seq de novo assembly.

#<https://github.com/trinityrnaseq/trinityrnaseq/wiki>

#LOG
#---

#Make it in place, in the `$CLUSTER` directory.

    VERSION=2.8.2
    CLUSTER=rackham
    OTHERCLUSTERS="bianca irma"
    cd /sw/apps/bioinfo/trinity
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    [[ -f Trinity-v${VERSION}.tar.gz ]] || wget https://github.com/trinityrnaseq/trinityrnaseq/archive/Trinity-v${VERSION}.tar.gz
    tar xzf Trinity-v${VERSION}.tar.gz 
    mv trinityrnaseq-Trinity-v${VERSION} ../$CLUSTER
    cd ../$CLUSTER
    module load cmake/3.7.2
    module load gcc/6.3.0
    module load java/sun_jdk1.8.0_151
    module load bioinfo-tools bowtie2/2.3.4.1
    make
    make plugins

    cd ../
    for c in $OTHERCLUSTERS; do
      ln -fs $CLUSTER $c
    done

    chgrp sw -R /sw/apps/bioinfo/trinity/$VERSION
    chmod g+rwx -R /sw/apps/bioinfo/trinity/$VERSION


I ran the tests sample_data/test_Trinity_Assembly/runMe.sh and got "All commands completed successfully. :-)"
