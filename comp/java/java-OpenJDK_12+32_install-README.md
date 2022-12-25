java/OpenJDK_12+32
==================

<https://jdk.java.net/java-se-ri/12>

Used under license:
GPL v2


Structure creating script (makeroom_java_12+32.sh) moved to /sw/comp/java/makeroom_12+32.sh

LOG
---

Drop x86_64 intervening direcotry.

    VERSION=OpenJDK_12+32
    cd /sw/comp/java/

    makeroom.sh -f -t java -v "OpenJDK_12+32" -c comp -w https://jdk.java.net/java-se-ri/12 -d "The official Reference Implementation for Java SE 12 (JSR 386) based solely upon open-source code available from the JDK 12 Project in the OpenJDK Community" -l "GPL v2"
    ./makeroom_java_OpenJDK_12+32.sh 
    vi java-OpenJDK_12+32_install-README.md 
    source SOURCEME_java_OpenJDK_12+32
    cd $SRCDIR
    wget https://download.java.net/openjdk/jdk12/ri/openjdk-12+32_linux-x64_bin.tar.gz
    wget https://download.java.net/openjdk/jdk12/ri/openjdk-12+32_linux-x64_bin.tar.gz.sha256

    diff -Z <(sha256sum  openjdk-12+32_linux-x64_bin.tar.gz | cut -f1 -d" ") openjdk-12+32_linux-x64_bin.tar.gz.sha256


    tar xf openjdk-12+32_linux-x64_bin.tar.gz 
    mv jdk-12/* $PREFIX/
    rmdir jdk-12/

