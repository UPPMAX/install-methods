GLIMPSE/2.0.0
========================

<https://odelaneau.github.io/GLIMPSE/>

Used under license:
MIT


Structure creating script (makeroom_GLIMPSE_2.0.0.sh) moved to /sw/bioinfo/GLIMPSE/makeroom_2.0.0.sh

LOG
---

    makeroom.sh -c bioinfo -s misc -t GLIMPSE -v 2.0.0 -l MIT -w https://odelaneau.github.io/GLIMPSE/ -d "GLIMPSE2 is a set of tools for low-coverage whole genome sequencing imputation. GLIMPSE2 is based on the GLIMPSE model and designed for reference panels containing hundreads of thousands of reference samples, with a special focus on rare variants." 
    ./makeroom_GLIMPSE_2.0.0.sh 
    source /sw/bioinfo/GLIMPSE/SOURCEME_GLIMPSE_2.0.0
    cd $SRCDIR

I tried compiling, but it includex AVX2 intrinsics so simply won't run on snowy, like SHAPEIT/5.1.0.0.
So, get prebuilt static binaries, and provide names without the `_static` suffix.

    wget https://github.com/odelaneau/GLIMPSE/releases/download/v2.0.0/GLIMPSE2_chunk_static
    wget https://github.com/odelaneau/GLIMPSE/releases/download/v2.0.0/GLIMPSE2_concordance_static
    wget https://github.com/odelaneau/GLIMPSE/releases/download/v2.0.0/GLIMPSE2_ligate_static
    wget https://github.com/odelaneau/GLIMPSE/releases/download/v2.0.0/GLIMPSE2_phase_static
    wget https://github.com/odelaneau/GLIMPSE/releases/download/v2.0.0/GLIMPSE2_split_reference_static

    cp -av * $PREFIX

Create symlinks without the suffix.

    cd $PREFIX
    chmod +x *_static
    for F in *_static ; do ln -s $F ${F%_static}; done

Remove snowy symlink, and edit mf to say can't run on snowy.

    cd $VERSIONDIR
    rm -f snowy

    cd $TOOLDIR/mf
    vi 2.0.0 

Wrap up.

    cd $TOOLDIR
    ./GLIMPSE-2.0.0_post-install.sh 
