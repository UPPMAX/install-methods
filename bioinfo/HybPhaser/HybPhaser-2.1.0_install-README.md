HybPhaser/2.1.0
========================

<https://github.com/LarsNauheimer/HybPhaser>

Used under license:
GPL-3.0


Structure creating script (makeroom_HybPhaser_2.1.0.sh) moved to /sw/bioinfo/HybPhaser/makeroom_2.1.0.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "HybPhaser" "-v" "2.1.0" "-w" "https://github.com/LarsNauheimer/HybPhaser" "-l" "GPL-3.0" "-d" "Workflow to detect and phase hybrids in target capture data " "-s" "misc"
    ./makeroom_HybPhaser_2.1.0.sh
    cd $SRCDIR
    source /sw/bioinfo/HybPhaser/SOURCEME_HybPhaser_2.1.0 && cd $TOOLDIR
    cd $PREFIX
    git clone https://github.com/LarsNauheimer/HybPhaser.git
    cd HybPhaser/
    chmod +x *.sh

    In mf file
    load hybpiper (brings samtools and bbmap)
    load latest bcftools
    load latest bwa
