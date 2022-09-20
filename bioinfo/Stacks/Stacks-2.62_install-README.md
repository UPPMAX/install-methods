Stacks/2.62
========================

<http://catchenlab.life.illinois.edu/stacks/>

Used under license:
GPL v3


Structure creating script (makeroom_Stacks_2.62.sh) moved to /sw/bioinfo/Stacks/makeroom_2.62.sh

LOG
---

    TOOL=Stacks
    VERSION=2.62
    makeroom.sh -f -t $TOOL -v $VERSION -w http://catchenlab.life.illinois.edu/stacks/ -s misc -l "GPL v3" -d "Software pipeline for building loci from short-read sequences"
    ./makeroom_${TOOL}_${VERSION}.sh

    source SOURCEME_${TOOL}_${VERSION}

    cd $SRCDIR

    [[ -f stacks-${VERSION}.tar.gz ]] || wget http://catchenlab.life.illinois.edu/stacks/source/stacks-${VERSION}.tar.gz
    tar xzf stacks-${VERSION}.tar.gz
    cd stacks-${VERSION}

    module load gcc/9.3.0
    module load perl_modules/5.26.2
    module load MariaDB/10.1.29

    ./configure --prefix=$PREFIX

    make -j 8 && make install
