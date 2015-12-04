
    cd /sw/apps/bioinfo/
    mkdir -p cd-hit
    cd cd-hit/
    mkdir 4.6.1
    cd 4.6.1
    mkdir milou src
    ln -s ./milou halvan
    ln -s ./milou nestor
    cd src
    wget https://github.com/weizhongli/cdhit/releases/download/V4.6.1/cd-hit-v4.6.1-2012-08-27.tgz
    tar xzf cd-hit-v4.6.1-2012-08-27.tgz 
    cd cd-hit-v4.6.1-2012-08-27/

Replace #!/usr/bin/perl with #!/usr/bin/env perl.

    vi *.pl

In contrast to 4.6.4, the directory structure of 4.6.1 is flat.

    module load gcc/4.9.2
    make openmp=yes
    PREFIX=/sw/apps/bioinfo/cd-hit/4.6.1/milou make install

