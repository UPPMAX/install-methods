GLIMPSE/1.1.1
=============

<https://odelaneau.github.io/GLIMPSE/>

Used under license:
MIT


Structure creating script (makeroom_GLIMPSE_1.1.1.sh) moved to /sw/bioinfo/GLIMPSE/makeroom_1.1.1.sh

LOG
---

    makeroom.sh "-f" "-c" "bioinfo" "-s" "misc" "-t" "GLIMPSE" "-v" "1.1.1" "-l" "MIT" "-w" "https://odelaneau.github.io/GLIMPSE/" "-d" "GLIMPSE2 is a set of tools for low-coverage whole genome sequencing imputation. GLIMPSE2 is based on the GLIMPSE model and designed for reference panels containing hundreads of thousands of reference samples, with a special focus on rare variants."
    ./makeroom_GLIMPSE_1.1.1.sh

    source /sw/bioinfo/GLIMPSE/SOURCEME_GLIMPSE_1.1.1
    cd $SRCDIR

Use the prebuilt static binaries. These maybe don't use AVX2.

    wget https://github.com/odelaneau/GLIMPSE/releases/download/v1.1.1/GLIMPSE_chunk_static
    wget https://github.com/odelaneau/GLIMPSE/releases/download/v1.1.1/GLIMPSE_concordance_static
    wget https://github.com/odelaneau/GLIMPSE/releases/download/v1.1.1/GLIMPSE_ligate_static
    wget https://github.com/odelaneau/GLIMPSE/releases/download/v1.1.1/GLIMPSE_phase_static
    wget https://github.com/odelaneau/GLIMPSE/releases/download/v1.1.1/GLIMPSE_sample_static
    wget https://github.com/odelaneau/GLIMPSE/releases/download/v1.1.1/GLIMPSE_snparray_static
    wget https://github.com/odelaneau/GLIMPSE/releases/download/v1.1.1/GLIMPSE_stats_static
    chmod +x *_static
    cp -av * $PREFIX
    cd $PREFIX
    for F in *_static ; do ln -s $F ${F%_static}; done

Wrap up.

    cd $TOOLDIR
    ./GLIMPSE-1.1.1_post-install.sh 


