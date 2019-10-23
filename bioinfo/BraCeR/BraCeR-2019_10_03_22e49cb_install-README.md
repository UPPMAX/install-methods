BraCeR/2019_10_03_22e49cb
========================

<https://github.com/teichlab/bracer>

Used under license:
Apache 2.0

Structure creating script (makeroom_BraCeR_2019_10_03_22e49cb.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/BraCeR/makeroom_2019_10_03_22e49cb.sh

LOG
---

    TOOL=BraCeR
    VERSION=2019_10_03_22e49cb
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_BraCeR_2019_10_03_22e49cb.sh
    mkdir $PREFIX/bin
    echo '#!/bin/bash' > /sw/bioinfo/BraCeR/2019_10_03_22e49cb/rackham/bin/BraCeR
    echo 'singularity exec /sw/bioinfo/BraCeR/2019_10_03_22e49cb/rackham/bin/BraCeR.sif bracer "$@"' >> /sw/bioinfo/BraCeR/2019_10_03_22e49cb/rackham/bin/BraCeR
    chmod +x /sw/bioinfo/BraCeR/2019_10_03_22e49cb/rackham/bin/BraCeR
    singularity build BraCeR.sif image/
    mv BraCeR.sif ../rackham/bin/

