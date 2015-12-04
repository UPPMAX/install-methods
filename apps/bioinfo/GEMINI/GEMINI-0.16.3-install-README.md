    http://gemini.readthedocs.org/en/latest/index.html

    mkdir -p /sw/apps/bioinfo/GEMINI/0.6.13
    cd /sw/apps/bioinfo/GEMINI/0.6.13
    mkdir share_data
    mkdir milou
    mkdir src
    cd src
    wget https://raw.github.com/arq5x/gemini/master/gemini/scripts/gemini_install.py
    PFX=/sw/apps/bioinfo/GEMINI/0.16.3/milou
    SHR=/sw/apps/bioinfo/GEMINI/0.16.3/share_data
    unset PYTHONPATH && unset PYTHONHOME && export PYTHONNOUSERSITE=1
    module load git
    python gemini_install.py $PFX $SHR --nosudo

