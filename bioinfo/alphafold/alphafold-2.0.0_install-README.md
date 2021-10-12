alphafold/2.0.0
========================

<https://github.com/deepmind/alphafold>

Used under license:
Apache License
<https://github.com/deepmind/alphafold/blob/main/LICENSE>

Structure creating script (makeroom_alphafold_2.0.0.sh) moved to /sw/bioinfo/alphafold/makeroom_2.0.0.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh -t "alphafold" -v "2.0.0" -d "This package provides an implementation of the inference pipeline of AlphaFold v2.0." -w "https://github.com/deepmind/alphafold" -l "Apache License" -L "https://github.com/deepmind/alphafold/blob/main/LICENSE" -s "misc" -f"
    ./makeroom_alphafold_2.0.0.sh
    cd $SRCDIR

Dataset installation:
    wget https://github.com/deepmind/alphafold/archive/refs/tags/v2.0.0.tar.gz
    tar xvf v2.0.0.tar.gz
    cd alphafold-2.0.0

    #copy the aria2c binary signulairty file and set the path accordingly.
    export PATH=/sw/bioinfo/alphafold/2.0.0/src/aria2c:$PATH

    DOWNLOAD_DIR=/sw/data/alphafold_dataset
    
    scripts/download_all_data.sh DOWNLOAD_DIR   

Alphafold Tool installation:
   # build singularity image following https://github.com/hyoo/alphafold_singularity
   # copy the alphafold.sif into $PREFIX directory
   mkdir $PREFIX/bin
   cd $PREFIX/bin
   vi alphafold
   # paste the following into script file alphafold
#!/bin/bash

params="$@"

singularity exec --nv \
    /sw/bioinfo/alphafold/2.0.0/rackham/alphafold.sif \
    bash -c "source /opt/miniconda3/etc/profile.d/conda.sh ; conda activate alphafold ; cd /opt/alphafold; source /opt/alphafold/run.sh $params"

   chmod +x alphafold

