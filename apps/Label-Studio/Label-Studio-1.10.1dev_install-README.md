Label-Studio/1.10.1dev
========================

<https://labelstud.io>

Used under license:
Apache-2.0
<https://github.com/HumanSignal/label-studio/blob/develop/LICENSE>

Structure creating script (makeroom_Label-Studio_1.10.1dev.sh) moved to /sw/apps/Label-Studio/makeroom_1.10.1dev.sh

LOG
---

    makeroom.sh "-t" "Label-Studio" "-v" "1.10.1dev" "-l" "Apache-2.0" "-w" "https://labelstud.io" "-L" "https://github.com/HumanSignal/label-studio/blob/develop/LICENSE" "-d" "Label Studio is an open source data labeling tool." "-c" "apps"
    sudo singularity build label-studio.sif label-studio.def
    cp label-studio.sif $PREFIX
    cd $PREFIX
    mkdir bin && cd bin
    ln -s ../label-studio.sif label-studio

# label-studio.def
=====
Bootstrap: docker
From: python:3.10-bookworm

%environment
  export LC_ALL=C
  export PYTHONNOUSERSITE=True

%post
  export LC_ALL=C
  export PYTHONNOUSERSITE=True
  export DEBIAN_FRONTEND=noninteractive

  python3 -m pip install --no-cache-dir --upgrade pip setuptools wheel
  python3 -m pip install --no-cache-dir --upgrade label-studio

%runscript
#!/bin/sh
  if command -v $SINGULARITY_NAME > /dev/null 2> /dev/null; then
    exec $SINGULARITY_NAME "$@"
  else
    echo "# ERROR !!! Command $SINGULARITY_NAME not found in the container"
  fi
=====

