ImageJ/1.54g
========================

<https://imagej.net>

Used under license:



Structure creating script (makeroom_ImageJ_1.54g.sh) moved to /sw/apps/ImageJ/makeroom_1.54g.sh

LOG
---

    makeroom.sh "-t" "ImageJ" "-v" "1.54g" "-c" "apps" "-w" "https://imagej.net" "-d" "ImageJ is open source software for processing and analyzing scientific images." "-f"
    ./makeroom_ImageJ_1.54g.sh
    source /sw/apps/ImageJ/SOURCEME_ImageJ_1.54g && cd $SRCDIR

    wget https://wsr.imagej.net/distros/linux/ij154-linux64-java8.zip
    unzip ij154-linux64-java8.zip
    cd $PREFIX
    mv ../src/ImageJ/* .
    rm -r ../src/ImageJ

