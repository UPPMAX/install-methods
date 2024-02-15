scvi-tools/1.0.4
========================

<https://github.com/scverse/scvi-tools>

Used under license:
BSD-3
<https://github.com/scverse/scvi-tools/blob/main/LICENSE>

Structure creating script (makeroom_scvi-tools_1.0.4.sh) moved to /sw/bioinfo/scvi-tools/makeroom_1.0.4.sh

LOG
---

    makeroom.sh "-t" "scvi-tools" "-v" "1.0.4" "-c" "bioinfo" "-s" "misc" "-w" "https://github.com/scverse/scvi-tools" "-d" "scvi-tools (single-cell variational inference tools) is a package for probabilistic modeling and analysis of single-cell omics data, built on top of PyTorch and AnnData." "-l" "BSD-3" "-L" "https://github.com/scverse/scvi-tools/blob/main/LICENSE"
    ./makeroom_scvi-tools_1.0.4.sh
    cd $SRCDIR
    module load python/3.9.5
    python3 -m venv scvi-tools
    source scvi-tools/bin/activate
    python3 -m pip install -U pip setuptools
    python3 -m pip install torch torchvision torchaudio
    python3 -m pip install scvi-tools
    cd $PREFIX
    



