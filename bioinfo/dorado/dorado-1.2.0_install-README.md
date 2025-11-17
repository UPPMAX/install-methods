dorado/1.2.0
============

<https://github.com/nanoporetech/dorado>

Used under license:
PLC 1.0
<https://raw.githubusercontent.com/nanoporetech/dorado/refs/heads/release-v1.2/LICENCE.txt>

Structure creating script (makeroom_dorado_1.2.0.sh) moved to /sw/bioinfo/dorado/makeroom_1.2.0.sh

LOG
---

    makeroom.sh "-t" "dorado" "-v" "1.2.0" "-w" "https://github.com/nanoporetech/dorado" "-l" "PLC 1.0" -L "https://raw.githubusercontent.com/nanoporetech/dorado/refs/heads/release-v1.2/LICENCE.txt" "-d" "Oxford Nanopore's Basecaller" "-s" "annotation" "-f"
    ./makeroom_dorado_1.2.0.sh 
    source /sw/bioinfo/dorado/SOURCEME_dorado_1.2.0 && cd $SRCDIR

Oxford Nanopore provides a prebuilt tarball for download.  This is what
EasyBuild uses, and is what is installed on Pelle.  Unfortunately, it needs
much newer glibc than we have on rackham.

    wget "https://cdn.oxfordnanoportal.com/software/analysis/dorado-${VERSION}-linux-x64.tar.gz"
    echo 4bb0513d9bd1a216094a388b08bed68f1881433d7cddecf367ecc1e3b3438f3d
    sha256sum dorado-${VERSION}-linux-x64.tar.gz 
    tar xf dorado-${VERSION}-linux-x64.tar.gz 
    ldd dorado-${VERSION}-linux-x64/bin/dorado

    ./dorado: /lib64/libm.so.6: version `GLIBC_2.27' not found (required by ./dorado)
    ./dorado: /lib64/libc.so.6: version `GLIBC_2.25' not found (required by ./dorado)
    ./dorado: /lib64/libm.so.6: version `GLIBC_2.27' not found (required by /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libtorch_cpu.so)
    ./dorado: /lib64/libm.so.6: version `GLIBC_2.23' not found (required by /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libtorch_cpu.so)
    ./dorado: /lib64/libm.so.6: version `GLIBC_2.27' not found (required by /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libtorch_cuda.so)
    ./dorado: /lib64/libc.so.6: version `GLIBC_2.18' not found (required by /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libstdc++.so.6)
    ./dorado: /lib64/libm.so.6: version `GLIBC_2.27' not found (required by /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libcusolver.so.11)
    ./dorado: /lib64/libm.so.6: version `GLIBC_2.27' not found (required by /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libcusparseLt.so.0)
    ./dorado: /lib64/libm.so.6: version `GLIBC_2.27' not found (required by /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libcublasLt.so.12)
    ./dorado: /lib64/libc.so.6: version `GLIBC_2.18' not found (required by /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libcublasLt.so.12)
        linux-vdso.so.1 =>  (0x00007ffe843d7000)
        libtorch.so => /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libtorch.so (0x00002b19ac2c6000)
        libtorch_cpu.so => /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libtorch_cpu.so (0x00002b19ac4c7000)
        libtorch_cuda.so => /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libtorch_cuda.so (0x00002b19bee27000)
        libc10_cuda.so => /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libc10_cuda.so (0x00002b19ac2dc000)
        libc10.so => /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libc10.so (0x00002b1a22d9a000)
        librt.so.1 => /lib64/librt.so.1 (0x00002b1a22eaa000)
        libcublas.so.12 => /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libcublas.so.12 (0x00002b1a230b2000)
        libz.so.1 => /lib64/libz.so.1 (0x00002b1a2a1bc000)
        libdl.so.2 => /lib64/libdl.so.2 (0x00002b1a2a3d2000)
        libpthread.so.0 => /lib64/libpthread.so.0 (0x00002b1a2a5d6000)
        libstdc++.so.6 => /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libstdc++.so.6 (0x00002b1a2a7f2000)
        libm.so.6 => /lib64/libm.so.6 (0x00002b1a2ab87000)
        libgcc_s.so.1 => /lib64/libgcc_s.so.1 (0x00002b1a2ae89000)
        libc.so.6 => /lib64/libc.so.6 (0x00002b1a2b09f000)
        /lib64/ld-linux-x86-64.so.2 (0x00002b19ac2a3000)
        libiomp5.so => /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libiomp5.so (0x00002b1a2b46d000)
        libcudart.so.12 => /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libcudart.so.12 (0x00002b1a2b8fe000)
        libcusparse.so.12 => /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libcusparse.so.12 (0x00002b1a2bbb2000)
        libcufft.so.11 => /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libcufft.so.11 (0x00002b1a433b8000)
        libcusolver.so.11 => /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libcusolver.so.11 (0x00002b1a5457c000)
        libcusparseLt.so.0 => /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libcusparseLt.so.0 (0x00002b1a628de000)
        libcudnn.so.9 => /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libcudnn.so.9 (0x00002b1a7c085000)
        libcublasLt.so.12 => /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libcublasLt.so.12 (0x00002b1a7c2a4000)
        libnvJitLink.so.12 => /sw/bioinfo/dorado/1.2.0/src/dorado-1.2.0-linux-x64/bin/./../lib/libnvJitLink.so.12 (0x00002b1aaff83000)

