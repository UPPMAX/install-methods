dentist/4.0.0
========================

<https://github.com/a-ludi/dentist>

Used under license:
MIT

TOOL=dentist
VERSION=4.0.0



Structure creating script (makeroom_dentist_4.0.0.sh) moved to /sw/bioinfo/dentist/makeroom_4.0.0.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "dentist" "-s" "pipelines" "-v" "4.0.0" "-w" "https://github.com/a-ludi/dentist" "-d" "Long sequencing reads allow increasing contiguity and completeness of fragmented, short-read based genome assemblies by closing assembly gaps, ideally at high accuracy." "-l" "MIT"
    ./makeroom_dentist_4.0.0.sh
    source /sw/bioinfo/dentist/SOURCEME_dentist_4.0.0 && cd $TOOLDIR

    cd $SRCDIR
    wget https://github.com/a-ludi/dentist/releases/download/v4.0.0/dentist.v4.0.0.x86_64.tar.gz
    tar zxvf dentist.v4.0.0.x86_64.tar.gz
    rmdir $PREFIX
    mv dentist.v4.0.0.x86_64 $PREFIX
    




