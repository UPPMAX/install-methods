#!/bin/bash
params=$@
singularity exec metawrap.sif bash -c "source /opt/conda/etc/profile.d/conda.sh ; conda activate metawrap-env ; metawrap $params"