Remove this unpacked directory to save space.

    rm -rf dorado-${VERSION}-linux-x64


To do the install, use a container.  With Pavlin's help, I began with his
Ubunto 24.04 template at
https://uppmax.github.io/Basic_Singularity_Apptainer/ubuntu_template/ and ended
up with this def file, which is at $SRCDIR/dorado-${VERSION}.def:


    Bootstrap: docker
    From: ubuntu:24.04

    %environment
      export LC_ALL=C.utf8          
      export PYTHONNOUSERSITE=True  # Disable user's local python modules in ~/.local
      export PATH="/opt/local/bin:$PATH"

    %post
      export LC_ALL=C.utf8
      export PYTHONNOUSERSITE=True
      export DEBIAN_FRONTEND=noninteractive
      export VERSION=1.2.0

      # apt packages cached in /tmp
      mkdir -p /tmp/apt24 &&  echo "Dir::Cache "/tmp/apt24";" > /etc/apt/apt.conf.d/singularity-cache.conf

      apt-get update && apt-get -y dist-upgrade && \
      apt-get install -y git wget zlib1g


      # Download
      export TMPD=/tmp/downloads &&   mkdir -p $TMPD
      wget -P $TMPD -c "https://cdn.oxfordnanoportal.com/software/analysis/dorado-${VERSION}-linux-x64.tar.gz"
      mkdir /opt/local
      tar -C /opt/local --strip-components 1 -xzf $TMPD/dorado-${VERSION}-linux-x64.tar.gz


    %runscript
    #!/bin/sh
      if command -v $SINGULARITY_NAME > /dev/null 2> /dev/null; then
        exec $SINGULARITY_NAME "$@"
      else
        echo "# ERROR !!! Command $SINGULARITY_NAME not found in the container"
      fi

Following Pavlin's advice, built this on pelle3-ae which is much faster: newer chips, faster memory, SSD temp.

    ssh pelle3-ae
    source /sw/bioinfo/dorado/SOURCEME_dorado_1.2.0 && cd $SRCDIR
    apptainer build dorado-1.2.0.sif dorado-1.2.0.def
    ln -s dorado-1.2.0.sif dorado
    ./dorado

It works!  Now back on rackham5 to complete the install and then download models.

    source /sw/bioinfo/dorado/SOURCEME_dorado_1.2.0

Make sure mf file is good.  Turns out, 1.2.0 and 0.9.1 are both copies of 0.8.2 which is sufficient. Make them symlinks to it.

    cd $TOOLDIR/mf
    rm -f 0.9.2 1.2.0
    ln -s 0.8.2 0.9.1
    ln -s 0.8.2 1.2.0

    rsync -Pa * /sw/mf/common/bioinfo-tools/annotation/dorado/
    all_mflink -f dorado 1.2.0

Position the container and its symlink.

    cd $PREFIX
    mkdir $PREFIX/bin
    cd $PREFIX/bin
    mv $SRCDIR/{dorado-1.2.0.sif,dorado} .
    ls -l

Finish off by creating $DORADO_MODELS_DIRECTORY which we will fill after loading the module, and finish up.

    mkdir $PREFIX/MODELS

    fixup $VERSIONDIR

Now download models.

    module purge
    module load bioinfo-tools dorado/1.2.0

    cd $DORADO_MODELS_DIRECTORY  # defined in the mf file
    dorado download

If this is successful, the installation was successful!

