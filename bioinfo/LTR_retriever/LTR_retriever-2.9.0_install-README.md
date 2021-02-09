LTR_retriever/2.9.0
========================

<https://github.com/oushujun/LTR_retriever>

Used under license:
GPL v3

Structure creating script (makeroom_LTR_retriever_2.9.0.sh) moved to /sw/bioinfo/LTR_retriever/makeroom_2.9.0.sh

LOG
---

    TOOL=LTR_retriever
    VERSION=2.9.0
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/LTR_retriever/2.9.0/src
    /home/douglas/bin/makeroom.sh -f" -t "LTR_retriever" -v "2.9.0" -s "misc" -w "https://github.com/oushujun/LTR_retriever" -l "GPL v3" -d "command line program \(in Perl\) for accurate identification of LTR retrotransposons \(LTR-RTs\) from outputs of LTRharvest\, LTR_FINDER\, MGEScan 3.0.0\, LTR_STRUC\, and LtrDetector\, and generates non-redundant LTR-RT library for genome annotations""
    ./makeroom_LTR_retriever_2.9.0.sh



    # Dont forget module load perl/5.26.2   4) perl_modules/5.26.2
    cd $SRCDIR/LTR_retriever 

    #edit the paths file $SRCDIR/LTR_retriever/paths
    BLAST+:
        /sw/bioinfo/blast/2.10.1+/rackham/bin

    RepeatMasker:
        /sw/bioinfo/RepeatMasker/4.1.0/rackham

    HMMER:
        /sw/bioinfo/hmmer/3.2.1/rackham/bin

    CDHIT:
        /sw/bioinfo/cd-hit/4.8.1/rackham

    BLAST (blastclust) :
        It is optional and I will leave this one out. The internet says that the program is deprecated. /Björn


    #Test run LTR_retriever with a simple fasta file to initiate the dependencies check. 
    ./LTR_retriever -genome /sw/bioinfo/parliament2/v0.1.11/rackham/test/ref_genome.fa
