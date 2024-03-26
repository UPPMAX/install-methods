msisensor-pro/1.2.0
========================

<https://github.com/xjtu-omics/msisensor-pro>

Used under license:

<https://github.com/xjtu-omics/msisensor-pro/blob/master/LICENSE>

Structure creating script (makeroom_msisensor-pro_1.2.0.sh) moved to /sw/bioinfo/msisensor-pro/makeroom_1.2.0.sh

LOG
---

    makeroom.sh "-t" "msisensor-pro" "-v" "1.2.0" "-c" "bioinfo" "-s" "misc" "-w" "https://github.com/xjtu-omics/msisensor-pro" "-d" "MSIsensor-pro evaluates Microsatellite Instability (MSI) for cancer patients with next generation sequencing data." "-L" "https://github.com/xjtu-omics/msisensor-pro/blob/master/LICENSE"

#     
singularity inspect -d /sw/bioinfo/msisensor-pro/1.2.0/rackham/bin/msisensor-pro.sif 

Bootstrap: docker
From: ubuntu:22.04

%environment
  export LC_ALL=C
  export PYTHONNOUSERSITE=True

%post
  export LC_ALL=C
  export PYTHONNOUSERSITE=True
  export DEBIAN_FRONTEND=noninteractive

  # apt packages cached in /tmp
  mkdir -p /tmp/apt22 &&  echo "Dir::Cache "/tmp/apt22";" > /etc/apt/apt.conf.d/singularity-cache.conf

  apt-get update && apt-get -y dist-upgrade && \
  apt-get install -y git make build-essential liblzma-dev libbz2-dev zlib1g-dev libncurses5-dev libncursesw5-dev libhts3

  mkdir -p /installs && cd /installs
  git clone https://github.com/xjtu-omics/msisensor-pro.git \
  && cd msisensor-pro \
  && ./INSTALL \
  && cp -r /installs/msisensor-pro/binary/msisensor-pro /usr/bin/ \
  && cd / && rm -r /installs



%runscript
#!/bin/sh
  if command -v $SINGULARITY_NAME > /dev/null 2> /dev/null; then
    exec $SINGULARITY_NAME "$@"
  else
    echo "# ERROR !!! Command $SINGULARITY_NAME not found in the container"
  fi
