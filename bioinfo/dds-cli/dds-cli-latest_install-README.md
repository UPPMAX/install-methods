dds-cli/latest
========================

TOOL=dds-cli
VERSION=latest

# TO UPDATE ====================================

cd /sw/bioinfo/dds-cli/latest/rackham
source venv/bin/activate
python3 -m pip install -U pip setuptools wheel  
python3 -m pip install -U dds-cli



# To install ===================================
run_makeroom -t $TOOL -v $VERSION   -w "https://pypi.org/project/dds-cli/"  -c "bioinfo" -s "misc" -l "Other" -d "SciLifeLab Data Delivery System - Command line interface"   -f

./makeroom_${TOOL}_${VERSION}.sh
source SOURCEME_${TOOL}_${VERSION}
    
module load python/3.12.1
module load gcc/14.2.0

cd $PREFIX
python3 -m venv $PREFIX/venv3.12
source $PREFIX/venv3.12/bin/activate

python3 -m pip install -U pip setuptools wheel
python3 -m pip install -U dds-cli

mkdir bin
cd bin
ln -s $PREFIX/venv/bin/dds-cli

# make soft link "milou" to pint to "rackham", so it will work on transit (sort of hack)
cd $VERSIONDIR
ln -s rackham milou
