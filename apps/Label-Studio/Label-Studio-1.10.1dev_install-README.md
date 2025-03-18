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
From: ubuntu:22.04

%environment
  export LC_ALL=C
  export LD_LIBRARY_PATH=/opt/calibre/lib:$LD_LIBRARY_PATH
  export PYTHONNOUSERSITE=True

%post
  export LC_ALL=C
  export PYTHONNOUSERSITE=True
  export DEBIAN_FRONTEND=noninteractive

  dpkg-divert --local --rename --add /sbin/initctl
  ln -sf /bin/true /sbin/initctl

  # Update package list and install dependencies
  apt update && apt install -y --no-install-recommends \
      glibc-source \
      wget xz-utils\
      libegl1 libopengl0 libxcb-cursor0 \
      python3 python3-pip \
      qt6-base-dev qt6-base-dev-tools libqt6core6 libqt6gui6 libqt6widgets6

  # Restore initctl to avoid issues
  rm /sbin/initctl
  dpkg-divert --local --rename --remove /sbin/initctl

  wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin

  python3 -m pip install --no-cache-dir taguette==1.4.1


%runscript
#!/bin/sh
  if command -v $SINGULARITY_NAME > /dev/null 2> /dev/null; then
    exec $SINGULARITY_NAME "$@"
  else
    echo "# ERROR !!! Command $SINGULARITY_NAME not found in the container"
  fi

=====

