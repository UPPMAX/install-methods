SHAPEIT/v5.1.0.0
================

<https://github.com/odelaneau/shapeit5>

Used under license:
MIT


Structure creating script (makeroom_SHAPEIT_v5.1.0.0.sh) moved to /sw/bioinfo/SHAPEIT/makeroom_v5.1.0.0.sh


Cannot be built for snowy
-------------------------

The prebuilt static binaries use, and the source now requires AVX2 instructions
through use of `__m256d` and similar datatypes. These do not exist on snowy. It
cannot be built from source for snowy.


LOG
---

    makeroom.sh -f -t SHAPEIT -v v5.1.0.0 -l MIT -w https://github.com/odelaneau/shapeit5 -d "estimates haplotypes in large datasets, with a special focus on rare variants" -u "rackham bianca miarka"
    ./makeroom_SHAPEIT_v5.1.0.0.sh 
    source /sw/bioinfo/SHAPEIT/SOURCEME_SHAPEIT_v5.1.0.0

    cd $SRCDIR

These are all directly downloaded, statically compiled binaries.
The tarballs under the release tag are all images, it appears.

    wget https://github.com/odelaneau/shapeit5/releases/download/v1.0.0/SHAPEIT5_ligate_static_v1.0.0
    wget https://github.com/odelaneau/shapeit5/releases/download/v1.0.0/SHAPEIT5_phase_common_static_v1.0.0
    wget https://github.com/odelaneau/shapeit5/releases/download/v1.0.0/SHAPEIT5_phase_rare_static_v1.0.0
    wget https://github.com/odelaneau/shapeit5/releases/download/v1.0.0/SHAPEIT5_switch_static_v1.0.0

Check each, then copy to the PREFIX and create unversioned symlinks.

    file SHAPEIT5_*
    chmod +x SHAPEIT5_*
    ./SHAPEIT5_phase_common_static_v1.0.0 
    ./SHAPEIT5_phase_rare_static_v1.0.0 
    ./SHAPEIT5_ligate_static_v1.0.0 
    ./SHAPEIT5_switch_static_v1.0.0 

    cp -av * $PREFIX
    cd $PREFIX
    for F in *_static_v1.0.0 ; do ln -s $F ${F%_static_v1.0.0}; done


