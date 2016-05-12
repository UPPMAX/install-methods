# Pilon-1.17-install-README.md

Pilon 1.17
==========

<https://github.com/broadinstitute/pilon/wiki>

Pilon is a software tool which can be used to:
* Automatically improve draft assemblies
* Find variation among strains, including large event detection

Log
---

Pilon is released as a JAR, like Picard or GATK.

    cd /sw/apps/bioinfo
    mkdir Pilon
    cd Pilon
    mkdir mf 1.17
    cd 1.17
    mkdir milou
    ln -s ./milou tintin
    ln -s ./milou irma
    cd milou/
    wget https://github.com/broadinstitute/pilon/releases/download/v1.17/pilon-1.17.jar
    ln -s ./pilon-1.17.jar pilon.jar
    cd ../../mf

Get the latest Picardtools mf file, which loads Java 1.8, 1.7 is required but a
good idea to use the later one.  Edit.

    cp /sw/apps/bioinfo/picard/mf/2.0.1 1.17
    vi 1.17

Add the mf file to the assembly subgroup of bioinfo-tools on milou and tintin.

Be a good coworker.

    cd /sw/apps/bioinfo
    fixup -g Pilon

