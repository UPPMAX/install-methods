Pilon/1.24
========================

<https://github.com/broadinstitute/pilon/wiki>

Used under license:
GPL v2 license

Structure creating script (makeroom_Pilon_1.24.sh) moved to /sw/bioinfo/Pilon/makeroom_1.24.sh

LOG
---

Pilon is released as a JAR, like Picard or GATK.

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "Pilon" -v "1.24" -w "https://github.com/broadinstitute/pilon/wiki" -c "bioinfo" -l "GPL v2 license" -d "Pilon is a software tool which can be used to: Automatically improve draft assemblies \& Find variation among strains\, including large event detection" -x "INSTALL" -f
    ./makeroom_Pilon_1.24.sh


    cd /sw/bioinfo/Pilon
    . SOURCEME_Pilon_1.24
    cd $PREFIX
    [[ -f pilon-${VERSION}.jar ]] || wget https://github.com/broadinstitute/pilon/releases/download/v${VERSION}/pilon-${VERSION}.jar
    ln -s ./pilon-${VERSION}.jar pilon.jar

Use mf from earlier Pilon version, updating the java version to that used for
the most recent GATK version.

