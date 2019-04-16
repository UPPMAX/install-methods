maven/3.6.0
===========

<https://maven.apache.org>

LOG
---

    VERSION=3.6.0
    cd /sw/apps/build
    mkdir maven
    cd maven
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src/
    wget http://apache.mirrors.spacedump.net/maven/maven-3/${VERSION}/binaries/apache-maven-${VERSION}-bin.tar.gz
    tar xzf apache-maven-${VERSION}-bin.tar.gz 
    mv apache-maven-${VERSION} ../$CLUSTER
    cd ..
    for C in bianca irma snowy ; do ln -s rackham $C; done

