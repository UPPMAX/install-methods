picard 2.10.3
============

Since this is a Java `.jar` file, pick a cluster (here, milou) and make the
others links to the one chosen.

<https://broadinstitute.github.io/picard/>

LOG
---

    VERSION=2.10.3
    CLUSTER=milou
    cd /sw/apps/bioinfo/picard
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    cd $CLUSTER
    wget https://github.com/broadinstitute/picard/releases/download/${VERSION}/picard.jar

Now link the remaining clusters

    cd ..
    ln -s $CLUSTER rackham
    ln -s $CLUSTER bianca
    ln -s $CLUSTER irma

Adjust the mf file a bit, and continue using the java 8 version from
`picard/2.0.1`, which is `java/sun_jdk1.8.0_40`.

