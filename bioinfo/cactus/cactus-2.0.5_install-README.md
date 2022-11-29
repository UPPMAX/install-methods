cactus/2.0.5
========================

<https://github.com/ComparativeGenomicsToolkit/cactus>

Used under license:



Structure creating script (makeroom_cactus_2.0.5.sh) moved to /sw/bioinfo/cactus/makeroom_2.0.5.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "cactus" "-v" "2.0.5" "-w" "https://github.com/ComparativeGenomicsToolkit/cactus" "-f"
    ./makeroom_cactus_2.0.5.sh
    source /sw/bioinfo/cactus/SOURCEME_cactus_2.0.5 && cd $TOOLDIR
    TOOL=cactus
    VERSION=2.0.5

    module load python/3.8.7
    module load git/2.34.1
    module load gcc/4.9.4
    module load hdf5/1.10.5
    module load lzo/2.10
    module load xz/5.2.2

    cd $PREFIX
    git clone https://github.com/ComparativeGenomicsToolkit/cactus.git --recursive
    cd $PREFIX/cactus
    git checkout v${VERSION}

    cd $PREFIX
    python3 -m virtualenv -p python3.8 cactus_env

    source cactus_env/bin/activate
    cd $PREFIX/cactus
    pip install --upgrade setuptools pip
# pip install --upgrade -r toil-requirement.txt it tries to install a python2 module with all.
    pip install --upgrade toil[aws,mesos,google,encryption,cwl]
    pip install --upgrade .

Remove CMD 'CMDLDFLAGS =  -static' from kyoto Makefiles due to errors. Ugly but works.

    unset PREFIX
    make -j 15

Download the cactus singularity binary set

    source /sw/bioinfo/cactus/SOURCEME_cactus_2.0.5
    singularity pull -F $PREFIX/cactus_v${VERSION}.sif docker://quay.io/comparative-genomics-toolkit/cactus:v${VERSION} 



Test with both the local binaries and the singularity ones

    module load bioinfo-tools cactus/2.0.5
    cactus \\
        jobStore${RANDOM} \\
        /sw/bioinfo/cactus/2.0.5/rackham/cactus/examples/evolverMammals.txt \\
        /sw/bioinfo/cactus/2.0.5/rackham/cactus/examples/evolverMammals.hal \\
        --root mr

    cactus \\
        --binariesMode singularity \\
        --containerImage $CACTUS_SINGULARITY_IMG \\
        jobStore${RANDOM} \\
        /sw/bioinfo/cactus/2.0.5/rackham/cactus/examples/evolverMammals.txt \\
        /sw/bioinfo/cactus/2.0.5/rackham/cactus/examples/evolverMammals.hal \\
        --root mr







