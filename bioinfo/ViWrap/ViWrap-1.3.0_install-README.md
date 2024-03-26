ViWrap/1.3.0
========================

<https://github.com/AnantharamanLab/ViWrap>

Used under license:
GPL v3


Structure creating script (makeroom_ViWrap_1.3.0.sh) moved to /sw/bioinfo/ViWrap/makeroom_1.3.0.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "ViWrap" "-v" "1.3.0" "-w" "https://github.com/AnantharamanLab/ViWrap" "-c" "bioinfo" "-l" "GPL v3" "-d" "wrapper to identify, bin, classify, and predict host-viral relationships for viruses from metagenomes" "-s" "pipelines"
    ./makeroom_ViWrap_1.3.0.sh
    source /sw/bioinfo/ViWrap/SOURCEME_ViWrap_1.3.0 && cd $PREFIX
    ml conda
    export CONDA_ENVS_PATH=/sw/bioinfo/ViWrap/1.3.0/rackham/ViWrap_conda_environments
    conda create -c bioconda -c conda-forge -p $CONDA_ENVS_PATH/ViWrap python=3.8 biopython=1.80 mamba=1.3.0 numpy=1.24.2 pandas=1.5.3 pyfastx=0.8.4 matplotlib=3.6.3 seaborn=0.12.2 diamond=2.0.15 hmmer=3.3.2
    source activate /sw/bioinfo/ViWrap/1.3.0/rackham/ViWrap_conda_environments/ViWrap
(full path required, otherwise it is not working)
    which python
    wget -c https://github.com/AnantharamanLab/ViWrap/archive/refs/tags/v1.3.0.tar.gz
    tar xzf v1.3.0.tar.gz;rm v1.3.0.tar.gz
    cd ViWrap-1.3.0;chmod +x ViWrap scripts/*.py # Make all python scripts to be executable
    PATH=`pwd`:$PATH # Add ViWrap to the PATH, so it can be called elsewhere in a terminal    
    cd ..
    rm v1.3.0.tar.gz

Check the conda environment
    ll ViWrap_conda_environments/ViWrap/
Set up 12 other conda envs    
    ViWrap set_up_env --conda_env_dir $CONDA_ENVS_PATH
Check the new conda environments (not sure if sizes are important but no environment reflects what is in the documentation
    according to the github:
	625M	./ViWrap-Mapping
	772M	./ViWrap-vRhyme
	4.0G	./ViWrap-iPHoP
	1.7G	./ViWrap-DVF
	271M	./ViWrap-vs2
	390M	./ViWrap-GTDBTk
	540M	./ViWrap-dRep
	102M	./ViWrap-CheckV
	1.6G	./ViWrap-vContact2
	88M	./ViWrap-Tax
	153M	./ViWrap-VIBRANT
	1.6G	./ViWrap-geNomad
If not working (missing envs) (like for Vibrant and genomad (look in ViWrap-1.3.0/scripts/master_set_up_env.py)
    mamba create -c bioconda -c conda-forge -p /sw/bioinfo/ViWrap/1.3.0/rackham/ViWrap_conda_environments/ViWrap-VIBRANT python=3.7 vibrant=1.2.1 scikit-learn=0.21.3 biopython=1.79 -y
    mamba create -c bioconda -c conda-forge -p /sw/bioinfo/ViWrap/1.3.0/rackham/ViWrap_conda_environments/ViWrap-geNomad genomad=1.7.4 -y


    ViWrap download --db_dir /sw/data/ViWrap/1.3.0/rackham/ViWrap_db --conda_env_dir $CONDA_ENVS_PATH

Check sizes
    du -h . -d 1
    according to the github:
 

		11G	./VIBRANT_db
		6.4G	./CheckV_db
		114M	./DVF_db
		829M	./Tax_classification_db
	199?	318G	./iPHoP_db
	9.8?	11G	./VirSorter2_db
		82G	./GTDB_db
		1.4G	./genomad_db

