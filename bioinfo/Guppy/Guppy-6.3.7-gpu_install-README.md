Guppy/6.3.7-gpu
========================

<https://nanoporetech.com/nanopore-sequencing-data-analysis>

Used under license:
Custom
<https://nanoporetech.com/sites/default/files/s3/terms/Nanopore-product-terms-and-conditions-nov2018-v2.pdf>

Structure creating script (makeroom_Guppy_6.3.7-gpu.sh) moved to /sw/bioinfo/Guppy/makeroom_6.3.7-gpu.sh

LOG
---

    /home/matpiq/install-methods/run_makeroom.sh -f -t "Guppy" -v "6.3.7-gpu" -s "misc" -u "snowy bianca miarka" -w "https://nanoporetech.com/nanopore-sequencing-data-analysis" "-d" "Oxford Nanopore neural-net basecaller, GPU-enabled" -l "Custom" -L "https://nanoporetech.com/sites/default/files/s3/terms/Nanopore-product-terms-and-conditions-nov2018-v2.pdf"
    ./makeroom_Guppy_6.3.7-gpu.sh
================

Oxford Nanopores Guppy basecaller, GPU enabled

<https://nanoporetech.com/nanopore-sequencing-data-analysis>

Used under license:
Custom
<https://nanoporetech.com/sites/default/files/s3/terms/Nanopore-product-terms-and-conditions-nov2018-v2.pdf>


Get the bundles from Oxford Nanopore user support. This requires an account,
wnd Douglas Scofield has one through SNP&SEQ.  Place these in the src
directory. GPU version is installed for Snowy, Bianca and Miarka. From src dir

    -rw-rw-r-- 1 douglas sw 1399399896 Sep 28 17:10 ont-guppy-6.3.7-1.el7.x86_64.rpm
    -rw-rw-r-- 1 douglas sw 1399399896 Sep 28 17:10 ont-guppy-6.3.7-1.el8.x86_64.rpm
    -rw-rw-r-- 1 douglas sw 1661737174 Sep 28 17:22 ont-guppy_6.3.7_linux64.tar.gz

    tar xf ont-guppy-gpu.3.7_linux64.tar.gz
    mv ont-guppy/* /sw/bioinfo/Guppy/6.3.7-gpu/snowy

Check that libraries can be found. RPATH info is relative so they should be.

    cd $PREFIX/bin
    ldd guppy_basecaller

    cd $TOOLDIR
    ./Guppy-6.3.7-gpu_post-install.sh

Note that the .rpm packages are not installed but just kept in src/ if they
would be needed. To extract it:

    rpm2cpio file.rpm | cpio -idmv
