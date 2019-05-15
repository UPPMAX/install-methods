Redundans/0.14a-de_novo-42e8edf-20190314
=======================

Pipeline assisting assembly of highly heterozygous/polymorphic genomes.

** this is a development branch **

<https://github.com/lpryszcz/redundans>

LOG
---

It provides all its own prerequisites.

    cd /sw/bioinfo
    mkdir Redundans
    VERSION=0.14a-de_novo-42e8edf-20190314
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    cd $CLUSTER
    module load python/2.7.15
    module load gcc/5.4.0  # must use this version, or at least not 6, as snap compilation fails otherwise)
    git clone -b de_novo --recursive https://github.com/lpryszcz/redundans.git
    cd redundans/
    git reset --hard 42e8edf524f7436ab65da27ce696cf5a96c31f37
    bin/.compile.sh

Run a couple of tests.

    ./redundans.py -v -i test/*.fq.gz -f test/contigs.fa -o test/run1
    ./redundans.py -v -i test/*.fq.gz -l test/pacbio.fq.gz test/nanopore.fa.gz -f test/contigs.fa -o test/run_short_long

Add `$version/$Cluster/redundans` to `PATH` in the mf, and we need to load `python/2.7.15`. 

