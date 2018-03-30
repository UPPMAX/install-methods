gmap-gsnap/2018-02-12
=====================

GMAP and GSNAP alignment tools

Wu TD and Watanabe CK. 2005. GMAP: a genomic mapping and alignment program 
for mRNA and EST sequences. Bioinformatics 21:1859-1875.

Wu TD and Serban N. 2010. Fast and SNP-tolerant detection of complex 
variants and splicing in short reads.  Bioinformatics 26:873-881.

<http://research-pub.gene.com/gmap/>


### Note a change involving MAX_READLENGTH from previous versions

From the `README` file:

    Note 3: GSNAP previously had a configure variable called
    MAX_READLENGTH (default 300) as a guide to the maximum read length.
    That variable is no longer needed, since GSNAP can align reads of
    arbitrary length.  (But, for longer reads, GMAP will probably be much
    faster.)

    However, whenever possible, based on the length of the read, GSNAP
    will use stack memory instead of heap memory for some algorithms.  To
    control this decision, there is a variable called
    MAX_STACK_READLENGTH, set like this

        ./configure MAX_STACK_READLENGTH=<length>

    or by defining it in your config.site file (or in the file provided to
    configure as the value of CONFIG_SITE).  Or you may set the value of
    MAX_STACK_READLENGTH as an environment variable before calling
    ./configure.  If you set MAX_STACK_READLENGTH too high, you may
    overflow the amount of stack allocated by your computer.  If you do
    not set MAX_STACK_READLENGTH, it will have a default value of 300.

At Uppmax, `ulimit -a | grep stack` shows that stack size is `unlimited` on
milou-b, rackham5, and in a single-core `interactive --qos=short` job on
rackham.  I will set `MAX_STACK_READLENGTH` to the 20000 used for
`MAX_READLENGTH` in previous module versions; in principal it could be much
higher.


LOG
---

    TOOL=/sw/apps/bioinfo/gmap-gsnap
    VERSION=2018-02-12
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    [[ $CLUSTER == rackham ]] && for CC in bianca irma; do ln -s $CLUSTER $CC; done
    PFX=$PWD/$CLUSTER
    cd src
    [[ -f gmap-gsnap-$VERSION.tar.gz ]] || wget http://research-pub.gene.com/gmap/src/gmap-gsnap-$VERSION.tar.gz
    [[ -d gmap-$VERSION ]] && rm -rf gmap-$VERSION
    tar xzf gmap-gsnap-$VERSION.tar.gz
    cd gmap-$VERSION
    module load gcc/6.3.0 bzip2/1.0.6 zlib/1.2.11
    ./configure --prefix="$PFX" MAX_STACK_READLENGTH=20000
    make -j 8 && make check && make install
    cd ..
    rm -rf gmap-$VERSION

The prebuilt index for hg19 made available with previous versions lacks the
most recent features (see the web site for more details).  So we are not
installing it nor are we defining `GMAPDB`.

Reuse the previous mf.
