omm-macse/12.01
========================

<https://www.agap-ge2pop.org/macsee-pipelines/>

Used under license:



Structure creating script (makeroom_omm-macse_12.01.sh) moved to /sw/bioinfo/omm-macse/makeroom_12.01.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "omm-macse" "-v" "12.01" "-d" "Pipelines based on MACSE" "-w" "https://www.agap-ge2pop.org/macsee-pipelines/" "-s" "annotation"
    ./makeroom_omm-macse_12.01.sh

    # Download singularity container
    mkdir $PREFIX/bin
    cd $PREFIX/bin

    apptainer remote add --no-login SylabsCloud cloud.sylabs.io
    apptainer remote use SylabsCloud
    singularity build omm-macse-12.01.sif library://vranwez/default/omm_macse:v12.01
    

    # Test
    wget https://www.agap-ge2pop.org/wp-content/uploads/macse/doc/LOC_48720_NT.fasta
    ./omm-macse-12.01.sif --in_seq_file LOC_48720_NT.fasta --out_dir RES_LOC_48720 --out_file_prefix LOC_48720

