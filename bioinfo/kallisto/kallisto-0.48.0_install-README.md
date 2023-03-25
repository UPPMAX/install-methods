kallisto/0.48.0
===============

<https://github.com/pachterlab/kallisto>

Used under license:
BSD-2 license


Structure creating script (makeroom_kallisto_0.48.0.sh) moved to /sw/bioinfo/kallisto/makeroom_0.48.0.sh

LOG
---

We are installing the prebuilt binary.  See readme for 0.46.2 and others to build from source.

    makeroom.sh -t "kallisto" -v "0.48.0" -w "https://github.com/pachterlab/kallisto" -c "bioinfo" -l "BSD-2 license" -d "Kallisto is a program for quantifying abundances of transcripts from RNA-Seq data, or more generally of target sequences using high-throughput sequencing reads." -f
    ./makeroom_kallisto_0.48.0.sh
    source /sw/bioinfo/kallisto/SOURCEME_kallisto_0.48.0 && cd $SRCDIR


    [[ -f kallisto_linux-v${VERSION}.tar.gz ]] || wget https://github.com/pachterlab/kallisto/releases/download/v${VERSION}/kallisto_linux-v${VERSION}.tar.gz
    tar xf kallisto_linux-v${VERSION}.tar.gz 

Replace the prefix with the unpacked directory.

    rm -rf $PREFIX
    mv kallisto $PREFIX

Then update the RPATH in `kallisto` to see libraries for gcc/10.3.0.

    cd $PREFIX
    module load gcc/10.3.0
    module load patchelf/0.10
    patchelf --set-rpath $LD_LIBRARY_PATH kallisto
    module purge
    ldd kallisto

Use a different mf, since the PATH should just include $modroot, not $modroot/bin.
