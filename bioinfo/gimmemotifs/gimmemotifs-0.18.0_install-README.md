gimmemotifs/0.18.0
========================

<https://github.com/vanheeringen-lab/gimmemotifs>

Used under license:
MIT


Structure creating script (makeroom_gimmemotifs_0.18.0.sh) moved to /sw/bioinfo/gimmemotifs/makeroom_0.18.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "gimmemotifs" "-v" "0.18.0" "-d" "About Suite of motif tools, including a motif prediction pipeline for ChIP-seq experiments. See full GimmeMotifs documentation for detailed installation instructions and usage examples." "-w" "https://github.com/vanheeringen-lab/gimmemotifs" "-l" "MIT" "-s" "annotation"
    ./makeroom_gimmemotifs_0.18.0.sh
    

    # Install with conda on rackham1-3
    module load conda/latest
    conda create -p $PREFIX/gimme python=3 gimmemotifs

    # Copy over binaries to $PREFIX/bin
    mkdir $PREFIX/bin
    cp $PREFIX/gimme/bin/{gimme,genomepy,combine_peaks,coverage_table} $PREFIX/bin

















    # Load modules
    module load python/3.8.7
    # Install
    cd $PREFIX
    python -m venv venv
    source venv/bin/activate
    pip install gimmemotifs==$VERSION

