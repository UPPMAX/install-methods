alphapulldown/1.0.4
========================

<https://github.com/KosinskiLab/AlphaPulldown>

Used under license:
GPL-3.0


Structure creating script (makeroom_alphapulldown_1.0.4.sh) moved to /sw/bioinfo/alphapulldown/makeroom_1.0.4.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "alphapulldown" "-v" "1.0.4" "-d" "AlphaPulldown is a Python package that streamlines protein-protein interaction screens and high-throughput modelling of higher-order oligomers using AlphaFold-Multimer" "-w" "https://github.com/KosinskiLab/AlphaPulldown" "-l" "GPL-3.0" "-s" "annotation"
    ./makeroom_alphapulldown_1.0.4.sh

    # 

    # On rackham1 load conda
    module load conda/latest
    cd $PREFIX
    conda create -p alphapulldown -c omnia -c bioconda -c conda-forge python==3.10 openmm==8.0 pdbfixer==1.9 kalign2 cctbx-base pytest importlib_metadata hhsuite
    conda activate /sw/bioinfo/alphapulldown/1.0.4/rackham/alphapulldown
    conda install -c bioconda hmmer
    python3 -m pip install alphapulldown==1.0.4 importlib_metadata
    pip install jax==0.4.23 jaxlib==0.4.23+cuda11.cudnn86 -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html

    create_individual_features.py \
      --fasta_paths=/domus/h1/bjornv/test/alphapulldown/example_1_sequences_shorter.fasta
      --data_dir=/sw/data/alphafold_dataset/2.3.1/rackham/
      --save_msa_files=False \
      --output_dir=~/test/alphapulldown
      --use_precomputed_msas=False \
      --max_template_date=<any date you want, format like: 2050-01-01> \
      --skip_existing=False \
      --seq_index=<any number you want or skip the flag to run all one after another>




