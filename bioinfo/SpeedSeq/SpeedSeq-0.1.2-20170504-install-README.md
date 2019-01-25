SpeedSeq 0.1.2-20170504-30f8dc6
=======================

<https://github.com/hall-lab/speedseq>

Log
---

Adding the commit and date because I am cloning the repository, not the 0.1.2 release.

    VERSION=0.1.2-20170504-30f8dc6
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir -p /sw/apps/bioinfo/SpeedSeq
    cd /sw/apps/bioinfo/SpeedSeq
    mkdir -p $VERSION mf
    cd $VERSION

    module load git/2.10.2
    module load gcc/4.9.4
    module load python/2.7.6
    module load ROOT/6.06.08
    module load bioinfo-tools
    module load pysam/0.8.3
    module load vep/87
    git clone --recursive https://github.com/hall-lab/speedseq

    mv speedseq $CLUSTER
    cd $CLUSTER
    export SPEEDSEQ_DIR=$PWD
    make

There are no longer problems building a separate `cnvnator-multi`, since its
`cnvnator` is already multithreaded, I suppose.  The new CNVnator is also
multithreaded.

It will fail looking for `samtools`, but it builds its own.  I got around this with:

    module load samtools/1.3
    make
    cp src/samtools-1.3.1/samtools bin/

Set up local VEP/76 and VEP cache, and GRCh37 human genome, following SpeedSeq
README and the example install in
<https://github.com/hall-lab/speedseq/blob/master/example/example_speedseq_install.sh>.
I download with `lftp`, since `wget` crapped out about halfway through.

    mkdir genomes
    cd genomes
    echo 'get human_g1k_v37.fasta.gz' | lftp ftp://ftp-trace.ncbi.nih.gov/1000genomes/ftp/technical/reference
    echo 'get human_g1k_v37.fasta.fai' | lftp ftp://ftp-trace.ncbi.nih.gov/1000genomes/ftp/technical/reference
    gunzip human_g1k_v37.fasta.gz
    cd ..
    mkdir annotations/cnvnator_chroms
    cd annotations/cnvnator_chroms
    cat ../../genomes/human_g1k_v37.fasta | awk 'BEGIN { CHROM="" } { if ($1~"^>") CHROM=substr($1,2); print $0 > CHROM".fa" }'
    cd ../..

Now add VEP and cache. Update `speedseq.config` but also make sure to load
`vep/87` in the mf file.

    which variant_effects_predictor.pl
    module help vep/87

This last to get the directory of the UPPMAX copy of the VEP cache. To create a
local copy instead, use the `INSTALL.pl` script from the `vep/87` module.

    INSTALL.pl -c annotations/vep_cache -a c -s homo_sapiens -y GRCh37

Takes a while to index.

    cd genomes
    ../bin/bwa index human_g1k_v37.fasta

Now continue editing `speedseq.config`.

    cd bin
    vi speedseq.config

Edit `SAMTOOLS` to point to the version under this `bin`.  Also, remove the
`/pica` from each directory and the double-slashes (if present) from the paths
with:

    :g/\/pica/s///
    :g/\/\//s//\//g

Now test out the install.

    cd example
    ./run_speedseq.sh 

