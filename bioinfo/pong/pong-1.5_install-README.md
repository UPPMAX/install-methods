pong/1.5
========================

<https://pypi.org/project/pong>

Used under license:
GPLv3


Structure creating script (makeroom_pong_1.5.sh) moved to /sw/bioinfo/pong/makeroom_1.5.sh

LOG
---


   TOOL=pong
    VERSION=1.5

    makeroom.sh -t $TOOL -v $VERSION -w "https://pypi.org/project/pong" -c "bioinfo" -l "GPLv3" -d "fast analysis and visualization of latent clusters in population genetic data." -s "misc" -f

    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

    module load python/3.9.5
    module load gcc/11.2.0

    PYTHONUSERBASE=$PREFIX pip install pong==1.5 --user

