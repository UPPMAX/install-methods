KneadData/0.12.0
========================

<https://github.com/biobakery/kneaddata>

Used under license:
MIT license


Structure creating script (makeroom_KneadData_0.12.0.sh) moved to /sw/bioinfo/KneadData/makeroom_0.12.0.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "KneadData" "-v" "0.12.0" "-w" "https://github.com/biobakery/kneaddata" "-c" "bioinfo" "-l" "MIT license" "-d" "is a tool designed to perform quality control on metagenomic and metatranscriptomic sequencing data\, especially data from microbiome experiments." "-s" "misc" "-x" "INSTALL" "-f"
    ./makeroom_KneadData_0.12.0.sh
    source /sw/bioinfo/KneadData/SOURCEME_KneadData_0.12.0 && cd $TOOLDIR
    cd $PREFIX
    ml java/sun_jdk1.8.0_151 python/3.10.8 trimmomatic/0.39 trf/4.09.1 bowtie2/2.5.1
    PYTHONUSERBASE=$PREFIX pip install --user kneaddata  --install-option='--bypass-dependencies-install'

