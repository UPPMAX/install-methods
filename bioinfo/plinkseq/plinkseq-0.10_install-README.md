plinkseq-0.10
========================

<http://atgu.mgh.harvard.edu/plinkseq/index.shtml>

LOG
---

    The default installer thought that we needed a static install, but couldn't
    find the libraries, so I commented out line 83 of config_defs.Makefile. That
    made it possible to compile five of the nine executables. The remaining four
    were taken from the binary executables provided by the developer. 

    cd /sw/apps/bioinfo/plinkseq/0.10/src/
    tar xfz plinkseq-src-latest.tgz
    cd plinkseq-0.10
    module load gcc/6.3.0
    vi config_defs.Makefile #To alter the static flag
    make mongoose  behead  tab2vcf  gcol  pseq
    unzip plinkseq-x86_64-latest.zip
    mkdir -p ../rackham/bin
    cd ../rackham/bin
    cp -av ../../src/plinkseq-0.10/build/execs/{behead,gcol,mongoose,tab2vcf,pseq} .
    cp -av ../../src/plinkseq-0.10/{browser,mm,pbrowse,smp} .

####NEWS 2017-01-29
    Apparently, that didn't work, so I now replaced the compiled ones with the binaries.
    Only tab2vcf is now compiled for rackham.
