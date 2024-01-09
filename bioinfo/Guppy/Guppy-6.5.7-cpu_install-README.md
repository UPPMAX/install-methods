Guppy/6.5.7-cpu
===============

Oxford Nanopores Guppy basecaller, CPU enabled

<https://nanoporetech.com/nanopore-sequencing-data-analysis>

Used under license:
Custom
<https://nanoporetech.com/sites/default/files/s3/terms/Nanopore-product-terms-and-conditions-nov2018-v2.pdf>

Local, updated licenses at

'/sw/bioinfo/Guppy/6.5.7-gpu/snowy/bin/Guppy End User License Agreement 17Feb22.pdf'
'/sw/bioinfo/Guppy/6.5.7-gpu/snowy/bin/THIRD_PARTY_LICENSES'


Structure creating script (makeroom_Guppy_6.5.7-cpu.sh) moved to /sw/bioinfo/Guppy/makeroom_6.5.7-cpu.sh

LOG
---

    makeroom.sh "-f" "-t" "Guppy" "-v" "6.5.7-cpu" "-s" "misc" "-w" "https://nanoporetech.com/nanopore-sequencing-data-analysis" "-d" "Oxford Nanopore neural-net basecaller" "-l" "Custom" "-L" "https://nanoporetech.com/sites/default/files/s3/terms/Nanopore-product-terms-and-conditions-nov2018-v2.pdf"
    ./makeroom_Guppy_6.5.7-cpu.sh


Get the bundles from Oxford Nanopore user support. This requires an account,
and Douglas Scofield has one through SNP&SEQ.  Place these in the src
directory. CPU version is installed for all clusters. From src dir

    rackham5: /sw/bioinfo/Guppy/6.5.7-cpu/src $ ll
    -rw-r--r-- 1 douglas staff 1144483396 Dec 22 11:09 ont-guppy-cpu-6.5.7-1.el7.x86_64.rpm
    -rw-r--r-- 1 douglas staff 1144335144 Dec 22 11:33 ont-guppy-cpu-6.5.7-1.el8.x86_64.rpm
    -rw-r--r-- 1 douglas staff 1295757837 Dec 22 11:21 ont-guppy-cpu_6.5.7_linux64.tar.gz

    tar xf ont-guppy-cpu_6.5.7_linux64.tar.gz
    mv ont-guppy-cpu/* $PREFIX/
    rmdir ont-guppy-cpu

Check that libraries can be found. RPATH info is relative so they should be.

    cd $PREFIX/bin
    ldd guppy_basecaller
    ./guppy_basecaller

    cd $TOOLDIR
    ./Guppy-6.5.7-cpu_post-install.sh 


Note that the .rpm packages are not installed but just kept in src/ if they
would be needed. To extract it:

    rpm2cpio file.rpm | cpio -idmv

