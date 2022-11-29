cactus/2.2.1
========================

<https://github.com/ComparativeGenomicsToolkit/cactus>

Used under license:
AS IS


Structure creating script (makeroom_cactus_2.2.1.sh) moved to /sw/bioinfo/cactus/makeroom_2.2.1.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "cactus" "-v" "2.2.1" "-w" "https://github.com/ComparativeGenomicsToolkit/cactus" "-x" "INSTALL" "-l" "AS IS" "-f"
    ./makeroom_cactus_2.2.1.sh

    source /sw/bioinfo/cactus/SOURCEME_cactus_2.2.1
    TOOL=cactus
    VERSION=2.2.1

    module load python/3.8.7
    module load git/2.34.1
    module load gcc/8.4.0
    module load hdf5/1.10.1
    module load lzo/2.10
    module load xz/5.2.2
    module load binutils/2.38

# Download and checkout
    cd $PREFIX
    git clone https://github.com/ComparativeGenomicsToolkit/cactus.git --recursive
    cd $PREFIX/cactus
    git checkout v${VERSION}

# Create virtualenv
    cd $PREFIX
    python3 -m virtualenv -p python3.8 cactus_env

# Update python packages
    source cactus_env/bin/activate
    cd $PREFIX/cactus
    pip install --upgrade setuptools pip
    python3 -m pip install -U -r ./toil-requirement.txt
    python3 -m pip install -U .

# Compile
    unset PREFIX
    make -j 15

# Download the cactus singularity binary set
    source /sw/bioinfo/cactus/SOURCEME_cactus_${VERSION}
    cd $PREFIX
    singularity pull -F $PREFIX/cactus_v${VERSION}.sif docker://quay.io/comparative-genomics-toolkit/cactus:v${VERSION} 



# Test with both the local binaries and the singularity ones

    VERSION=2.2.1
    module load bioinfo-tools cactus/${VERSION}
    cactus \\
        jobStore${RANDOM} \\
        /sw/bioinfo/cactus/${VERSION}/rackham/cactus/examples/evolverMammals.txt \\
        /sw/bioinfo/cactus/${VERSION}/rackham/cactus/examples/evolverMammals.hal \\
        --root mr

    cactus \\
        --binariesMode singularity \\
        --containerImage $CACTUS_SINGULARITY_IMG \\
        jobStore${RANDOM} \\
        /sw/bioinfo/cactus/${VERSION}/rackham/cactus/examples/evolverMammals.txt \\
        /sw/bioinfo/cactus/${VERSION}/rackham/cactus/examples/evolverMammals.hal \\
        --root mr






