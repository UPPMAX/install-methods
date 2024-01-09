Guppy/6.5.7-gpu
===============

<https://nanoporetech.com/nanopore-sequencing-data-analysis>

Used under license:
Custom
<https://nanoporetech.com/sites/default/files/s3/terms/Nanopore-product-terms-and-conditions-nov2018-v2.pdf>

Local, updated licenses at

'/sw/bioinfo/Guppy/6.5.7-gpu/snowy/bin/Guppy End User License Agreement 17Feb22.pdf'
'/sw/bioinfo/Guppy/6.5.7-gpu/snowy/bin/THIRD_PARTY_LICENSES'

Structure creating script (makeroom_Guppy_6.5.7-gpu.sh) moved to /sw/bioinfo/Guppy/makeroom_6.5.7-gpu.sh

LOG
---

    makeroom.sh "-f" "-t" "Guppy" "-v" "6.5.7-gpu" "-s" "misc" -u "snowy miarka bianca" "-w" "https://nanoporetech.com/nanopore-sequencing-data-analysis" "-d" "Oxford Nanopore neural-net basecaller" "-l" "Custom" "-L" "https://nanoporetech.com/sites/default/files/s3/terms/Nanopore-product-terms-and-conditions-nov2018-v2.pdf"
    ./makeroom_Guppy_6.5.7-gpu.sh


Get the bundles from Oxford Nanopore user support. This requires an account,
wnd Douglas Scofield has one through SNP&SEQ.  Place these in the src
directory. GPU version is installed for Snowy, Bianca and Miarka. From src dir

    rackham5: /sw/bioinfo/Guppy/6.5.7-gpu/src $ ll
    -rw-r--r-- 1 douglas staff 1581903756 Dec 22 11:03 ont-guppy-6.5.7-1.el7.x86_64.rpm
    -rw-r--r-- 1 douglas staff 1581728328 Dec 22 11:37 ont-guppy-6.5.7-1.el8.x86_64.rpm
    -rw-r--r-- 1 douglas staff 1865218294 Dec 22 11:17 ont-guppy_6.5.7_linux64.tar.gz


    tar xf ont-guppy_6.5.7_linux64.tar.gz 
    mv ont-guppy/* $VERSIONDIR/snowy/
    rmdir ont-guppy

Check that libraries can be found. Note that it uses only system libraries,
including libcuda, no longer its own.

    cd $VERSIONDIR/snowy/bin
    ldd guppy_basecaller
    ./guppy_basecaller

    cd $TOOLDIR
    ./Guppy-6.5.7-gpu_post-install.sh 


Note that the .rpm packages are not installed but just kept in src/ if they
would be needed. To extract it:

    rpm2cpio file.rpm | cpio -idmv

