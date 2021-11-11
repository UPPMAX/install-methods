vsearch/2.18.0
========================

<https://github.com/torognes/vsearch>

Used under license:
GPL v3 or BSD 2-clause
<https://github.com/torognes/vsearch/blob/master/LICENSE.txt>

Structure creating script (makeroom_vsearch_2.18.0.sh) moved to /sw/bioinfo/vsearch/makeroom_2.18.0.sh

LOG
---

    /home/douglas/bin/makeroom.sh -f" -t "vsearch" -v "2.18.0" -l "GPL v3 or BSD 2-clause" -L "https://github.com/torognes/vsearch/blob/master/LICENSE.txt" -w "https://github.com/torognes/vsearch" -d "Open-source alternative to USEARCH\, supporting: supports de novo and reference based chimera detection\, clustering\, full-length and prefix dereplication\, rereplication\, reverse complementation\, masking\, all-vs-all pairwise global alignment\, exact and global alignment searching\, shuffling\, subsampling and sorting\; FASTQ file analysis\, filtering\, conversion and merging of paired-end reads"
    ./makeroom_vsearch_2.18.0.sh
vsearch/2.14.1
========================

<https://github.com/torognes/vsearch>

Used under license:
GPL v3 or BSD 2-clause

Structure creating script (makeroom_vsearch_2.14.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/vsearch/makeroom_2.14.1.sh


LOG
---

Use the precompiled executables, which work on all systems.

    cd /sw/bioinfo/
    TOOL=vsearch
    VERSION=2.14.1
    makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://github.com/torognes/vsearch -l "GPL v3 or BSD 2-clause" -d "Versatile open source tool for metagenomics"
    cd $TOOL
    ./makeroom_${TOOL}_${VERSION}.sh 
    source ./SOURCEME_${TOOL}_${VERSION}
    cat vsearch-2.5.2-install-README.md >> ${TOOL}-${VERSION}_install-README.md
    history | tail -n 100 >> ${TOOL}-${VERSION}_install-README.md

    cd $VERSION
    cd src
    [[ -f vsearch-${VERSION}-linux-x86_64.tar.gz ]] || wget https://github.com/torognes/vsearch/releases/download/v${VERSION}/vsearch-${VERSION}-linux-x86_64.tar.gz
    tar xvzf vsearch-${VERSION}-linux-x86_64.tar.gz
    rmdir $PREFIX
    mv vsearch-${VERSION}-linux-x86_64 $PREFIX
    cd $PREFIX
    mv man man1
    mkdir man
    mv man1 man


To build from source, follow the script for 2.4.3.

The mf file should also set `MANPATH`.  The doc pdf us in the tree but we leave that to the users to find.

Now edit.
