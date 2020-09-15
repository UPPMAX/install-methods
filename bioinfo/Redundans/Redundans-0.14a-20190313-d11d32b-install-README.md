Redundans/0.14a-d11d32b-20190313
================================

Pipeline assisting assembly of highly heterozygous/polymorphic genomes.

<https://github.com/lpryszcz/redundans>

LOG
---

It provides all its own prerequisites.

    cd /sw/bioinfo
    mkdir -p Redundans
    cd Redundans
    VERSION=0.14a-d11d32b-20190313
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    cd $CLUSTER
    module load git/2.16.1
    module load python/2.7.15
    module load gcc/5.4.0  # must use this version, or at least not 6, as snap compilation fails otherwise)
    git clone --recursive https://github.com/lpryszcz/redundans
    cd redundans
    git reset --hard d11d32b2ca57bd3ea285bf70828392e40935ce59
    bin/.compile.sh

Run a couple of tests.

    ./redundans.py -v -i test/*.fq.gz -f test/contigs.fa -o test/run1
    ./redundans.py -v -i test/*.fq.gz -l test/pacbio.fq.gz test/nanopore.fa.gz -f test/contigs.fa -o test/run_short_long

Add `$version/$Cluster/redundans` to `PATH` in the mf, and we need to load `python/2.7.15`. 

