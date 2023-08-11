FastTree/2.1.11
===============

<http://www.microbesonline.org/fasttree/>

Used under license:
GPL v2+
<http://www.microbesonline.org/fasttree/FastTree.c>  (The licence is at the top of the source file)

Structure creating script (makeroom_FastTree_2.1.11.sh) moved to /sw/bioinfo/FastTree/makeroom_2.1.11.sh

LOG
---

Use the precompiled binaries.  These are timestamped May 18 2019.

    makeroom.sh -f -t FastTree -v 2.1.11 -w http://www.microbesonline.org/fasttree/ -d "Infers approximately-maximum-likelihood phylogenetic trees from alignments of nucleotide or protein sequences. FastTree can handle alignments with up to a million of sequences in a reasonable amount of time and memory." -l "GPL v2+" -L http://www.microbesonline.org/fasttree/FastTree.c
    ./makeroom_FastTree_2.1.11.sh 
    source /sw/bioinfo/FastTree/SOURCEME_FastTree_2.1.11 && cd $SRCDIR
    wget http://www.microbesonline.org/fasttree/FastTree
    wget http://www.microbesonline.org/fasttree/FastTreeDbl
    wget http://www.microbesonline.org/fasttree/FastTreeMP

    ldd *
    cp -av * $PREFIX/ && cd $PREFIX && chmod +x *

The binaries are:

    -rwxrwxr-x 1 douglas sw 376821 May 18  2019 FastTree
    -rwxrwxr-x 1 douglas sw 413458 May 18  2019 FastTreeDbl
    -rwxrwxr-x 1 douglas sw 381876 May 18  2019 FastTreeMP
