BlobToolKit/3.1.0
========================

<https://github.com/blobtoolkit>

Used under license:
MIT License


Structure creating script (makeroom_BlobToolKit_3.1.0.sh) moved to /sw/bioinfo/BlobToolKit/makeroom_3.1.0.sh

LOG
---

  TOOL=BlobToolKit
  VERSION=3.1.0
 
  makeroom.sh -f -t $TOOL -v $VERSION -s "misc" -w "https://github.com/blobtoolkit" -l "MIT License" -d "A new implementation of BlobTools with support for interactive data exploration via the BlobToolKit viewer"

  ./makeroom_${TOOL}_${VERSION}.sh
  source SOURCEME_${TOOL}_${VERSION}

  module load python/3.9.5
  module load gcc/9.3.0

  cd $PREFIX

  PYTHONUSERBASE=$PREFIX pip install blobtoolkit==3.1.0
