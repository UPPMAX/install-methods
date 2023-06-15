Salmon/1.9.0
============

<https://salmon.readthedocs.io/en/latest>

Used under license:
GPL v3


Structure creating script (makeroom_Salmon_1.9.0.sh) moved to /sw/bioinfo/Salmon/makeroom_1.9.0.sh

LOG
---

    makeroom.sh "-f" "-c" "bioinfo" "-s" "misc" "-t" "Salmon" "-v" "1.9.0" "-w" "https://salmon.readthedocs.io/en/latest" "-d" "a tool for wicked-fast transcript quantification from RNA-seq data" "-l" "GPL v3"
    ./makeroom_Salmon_1.9.0.sh

    source /sw/bioinfo/Salmon/SOURCEME_Salmon_1.9.0 && cd $SRCDIR
    wget https://github.com/COMBINE-lab/salmon/releases/download/v1.9.0/salmon-1.9.0_linux_x86_64.tar.gz
    tar xf salmon-1.9.0_linux_x86_64.tar.gz
    cd salmon-1.9.0_linux_x86_64/
    mv * $PREFIX/
    cd ..
    rmdir salmon-1.9.0_linux_x86_64/
    cd $PREFIX/bin
    ./salmon
