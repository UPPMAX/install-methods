HiCapTools/1.3.2
========================

<https://github.com/sahlenlab/HiCapTools#how-to-run-hicaptools>

Used under license:
C


Structure creating script (makeroom_HiCapTools_1.3.2.sh) moved to /sw/bioinfo/HiCapTools/makeroom_1.3.2.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "HiCapTools" "-v" "1.3.2" "-w" "https://github.com/sahlenlab/HiCapTools#how-to-run-hicaptools" "-d" "HiCapTools is a software package that can design sequence capture probes for targeted chromosome capture applications and analyze sequencing output to detect proximities between fragments." "-l" "C" "-s" "annotation"

    source /sw/bioinfo/HiCapTools/SOURCEME_HiCapTools_1.3.2 && cd $TOOLDIR

    # Modules
    module load bioinfo-tools
    module load zlib/1.2.12
    module load gcc/4.9.2
    module load cmake/3.26.3
    module load bamtools/2.5.1

    # Download
    cd $SRCDIR
    wget https://github.com/sahlenlab/HiCapTools/archive/refs/tags/v$VERSION.tar.gz
    tar xfvz v$VERSION.tar.gz  --strip-components 1

    # Build
    ./buildHiCapTools.sh
    export LD_LIBRARY_PATH=$PREFIX/bamtools:$LD_LIBRARY_PATH




