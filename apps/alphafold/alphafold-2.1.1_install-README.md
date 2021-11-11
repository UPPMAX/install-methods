alphafold/2.1.1
========================

<https://github.com/deepmind/alphafold>

Used under license:
Apache License
<https://github.com/deepmind/alphafold/blob/main/LICENSE>

Structure creating script (makeroom_alphafold_2.1.1.sh) moved to /sw/apps/alphafold/makeroom_2.1.1.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh -t "alphafold" -v "2.1.1" -d "This package provides an implementation of the inference pipeline of AlphaFold v2.0." -w "https://github.com/deepmind/alphafold" -l "Apache License" -L "https://github.com/deepmind/alphafold/blob/main/LICENSE" -c "apps" -f"
    ./makeroom_alphafold_2.1.1.sh

    source SOURCEME_${TOOL}_${VERSION}
    cd $SRCDIR
Copy base.def and alphafold.def from previous release' src directory.
Create singularity image using base.def
    sudo singularity build alphafold.sif alphafold.def
Create singularity image using alphafold.def
    sudo singularity build alphafold.sif alphafold.def
