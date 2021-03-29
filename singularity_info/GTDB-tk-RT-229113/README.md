https://support.snic.se/Ticket/Display.html?id=229113

https://ecogenomics.github.io/GTDBTk/installing/index.html

https://ecogenomics.github.io/GTDBTk/installing/docker.html

## Setup

``` bash
#For convenince make the installation in a folder in the project space
mkdir -p GTDB-tk
cd GTDB-tk

# pull the docker container and convert. This will pull the latest (2021.03.27) ...::: GTDB-Tk v1.4.1 :::...
singularity pull docker://ecogenomic/gtdbtk

# Download the reference data
wget https://data.ace.uq.edu.au/public/gtdb/data/releases/release95/95.0/auxillary_files/gtdbtk_r95_data.tar.gz
tar xvzf gtdbtk_r95_data.tar.gz

# make the gtdbtk_io folder to bind with the container
mkdir -p gtdbtk_io
```

## Run the tool

```bash
singularity run -B ./gtdbtk_io:/data -B ./release95:/refdata gtdbtk_latest.sif

              ...::: GTDB-Tk v1.4.1 :::...

  Workflows:
    classify_wf -> Classify genomes by placement in GTDB reference tree
                     (identify -> align -> classify)
    de_novo_wf  -> Infer de novo tree and decorate with GTDB taxonomy
                     (identify -> align -> infer -> root -> decorate)

  Methods:
    identify -> Identify marker genes in genome
    align    -> Create multiple sequence alignment
    classify -> Determine taxonomic classification of genomes
    infer    -> Infer tree from multiple sequence alignment
    root     -> Root tree using an outgroup
    decorate -> Decorate tree with GTDB taxonomy

  Tools:
    infer_ranks -> Establish taxonomic ranks of internal nodes using RED
    ani_rep     -> Calculates ANI to GTDB representative genomes
    trim_msa    -> Trim an untrimmed MSA file based on a mask
    export_msa  -> Export the untrimmed archaeal or bacterial MSA file

  Testing:
    test          -> Validate the classify_wf pipeline with 3 archaeal genomes 
    check_install -> Verify third party programs and GTDB reference package.

  Use: gtdbtk <command> -h for command specific help
```

## Test

```bash
singularity run -B ./gtdbtk_io:/data -B ./release95:/refdata gtdbtk_latest.sif test
[2021-03-29 11:53:56] INFO: GTDB-Tk v1.4.1
[2021-03-29 11:53:56] INFO: gtdbtk test
[2021-03-29 11:53:56] INFO: Using GTDB-Tk reference data version r95: /refdata/
[2021-03-29 11:53:56] INFO: Using a temporary directory as out_dir was not specified.
[2021-03-29 11:53:56] INFO: Command: gtdbtk classify_wf --genome_dir /scratch/gtdbtk_tmp_roujlwz4/genomes --out_dir /scratch/gtdbtk_tmp_roujlwz4/output --cpus 1
1
    <TEST OUTPUT>     [2021-03-29 11:53:57] INFO: gtdbtk classify_wf --genome_dir /scratch/gtdbtk_tmp_roujlwz4/genomes --out_dir /scratch/gtdbtk_tmp_roujlwz4/
    <TEST OUTPUT>     [2021-03-29 11:53:57] INFO: Using GTDB-Tk reference data version r95: /refdata/
[2021-03-29 11:57:05] INFO: Test has successfully finished.
```

