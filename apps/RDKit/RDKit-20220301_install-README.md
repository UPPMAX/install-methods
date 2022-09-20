RDKit/20220301
========================

<https://github.com/rdkit/rdkit>

Used under license:
BSD 3-Clause-d


Structure creating script (makeroom_RDKit_20220301.sh) moved to /sw/apps/RDKit/makeroom_20220301.sh

LOG
---

    ######RDKIT

TOOL=RDKit
VERSION=20220301

makeroom.sh -t $TOOL -v $VERSION   -w "https://github.com/rdkit/rdkit"  -c "apps"  -l "BSD 3-Clause"-d "RDKit is a collection of cheminformatics and machine-learning software written in C++ and Python."   -f


./makeroom_${TOOL}_${VERSION}.sh
 source SOURCEME_${TOOL}_${VERSION}
    
module load boost/1.79.0_gcc11.2.0_mpi4.1.2
module load python/3.9.5
module load cmake/3.22.2
module load gcc/11.2.0
module load openmpi/4.1.2
module load git
cd $SRCDIR

wget https://github.com/rdkit/rdkit/archive/Release_2022_03_1.tar.gz

tar xvf Release_2022_03_1.tar.gz

cd rdkit-Release_2022_03_1/


cmake -DRDK_INSTALL_INTREE=OFF -DCMAKE_INSTALL_PREFIX=$PREFIX ..
make
make install

export RDBASE=/sw/apps/RDKit/20220301/src/rdkit-Release_2022_03_1
ctest
