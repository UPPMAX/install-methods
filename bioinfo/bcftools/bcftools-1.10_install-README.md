bcftools/1.9
============

<http://www.htslib.org/doc/bcftools.html>

Used under license:
MIT/Expat or GPL v3

Structure creating script (makeroom_bcftools_1.9.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/bcftools/makeroom_1.9.sh


Holds the bcf/vcf commands which were in the old htslib. Associated with samtools and htslib.
<http://www.htslib.org/download/>


Simple installation with system version tools. Could be redone with newer compiler.
Note that the GSL option was not added due to complicated issues on Milou (related to ATLAS).
May try again later, if needed.


LOG
---

    TOOL=bcftools
    VERSION=1.10
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w http://www.htslib.org/doc/bcftools.html -l "MIT/Expat or GPL v3" -d "Tools for working with variant files"
    ./makeroom_${TOOL}_${VERSION}.sh 

    source SOURCEME_${TOOL}_${VERSION} 
    cd $VERSION/src
    [[ -f ${TOOL}-${VERSION}.tar.bz2 ]] || wget https://github.com/samtools/${TOOL}/releases/download/${VERSION}/${TOOL}-${VERSION}.tar.bz2
    tar xjf ${TOOL}-${VERSION}.tar.bz2
    cd ${TOOL}-${VERSION}

Configure the local htslib special.

    module load libcurl/7.45.0
    module load zlib/1.2.11
    module load gsl/2.6
    cd htslib-${VERSION}
    ./configure --enable-libcurl --enable-plugins --enable-s3 --enable-gcs --prefix=$PREFIX

Now configure the bcftools special to have it use the new htslib, build it so
it can find the right GSL libraries, and test it so it can find the new htslib.

    ./configure --prefix=$PREFIX --with-htslib=$PREFIX --enable-perl-filters --enable-gsl
    make -j4 GSL_LIBS='-lgsl -lgslcblas' USE_GPL=1
    PATH=$PREFIX/bin:$PATH LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH  make test
    make install

Now adjust RPATH information for the bcftools executable.

    cd $PREFIX/bin
    module load patchelf/0.10
    patchelf --set-rpath "$(patchelf --print-rpath bcftools):$PREFIX/lib:$GSL_ROOT/lib" bcftools
    module purge
    ldd *
