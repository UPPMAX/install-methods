canu/2.0
========================

<http://canu.readthedocs.org/>
<http://canu.readthedocs.org/en/latest/>

Used under license:
Various

Structure creating script (makeroom_canu_2.0.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/canu/makeroom_2.0.sh

LOG
---

    TOOL=canu
    VERSION=2.0
    makeroom.sh -f" -t "canu" -v "2.0" -w "http://canu.readthedocs.org/" -l "Various" -d "a fork of the Celera Assembler\, designed for high-noise single-molecule sequencing \(such as the PacBio RS II/Sequel or Oxford Nanopore MinION\)"
    ./makeroom_canu_2.0.sh

    cd /sw/bioinfo/$TOOL
    source SOURCEME_canu_2.0

    cd ${VERSION}
    cd src/
    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/marbl/canu/archive/v${VERSION}.tar.gz
    [[ -d canu-${VERSION} ]] && rm -rf canu-${VERSION}
    tar xzf v${VERSION}.tar.gz 
    cd canu-${VERSION}
    cd src/
    module load gcc/9.3.0
    module load zlib/1.2.11
    make -j 10

Because `PREFIX` is set, this also installs right into there.

Now, add a line to `canu.defaults` so that a grid engine won't be used by default.

    vi $PREFIX/Linux-amd64/bin/canu.defaults

Add the line

    useGrid=false


