Redundans/2.0.1
========================

<https://github.com/Gabaldonlab/redundans>

Used under license:
GPL v3


Structure creating script (makeroom_Redundans_2.0.1.sh) moved to /sw/bioinfo/Redundans/makeroom_2.0.1.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-t" "Redundans" "-v" "2.0.1" "-w" "https://github.com/Gabaldonlab/redundans" "-l" "GPL v3" "-d" "Redundans is a pipeline that assists an assembly of heterozygous/polymorphic genomes" "-k" "python,bioinformatics,pipeline,genomics,assembly,docker-image,polymorphic,gap-closing,fasta,scaffolding,assembled-contigs,genome-assembly,paired-end,contigs,heterozygous,mate-pairs"
    ./makeroom_Redundans_2.0.1.sh

    source /sw/bioinfo/Redundans/SOURCEME_Redundans_2.0.1
    cd $SRCDIR

    ml git/2.34.1
    git clone --recursive https://github.com/Gabaldonlab/redundans.git

    cd redundans
    ml python/3.11.4
    ml gcc/12.3.0
    ml R_packages/4.3.1
    ml zlib/1.3
    ml bzip2/1.0.8

    ml bioinfo-tools
    ml miniasm/0.3-r179-20191007-ce615d1
    ml minimap2/2.26-r1175
    ml last/1505
    ml SNAP-aligner/2.0.3
    ml k8/0.2.5
    ml meryl/1.4.1



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
    cd Redundans
    VERSION=0.14a-20190509-ffae69e
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    cd $CLUSTER
    module load git/2.21.0
    module load python/2.7.15
    module load gcc/5.4.0  # must use this version, or at least not 6, as snap compilation fails otherwise)
    git clone --recursive https://github.com/lpryszcz/redundans.git
    cd redundans/
    git reset --hard ffae69ec64065b128cf513f6b0603a6d285489b2
    bin/.compile.sh

Run a couple of tests.

    ./redundans.py -v -i test/*.fq.gz -f test/contigs.fa -o test/run1
    ./redundans.py -v -i test/*.fq.gz -l test/pacbio.fq.gz test/nanopore.fa.gz -f test/contigs.fa -o test/run_short_long

Add `$version/$Cluster/redundans` to `PATH` in the mf, and we need to load `python/2.7.15`. 

