bismark/0.22.1
==============

<https://www.bioinformatics.babraham.ac.uk/projects/bismark>

Used under license:
GPL v3

Structure creating script (makeroom_bismark_0.22.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/bismark/makeroom_0.22.1.sh


LOG
---

This is a collection of Perl scripts, so just move the unpacked directory to be the $CLUSTER directory

    VERSION=0.22.1
    cd /sw/bioinfo/bismark
    mkdir $VERSION
    cd $VERSION
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src
    wget --timestamping https://www.bioinformatics.babraham.ac.uk/projects/bismark/bismark_v${VERSION}.tar.gz
    tar xzf bismark_v${VERSION}.tar.gz 
    mv bismark_v0.22.1 ../$CLUSTER
    cd ../$CLUSTER
    file *

