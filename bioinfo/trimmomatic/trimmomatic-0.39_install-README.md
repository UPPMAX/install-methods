trimmomatic/0.39
========================

<https://github.com/usadellab/Trimmomatic>

Used under license:
GPL


Structure creating script (makeroom_trimmomatic_0.39.sh) moved to /sw/bioinfo/trimmomatic/makeroom_0.39.sh

LOG
---

    TOOL=trimmomatic
    VERSION=0.39

    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://github.com/usadellab/Trimmomatic -l 'GPL' -d 'Trimmomatic performs a variety of useful trimming tasks for illumina paired-end and single ended data.'

    ./makeroom_${TOOL}_${VERSION}.sh

    source SOURCEME_${TOOL}_${VERSION}
    cd $SRCDIR


    wget https://github.com/usadellab/Trimmomatic/files/5854859/Trimmomatic-0.39.zip
    unzip Trimmomatic-0.39.zip
#move the content to $PREFIX

