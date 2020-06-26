cactus/1.0.0
========================

<https://github.com/ComparativeGenomicsToolkit/cactus>

Used under license:
MIT

Structure creating script (makeroom_cactus_1.0.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/cactus/makeroom_1.0.0.sh

LOG
---

    TOOL=cactus
    VERSION=1.0.0
    CLUSTER=rackham
    TOOLDIR=/sw/libs/$TOOL
    VERSIONDIR=/sw/libs/$TOOL/$VERSION
    PREFIX=/sw/libs/$TOOL/$VERSION/$CLUSTER

module load python/3.6.8


git clone https://github.com/ComparativeGenomicsToolkit/cactus.git --recursive
cd $PREFIX/cactus
git checkout v1.0.0

cd $PREFIX
python3 -m pip install --upgrade --target $PREFIX/virtualenv virtualenv
./virtualenv/bin/virtualenv -p python3.6 cactus_env
source cactus_env/bin/activate
pip install --upgrade setuptools pip
pip install --upgrade -r $PREFIX/cactus/toil-requirement.txt

cd $PREFIX/cactus
pip install --upgrade .



# Download the cactus singularity binary set
singularity pull -F $PREFIX/cactus_v1.0.0.sif docker://quay.io/comparative-genomics-toolkit/cactus:v1.0.0 



