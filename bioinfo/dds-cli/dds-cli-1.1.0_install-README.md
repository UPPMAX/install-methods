dds-cli/1.1.0
========================

<https://pypi.org/project/dds-cli/>

Used under license:
Other


Structure creating script (makeroom_dds-cli_1.1.0.sh) moved to /sw/bioinfo/dds-cli/makeroom_1.1.0.sh

LOG
---

TOOL=dds-cli
VERSION=1.1.0

makeroom.sh -t $TOOL -v $VERSION   -w "https://pypi.org/project/dds-cli/"  -c "bioinfo" -s "misc" -l "Other" -d "SciLifeLab Data Delivery System - Command line interface"   -f

./makeroom_dds-cli_1.1.0.sh

./makeroom_${TOOL}_${VERSION}.sh
 source SOURCEME_${TOOL}_${VERSION}
    
module load python/3.9.5
module load gcc/11.2.0

cd $SRCDIR


PYTHONUSERBASE=$PREFIX pip install dds-cli==$VERSION

