#!/bin/bash

source /sw/bioinfo/nf-core-pipelines/SOURCEME_nf-core-pipelines_latest
cd $SRCDIR

#cd /sw/bioinfo/nf-core-pipelines/SOURCEME_nf-core-pipelines_latest
# make sure PREFIX points to the correct directory before running this script

# clean existing directory
rm -rf $PREFIX
mkdir $PREFIX
mkdir $PREFIX/singularity_cache_dir

module load bioinfo-tools
module load nf-core/2.1
module load Nextflow/21.04.1


export NXF_HOME=/sw/bioinfo/nf-core-pipelines/nxf_home

export NXF_SINGULARITY_CACHEDIR=$PREFIX/singularity_cache_dir

export NXF_TEMP=$SNIC_TMP
export NXF_LAUNCHER=$SNIC_TMP

python3 download_pipelines.py
