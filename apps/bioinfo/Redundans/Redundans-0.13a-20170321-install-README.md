Redundans-0.13a-20170321-install-README.md
==========================================

Pipeline assisting assembly of highly heterozygous/polymorphic genomes.

<https://github.com/Gabaldonlab/redundans>

LOG
---

It provides all its own prerequisites.

    cd /sw/apps/bioinfo
    mkdir Redundans
    VERSION=0.13a-20170321
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    cd $CLUSTER
    module load git/2.10.2
    module load python/2.7.6
    module load gcc/5.4.0  # must use this version, or at least not 6, as snap compilation fails otherwise)
    git clone --recursive https://github.com/lpryszcz/redundans.git
    cd redundans/
    (cd bin/bwa && make clean && make)
    (cd bin/last && make clean && make)
    (cd bin/snap && make clean && make)

Run a couple of tests.

    ./redundans.py -v -i test/*.fq.gz -f test/contigs.fa -o test/run1
    ./redundans.py -v -i test/*.fq.gz -l test/pacbio.fq.gz test/nanopore.fa.gz -f test/contigs.fa -o test/run_short_long

Add `$version/$Cluster/redundans` to `PATH` in the mf, and we need to load `python/2.7.6`. 

