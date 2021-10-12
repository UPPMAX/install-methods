eggNOG-mapper/2.1.4
========================

<https://github.com/eggnogdb/eggnog-mapper[D>

Used under license:



Structure creating script (makeroom_eggNOG-mapper_2.1.4.sh) moved to /sw/bioinfo/eggNOG-mapper/makeroom_2.1.4.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh -f" -t "eggNOG-mapper" -v "2.1.4" -s "annotation" -d "EggNOG-mapper is a tool for fast functional annotation of novel sequences" -w "https://github.com/eggnogdb/eggnog-mapper\[D"
    ./makeroom_eggNOG-mapper_2.1.4.sh

    source SOURCEME_${TOOL}_${VERSION}
    cd $SRCDIR

    rmdir $PREFIX
    #wget https://github.com/eggnogdb/eggnog-mapper/archive/refs/tags/2.1.4.tar.gz
    #tar xvf ${VERSION}.tar.gz
    #mv eggnog-mapper-2.1.4 $PREFIX

    module load python/3.8.7
    pip install eggnog-mapper --target=$PREFIX


