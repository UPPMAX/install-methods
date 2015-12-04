    cd /sw/apps/bioinfo/
    mkdir cd-hit
    cd cd-hit/
    mkdir 4.6.4 mf
    cd 4.6.4/
    mkdir milou src
    cd src/
    wget https://github.com/weizhongli/cdhit/releases/download/V4.6.4/cd-hit-v4.6.4-2015-0603.tar.gz
    tar xzf cd-hit-v4.6.4-2015-0603.tar.gz 
    cd cd-hit-v4.6.4-2015-0603/

Replace #!/usr/bin/perl with #!/usr/bin/env perl.

    vi *.pl
    cd cd-hit-auxtools/
    vi *pl
    cd ..
    cd psi-cd-hit/
    vi *.pl
    cd ..

Make cd-hit and install the top-level executables and the auxtools.

    module load gcc/4.9.2
    make
    cd cd-hit-auxtools/
    make
    cd ..
    PREFIX=/sw/apps/bioinfo/cd-hit/4.6.4/milou make install
    cd cd-hit-auxtools/
    cp -i cd-hit-dup cd-hit-dup-PE-out.pl cd-hit-lap read-linker /sw/apps/bioinfo/cd-hit/4.6.4/milou
    cd ..

Now the psi-cd-hit/ directory.  Add this to the path as a separate directory.

    cp -av psi-cd-hit /sw/apps/bioinfo/cd-hit/4.6.4/milou/

