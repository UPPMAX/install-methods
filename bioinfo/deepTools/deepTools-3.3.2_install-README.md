deepTools/3.3.2
========================

<https://github.com/deeptools/deepTools>

Used under license:
BSD and MIT, see LICENSE.txt

Structure creating script (makeroom_deepTools_3.3.2.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/deepTools/makeroom_3.3.2.sh

    TOOL=deepTools
    VERSION=3.3.2
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -d "Tools to process and analyze deep sequencing data" -w https://github.com/deeptools/deepTools -l "BSD and MIT, see LICENSE.txt"
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION} 

    module load python/3.7.2
    export PYTHONPATH=$PREFIX/lib/python3.7/site-packages

    PYTHONUSERBASE=$PREFIX pip install --user $TOOL==$VERSION

