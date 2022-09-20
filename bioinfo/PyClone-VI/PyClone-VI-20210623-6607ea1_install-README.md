PyClone-VI/20210623-6607ea1
========================

<https://github.com/Roth-Lab/pyclone-vi>

Used under license:
GPL V3-d


Structure creating script (makeroom_PyClone-VI_20210623-6607ea1.sh) moved to /sw/bioinfo/PyClone-VI/makeroom_20210623-6607ea1.sh

LOG
---

TOOL=PyClone-VI
VERSION=20210623-6607ea1
mkdir $TOOL
cd $TOOL

makeroom.sh -t $TOOL -v $VERSION   -w "https://github.com/Roth-Lab/pyclone-vi"  -c "bioinfo" -s "misc" -l "GPL V3"-d "PyClone-VI is a fast method for inferring clonal population structure."   -f

./makeroom_${TOOL}_${VERSION}.sh
 source SOURCEME_${TOOL}_${VERSION}
    
#module load conda/latest
module load python/3.9.5
module load gcc/11.2.0
module load git/2.34.1

cd $SRCDIR

#wget https://github.com/Roth-Lab/pyclone-vi/archive/refs/tags/0.1.1.tar.gz
#conda create -c conda-forge -n pyclone-vi --file requirements.txt --yes

PYTHONUSERBASE=$PREFIX pip install git+https://github.com/Roth-Lab/pyclone-vi.git
PYTHONUSERBASE=$PREFIX pip install numba
