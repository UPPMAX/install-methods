CheckM/1.0.11
=============

<https://github.com/Ecogenomics/CheckM/wiki>

CheckM provides a set of tools for assessing the quality of genomes recovered
from isolates, single cells, or metagenomes. It provides robust estimates of
genome completeness and contamination by using collocated sets of genes that
are ubiquitous and single-copy within a phylogenetic lineage. Assessment of
genome quality can also be examined using plots depicting key genomic
characteristics (e.g., GC, coding density) which highlight sequences outside
the expected distributions of a typical genome. CheckM also provides tools for
identifying genome bins that are likely candidates for merging based on marker
set compatibility, similarity in genomic characteristics, and proximity within
a reference genome tree.


LOG
---

    TOOL=CheckM
    VERSION=1.0.11
    cd /sw/apps/bioinfo
    mkdir $TOOL
    cd $TOOL/
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for C in bianca irma ; do ln -s $CLUSTER $C; done
    PFX=$PWD/$CLUSTER
    module load bioinfo-tools
    module load python/2.7.11
    module load hmmer/3.1b2
    module load prodigal/2.6.3
    module load pplacer/1.1.alpha19
    which prodigal 
    PYTHONUSERBASE=$PFX pip install --user checkm-genome

For the mf file, load `python/2.7.11`, `hmmer/3.1b2`, `prodigal/2.6.3`, and `pplacer/1.1.alpha19`, and set `PATH` and `PYTHONPATH`.
