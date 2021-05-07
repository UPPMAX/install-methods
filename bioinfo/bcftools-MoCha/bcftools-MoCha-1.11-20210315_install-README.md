bcftools-MoCha/1.11-20210315
========================

<http://software.broadinstitute.org/software/mocha/>

Used under license:
MIT

Structure creating script (makeroom_bcftools-MoCha_1.11-20210315.sh) moved to /sw/bioinfo/bcftools-MoCha/makeroom_1.11-20210315.sh

LOG
---


    TOOL=bcftools-MoCha
    VERSION=1.11-20210315
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -w http://software.broadinstitute.org/software/mocha/ -d "MOsaic CHromosomal Alterations (MoChA) caller" -l MIT 
    ./makeroom_bcftools-MoCha_1.11-20210315.sh 
    source SOURCEME_bcftools-MoCha_1.11-20210315 
    cd $SRCDIR
    module load bzip2/1.0.6
    module load xz/5.2.2
    module load zlib/1.2.11
    module load gcc/9.3.0
    module load libcurl/7.45.0
    module load gsl/2.6
    wget http://software.broadinstitute.org/software/mocha/bio-mocha_1.11-20210315.tar.gz
    wget https://github.com/samtools/bcftools/releases/download/1.11/bcftools-1.11.tar.bz2
    tar xf bcftools-1.11.tar.bz2
    mkdir bio-mocha_1.11-20210315
    cd bio-mocha_1.11-20210315
    tar xf ../bio-mocha_1.11-20210315.tar.gz
    cd ..
    rm -f bcftools-1.11/plugins/{{mocha,beta_binom,genome_rules}.h,{mocha,trio-phase,mochatools,extendFMT}.c}
    cp -av bio-mocha_1.11-20210315/{{mocha,beta_binom,genome_rules}.h,{mocha,trio-phase,mochatools,extendFMT}.c} bcftools-1.11/plugins/
    cd bcftools-1.11/
    cd htslib-1.11/
    ./configure --enable-libcurl --enable-plugins --enable-s3 --enable-gcs --prefix=$PREFIX
    make -j10 && make install
    cd ..
    ./configure --prefix=$PREFIX --with-htslib=$PREFIX --enable-libgsl
    make -j10
    PATH=$PREFIX/bin:$PATH LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH  make test
    make install
    cd $PREFIX/bin
    head gff2gff.py 
    which python3
    python3 --version
    head run-roh.pl 
    perl --version
    module load patchelf/0.10
    patchelf --set-rpath "$(patchelf --print-rpath bcftools):$PREFIX/lib:$GSL_ROOT/lib" bcftools

Get other tools.

    cd $SRCDIR
    wget -O impute5_v1.1.4.zip https://www.dropbox.com/sh/mwnceyhir8yze2j/AAAPJVJv3kI2glXGDdc3sSHga/impute5_v1.1.4.zip?dl=0
    unzip impute5_v1.1.4.zip impute5_v1.1.4/imp{ute5,5Converter}_1.1.4_static
    mv impute5_v1.1.4/impute5_1.1.4_static $PREFIX/bin/impute5
    mv impute5_v1.1.4/imp5Converter_1.1.4_static $PREFIX/bin/imp5Converter
    wget http://faculty.washington.edu/browning/beagle/bref3.18May20.d20.jar
    cp -av bref3.18May20.d20.jar $PREFIX/bin
    cd $PREFIX/bin
    ln -s bref3.18May20.d20.jar bref3.jar


Genome resources
----------------

    cd $PREFIX
    mkdir res
    cd res
    module load bioinfo-tools samtools/1.12 BEDTools/2.29.2
    export PATH=$PREFIX/bin:$PATH

And also set up GRCh37-setup.sh and GRCh38-setup.sh according to the
instructions.  These are changed from the previous version.

I debugged the instructions from the website and popped them into two shell
scripts that will create data directories within $PREFIX/res.  These will take
a few hours each.


### for GRCh37 ...

    cd $PREFIX/res
    ./GRCh37-download-and-process-data.sh

### for GRCh38 ...

    cd $PREFIX/res
    ./GRCh38-download-and-process-data.sh


