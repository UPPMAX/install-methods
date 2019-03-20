phyutility/2.7.3
================

There is a version mismatch, phyutility will self-report 2.7.1 but this is indeed 2.7.3 as downloaded from the tagged release:

    https://github.com/blackrim/phyutility/releases/tag/v2.7.3


<https://github.com/blackrim/phyutility>


LOG
---

    cd /sw/bioinfo/
    mkdir phyutility
    VERSION=2.7.3
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    PFX=$PWD/$CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in snowy irma bianca ; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src

    wget https://github.com/blackrim/phyutility/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz 
    cd phyutility-${VERSION}/

    module load java/sun_jdk1.8.0_151
    module load ant/1.10.0

    ant clean
    ant compile
    ant jar

    cd build/jar/
    java -jar phyutility.jar -h
    cp -av phyutility.jar $PFX

    cd $PFX

    wget -O phyutility-manual.pdf https://github.com/blackrim/phyutility/raw/master/manual.pdf


Now create shell script `phyutility` for invoking the jar.  Contents below.


    #!/bin/bash

    # UPPMAX script to run phyutility.jar
    #
    # one-liner for DIR from https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself/246128#246128

    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

    java -Xms512m -Xmx5g -jar "$DIR"/phyutility.jar $*


In the mf script, load `java/sun_jdk1.8.0_151`, and call out the version mismatch and availability of the script and manual.
