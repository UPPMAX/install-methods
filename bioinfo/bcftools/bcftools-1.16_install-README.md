bcftools/1.16
========================

<http://www.htslib.org/doc/bcftools.html>

Used under license:
MIT/Expat or GPL v3


Structure creating script (makeroom_bcftools_1.16.sh) moved to /sw/bioinfo/bcftools/makeroom_1.16.sh

LOG
---

Holds the bcf/vcf commands which were in the old htslib. Associated with samtools and htslib.
<http://www.htslib.org/download/>

Like for samtools, build the new local htslib. Then build bcftools, referring
to this new htslib.  Configure the bcftools special to have it use the new
htslib, build it so it can find the right GSL libraries, and test it so it can
find the new htslib.



    TOOL=bcftools
    VERSION=1.16
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w http://www.htslib.org/doc/bcftools.html -l "MIT/Expat or GPL v3" -d "Tools for working with variant files"
    ./makeroom_${TOOL}_${VERSION}.sh 

    source SOURCEME_${TOOL}_${VERSION} 
    cd $VERSION/src
    [[ -f ${TOOL}-${VERSION}.tar.bz2 ]] || wget https://github.com/samtools/${TOOL}/releases/download/${VERSION}/${TOOL}-${VERSION}.tar.bz2
    tar xf ${TOOL}-${VERSION}.tar.bz2
    cd ${TOOL}-${VERSION}

    module load libcurl/7.85.0
    module load zlib/1.2.12
    module load bzip2/1.0.8
    module load xz/5.2.6
    module load zstd/1.5.2  # mentioned in NEWS but apparently not used yet
    module load gsl/2.7

    cd htslib-${VERSION}
    ./configure --enable-libcurl --enable-plugins --enable-s3 --enable-gcs --prefix=$PREFIX
    make -j 10 && make install
    cd ..

    ./configure --prefix=$PREFIX --with-htslib=$PREFIX --enable-perl-filters --enable-gsl
    make -j4 GSL_LIBS='-lgsl -lgslcblas' USE_GPL=1
    PATH=$PREFIX/bin:$PATH LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH  make test
    make install


Now update RPATH info in executables to point to the new htslib, and make sure
all the executables can find their libhts and other libraries.

    cd $PREFIX/bin
    MYGSL_ROOT=$GSL_ROOT
    module purge
    module load uppmax
    module load patchelf/0.10
    for F in $(file * | grep 'ELF 64-bit' | cut -f1 -d:) ; do
        echo "fixing $F ..."
        patchelf --set-rpath "$(patchelf --print-rpath $F):$PREFIX/lib:$MYGSL_ROOT/lib" $F
    done

    module purge
    ldd *


The problem is that zlib/1.2.12 is not used, the system zlib is used.
