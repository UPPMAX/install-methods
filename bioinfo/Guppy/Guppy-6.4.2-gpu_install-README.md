Guppy/6.4.2-gpu
===============

Oxford Nanopores Guppy basecaller, GPU enabled

<https://nanoporetech.com/nanopore-sequencing-data-analysis>

Used under license:
Custom
<https://nanoporetech.com/sites/default/files/s3/terms/Nanopore-product-terms-and-conditions-nov2018-v2.pdf>


Structure creating script (makeroom_Guppy_6.4.2-gpu.sh) moved to /sw/bioinfo/Guppy/makeroom_6.4.2-gpu.sh

LOG
---

    makeroom.sh "-f" "-t" "Guppy" "-v" "6.4.2-gpu" "-s" "misc" -u "snowy miarka bianca" "-w" "https://nanoporetech.com/nanopore-sequencing-data-analysis" "-d" "Oxford Nanopore neural-net basecaller" "-l" "Custom" "-L" "https://nanoporetech.com/sites/default/files/s3/terms/Nanopore-product-terms-and-conditions-nov2018-v2.pdf"
    ./makeroom_Guppy_6.4.2-gpu.sh


Get the bundles from Oxford Nanopore user support. This requires an account,
wnd Douglas Scofield has one through SNP&SEQ.  Place these in the src
directory. GPU version is installed for Snowy, Bianca and Miarka. From src dir

    rackham5: /sw/bioinfo/Guppy $ ll 6.4.2-gpu/src/
    -rw-rw-r-- 1 douglas sw 1405469744 Jan 24 10:28 ont-guppy-6.4.2-1.el7.x86_64.rpm
    -rw-rw-r-- 1 douglas sw 1405310292 Jan 24 10:28 ont-guppy-6.4.2-1.el8.x86_64.rpm
    -rw-rw-r-- 1 douglas sw 1669334522 Jan 24 10:28 ont-guppy_6.4.2_linux64.tar.gz


    tar xf ont-guppy_6.4.2_linux64.tar.gz 
    mv ont-guppy/* $VERSIONDIR/snowy/

Check that libraries can be found. RPATH info is relative so they should be.

    cd $VERSIONDIR/snowy/bin
    ldd guppy_basecaller
    ./guppy_basecaller

    cd $TOOLDIR
    ./Guppy-6.4.2-gpu_post-install.sh 


Note that the .rpm packages are not installed but just kept in src/ if they
would be needed. To extract it:

    rpm2cpio file.rpm | cpio -idmv

