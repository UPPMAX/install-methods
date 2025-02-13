AFNI/24.3.08
========================

<https://www.opensourceimaging.org/project/afni/>

Used under license:



Structure creating script (makeroom_AFNI_24.3.08.sh) moved to /sw/bioinfo/AFNI/makeroom_24.3.08.sh

LOG
---

    /crex/proj/staff/pmitev/nobackup/GIT/install-methods/makeroom.sh "-t" "AFNI" "-v" "24.3.08" "-c" "bioinfo" "-w" "https://www.opensourceimaging.org/project/afni/" "-s" "misc"
    ./makeroom_AFNI_24.3.08.sh

# container definition file
singularity inspect -d /sw/bioinfo/AFNI/24.3.08/src/AFNI.sif

#Bootstrap: docker
#From: afni/afni_make_build
#
#%environment
#  export LC_ALL=C.utf8
#  export PYTHONNOUSERSITE=True
#
#
#%runscript
##!/bin/sh
#  if command -v $SINGULARITY_NAME > /dev/null 2> /dev/null; then
#    exec $SINGULARITY_NAME "$@"
#  else
#    echo "# ERROR !!! Command $SINGULARITY_NAME not found in the container"
#  fi

  cd $PREFIX
  mkdir bin
  cd bin
  AFNI_TOOLS=i$(singularity exec /sw/bioinfo/AFNI/24.3.08/src/AFNI.sif ls -l /opt/afni/install | awk '$1 ~ "x" && $1 !~"d" {print $NF}')

  for i in $AFNI_TOOLS; do echo ln -s ../../src/AFNI.sif $i; done

