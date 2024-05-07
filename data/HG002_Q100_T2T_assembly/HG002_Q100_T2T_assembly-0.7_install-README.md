HG002_Q100_T2T_assembly/0.7
===========================

<https://github.com/marbl/hg002>

Used under license:
CC0


Structure creating script (makeroom_HG002_Q100_T2T_assembly_0.7.sh) moved to /sw/data/HG002_Q100_T2T_assembly/makeroom_0.7.sh

LOG
---

    makeroom.sh -f -c data -t HG002_Q100_T2T_assembly -v 0.7 -l CC0 -d "Telomere-to-telomere reconstruction of all 46 chromosomes of the HG002 aka GM24385 aka huAA53E0 cell line along with mitochondria and EBV sequences. Maternal and paternal haplotypes are denoted by contig name. Unassigned contigs are from unresolved rDNA arrays." 
    ./makeroom_HG002_Q100_T2T_assembly_0.7.sh 
    source /sw/data/HG002_Q100_T2T_assembly/SOURCEME_HG002_Q100_T2T_assembly_0.7


### assembly/

    cd $SRCDIR
    mkdir assembly
    cd assembly
    wget https://s3-us-west-2.amazonaws.com/human-pangenomics/T2T/scratch/HG002/assemblies/drafts/assembly.v0.7.fasta
    wget https://s3-us-west-2.amazonaws.com/human-pangenomics/T2T/scratch/HG002/assemblies/graphs/20220725/assembly.homopolymer-compressed.noseq.gfa
    mv assembly.homopolymer-compressed.noseq.gfa assembly.homopolymer-compressed.noseq.Verkko1.1.gfa
    wget https://s3-us-west-2.amazonaws.com/human-pangenomics/T2T/scratch/HG002/assemblies/graphs/20220812/assembly.homopolymer-compressed.noseq.gfa
    mv assembly.homopolymer-compressed.noseq.gfa assembly.homopolymer-compressed.Verkko1.2-MBG1.0.13.noseq.gfa
    wget https://s3-us-west-2.amazonaws.com/human-pangenomics/T2T/scratch/HG002/assemblies/drafts/v0.7/assembly.v0.7.chromosome_paths.gaf
    md5sum * > md5.txt

The checksums match.

Copy relevant text from assembly description to `README.assembly.v0.7.txt`.


### sequencing-data/

    cd $SRCDIR
    mkdir sequencing-data
    cd sequencing-data/

From the repository, links to webpages containing sequencing data point into
amazonaws buckets dynamically created by javascript. Data includes HiC, HiFi,
Oxford Nanopore fastq (we do not download the raw fast5), and StrandSeq. Save
these pages and extract the direct URLs to sequence data files. Save these as

    -rw-rw-r-- 1 douglas sw   312 Sep 22 14:29 sequencing-data/HiC.links.txt
    -rw-rw-r-- 1 douglas sw  2236 Sep 22 15:52 sequencing-data/HiFi.links.txt
    -rw-rw-r-- 1 douglas sw  5298 Sep 22 14:18 sequencing-data/Oxford-Nanopore-fastq.links.txt
    -rw-rw-r-- 1 douglas sw 79612 Sep 22 14:27 sequencing-data/Seq/StrandSeq.links.txt

Create subdirectories and move the links files into them.

    for F in *.links.txt ; do
        D=${F%.links.txt} && mkdir $D && mv $F $D/
    done

Create `s3fetch.pl` to convert these direct URLs to S3 links and use awscli to
download them.  After some trial and error, got this working.

    https://github.com/douglasgscofield/bioinfo/blob/main/scripts/s3fetch.pl

Use the script to download sequencing data files.


    for D in HiC HiFi Oxford-Nanopore-fastq StrandSeq ; do
        ( echo ; echo $D; echo; cd $D; cat $D.links.txt | ../s3fetch.pl )
    done

Store their sizes.

    du -csh * > du-csh.txt

Move everything to $PREFIX.

    cd $SRCDIR
    mv * $PREFIX/
