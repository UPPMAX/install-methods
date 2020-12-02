jellyfish/2.3.0
========================

<https://github.com/gmarcais/Jellyfish>

Used under license:
BSD3 / GPLv3

Structure creating script (makeroom_jellyfish_2.3.0.sh) moved to /sw/bioinfo/jellyfish/makeroom_2.3.0.sh

LOG
---

    cd /sw/bioinfo/jellyfish
    TOOL=jellyfish
    VERSION=2.3.0
    makeroom.sh -f -s "misc" -t "$TOOL" -v "${VERSION}" -w "https://github.com/gmarcais/Jellyfish" -l "BSD3 / GPLv3" -d "tool for fast, memory-efficient counting of k-mers in DNA"
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION} 
    cd $VERSIONDIR

    # update older architecture links

    rm -rf snowy irma bianca
    mkdir snowy
    for CL in irma bianca ; do ln -s snowy $CL ; done

    # build for this cluster, repeat this part on rackham and snowy s229

    cd /sw/bioinfo/jellyfish
    TOOL=jellyfish
    VERSION=2.3.0
    source SOURCEME_${TOOL}_${VERSION} 
    cd $SRCDIR/
    [[ -f ${TOOL}-${VERSION}.tar.gz ]] || wget https://github.com/gmarcais/Jellyfish/releases/download/v${VERSION}/${TOOL}-${VERSION}.tar.gz
    [[ -d ${TOOL}-${VERSION} ]] && rm -rf ${TOOL}-${VERSION}
    tar xzf ${TOOL}-${VERSION}.tar.gz 
    cd ${TOOL}-${VERSION}
    module load gcc/9.3.0
    module load swig/3.0.12
    module load python/3.7.2  # do not load a separate perl, use the system perl
    module load bioinfo-tools
    module load htslib/1.10
    module load samtools/1.10
    ./configure --with-gnu-ld --with-sse --prefix=$PREFIX --enable-python-binding --enable-perl-binding
    make
    make check
    make install

Build on rackham and on s229 on snowy.

