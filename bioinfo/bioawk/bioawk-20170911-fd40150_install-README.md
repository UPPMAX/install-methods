bioawk/20170911-fd40150
========================

<https://github.com/lh3/bioawk>

Used under license:
Others


Structure creating script (makeroom_bioawk_20170911-fd40150.sh) moved to /sw/bioinfo/bioawk/makeroom_20170911-fd40150.sh

LOG
---

    TOOL=bioawk
    VERSION=20170911-fd40150

    makeroom.sh -t $TOOL -v $VERSION -w "https://github.com/lh3/bioawk" -c "bioinfo" -l "Others" -d "Bioawk is an extension to Brian Kernighan's awk, adding the support of several common biological data formats, including optionally gzip'ed BED, GFF, SAM, VCF, FASTA/Q and TAB-delimited formats with column names." -s "misc" -f

    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

    cd $SRCDIR   
    module load gcc/11.2.0
    module load git
    module load cmake

    git clone https://github.com/lh3/bioawk.git
    cd bioawk
    make
    mv bioawk $PREFIX/bin
