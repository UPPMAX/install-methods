ChromoPainter/0.0.4
========================

<https://people.maths.bris.ac.uk/~madjl/finestructure-old/index.html>

Used under license:



Structure creating script (makeroom_ChromoPainter_0.0.4.sh) moved to /sw/bioinfo/ChromoPainter/makeroom_0.0.4.sh

LOG
---

    makeroom.sh "-t" "ChromoPainter" "-v" "0.0.4" "-c" "bioinfo" "-w" "https://people.maths.bris.ac.uk/~madjl/finestructure-old/index.html" "-d" "Painting is an efficient way of identifying important haplotype information from dense genotype data. It describes ancestry in an efficient way suitable for a range of further analyses, including population identification and admixture dating." "-s" "misc"
    ./makeroom_ChromoPainter_0.0.4.sh

    Singularity container
====================================
Bootstrap: docker                                                                                       
From: ubuntu:24.04
 
%environment
  export LC_ALL=C.utf8
  export PYTHONNOUSERSITE=True
 
%post
  export LC_ALL=C.utf8
  export PYTHONNOUSERSITE=True
  export DEBIAN_FRONTEND=noninteractive
 
  # apt packages cached in /tmp
  mkdir -p /tmp/apt24 &&  echo "Dir::Cache "/tmp/apt24";" > /etc/apt/apt.conf.d/singularity-cache.conf
 
  apt-get update && apt-get -y dist-upgrade && \
  apt-get install -y wget git build-essential \
          zlib1g-dev ibwxgtk3.2-dev wx-common
 
 
  # Download
  export TMPD=/tmp/downloads &&   mkdir -p $TMPD
  wget -P $TMPD -c  https://people.maths.bris.ac.uk/~madjl/finestructure-old/chromopainter-0.0.4GUI.tar.gz
  mkdir -p /installs && cd /installs
  tar -xvf $TMPD/chromopainter-0.0.4GUI.tar.gz
  cd chromopainter-0.0.4 && ./configure &&  make -j 4 && make install
 
  cd gui && ./configure && make -j 4 && make install
 
%runscript                
#!/bin/sh                 
  if command -v $SINGULARITY_NAME > /dev/null 2> /dev/null; then
    exec $SINGULARITY_NAME "$@"
  else                    
    echo "# ERROR !!! Command $SINGULARITY_NAME not found in the container"
  fi

