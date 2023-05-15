af2complex/1.4.0
========================

<https://github.com/FreshAirTonight/af2complex>

Used under license:



Structure creating script (makeroom_af2complex_1.4.0.sh) moved to /sw/bioinfo/af2complex/makeroom_1.4.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "af2complex" "-v" "1.4.0" "-w" "https://github.com/FreshAirTonight/af2complex" "-d" "Predicting and modeling protein complexes with deep learning" "-s" "annotation"
    ./makeroom_af2complex_1.4.0.sh

    TOOL=af2complex
    VERSION=1.4.0

    # Load modules
    module load python/3.8.7
    module load hh-suite/3.3.0 # for run_fea_gen.sh

    # Download
    cd $PREFIX
    git clone https://github.com/FreshAirTonight/af2complex
    cd af2complex/src
    PYTHONUSERBASE=$PREFIX pip install .
    PYTHONUSERBASE=$PREFIX pip install networkx==2.5 tqdm==4.65.0

    export PATH=$PREFIX/bin:$PATH
    export PYTHONPATH=$PREFIX/lib:$PYTHONPATH


    # Add import scipy.spatial to confidency.py
    sed -i.bak '26 i import scipy.spatial' /sw/bioinfo/af2complex/1.4.0/rackham/af2complex/src/alphafold/common/confidence.py

    # Run examples
    # Modify the examples
    cd $PREFIX/af2complex/examples
    sed -i -r 's/(DATA_DIR=).*$/\1$ALPHAFOLD_DATASET/' example*.sh run_af2comp.sh run_fea_gen.sh
    sed -i -r 's/v2/v3/g' targets/examples.lst
    sed -i -r 's/(af_dir=).*/\1\$AF2COMPLEX_SRC/' *.sh
    sed -i -r 's/(fea_dir=).*/\1\$AF2COMPLEX_EXAMPLE\/af2c_fea/' *.sh
    sed -i -r 's/(inp_dir=).*/\1\$AF2COMPLEX_EXAMPLE\/af2c_mod/' *.sh
    sed -i.bak -r 's/(^target_lst_file=)targets\/(.*)/\1\$AF2COMPLEX_EXAMPLE\/targets\/\2/' *.sh


    # run_fea_gen.sh does not want to have dates on databases. Symlink.
    ln -s /crex/data/alphafold_dataset/2.3.1/rackham/mgnify/mgy_clusters_2022_05.fa /crex/data/alphafold_dataset/2.3.1/rackham/mgnify/mgy_clusters.fa
    
    sed -i -r 's/(HHLIB=).*$/\1\/sw\/bioinfo\/hh-suite\/3.3.0\/\$CLUSTER/' run_fea_gen.sh
    sed -i -r 's/(HMMER=).*$/\1\/sw\/apps\/alphafold\/2.3.1\/\$CLUSTER\/conda_env/' run_fea_gen.sh
    sed -i -r 's/(KALIGN=).*$/\1\/sw\/apps\/alphafold\/2.3.1\/\$CLUSTER\/conda_env\/bin/' run_fea_gen.sh







