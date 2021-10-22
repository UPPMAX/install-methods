phaser/20210423-5d4926d
========================

<https://github.com/secastel/phaser>

Used under license:
GNU


Structure creating script (makeroom_phaser_20210423-5d4926d.sh) moved to /sw/bioinfo/phaser/makeroom_20210423-5d4926d.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh -f" -t "phaser" -v "20210423-5d4926d" -s "misc" -w "https://github.com/secastel/phaser" -l "GNU" -d "phasing and Allele Specific Expression from RNA-seq"
    ./makeroom_phaser_20210423-5d4926d.sh


    TOOL=phaser
    COMMIT=5d4926d
    VERSION=20210423-5d4926d
    #makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://github.com/secastel/phaser -l 'GNU' -d 'phasing and Allele Specific Expression from RNA-seq'



    source SOURCEME_phaser_20210423-5d4926d
    cd $PREFIX

    module load python/2.7.6
    module load git/2.28.0

    git clone https://github.com/secastel/phaser.git
    git reset --hard COMMIT

    cd phaser/phaser/
    python setup.py build_ext --inplace
