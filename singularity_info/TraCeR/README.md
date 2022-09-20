# TraCeR on Bianca
Running Singularity container from Docker
https://github.com/Teichlab/tracer  

## Pulling the container

> On Rackham (or computer with Singularity installed)

```bash
# Pull the container
singularity pull docker://teichlab/tracer
# Clean the cache
singularity cache clean
```
This will build/convert the docker container in to Singularity container with name `tracer_latest.sif`. It is a single 836MB file - copy this file to Bianca.

## Setup the tool
> On Bianca

This step should be done only once. It copies the necessary configuration for the Docker setup we are going to use [[src]](https://github.com/Teichlab/tracer/blob/84f53e5ae0211822580be53841fc097fa8694419/Dockerfile#L46) .
```
singularity exec PATH_to/tracer_latest.sif cp /tracer/docker_helper_files/docker_tracer.conf ~/.tracerrc
```


## Running the tool
> On Bianca

Here is an example on how to run the test from the GitHub repository. [[src]](https://github.com/Teichlab/tracer/blob/master/docker_helper_files/docker_wrapper.sh)
```bash
singularity exec --env IGDATA=/ncbi-igblast-1.7.0/bin --env LC_ALL=C PATH_to/tracer_latest.sif tracer test -o test_data

...

#############################################################################
Finished.  Final Trinity assemblies are written to test_data/results/cell1/Trinity_output/Trinity_cell1_TCR_B.Trinity.fasta
#############################################################################


Tuesday, August 16, 2022: 11:41:20      CMD: /trinityrnaseq-v2.11.0/util/support_scripts/get_Trinity_gene_to_trans_map.pl test_data/results/cell1/Trinity_output/Trinity_cell1_TCR_B.Trinity.fasta > test_data/results/cell1/Trinity_output/Trinity_cell1_TCR_B.Trinity.fasta.gene_trans_map

##Running IgBLAST##
##Running IgBLAST##
Performing IgBlast on ['TCR_A', 'TCR_B']
##TCR_A##
##TCR_B##

##Running Kallisto##
##Making Kallisto indices##

[build] loading fasta file test_data/results/cell1/expression_quantification/kallisto_index/cell1_transcriptome.fa
[build] k-mer length: 31
[build] warning: clipped off poly-A tail (longer than 10)
        from 654 target sequences
[build] warning: replaced 3 non-ACGUT characters in the input sequence
        with pseudorandom nucleotides
[build] counting k-mers ... done.
[build] building target de Bruijn graph ...  done 
[build] creating equivalence classes ...  done
[build] target de Bruijn graph has 781463 contigs and contains 113560426 k-mers 

##Quantifying with Kallisto##

[quant] fragment length distribution will be estimated from the data
[index] k-mer length: 31
[index] number of targets: 131,104
[index] number of k-mers: 113,560,426
[index] number of equivalence classes: 460,618
[quant] running in paired-end mode
[quant] will process pair 1: /tracer/test_data/cell1_1.fastq
                             /tracer/test_data/cell1_2.fastq
[quant] finding pseudoalignments for the reads ... done
[quant] processed 1,135 reads, 1,042 reads pseudoaligned
[quant] estimated average fragment length: 106.333
[   em] quantifying the abundances ... done
[   em] the Expectation-Maximization algorithm ran for 52 rounds
```

Example simple output
```bash
singularity exec --env IGDATA=/ncbi-igblast-1.7.0/bin --env LC_ALL=C ../tracer_latest.sif tracer -h

usage:  tracer <mode> [<args>]

              Modes are :

              - assemble: assemble TCR sequences from single-cell RNA-sequencing reads
              - summarise: summarise TCR sequences from set of cells, build clonotype networks
              - test : use a small dataset from three cells to test TraCeR installation
              - build : build resource files from gene segment sequences

              use tracer <mode> -h for specific help
              

TraCeR: reconstruction of TCR sequences from single-cell RNAseq data

positional arguments:
  <MODE>      tracer mode (assemble, summarise, test or build)

optional arguments:
  -h, --help  show this help message and exit
```
