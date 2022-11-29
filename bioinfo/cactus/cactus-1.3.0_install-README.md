cactus/1.3.0
========================

<https://github.com/ComparativeGenomicsToolkit/cactus>

Used under license:
Copyright
<>

Structure creating script (makeroom_cactus_1.3.0.sh) moved to /sw/bioinfo/cactus/makeroom_1.3.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "cactus" -v "1.3.0" -s "annotation" -w "https://github.com/ComparativeGenomicsToolkit/cactus" -l "Copyright" -d "Cactus is a reference-free whole-genome multiple alignment program." -f""
    ./makeroom_cactus_1.3.0.sh
    TOOL=cactus
    VERSION=1.3.0
    cd /sw/bioinfo/$TOOL
    source SOURCEME_cactus_1.3.0

    module load python/3.8.7
    module load git/2.28.0
    module load gcc/4.9.4
    module load hdf5/1.10.5
    module load lzo/2.10
    module load xz/5.2.2

    cd $PREFIX
    git clone https://github.com/ComparativeGenomicsToolkit/cactus.git --recursive
    cd $PREFIX/cactus
    git checkout v${VERSION}

    cd $PREFIX
    #python3 -m pip install --upgrade --target $PREFIX/virtualenv virtualenv
    python3 -m virtualenv -p python3.8 cactus_env

    source cactus_env/bin/activate
    cd $PREFIX/cactus
    pip install --upgrade setuptools pip
    pip install --upgrade -r toil-requirement.txt
    pip install --upgrade .

#Remove CMD 'CMDLDFLAGS =  -static' from kyoto Makefiles due to errors. Ugly but works.
    unset PREFIX
    make -j 15
    sed -i.bak 's/-static//g' submodules/kyoto/kyotocabinet/Makefile
    make -j 15
    sed -i.bak 's/-static//g' submodules/kyoto/kyototycoon/Makefile
    make -j 15


    # Download the cactus singularity binary set
    singularity pull -F $PREFIX/cactus_v1.3.0.sif docker://quay.io/comparative-genomics-toolkit/cactus:v1.3.0 




