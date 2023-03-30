AnchorWave/1.1.1
================

<https://github.com/baoxingsong/AnchorWave>

Used under license:
MIT


Supports compilation with different instructions: sse4.1 (snowy), avx2 (rackham, bianca), avx512 (miarka).

Structure creating script (makeroom_AnchorWave_1.1.1.sh) moved to /sw/bioinfo/AnchorWave/makeroom_1.1.1.sh

LOG
---

We will use minimap2 and gmap from existing modules.


    cd /sw/bioinfo
    makeroom.sh -t AnchorWave -v 1.1.1 -c bioinfo -s alignment -w https://github.com/baoxingsong/AnchorWave -d "sensitive alignment of genomes with high sequence diversity, extensive structural polymorphism and whole-genome duplication variation" -l MIT
    ./makeroom_AnchorWave_1.1.1.sh 
    source /sw/bioinfo/AnchorWave/SOURCEME_AnchorWave_1.1.1
    cd $SRCDIR

    wget https://github.com/baoxingsong/AnchorWave/archive/refs/tags/v1.1.1.tar.gz
    tar xf v1.1.1.tar.gz 

Set up rackham/bianca, snowy, miarka directories and build separately. For the rackham/bianca build, handle the `scripts/` directory as well.

    cd $VERSIONDIR
    rm -f snowy miarka
    mkdir snowy miarka

### rackham/bianca

    cd $SRCDIR
    cd AnchorWave-1.1.1

    module load cmake/3.22.2
    module load gcc/10.3.0
    module load zlib/1.2.12
    module load bioinfo+tools
    module load minimap2/2.24-r1122
    module load gmap-gsnap/2021-12-17

    mkdir build_avx2
    cp -av CMakeLists_avx2.txt CMakeLists.txt
    cd build_avx2/
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_POLICY_DEFAULT_CMP0074=NEW
    make -j4
    make install

On rackham, handle scripts/ directory and msa-convert.

    cd ..
    cd scripts
    head -n 1 *

These scripts have odd first lines or missing interpreters. Fix it all with sed.
Download the `maf-convert` script and make all scripts executable.

    sed -i 's,^#!python,#!/usr/bin/env python,' *.py
    sed -i 's,^#!perl,#!/usr/bin/env perl,' *.pl
    sed -i '1i #!/usr/bin/env Rscript' plot.r 
    wget https://gitlab.com/mcfrith/last/-/raw/main/bin/maf-convert

    chmod +x *

Set up links from other cluster prefixes.

    cd $VERSIONDIR
    cd snowy
    ln -s ../rackham/scripts .
    cd miarka
    ln -s ../rackham/scripts .

### snowy

    cd /sw/bioinfo/AnchorWave
    source SOURCEME_AnchorWave_1.1.1
    cd $SRCDIR
    cd AnchorWave-1.1.1/
    cp -av CMakeLists_sse4.1.txt CMakeLists.txt
    mkdir build_sse4.1
    cd build_sse4.1/
    module load cmake/3.22.2 gcc/10.3.0 bioinfo-tools minimap2/2.24-r1122 gmap-gsnap/2021-12-17 zlib/1.2.12
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_POLICY_DEFAULT_CMP0074=NEW
    make -j10
    make install


### miarka

    cd /sw/bioinfo/AnchorWave
    source SOURCEME_AnchorWave_1.1.1
    cd $SRCDIR
    cd AnchorWave-1.1.1/
    cp -av CMakeLists_avx512.txt CMakeLists.txt
    mkdir build_avx512
    cd build_avx512
    module load cmake/3.22.2 gcc/10.3.0 bioinfo-tools minimap2/2.24-r1122 gmap-gsnap/2021-12-17 zlib/1.2.12
    cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_POLICY_DEFAULT_CMP0074=NEW
    make -j10
    make install


## mf file

The mf file should add `$modroot/bin` and `$modroot/scripts` to `PATH`, load
minimap2/2.24-r1122 and gmap-gsnap/2021-12-17, and in the module help include
the need to load python/3.10.8, perl_modules/5.26.2, and R_packages/4.1.1 to
use the scripts.


