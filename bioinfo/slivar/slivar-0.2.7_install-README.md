slivar/0.2.7
========================

<https://github.com/brentp/slivar>

Used under license:
MIT License-d


Structure creating script (makeroom_slivar_0.2.7.sh) moved to /sw/bioinfo/slivar/makeroom_0.2.7.sh

LOG
---

TOOL=slivar
VERSION=0.2.7

makeroom.sh -t $TOOL -v $VERSION   -w "https://github.com/brentp/slivar"  -c "bioinfo" -s "misc" -l "MIT License"-d "slivar is a set of command-line tools that enables rapid querying and filtering of VCF files."   -f

./makeroom_${TOOL}_${VERSION}.sh
 source SOURCEME_${TOOL}_${VERSION}

$cd $PREFIX
wget https://github.com/brentp/slivar/releases/download/v0.2.7/slivar
chmod +x ./slivar
wget https://raw.githubusercontent.com/brentp/slivar/master/js/slivar-functions.js
wget https://slivar.s3.amazonaws.com/gnomad.hg38.genomes.v3.fix.zip


