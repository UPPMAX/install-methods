eggNOG-mapper/2.1.5
========================

<https://github.com/eggnogdb/eggnog-mapper>

Used under license:



Structure creating script (makeroom_eggNOG-mapper_2.1.5.sh) moved to /sw/bioinfo/eggNOG-mapper/makeroom_2.1.5.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh -f" -t "eggNOG-mapper" -v "2.1.5" -s "annotation" -d "EggNOG-mapper is a tool for fast functional annotation of novel sequences" -w "https://github.com/eggnogdb/eggnog-mapper"
    ./makeroom_eggNOG-mapper_2.1.5.sh

    source SOURCEME_${TOOL}_${VERSION}
    cd $SRCDIR

    rmdir $PREFIX

    module load python/3.8.7
    PYTHONUSERBASE=$PREFIX pip install --user eggnog-mapper==2.1.5


