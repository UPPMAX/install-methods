java/OpenJDK_17+35
==================

<https://jdk.java.net/java-se-ri/17>

JSR 392, <https://www.jcp.org/en/jsr/detail?id=392>

Used under license:
GPL v2 with the Classpath Exception
<https://openjdk.org/legal/gplv2+ce.html>



Structure creating script (makeroom_java_17+35.sh) moved to /sw/comp/java/makeroom_17+35.sh

LOG
---

Drop x86_64 intervening direcotry.

    VERSION=OpenJDK_17+35
    cd /sw/comp/java/

    makeroom.sh -f -t java -v "OpenJDK_17+35" -c comp -w https://jdk.java.net/java-se-ri/17 -d "The official Reference Implementation for Java SE 17 (JSR 392, https://www.jcp.org/en/jsr/detail?id=392) based solely upon open-source code available from the JDK 17 Project in the OpenJDK Community" -l "GPL v2 with the Classpath Exception" -L https://openjdk.org/legal/gplv2+ce.html
    ./makeroom_java_OpenJDK_17+35.sh 
    source /sw/comp/java/SOURCEME_java_OpenJDK_17+35
    cd $SRCDIR

    wget https://download.java.net/openjdk/jdk17/ri/openjdk-17+35_linux-x64_bin.tar.gz
    wget https://download.java.net/openjdk/jdk17/ri/openjdk-17+35_linux-x64_bin.tar.gz.sha256

    diff -Z <(sha256sum  openjdk-17+35_linux-x64_bin.tar.gz | cut -f1 -d" ") openjdk-17+35_linux-x64_bin.tar.gz.sha256


    tar xf openjdk-17+35_linux-x64_bin.tar.gz 
    mv jdk-17/* $PREFIX/
    rmdir jdk-17/

