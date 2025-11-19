modkit/0.5.1-rc1
================

<https://github.com/nanoporetech/modkit>

Used under license:
PLC 1.0
<https://raw.githubusercontent.com/nanoporetech/modkit/refs/heads/master/LICENCE.txt>

Structure creating script (makeroom_modkit_0.5.1-rc1.sh) moved to /sw/bioinfo/modkit/makeroom_0.5.1-rc1.sh

Use prebuilt binaries in an image, install models directory alongside the image.

LOG
---

makeroom.sh -f -t modkit -v 0.5.1-rc1 -w https://github.com/nanoporetech/modkit -l "PLC 1.0" -L "https://raw.githubusercontent.com/nanoporetech/modkit/refs/heads/master/LICENCE.txt" -d "A bioinformatics tool for working with modified bases from Oxford Nanopore"
./makeroom_modkit_0.5.1-rc1.sh 
source /sw/bioinfo/modkit/SOURCEME_modkit_0.5.1-rc1 && cd $SRCDIR
wget https://github.com/nanoporetech/modkit/releases/download/v0.5.1-rc1/modkit_v0.5.1rc1_u16_x86_64.tar.gz
tar xf modkit_v0.5.1rc1_u16_x86_64.tar.gz 
cd dist_modkit_v0.5.1_8fa79e3/
./modkit 

Does not work because glibc not new enough. Building from source ran into
typical rust tool build problems. Time for a container. Start with the 
dorado 1.2.0 def.


cp /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0.def .
mv dorado-1.2.0.def modkit-0.5.1-rc1.def
vi modkit-0.5.1-rc1.def 

The def file becomes:

    Bootstrap: docker
    From: ubuntu:24.04

    %environment
      export LC_ALL=C.utf8
      export PYTHONNOUSERSITE=True  # Disable user's local python modules in ~/.local
      export PATH="/opt/local/modkit:$PATH"

    %post
      export LC_ALL=C.utf8
      export PYTHONNOUSERSITE=True
      export DEBIAN_FRONTEND=noninteractive

      # apt packages cached in /tmp
      mkdir -p /tmp/apt24 &&  echo "Dir::Cache "/tmp/apt24";" > /etc/apt/apt.conf.d/singularity-cache.conf

      apt-get update && apt-get -y dist-upgrade && \
      apt-get install -y git wget


      # Download
      export TMPD=/tmp/downloads &&   mkdir -p $TMPD
      wget -P $TMPD -c "https://github.com/nanoporetech/modkit/releases/download/v0.5.1-rc1/modkit_v0.5.1rc1_u16_x86_64.tar.gz"

      mkdir -p /opt/local/modkit
      tar -C /opt/local/modkit --strip-components 1 -xzf $TMPD/modkit_v0.5.1rc1_u16_x86_64.tar.gz


    %runscript
    #!/bin/sh
      if command -v $SINGULARITY_NAME > /dev/null 2> /dev/null; then
        exec $SINGULARITY_NAME "$@"
      else
        echo "# ERROR !!! Command $SINGULARITY_NAME not found in the container"
      fi


Build this on pelle3-ae. Otherwise problems when reaching openssh.

    apptainer build modkit-0.5.1-rc1.sif modkit-0.5.1-rc1.def 

Back on rackham5.  PREFIX must be defined correctly.

    md modkit-0.5.1-rc1.sif $PREFIX
    cd $PREFIX
    ln -s modkit-0.5.1-rc1.sif  modkit

Now copy over side-riding directories from the tarball

    cd $SRCDIR/dist_modkit_v0.5.1_8fa79e3
    cp -av LICENCE.txt README.md docs models $PREFIX/

The path must add $modroot.  Simplify the mf and remove .version pegging.

    cd $TOOLDIR/mf
    rm -f 0.3.1 0.3.3 0.4.1 0.5.1-rc1
    vi 0.2.5-rc2 
    ln -s 0.2.5-rc2 0.3.1
    ln -s 0.2.5-rc2 0.3.3
    ln -s 0.2.5-rc2 0.4.1
    ln -s 0.2.5-rc2 0.5.1-rc1

    rm -fv /sw/mf/*/bioinfo-tools/misc/modkit/.version

    rsync -Pa * /sw/mf/common/bioinfo-tools/misc/modkit/
    mfshow modkit
    all_mflink -f modkit 0.5.1-rc1

