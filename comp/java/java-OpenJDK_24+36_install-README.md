java/OpenJDK_24+36
==================

<https://jdk.java.net/java-se-ri/24>

JSR 399, <https://www.jcp.org/en/jsr/detail?id=399>

Used under license:
GPL v2 with the Classpath Exception
<https://openjdk.org/legal/gplv2+ce.html>



Structure creating script (makeroom_java_24+36.sh) moved to /sw/comp/java/makeroom_24+36.sh

LOG
---

    VERSION=OpenJDK_24+36
    cd /sw/comp/java/

    makeroom.sh -f -t java -v "OpenJDK_24+36" -c comp -w https://jdk.java.net/java-se-ri/24 -d "The official Reference Implementation for Java SE 24 (JSR 397, https://www.jcp.org/en/jsr/detail?id=392) based solely upon open-source code available from the JDK 24 Project in the OpenJDK Community" -l "GPL v2 with the Classpath Exception" -L https://openjdk.org/legal/gplv2+ce.html
    ./makeroom_java_OpenJDK_24+36.sh 
    source /sw/comp/java/SOURCEME_java_OpenJDK_24+36
    cd $SRCDIR

    wget https://download.java.net/openjdk/jdk24/ri/openjdk-24+36_linux-x64_bin.tar.gz
    wget https://download.java.net/openjdk/jdk24/ri/openjdk-24+36_linux-x64_bin.tar.gz.sha256

    diff -Z <(sha256sum  openjdk-24+36_linux-x64_bin.tar.gz | cut -f1 -d" ") openjdk-24+36_linux-x64_bin.tar.gz.sha256


    tar xf openjdk-24+36_linux-x64_bin.tar.gz 
    mv jdk-24/* $PREFIX/
    rmdir jdk-24/

java/OpenJDK_24+36
========================

<https://jdk.java.net/java-se-ri/24>

Used under license:
GPL v2 with the Classpath Exception
<https://openjdk.org/legal/gplv2+ce.html>

Structure creating script (makeroom_java_OpenJDK_24+36.sh) moved to /sw/comp/java/makeroom_OpenJDK_24+36.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-t" "java" "-v" "OpenJDK_24+36" "-c" "comp" "-w" "https://jdk.java.net/java-se-ri/24" "-d" "The official Reference Implementation for Java SE 24 (JSR 397, https://www.jcp.org/en/jsr/detail?id=392) based solely upon open-source code available from the JDK 24 Project in the OpenJDK Community" "-l" "GPL v2 with the Classpath Exception" "-L" "https://openjdk.org/legal/gplv2+ce.html"
    ./makeroom_java_OpenJDK_24+36.sh
