IPA/1.8.0
========================

<https://github.com/PacificBiosciences/pbipa>

Used under license:
BSD 3-clause


Structure creating script (makeroom_IPA_1.8.0.sh) moved to /sw/bioinfo/IPA/makeroom_1.8.0.sh

LOG
---

TOOL=IPA
VERSION=1.8.0


makeroom.sh -t $TOOL -v $VERSION   -f -w "https://github.com/PacificBiosciences/pbipa"  -c "bioinfo" -s "assembly"  -d " IPA HiFi Genome Assembler." -l "BSD 3-clause"

./makeroom_${TOOL}_${VERSION}.sh
 source SOURCEME_${TOOL}_${VERSION}

ml conda

cd $PREFIX
export CONDA_ENVS_PATH=$PREFIX

conda create -n pia_env pbipa

