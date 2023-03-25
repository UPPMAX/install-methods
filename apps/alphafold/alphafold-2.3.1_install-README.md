alphafold/2.3.1
========================

<http://>

Used under license:



Structure creating script (makeroom_alphafold_2.3.1.sh) moved to /sw/apps/alphafold/makeroom_2.3.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "alphafold" "-v" "2.3.1" "-c" "apps" "-f"
    ./makeroom_alphafold_2.3.1.sh

    TOOL=alphafold
    VERSION=2.3.1
    ALPHAFOLD_DATASET=/sw/data/${TOOL}_dataset/${VERSION}/rackham

# I Looked at the guide from our friend at Berzelius
# https://gitlab.liu.se/xuagu37/berzelius-alphafold-guide
# Install on rackham2

    cd $PREFIX
    conda create --prefix $PREFIX/conda_env  python==3.8
    conda activate /sw/apps/alphafold/2.3.1/rackham/conda_env
    
    wget https://github.com/deepmind/alphafold/archive/refs/tags/v2.3.1.tar.gz
    tar -xf v2.3.1.tar.gz
    cd alphafold-2.3.1

pip install \
    mock==5.0.1 \
    absl-py==1.0.0 \
    biopython==1.79 \
    chex==0.0.7 \
    dm-haiku==0.0.9 \
    dm-tree==0.1.6 \
    immutabledict==2.0.0 \
    ml-collections==0.1.0 \
    numpy==1.21.6 \
    pandas==1.3.4 \
    protobuf==3.20.1 \
    scipy==1.7.0 \
    tensorflow-cpu==2.9.0 \
    jax==0.3.25 jaxlib==0.3.25+cuda11.cudnn805 -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html

conda install -c conda-forge \
  openmm==7.5.1 \
  cudatoolkit==11.1.1 \
  cudnn==8.2.1.32 \
  pdbfixer==1.7

conda install -c bioconda \
  hmmer==3.3.2 \
  hhsuite==3.3.0 \
  kalign2==2.04

# Reinstall numpy to get rid of version warnings
  pip install numpy==1.21.6

# Apply openmm patch
  cd $PREFIX/conda_env/lib/python3.8/site-packages
  patch -p0 < $PREFIX/alphafold-2.3.1/docker/openmm.patch

# Download stereo_chemical_props.txt. Taken from Alphafolds Dockerfile:
  wget -q -P $PREFIX/alphafold-2.3.1/alphafold/common/ \
      https://git.scicore.unibas.ch/schwede/openstructure/-/raw/7102c63615b64735c4941278d92b554ec94415f8/modules/mol/alg/src/stereo_chemical_props.txt

# Download run_alphafold.sh script and change the alphafold_script path to alphafold_script="/sw/apps/alphafold/2.3.1/rackham/alphafold-2.3.1/run_alphafold.py"
    cd $SRCDIR
    git clone https://gitlab.liu.se/xuagu37/berzelius-alphafold-guide.git
    cd berzelius-alphafold-guide

    cp $SRCDIR/berzelius-alphafold-guide/run_alphafold.sh $PREFIX/alphafold-2.3.1/
    chmod 775 run_alphafold.sh



# Run tests
    cd $PREFIX/alphafold-2.3.1
    python run_alphafold_test.py

# Protein fasta
    cd $SRCDIR
    git clone https://gitlab.liu.se/xuagu37/berzelius-alphafold-guide.git
    cd berzelius-alphafold-guide

    export data_dir=/sw/data/alphafold_dataset/2.3.1/rackham/
    mkdir $SRCDIR/berzelius-alphafold-guide/output
    export output=$SRCDIR/berzelius-alphafold-guide/output
    export fasta=$SRCDIR/berzelius-alphafold-guide/T1050.fasta

    bash run_alphafold.sh \
        -d ${data_dir} \
        -o ${output}_rackham \
        -f ${fasta} \
        -t 2021-11-01 \
        -g true \
        -p reduced_dbs \
        -u true

































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
