SKESA/2.4.0
========================

<https://github.com/ncbi/SKESA>

Used under license:
Public domain
<https://raw.githubusercontent.com/ncbi/SKESA/master/LICENSE>

Structure creating script (makeroom_SKESA_2.4.0.sh) moved to /sw/bioinfo/SKESA/makeroom_2.4.0.sh

LOG
---

    makeroom.sh -f -t SKESA -v 2.4.0 -w https://github.com/ncbi/SKESA -l "Public domain" -L https://raw.githubusercontent.com/ncbi/SKESA/master/LICENSE -d "TE 1.3.0 This repository is the home for two different short read assemblers and helper programs SKESA 2.4.0 and SAUTE 1.3.0. These programs are based on de Bruijn graphs and share k-mer related code. SKESA is a de-novo sequence read assembler for microbial genomes. It uses conservative heuristics and is designed to create breaks at repeat regions in the genome. This leads to excellent sequence quality without significantly compromising contiguity. If desired, SKESA contigs could be connected into a GFA graph using GFA connector. SAUTE is a de Bruijn graph based target enriched de-novo assembler designed for assembling genomic and RNA-seq reads sequenced using Illumina. The result is reported as a GFA graph and two nucleotide fasta sequence files for assemblies in the graph."
    ./makeroom_SKESA_2.4.0.sh 
    source /sw/bioinfo/SKESA/SOURCEME_SKESA_2.4.0

    cd $SRCDIR

    wget https://github.com/ncbi/SKESA/releases/download/skesa.2.4.0_saute.1.3.0_2/example.tar.gz
    wget https://github.com/ncbi/SKESA/releases/download/skesa.2.4.0_saute.1.3.0_2/gfa_connector.centos.7.9.2009
    wget https://github.com/ncbi/SKESA/releases/download/skesa.2.4.0_saute.1.3.0_2/kmercounter.centos.7.9.2009
    wget https://github.com/ncbi/SKESA/releases/download/skesa.2.4.0_saute.1.3.0_2/saute.centos.7.9.2009
    wget https://github.com/ncbi/SKESA/releases/download/skesa.2.4.0_saute.1.3.0_2/saute_prot.centos.7.9.2009
    wget https://github.com/ncbi/SKESA/releases/download/skesa.2.4.0_saute.1.3.0_2/skesa.centos.7.9.2009


The prebuilt binaries don't run out of the box, they want later glibc and c++ libraries. The RPATH for each

    ml patchelf/0.10
    for F in *2009 ; do echo $F; patchelf --print-rpath $F; done

is

    /opt/ncbi/gcc/7.3.0/lib/gcc/x86_64-redhat-linux-gnu/7.3.0/:/opt/ncbi/gcc/7.3.0/lib64/

So, they expect gcc/7.3.0.  Load our such module and change the RPATH to be LD_LIBRARY_PATH

    ml patchelf/0.10
    ml gcc/7.3.0
    echo $LD_LIBRARY_PATH
    for F in *2009 ; do
        echo $F
        patchelf --set-rpath "$LD_LIBRARY_PATH" $F
    done

Now move all to PREFIX and provide symlinks to simplified names.

    cp -av *2009 $PREFIX
    cd $PREFIX
    for F in *2009; do
        ln -s $F ${F%.centos.7.9.2009}
    done

Wrap up.  Add $modroot to PATH.

    cd $TOOLDIR/mf
    vi 2.4.0

Final post-install.

    cd $TOOLDIR


Test
----

Test on provided test data.

    cd $SRCDIR
    wget https://github.com/ncbi/SKESA/releases/download/skesa.2.4.0_saute.1.3.0_2/example.tar.gz
    mkdir test
    cd test
    tar xf ../example.tar.gz
    cd example

Copy run.test to run.test.UPPMAX and change output files to have .UPPMAX suffix. Its contents:

    ml bioinfo-tools SKESA/2.4.0

    skesa --reads SRR8178079_1.fasta,SRR8178079_2.fasta --hash_count --contigs_out SRR8178079.skesa.fa.UPPMAX 2> SRR8178079.skesa.log.UPPMAX

    saute --reads SRR8178079_1.fasta,SRR8178079_2.fasta --targets AMR_CDS.fa --gfa SRR8178079.saute.gfa.UPPMAX --all_variants SRR8178079.saute.vars.fa.UPPMAX --extend_ends --keep_subgraphs 2> SRR8178079.saute.log.UPPMAX

Outputs identical.

Log comparisons contain no changes except for timings output. Great! Remove the unpacked directory.

    cd ..
    rm -rf example


