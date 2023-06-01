ERVmap/1.1
========================

<https://github.com/mtokuyama/ERVmap>
<https://www.ervmap.com/>

Used under license:



Structure creating script (makeroom_ERVmap_1.1.sh) moved to /sw/bioinfo/ERVmap/makeroom_1.1.sh

LOG
---

    makeroom.sh -t ERVmap -v 1.1 -c bioinfo -s misc -w https://www.ervmap.com/ -d "ERVmap is one part curated database of human proviral ERV loci and one part a stringent algorithm to determine which ERVs are transcribed in their RNA seq data." 
    ./makeroom_ERVmap_1.1.sh 
    source /sw/bioinfo/ERVmap/SOURCEME_ERVmap_1.1
    cd $SRCDIR

Clone the 1.1 repository. There is one more commit fixing a couple typos, just keep at 1.1.

    module load git/2.34.1
    git clone https://github.com/mtokuyama/ERVmap.git
    cd ERVmap
    git reset --hard b282adb
    cd ..

Set up the directory in $PREFIX.

    rmdir $PREFIX
    mv ERVmap $PREFIX

Set up the references. ERVmap notes "primary assembly".  Get unmasked and soft-masked, use unmasked.  Get latest GTF annotation.  Populate the ref/ directory.  The source directory contains `get_refs.sh`.

    #!/bin/bash

    [[ "$SRCDIR" ]] || { echo "must be run after source'ing SOURCEME..."; exit 1; }

    set -x

    cd $SRCDIR

    [[ -f Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz ]] || wget https://ftp.ensembl.org/pub/release-109/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz

    [[ -f Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa.gz ]] || wget https://ftp.ensembl.org/pub/release-109/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa.gz

    [[ -f Homo_sapiens.GRCh38.109.gtf.gz ]] || wget https://ftp.ensembl.org/pub/release-109/gtf/homo_sapiens/Homo_sapiens.GRCh38.109.gtf.gz

Now build the reference indices.

    cd $SRCDIR
    mkdir -p $PREFIX/ref/{bwa_genome,Bowtie2_genome}
    gzip -dc Homo_sapiens.GRCh38.109.gtf.gz > $PREFIX/ref/genes.gtf
    gzip -dc Homo_sapiens.GRCh38.dna_sm.toplevel.fa.gz > $PREFIX/ref/bwa_genome/genome.fa
    cd $PREFIX/ref/Bowtie2_genome
    ln -s ../bwa_genome/genome.fa .

Now load all of the prereq modules.  Load all of these modules in the mf file.

To double-check that perl_modules/5.26 provides the required File::Type, use

    perl -MFile::Type -e 0

If there's no error, it does. To double-check of R_packages/3.6.1 provides DESeq, do

    library(DESeq)

If there's no error, it does.

    module load perl_modules/5.26  # File::Type is provided in perl_modules
    module load R_packages/3.6.1
    module load bwa/0.7.17
    module load samtools/1.9
    module load btrim/0.3.0
    module load BEDTools/2.29.2
    module load bowtie/1.2.3
    module load bowtie2/2.4.5
    module load python/2.7.15
    module load tophat/2.1.1
    module load cufflinks/2.2.1-b55bb21

    PYTHONUSERBASE=$PREFIX pip install --user htseq==0.11.3

This means we need the site-packages directory added to PYTHONPATH in the mf file.

Build BWA, Bowtie2, and tophat2 indices.

    cd $PREFIX
    bwa index -p ref/bwa_genome/genome ref/bwa_genome/genome.fa
    bowtie2-build ref/Bowtie2_genome/genome.fa ref/Bowtie2_genome/genome
    tophat2 -G ref/genes.gtf --transcriptome-index=ref/Bowtie2_genome/known ref/Bowtie2_genome/genome

Make the scripts executable. Make sure to add $modroot/scripts to PATH

    cd $PREFIX/scripts
    head -n 1 *
    chmod +x *

Also, edit the top-level wrapper script `ERVmap_auto.sh` to work within the
module.  Simply check for definitions of `ERVMAP_REF` and `ERVMAP_SCRIPTS`, die
with a message to load the module if they are not defined, and use them to
define the locals `ref` and `scripts`.  Compare it with its original version to
see differences.  And, make it executable.

    cd $PREFIX
    cp -av ERVmap_auto.sh  ERVmap_auto.sh.orig
    vim ERVmap_auto.sh

The result of diff -y:

         Orig                                                                             New

     6   ref=~/ERVmap/ref #folder containing required reference files (see below)     |   [[ "$ERVMAP_REF" && "$ERVMAP_SCRIPTS" ]] || { echo "$0: must load module ERVmap/1.1"; exit 1; }
     7   scripts=~/ERVmap/scripts #folder containing included perl and R scripts      |   #[[ "$ERVMAP_SCRIPTS" ]] || { echo "$0: must load module ERVmap/1.1"; exit 1; }
     8                                                                                >
     9                                                                                >   ref=${ERVMAP_REF}
    10                                                                                >   scripts=${ERVMAP_SCRIPTS}


In the mf file, add $modroot/scripts to path and devine ERVMAP_SCRIPTS and
ERVMAP_REF convenience variables. Print a message at load to see module help.
Be very explicit in the help.

