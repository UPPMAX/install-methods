augustus/3.3.3-CGP
==================

<http://bioinf.uni-greifswald.de/augustus>

Used under license:
Artistic

Augustis with Computational Gene Prediction included


LOG
---

    TOOLVERSION=3.3.3
    VERSION=${TOOLVERSION}-CGP
    cd /sw/bioinfo/augustus
    makeroom.sh -f -t augustus -v $VERSION -s annotation -w http://bioinf.uni-greifswald.de/augustus -l Artistic -d "find genes and their structures in one or more genomes"
    ./makeroom_augustus_${VERSION}.sh
    source SOURCEME_augustus_${VERSION}


Make this an alias module to the EasyBuild module `AUGUSTUS/3.3.3-foss-2019b`, with a local `augustus_config_copy` script.

