DeepVariant/1.3.0
========================

<https://github.com/google/deepvariant>

Used under license:
BSD 3-Clause
<https://github.com/google/deepvariant/blob/r1.3/LICENSE>

Structure creating script (makeroom_DeepVariant_1.3.0.sh) moved to /sw/bioinfo/DeepVariant/makeroom_1.3.0.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh -t "DeepVariant" -v "1.3.0" -d "DeepVariant is a deep learning-based variant caller that takes aligned reads \(in BAM or CRAM format\)\, produces pileup image tensors from them\, classifies each tensor using a convolutional neural network\, and finally reports the results in a standard VCF or gVCF file." -w "https://github.com/google/deepvariant" -l "BSD 3-Clause" -L "https://github.com/google/deepvariant/blob/r1.3/LICENSE" -f"
    ./makeroom_DeepVariant_1.3.0.sh
DeepVariant/0.8.0
========================

<https://github.com/google/deepvariant>

Used under license:
BSD-3

LOG
---

    TOOL=DeepVariant
    VERSION=0.8.0
    CLUSTER=rackham
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_DeepVariant_0.8.0.sh

Structure creating script (makeroom_DeepVariant_0.8.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/DeepVariant/makeroom_0.8.0.sh

    cd /sw/bioinfo/$TOOL/$VERSION/src
    singularity pull docker://gcr.io/deepvariant-docker/deepvariant:0.8.0
    mv deepvariant_0.8.0.sif ../rackham/
