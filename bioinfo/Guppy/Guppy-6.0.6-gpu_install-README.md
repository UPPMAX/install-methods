Guppy/6.0.6-gpu
========================

<https://nanoporetech.com/nanopore-sequencing-data-analysis>

Used under license:
Custom
<https://nanoporetech.com/sites/default/files/s3/terms/Nanopore-product-terms-and-conditions-nov2018-v2.pdf>

Structure creating script (makeroom_Guppy_6.0.6-gpu.sh) moved to /sw/bioinfo/Guppy/makeroom_6.0.6-gpu.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-t" "Guppy" "-v" "6.0.6-gpu" "-s" "misc" "-u" "snowy miarka bianca" "-w" "https://nanoporetech.com/nanopore-sequencing-data-analysis" "-d" "Oxford Nanopore neural-net basecaller" "-l" "Custom" "-L" "https://nanoporetech.com/sites/default/files/s3/terms/Nanopore-product-terms-and-conditions-nov2018-v2.pdf"
    ./makeroom_Guppy_6.0.6-gpu.sh
Guppy/6.4.2-cpu
===============

Oxford Nanopores Guppy basecaller, CPU enabled

<https://nanoporetech.com/nanopore-sequencing-data-analysis>

Used under license:
Custom
<https://nanoporetech.com/sites/default/files/s3/terms/Nanopore-product-terms-and-conditions-nov2018-v2.pdf>


Structure creating script (makeroom_Guppy_6.4.2-cpu.sh) moved to /sw/bioinfo/Guppy/makeroom_6.4.2-cpu.sh

LOG
---

    makeroom.sh "-f" "-t" "Guppy" "-v" "6.4.2-cpu" "-s" "misc" "-w" "https://nanoporetech.com/nanopore-sequencing-data-analysis" "-d" "Oxford Nanopore neural-net basecaller" "-l" "Custom" "-L" "https://nanoporetech.com/sites/default/files/s3/terms/Nanopore-product-terms-and-conditions-nov2018-v2.pdf"
    ./makeroom_Guppy_6.4.2-cpu.sh


Get the bundles from Oxford Nanopore user support. This requires an account,
wnd Douglas Scofield has one through SNP&SEQ.  Place these in the src
directory. CPU version is installed for all clusters. From src dir

    rackham5: /sw/bioinfo/Guppy/6.4.2-cpu/src $ ll
    -rw-r--r-- 1 douglas staff  968122908 Jan 24 10:27 ont-guppy-cpu-6.4.2-1.el7.x86_64.rpm
    -rw-r--r-- 1 douglas staff  967970776 Jan 24 10:28 ont-guppy-cpu-6.4.2-1.el8.x86_64.rpm
    -rw-r--r-- 1 douglas staff 1099996966 Jan 24 10:27 ont-guppy-cpu_6.4.2_linux64.tar.gz

    tar xf ont-guppy-cpu_6.4.2_linux64.tar.gz
    mv ont-guppy-cpu/* $PREFIX/

Check that libraries can be found. RPATH info is relative so they should be.

    cd $PREFIX/bin
    ldd guppy_basecaller
    ./guppy_basecaller

    cd $TOOLDIR
    ./Guppy-6.4.2-cpu_post-install.sh 


Note that the .rpm packages are not installed but just kept in src/ if they
would be needed. To extract it:

    rpm2cpio file.rpm | cpio -idmv

