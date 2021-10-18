#!/bin/bash

source /sw/bioinfo/nf-core-pipelines/SOURCEME_nf-core-pipelines_latest
cd $SRCDIR

# make sure PREFIX points to the correct directory before running this script

module load bioinfo-tools
module load nf-core/2.1
module load Nextflow/21.04.1

export NXF_HOME=/sw/bioinfo/nf-core-pipelines/nxf_home

export NXF_SINGULARITY_CACHEDIR=$PREFIX/singularity_cache_dir

python3 dry_update_pipelines.py
