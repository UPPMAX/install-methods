samblaster/0.1.26
=================

<https://github.com/GregoryFaust/samblaster>

Used under license:
MIT


Structure creating script (makeroom_samblaster_0.1.26.sh) moved to /sw/bioinfo/samblaster/makeroom_0.1.26.sh

LOG
---

    makeroom.sh "-f" "-t" "samblaster" "-v" "0.1.26" "-w" "https://github.com/GregoryFaust/samblaster" "-d" "a tool to mark duplicates and extract discordant and split reads from sam files" "-l" "MIT"
    ./makeroom_samblaster_0.1.26.sh
    source /sw/bioinfo/samblaster/SOURCEME_samblaster_0.1.26 && cd $SRCDIR

    wget https://github.com/GregoryFaust/samblaster/releases/download/v.${VERSION}/samblaster-v.${VERSION}.tar.gz
    tar xf samblaster-v.${VERSION}.tar.gz 
    cd samblaster-v.${VERSION}
    module load gcc/9.3.0
    make
    cp samblaster $PREFIX
    make clean

