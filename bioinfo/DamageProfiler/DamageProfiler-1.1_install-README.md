DamageProfiler/1.1
========================

<https://damageprofiler.readthedocs.io/en/latest/#>

Used under license:
GPL v3


Structure creating script (makeroom_DamageProfiler_1.1.sh) moved to /sw/bioinfo/DamageProfiler/makeroom_1.1.sh

LOG
---

    makeroom.sh -c bioinfo -s misc -t DamageProfiler -v 1.1 -w https://damageprofiler.readthedocs.io/en/latest/# -l "GPL v3" -d "used to calculate and visualize damage patterns in ancient DNA" -k "aDNA ancient-DNA"
    ./makeroom_DamageProfiler_1.1.sh 
    source /sw/bioinfo/DamageProfiler/SOURCEME_DamageProfiler_1.1 && cd $SRCDIR

    wget https://github.com/Integrative-Transcriptomics/DamageProfiler/releases/download/v1.1/DamageProfiler-1.1-java11.jar

    cp -av DamageProfiler-1.1-java11.jar $PREFIX

    cd $PREFIX

    chmod +x DamageProfiler-1.1-java11.jar
    ln -s DamageProfiler-1.1-java11.jar DamageProfiler-1.1.jar 
    ln -s DamageProfiler-1.1-java11.jar DamageProfiler.jar
    ml java/OpenJDK_12+32
    java -jar DamageProfiler.jar 

Load java/OpenJDK_12+32 as a prerequisite, and include help about running the jar in the module help.

