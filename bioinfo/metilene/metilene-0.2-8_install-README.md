metilene/0.2-8
==============

<http://legacy.bioinf.uni-leipzig.de/Software/metilene/>

Used under license:
GPL v2


Structure creating script (makeroom_metilene_0.2-8.sh) moved to /sw/bioinfo/metilene/makeroom_0.2-8.sh

LOG
---

makeroom.sh -t metilene -v 0.2-8 -l "GPL v2" -d "Fast and sensitive detection of differential DNA methylation" -w http://legacy.bioinf.uni-leipzig.de/Software/metilene/ -s misc
./makeroom_metilene_0.2-8.sh 
source /sw/bioinfo/metilene/SOURCEME_metilene_0.2-8 && cd $SRCDIR

Download, BUT:

    wget http://www.bioinf.uni-leipzig.de/Software/metilene/metilene_v02-8.tar.gz

Downloading directly doesn't seem to work, so separately and transfer.

    tar xf metilene_v02-8.tar.gz 
    cd metilene_v0.2-8/

Remove execute permission from all files except scripts and prebuilt executables.

    find . -type f -print0 | xargs --null chmod -x
    chmod +x *.pl *.R *linux??

Build with older gcc and modify #! lines to use env.

    make clean
    module load gcc/6.3.0
    make

    sed -i '1i#!/usr/bin/env perl' *.pl
    sed -i '1i#!/usr/bin/env Rscript' *.R

Install under $PREFIX.

    cp -av metilene *.pl *.R $PREFIX/

Note the need to load perl_modules and R_packages to use scripts in the mf file.

    cd ../../mf
    vi 0.2-8 

Wrap up.

    ./metilene-0.2-8_post-install.sh 
