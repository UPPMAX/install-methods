graftM/0.13.1
========================

<http://geronimp.github.io/graftM/>

Used under license:
GNU 3.0
<>

Structure creating script (makeroom_graftM_0.13.1.sh) moved to /sw/bioinfo/graftM/makeroom_0.13.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "graftM" -v "0.13.1" -s "annotation" -w "http://geronimp.github.io/graftM/" -l "GNU 3.0" -d "GraftM is a tool for finding genes of interest in metagenomes\, metatranscriptomes\, and whole genomes."
    ./makeroom_graftM_0.13.1.sh

    cd /sw/bioinfo/graftM
    source SOURCEME_graftM_0.13.1
    
Download dependencies
orfm
    mkdir -p ${TOOLDIR}/aux_rackham/orfm
    cd ${TOOLDIR}/aux_rackham/orfm
    wget https://github.com/wwood/OrfM/releases/download/v0.7.1/orfm-0.7.1_Linux_x86_64.tar.gz
    tar xfvz orfm-0.7.1_Linux_x86_64.tar.gz --strip-components=1
    PATH=${TOOLDIR}/aux_rackham/orfm/:${PATH}
mfqe
    mkdir ${TOOLDIR}/aux_rackham/mfqe
    cd ${TOOLDIR}/aux_rackham/mfqe
    tar xfvz mfqe-static-x86_64-unknown-linux-musl-0.5.0.tar.gz --strip-components=1
    rm mfqe-static-x86_64-unknown-linux-musl-0.5.0.tar.gz
    PATH=${TOOLDIR}/aux_rackham/mfqe/:${PATH}

    module load hmmer/3.2.1
    module load pplacer/1.1.alpha19
    module load Krona/2.7.1
    module load MAFFT/7.407
    module load diamond/2.0.4
    module load FastTree/2.1.10
    module load python/3.7.2

Install as a virtual environment
    virtualenv ${PREFIX}/venv
    ${PREFIX}/venv/bin/pip install graftm==0.13.1
    mkdir ${PREFIX}/bin
    cd ${PREFIX}/bin
    ln -s ../venv/bin/graftM
    ldd $(head -n 1 graftM | cut -c3-)

Download source to run test 
    cd $SRCDIR
    wget https://github.com/geronimp/graftM/archive/v0.13.1.tar.gz
    tar xfvz v0.13.1.tar.gz --strip-components=1
