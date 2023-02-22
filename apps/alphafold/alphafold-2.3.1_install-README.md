alphafold/2.3.1
========================

<http://>

Used under license:



Structure creating script (makeroom_alphafold_2.3.1.sh) moved to /sw/apps/alphafold/makeroom_2.3.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "alphafold" "-v" "2.3.1" "-c" "apps" "-f"
    ./makeroom_alphafold_2.3.1.sh

    TOOL              =alphafold
    VERSION           =2.3.1
    ALPHAFOLD_DATASET=/sw/data/${TOOL}_dataset/${VERSION}/rackham

# Download
    cd $SRCDIR
    git clone https://github.com/deepmind/alphafold.git .

# Create a new database module and download the database
# run_makeroom -t alphafold_dataset -v 2.3.1 -c data
    
    cd $SRCDIR/scripts
    ./download_all_data.sh $ALPHAFOLD_DATASET


# On a computer with root. Build docker -> singularity image
# guide from https://www.rbvi.ucsf.edu/chimerax/data/singularity-apr2022/afsingularity.html
#docker build -f docker/Dockerfile -t alphafold:2.3.1 .
#mkdir singularity
#cd singularity
#sudo docker save c6b5c939a79d -o alphafold2.3.1_docker.tar
#sudo singularity build alphafold2.3.1.sif docker-archive://alphafold2.3.1_docker.tar

# Download modified run script
wget https://www.rbvi.ucsf.edu/chimerax/data/singularity-apr2022/run_alphafold220.py -O $PREFIX/run_alphafold220.py







alphafold/2.1.1
========================

<https://github.com/deepmind/alphafold>

Used under license:
Apache License
<https://github.com/deepmind/alphafold/blob/main/LICENSE>

Structure creating script (makeroom_alphafold_2.1.1.sh) moved to /sw/apps/alphafold/makeroom_2.1.1.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh -t "alphafold" -v "2.1.1" -d "This package provides an implementation of the inference pipeline of AlphaFold v2.0." -w "https://github.com/deepmind/alphafold" -l "Apache License" -L "https://github.com/deepmind/alphafold/blob/main/LICENSE" -c "apps" -f"
    ./makeroom_alphafold_2.1.1.sh

    source SOURCEME_${TOOL}_${VERSION}
    cd $SRCDIR
Copy base.def and alphafold.def from previous release' src directory.
Create singularity image using base.def
    sudo singularity build alphafold.sif alphafold.def
Create singularity image using alphafold.def
    sudo singularity build alphafold.sif alphafold.def
