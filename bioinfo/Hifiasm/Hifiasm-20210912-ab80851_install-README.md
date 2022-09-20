Hifiasm/20210912-ab80851
========================

<https://github.com/chhylp123/hifiasm>

Used under license:
MIT License


Structure creating script (makeroom_Hifiasm_20210912-ab80851.sh) moved to /sw/bioinfo/Hifiasm/makeroom_20210912-ab80851.sh

LOG
---

TOOL=Hifiasm
VERSION=20210912-ab80851

makeroom.sh -t $TOOL -v $VERSION   -w "https://github.com/chhylp123/hifiasm"  -c "bioinfo" -s "assembly" -l "MIT License" -d  "Hifiasm is a fast haplotype-resolved de novo assembler for PacBio HiFi reads."   -f


./makeroom_${TOOL}_${VERSION}.sh
 source SOURCEME_${TOOL}_${VERSION}
    


   cd $SRCDIR

module load gcc/11.

git clone https://github.com/chhylp123/hifiasm
cd hifiasm && make
mkdir $PREFIX/bin
cp hifiasm $PREFIX/bin
