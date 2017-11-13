optima/f-1.3
============

OPTIMA: <http://www.davideverzotto.it/research/OPTIMA/>

LOG
---

    VER=f-1.3
    TOP=/sw/apps/bioinfo/optima/$VER

    mkdir -p $TOP
    cd $TOP
    mkdir src aux

    cd src
    wget https://github.com/verznet/OPTIMA/archive/f-1.3.zip

    cd ../aux
    wget http://www.davideverzotto.it/research/OPTIMA/commons-math3-3.2.jar
    wget http://www.davideverzotto.it/research/OPTIMA/cern.jar

For each cluster:

    cd $TOP
    unzip src/$VER.zip
    mv OPTIMA-$VER  $CLUSTER
    cd $CLUSTER
    mkdir OPTIMA
    mv *.java OPTIMA
    ln -s ../aux/*.jar .
    javac -cp ".:cern.jar:commons-math3-3.2.jar" OPTIMA/Align.java
