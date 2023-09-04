DRAM/1.4.6
==========

<https://github.com/WrightonLabCSU/DRAM>

Used under license:
GPL v3


Structure creating script (makeroom_DRAM_1.4.6.sh) moved to /sw/bioinfo/DRAM/makeroom_1.4.6.sh

LOG
---

Installed DRAM_data/20230530 first, see its install README for important steps and the creation of the config file that is later imported here.


Must use a more recent gcc to install scikit-bio

    makeroom.sh "-f" "-t" "DRAM" "-v" "1.4.6" "-c" "bioinfo" -s "annotation" "-l" "GPL v3" "-w" "https://github.com/WrightonLabCSU/DRAM" "-d" "Distilled and Refined Annotation of Metabolism: A tool for the annotation and curation of function for microbial and viral genomes"
    ./makeroom_DRAM_1.4.6.sh 
    source /sw/bioinfo/DRAM/SOURCEME_DRAM_1.4.6
    cd $PREFIX
    ml python/3.10.8
    ml gcc/10.3.0
    virtualenv venv
    venv/bin/pip3 install pandas
    source venv/bin/activate
    ml -python   # unload the python module
    which pip3   # ensure that this is coming from the venv
    pip3 install networkx
    pip3 install scikit-bio
    pip3 install pytest
    ml -gcc      # unload gcc

Testing scikit-bio on rackham5:

    python -m skbio.test
    ...
    ========= 2586 passed, 30 skipped, 116 warnings in 84.45s (0:01:24) ========

Testing scikit-bio on snowy-lr1:

    python -m skbio.test
    ...
    ========= 2586 passed, 30 skipped, 117 warnings in 91.84s (0:01:31) ========


Now configure for use.

We have databases already installed back 2023-05-30 under DRAM_data/20230530.
For that, I installed DRAM within a conda environment following its
instructions and installed the databases there using s229, since it needs
*tons* of memory. I will import the config from that environment to use as the
new config here.


    ml bioinfo-tools 
    ml DRAM_data/20230530
    ml prodigal/2.6.3
    ml MMseqs2/14-7e284
    ml hmmer/3.3.2
    ml tRNAscan-SE/2.0.9

    pip3 install DRAM-bio

    which DRAM-setup.py

Import the config from the other conda environment used to set up the DRAM_data module.

    cd $PREFIX/bin
    cp -av /sw/data/DRAM_data/20230530/20230530_config.txt .
    DRAM-setup.py import_config --config_loc 20230530_config.txt 
    DRAM-setup.py print_config
    DRAM-setup.py print_settings

Load the above 5 modules in the mf file, and add more info about using the databases.

