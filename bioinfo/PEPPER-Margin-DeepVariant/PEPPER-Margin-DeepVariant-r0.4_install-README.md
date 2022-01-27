PEPPER-Margin-DeepVariant/r0.4
========================

<https://github.com/kishwarshafin/pepper>

Used under license:
MIT License
<https://github.com/kishwarshafin/pepper/blob/r0.7/LICENSE>

Structure creating script (makeroom_PEPPER-Margin-DeepVariant_r0.4.sh) moved to /sw/bioinfo/PEPPER-Margin-DeepVariant/makeroom_r0.4.sh

LOG
---

   TOOL=PEPPER-Margin-DeepVariant

    VERSION=r0.4

    makeroom.sh -t $TOOL -v $VERSION -d "PEPPER is a genome inference module based on recurrent neural networks that enables long-read variant calling and nanopore assembly polishing in the PEPPER-Margin-DeepVariant pipeline." -w "https://github.com/kishwarshafin/pepper" -l "MIT License" -L "https://github.com/kishwarshafin/pepper/blob/r0.7/LICENSE" -f -s "pipelines"

    ./makeroom_PEPPER-Margin-DeepVariant_r0.4.sh

    source SOURCEME_PEPPER-Margin-DeepVariant_r0.4

    cd $SRCDIR

    singularity pull docker://kishwars/pepper_deepvariant:r0.4
