CheckM/1.1.2
========================

<https://github.com/Ecogenomics/CheckM>

Used under license:
GPL v3

Structure creating script (makeroom_CheckM_1.1.2.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/CheckM/makeroom_1.1.2.sh


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
    VERSION=1.1.2
    cd /sw/bioinfo/${TOOL}
    makeroom.sh -f -s "misc" -t "${TOOL}" -v "1.1.2" -w "https://github.com/Ecogenomics/CheckM" -l "GPL v3" -d "Assess the quality of microbial genomes recovered from isolates\, single cells\, and metagenomes"
    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}
    module load bioinfo-tools
    module load python/3.7.2
    module load hmmer/3.1b2
    module load prodigal/2.6.3
    module load pplacer/1.1.alpha19
    which prodigal 
    PYTHONUSERBASE=$PREFIX pip install --user checkm-genome==1.1.2

For the mf file, load `python/3.7.2`, `hmmer/3.1b2`, `prodigal/2.6.3`, and `pplacer/1.1.alpha19`, and set `PATH` and `PYTHONPATH`.

Added data directory, see the install file for 1.0.15.
