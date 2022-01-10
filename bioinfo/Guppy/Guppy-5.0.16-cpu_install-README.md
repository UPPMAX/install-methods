Guppy/5.0.16-cpu
================

Oxford Nanopore's Guppy basecaller, CPU only

<https://nanoporetech.com/nanopore-sequencing-data-analysis>

Used under license:
Custom
<https://nanoporetech.com/sites/default/files/s3/terms/Nanopore-product-terms-and-conditions-nov2018-v2.pdf>


Structure creating script (makeroom_Guppy_5.0.16-cpu.sh) moved to /sw/bioinfo/Guppy/makeroom_5.0.16-cpu.sh

LOG
---

    makeroom.sh -f -t Guppy -v 5.0.16-cpu -s misc -w https://nanoporetech.com/nanopore-sequencing-data-analysis -d "Oxford Nanopore neural-net basecaller, CPU only" -l Custom -L https://nanoporetech.com/sites/default/files/s3/terms/Nanopore-product-terms-and-conditions-nov2018-v2.pdf
    ./makeroom_Guppy_5.0.16-cpu.sh 
    source /sw/bioinfo/Guppy/SOURCEME_Guppy_5.0.16-cpu && cd $SRCDIR

Get the bundles from Oxford Nanopore user support. This requires an account,
and I have one through SNP&SEQ.  Place these in the src directory.  For CPU
only:

    -rw-r--r-- 1 douglas staff 609682260 Nov 23 09:46 ont-guppy-cpu-5.0.16-1.el7.x86_64.rpm
    -rw-r--r-- 1 douglas staff 664245818 Nov 23 09:45 ont-guppy-cpu_5.0.16_linux64.tar.gz

    tar xf ont-guppy-cpu_5.0.16_linux64.tar.gz
    rmdir $PREFIX && mv ont-guppy-cpu $PREFIX

Check that libraries can be found. RPATH info is relative so they should be.

    cd $PREFIX/bin
    ldd guppy_basecaller


    cd $TOOLDIR
    ./Guppy-5.0.16-gpu_post-install.sh

