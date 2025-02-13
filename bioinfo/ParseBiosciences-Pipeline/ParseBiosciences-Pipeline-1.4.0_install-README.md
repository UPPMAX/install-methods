ParseBiosciences-Pipeline/1.4.0
========================

<https://www.parsebiosciences.com/>

Used under license:
Custom


Structure creating script (makeroom_ParseBiosciences-Pipeline_1.4.0.sh) moved to /sw/bioinfo/ParseBiosciences-Pipeline/makeroom_1.4.0.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "ParseBiosciences-Pipeline" "-v" "1.4.0" "-w" "https://www.parsebiosciences.com/" "-c" "bioinfo" "-l" "Custom" "-d" "Combinatorial barcoding technology strips away the limitations and frustrations of yesterday’s single cell approach. It ditches the specialized instrument, freeing you to pursue unprecedented discoveries. Unleash the potential of single cell." "-s" "pipelines"
    ./makeroom_ParseBiosciences-Pipeline_1.4.0.sh
    source /sw/bioinfo/ParseBiosciences-Pipeline/SOURCEME_ParseBiosciences-Pipeline_1.4.0 && cd $SRCDIR
    wget https://support.parsebiosciences.com/hc/en-us/article_attachments/32317337446036
    unzip ParseBiosciences-Pipeline.1.4.0.zip
    rm ParseBiosciences-Pipeline.1.4.0.zip
    cd $PREFIX    
    mkdir newvolume
    cd /newvolume/
    mkdir analysis expdata genomes
    mv $SRCDIR/ParseBiosciences-Pipeline.1.4.0/ $PREFIX/newvolume/
    cd $PREFIX/newvolume/ParseBiosciences-Pipeline.1.4.0/

    ml conda
    conda create --prefix=$PREFIX/spipe-conda
    source activate /sw/bioinfo/ParseBiosciences-Pipeline/1.4.0/rackham/spipe-conda
    conda install -c conda-forge python=3.10
    which python
    bash ./install_dependencies_conda.sh -i -y
    pip install Cython
    ml gcc/12.3.0
    python setup.py install
    pip install --no-cache-dir ./
~
    # Call without arguments
    split-pipe
    # Displays usage screen
split-pipe --help

# Briefly describes processing steps, option formatting
split-pipe --explain

 Databases
    bash ./install_immune_dbs.sh -i -y
    pip install . --no-cache-dir
    bash ./install_immune_dbs.sh -I -y
    pip install . --no-cache-dir
    bash ./install_immune_dbs.sh -c

Test in full node
    cd ../genomes
    wget https://ftp.ensembl.org/pub/release-109/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz;
    wget https://ftp.ensembl.org/pub/release-109/gtf/homo_sapiens/Homo_sapiens.GRCh38.109.gtf.gz;
    wget https://ftp.ensembl.org/pub/release-109/fasta/mus_musculus/dna/Mus_musculus.GRCm39.dna.primary_assembly.fa.gz;
    wget https://ftp.ensembl.org/pub/release-109/gtf/mus_musculus/Mus_musculus.GRCm39.109.gtf.gz;
    split-pipe \
--mode mkref \
--genome_name hg38 \
--fasta /newvolume/genomes/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz \
--genes /newvolume/genomes/Homo_sapiens.GRCh38.109.gtf.gz \
--output_dir /newvolume/genomes/hg38
