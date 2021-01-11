java/OpenJDK_11+28
==================

Install the OpenJDK Java "11".


LOG
---

    VERSION=OpenJDK_11+28
    cd /sw/comp/java/x86_64/
    mkdir $VERSION
    cd $VERSION
    PREFIX=$PWD
    mkdir src
    cd src
    wget https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_linux-x64_bin.tar.gz
    wget https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_linux-x64_bin.tar.gz.sha256
    sha256sum openjdk-11+28_linux-x64_bin.tar.gz 
    tar xzf openjdk-11+28_linux-x64_bin.tar.gz 
    mv jdk-11/* $PREFIX/
    rmdir jdk-11/

The OpenJDK mf file differs in that it we do not add to `MANPATH` since it
contains no `man/` directory.
