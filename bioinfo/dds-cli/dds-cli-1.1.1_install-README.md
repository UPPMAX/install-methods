dds-cli/1.1.1
========================

<https://pypi.org/project/dds-cli/>

Used under license:
Other

LOG
---

TOOL=dds-cli
VERSION=1.1.1

makeroom.sh -t $TOOL -v $VERSION   -w "https://pypi.org/project/dds-cli/"  -c "bioinfo" -s "misc" -l "Other" -d "SciLifeLab Data Delivery System - Command line interface"   -f

./makeroom_${TOOL}_${VERSION}.sh
source SOURCEME_${TOOL}_${VERSION}
    
module load python/3.9.5
module load gcc/11.2.0

cd $SRCDIR


PYTHONUSERBASE=$PREFIX pip install dds-cli==$VERSION

