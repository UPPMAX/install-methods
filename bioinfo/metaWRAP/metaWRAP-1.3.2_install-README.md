metaWRAP/1.3.2
========================

<http://>

Used under license:
MIT
<https://github.com/bxlab/metaWRAP>

Structure creating script (makeroom_metaWRAP_1.3.2.sh) moved to /sw/bioinfo/metaWRAP/makeroom_1.3.2.sh

Singularity recipe: https://github.com/UPPMAX/install-methods/blob/master/singularity_info/metaWRAP_1.3.2/Singularity.metaWRAP

or

singularity inspect -d $_ROOT/metawrap.sif

LOG
---

    /home/pmitev/GIT/install-methods/makeroom.sh -t "metaWRAP" -v "1.3.2" -c "bioinfo" -s "misc" -l "MIT" -L "https://github.com/bxlab/metaWRAP" -d "MetaWRAP\" - a flexible pipeline for genome-resolved metagenomic data analysis"
    ./makeroom_metaWRAP_1.3.2.sh
    cd $VERSIONDIR/rackham
    mkdir bin && cd bin
    echo '#!/bin/bash' > /sw/bioinfo/metaWRAP/1.3.2/rackham/bin/metawrap
    echo 'singularity exec $_ROOT/metawrap.sif bash -c "source /opt/conda/etc/profile.d/conda.sh ; conda activate metawrap-env ; metawrap $@"' >> /sw/bioinfo/metaWRAP/1.3.2/rackham/bin/metawrap
    /sw/bioinfo/metaWRAP/metaWRAP-1.3.2_post-install.sh
    
    
BC installed the MY_CHECKM_FOLDER data base see https://github.com/bxlab/metaWRAP/blob/master/installation/database_installation.md#downloading-the-checkm-database

