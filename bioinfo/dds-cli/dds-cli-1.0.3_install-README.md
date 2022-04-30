dds-cli/1.0.3
========================

<https://pypi.org/project/dds-cli/>

Used under license:
Other-d


Structure creating script (makeroom_dds-cli_1.0.3.sh) moved to /sw/bioinfo/dds-cli/makeroom_1.0.3.sh

LOG
---

  TOOL=dds-cli
  VERSION=1.0.3
  mkdir $TOOL
  cd $TOOL

  makeroom.sh -t $TOOL -v $VERSION   -w "https://pypi.org/project/dds-cli/"  -c "bioinfo" -s "misc" -l "Other"-d "SciLifeLab Data Delivery System - Command line interface"   -f

  ./makeroom_${TOOL}_${VERSION}.sh
  source SOURCEME_${TOOL}_${VERSION}
    
  module load python/3.9.5
  module load gcc/11.2.0

  cd $SRCDIR

  PYTHONUSERBASE=$PREFIX pip install dds-cli
