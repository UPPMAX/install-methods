QualCoder/3.7
========================

<https://qualcoder.wordpress.com/>

Used under license:
LGPL-3.0
<https://github.com/ccbogel/QualCoder/blob/master/LICENSE.txt>

Structure creating script (makeroom_QualCoder_3.7.sh) moved to /sw/apps/QualCoder/makeroom_3.7.sh

LOG
---

    /crex/proj/staff/pmitev/nobackup/GIT/install-methods/makeroom.sh "-t" "QualCoder" "-v" "3.7" "-c" "apps" "-w" "https://qualcoder.wordpress.com/" "-l" "LGPL-3.0" "-L" "https://github.com/ccbogel/QualCoder/blob/master/LICENSE.txt"
    ./makeroom_QualCoder_3.7.sh


=====================================================
Bootstrap: docker
From: python:3.12-slim

%environment
  export LC_ALL=C.utf8
  export PYTHONNOUSERSITE=True
  export PYTHONPATH=/opt/QualCoder

%post
  export LC_ALL=C.utf8
  export PYTHONNOUSERSITE=True
  export DEBIAN_FRONTEND=noninteractive


  # apt packages cached in /tmp
  mkdir -p /tmp/apt22 &&  echo "Dir::Cache "/tmp/apt22";" > /etc/apt/apt.conf.d/singularity-cache.conf

  apt-get update && apt-get -y dist-upgrade && \
  apt-get install -y build-essential qtbase5-dev libgl1-mesa-dev libglib2.0-0 \
        libxcb-cursor0 wget git vlc xvfb fluxbox unzip nano vim


  cd /opt && \
  git clone https://github.com/ccbogel/QualCoder.git && \
  cd QualCoder
  
  # pip cache in /tmp
  # export PIP_CACHE_DIR=/tmp/pip-cache ;  mkdir -p $PIP_CACHE_DIR
  python3.12 -m pip install --cache-dir $PIP_CACHE_DIR --break-system-packages -U pip setuptools wheel
  python3.12 -m pip install --cache-dir $PIP_CACHE_DIR --break-system-packages    sip==6.7.9 PyQt6==6.5.0 PyQt6-sip==13.5.0
  python3.12 -m pip install --cache-dir $PIP_CACHE_DIR --break-system-packages -r requirements.txt

%runscript
  python3.12 -m qualcoder
