manta/1.6.0
========================

<https://github.com/Illumina/manta/releases/tag/v1.6.0>

Used under license:
GPL v3


Structure creating script (makeroom_manta_1.6.0.sh) moved to /sw/bioinfo/manta/makeroom_1.6.0.sh

LOG
---

  TOOL=manta
  VERSION=1.6.0

  makeroom.sh -f -t $TOOL -v $VERSION -s "misc" -w "https://github.com/Illumina/manta/releases/tag/v1.6.0" -l "GPL v3" -d "Manta calls structural variants (SVs) and indels from mapped paired-end sequencing reads."

  ./makeroom_${TOOL}_${VERSION}.sh
  source SOURCEME_${TOOL}_${VERSION}

  module load python/2.7.15
  module load gcc/9.3.0
  module load cmake/3.22.2   
  module load git/2.34.1


  cd $SRCDIR

  wget https://github.com/Illumina/manta/releases/download/v${VERSION}/manta-${VERSION}.release_src.tar.bz2
  tar -xjf manta-${VERSION}.release_src.tar.bz2
  mkdir build && cd build
# Ensure that CC and CXX are updated to target compiler if needed, e.g.:
#     export CC=/path/to/cc
#     export CXX=/path/to/c++
  ../configure --jobs=4 --prefix=$PREFIX
  make -j4 install


