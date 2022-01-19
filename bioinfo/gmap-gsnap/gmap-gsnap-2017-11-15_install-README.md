gmap-gsnap/2017-11-15
=====================

<http://research-pub.gene.com/gmap/>

Used under license:
Custom As IS


Structure creating script (makeroom_gmap-gsnap_2017-11-15.sh) moved to /sw/bioinfo/gmap-gsnap/makeroom_2017-11-15.sh

GMAP and GSNAP alignment tools

Wu TD and Watanabe CK. 2005. GMAP: a genomic mapping and alignment program 
for mRNA and EST sequences. Bioinformatics 21:1859-1875.

Wu TD and Serban N. 2010. Fast and SNP-tolerant detection of complex 
variants and splicing in short reads.  Bioinformatics 26:873-881.

Not necessary to apply the `MAX_READLENGTH` change since that is no longer
used.  Still applying just to be sure but according to the README it has no
effect.

Also, for this version, use the same as 2017-09 version, so gcc/6.3.0 and load
zlib/1.2.11 and bzip2/1.0.6.


LOG
---

The prebuilt index for hg19 made available with previous versions lacks the
most recent features (see the web site for more details).  So we are not
installing it nor are we defining `GMAPDB`.

Since this detects available instructions, build separate versions for rackham
and snowy/irma/bianca.

On rackham:

    makeroom.sh -f -t gmap-gsnap -v 2017-11-15 -s alignment -w "http://research-pub.gene.com/gmap/" -d "Genomic Mapping and Alignment Program for mRNA and EST Sequences" -l "Custom As IS"
    ./makeroom_gmap-gsnap_2017-11-15.sh 
    source /sw/bioinfo/gmap-gsnap/SOURCEME_gmap-gsnap_2017-11-15 && cd $SRCDIR
    wget http://research-pub.gene.com/gmap/src/gmap-gsnap-2017-11-15.tar.gz
    module load gcc/6.3.0 bzip2/1.0.6 zlib/1.2.11
    tar xf gmap-gsnap-2017-11-15.tar.gz 
    cd gmap-2017-11-15/
    ./configure --prefix="$PREFIX" MAX_READLENGTH=20000
    MAX_READLENGTH=20000 make -j 8 && make check && make install

Now on a snowy login node

    cd /sw/bioinfo/gmap-gsnap/
    source SOURCEME_gmap-gsnap_2017-11-15
    cd $PREFIX
    rm -f bianca irma snowy
    mkdir snowy
    ln -s snowy irma
    ln -s snowy bianca
    echo $PREFIX      # make sure this includes snowy
    cd $SRCDIR
    # remove the previous unpacked/configured directory
    rm -rf gmap-2017-11-15/
    tar xf gmap-gsnap-2017-11-15.tar.gz 
    cd gmap-2017-11-15/
    module load gcc/6.3.0 bzip2/1.0.6 zlib/1.2.11
    ./configure --prefix="$PREFIX" MAX_READLENGTH=20000
    MAX_READLENGTH=20000 make -j 8 && make check && make install

