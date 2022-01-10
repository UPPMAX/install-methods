Guppy/5.0.16-gpu
================

Oxford Nanopore's Guppy basecaller, GPU enabled.  This is being installed for
Bianca and Snowy only.

<https://nanoporetech.com/nanopore-sequencing-data-analysis>

Used under license:
Custom
<https://nanoporetech.com/sites/default/files/s3/terms/Nanopore-product-terms-and-conditions-nov2018-v2.pdf>


Structure creating script (makeroom_Guppy_5.0.16-gpu.sh) moved to /sw/bioinfo/Guppy/makeroom_5.0.16-gpu.sh

LOG
---

    makeroom.sh -f -t Guppy -v 5.0.16-gpu -s misc -w https://nanoporetech.com/nanopore-sequencing-data-analysis -d "Oxford Nanopore neural-net basecaller, GPU-enables" -l Custom -L https://nanoporetech.com/sites/default/files/s3/terms/Nanopore-product-terms-and-conditions-nov2018-v2.pdf
    ./makeroom_Guppy_5.0.16-gpu.sh 
    source /sw/bioinfo/Guppy/SOURCEME_Guppy_5.0.16-gpu && cd $SRCDIR

Get the bundles from Oxford Nanopore user support. This requires an account,
and I have one through SNP&SEQ.  Place these in the src directory.  The GPU
enabled packages are

    -rw-r--r-- 1 douglas staff  900555780 Nov 23 09:46 ont-guppy-5.0.16-1.el7.x86_64.rpm
    -rw-r--r-- 1 douglas staff 1042686798 Nov 23 09:47 ont-guppy_5.0.16_linux64.tar.gz

Unpack the tarball and replace PREFIX with the unpacked directory.

    tar xf ont-guppy_5.0.16_linux64.tar.gz
    rmdir $PREFIX && mv ont-guppy $PREFIX

Check that libraries can be found. RPATH info is relative so they should be.

    cd $PREFIX/bin
    ldd guppy_basecaller

    cd $TOOLDIR
    ./Guppy-5.0.16-gpu_post-install.sh

Do not provide this for irma or rackham.  Better to do this at makeroom time but whoops.
Edit the yaml

    rm -f /sw/mf/{irma,rackham}/bioinfo-tools/misc/Guppy/5.0.16-gpu
