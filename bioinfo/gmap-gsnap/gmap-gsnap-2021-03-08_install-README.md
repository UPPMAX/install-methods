gmap-gsnap/2021-03-08
========================

<http://research-pub.gene.com/gmap/>

Used under license:
Custom As IS

Structure creating script (makeroom_gmap-gsnap_2021-03-08.sh) moved to /sw/bioinfo/gmap-gsnap/makeroom_2021-03-08.sh


GMAP and GSNAP alignment tools

Wu TD and Watanabe CK. 2005. GMAP: a genomic mapping and alignment program 
for mRNA and EST sequences. Bioinformatics 21:1859-1875.

Wu TD and Serban N. 2010. Fast and SNP-tolerant detection of complex 
variants and splicing in short reads.  Bioinformatics 26:873-881.

The `MAX_READLENGTH` change from the previous version applies.  See there
for more.

Also, for this version, updating to gcc/9.3.0 and load zlib/1.2.11 and bzip2/1.0.6.


LOG
---

The prebuilt index for hg19 made available with previous versions lacks the
most recent features (see the web site for more details).  So we are not
installing it nor are we defining `GMAPDB`.

Reuse the previous mf.


    TOOL=gmap-gsnap
    VERSION=2021-03-08
    cd /sw/bioinfo/gmap-gsnap/
    makeroom.sh -f -t ${TOOL} -v ${VERSION} -s alignment -w "http://research-pub.gene.com/gmap/" -d "Genomic Mapping and Alignment Program for mRNA and EST Sequences" -l "Custom As IS"
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}/
    cd src/
    wget http://research-pub.gene.com/gmap/src/${TOOL}-${VERSION}.tar.gz
    tar xf ${TOOL}-${VERSION}.tar.gz 
    cd gmap-${VERSION}/
    ml gcc/9.3.0
    ml bzip2/1.0.6
    ml zlib/1.2.11
    MAX_STACK_READLENGTH=20000 ./configure --prefix=$PREFIX
    make -j10 && make check && make install
    cd ..
    rm -rf gmap-${VERSION}/



Compile separately for snowy/bianca/irma.  On snowy-lr1:



    TOOL=gmap-gsnap
    VERSION=2021-03-08
    cd /sw/bioinfo/gmap-gsnap/
    source SOURCEME_${TOOL}_${VERSION} 
    cd $VERSIONDIR
    rm -f snowy bianca irma
    mkdir snowy
    ln -s snowy bianca
    ln -s snowy irma
    cd src
    tar xf ${TOOL}-${VERSION}.tar.gz 
    cd gmap-${VERSION}/
    ml gcc/9.3.0
    ml bzip2/1.0.6
    ml zlib/1.2.11
    MAX_STACK_READLENGTH=20000 ./configure --prefix=$PREFIX
    make -j10 && make check && make install
    cd ..
    rm -rf gmap-${VERSION}/


