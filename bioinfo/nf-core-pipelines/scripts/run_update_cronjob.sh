#!/bin/bash

module load bioinfo-tools
module load nf-core/2.1
module load Nextflow/21.04.1
module load nf-core-pipelines/latest


export NXF_HOME=/sw/bioinfo/nf-core-pipelines/nxf_home

export PREFIX=$NF_CORE_PIPELINES_ROOT

export SINGULARITY_CACHEDIR=/sw/bioinfo/nf-core-pipelines/latest/src

python3 /sw/bioinfo/nf-core-pipelines/latest/src/update_pipelines.py
