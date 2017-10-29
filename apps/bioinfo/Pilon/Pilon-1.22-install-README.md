Pilon/1.22
==========

<https://github.com/broadinstitute/pilon/wiki>

Pilon is a software tool which can be used to:
* Automatically improve draft assemblies
* Find variation among strains, including large event detection

Log
---

Pilon is released as a JAR, like Picard or GATK.

    TOOL=/sw/apps/bioinfo/Pilon
    VERSION=1.22
    CLUSTER=rackham
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    for C in milou bianca irma ; do ln -s $CLUSTER $C; done
    cd $CLUSTER
    [[ -f pilon-${VERSION}.jar ]] || wget https://github.com/broadinstitute/pilon/releases/download/v${VERSION}/pilon-${VERSION}.jar
    ln -s ./pilon-${VERSION}.jar pilon.jar

Use mf from earlier Pilon version, updating the java version to that used for
the most recent GATK version.

