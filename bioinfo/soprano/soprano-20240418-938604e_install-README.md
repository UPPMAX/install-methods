soprano/20240418-938604e
========================

<https://github.com/instituteofcancerresearch/SOPRANO/>

Used under license:



Structure creating script (makeroom_soprano_20240418-938604e.sh) moved to /sw/bioinfo/soprano/makeroom_20240418-938604e.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "soprano" "-v" "20240418-938604e" "-d" "SelectiOn in PRotein ANnotated regiOns. Adapted dN/dS based method to detect selection in specific protein regions" "-w" "https://github.com/instituteofcancerresearch/SOPRANO/" "-s" "annotation"
    ./makeroom_soprano_20240418-938604e.sh

#    # Load modules
#    module load python/3.12.1
#    module load R_packages/4.3.1
#    module load perl/5.32.1
#    module load bioinfo-tools
#    module load BEDTools/2.31.1
#    module load samtools/1.19
#    module load OpenSSL/1.1
#
#
#    # Git clone
#    cd $SRCDIR
#    git clone https://github.com/instituteofcancerresearch/SOPRANO.git .
#    git checkout 938604e
#    git reset --hard
#
#    # Install
#    PYTHONUSERBASE=$PREFIX pip install --user .


    ## Using conda
    module load conda/latest

    # Git clone
    cd $SRCDIR
    git clone https://github.com/instituteofcancerresearch/SOPRANO.git .
    git checkout 938604e
    git reset --hard

    # Install
    conda create -p $PREFIX/soprano
    conda env update --file env.yml -p $PREFIX/soprano
    Rscript install_R_pkgs.R
    pip install -e .
    pip install -e .
    gunzip -cd data/aux_soprano/ensemble_transcriptID.fasta.gz  > data/aux_soprano/ensemble_transcriptID.fasta

    # Download fasta files.
    #soprano-get-genome -s homo_sapiens -a GRCh38 -r 110
    releases=(105 108 109 110 111)
    assemblies=(37 38)
    for release in "${releases[@]}"; do
        for assembly in "${assemblies[@]}"; do
            soprano-get-genome -s homo_sapiens -a GRCh${assembly} -r ${release} &
        done
    done
    # move to /sw/data
    mkdir -p /sw/data/${TOOL}/${VERSION}
    mv $SRCDIR/ensembl_downloads/ /sw/data/${TOOL}/${VERSION}


    # Test
    pytest -s tests/test_installation.py



