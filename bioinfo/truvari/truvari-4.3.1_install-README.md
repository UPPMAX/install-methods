truvari/4.3.1
========================

<https://github.com/ACEnglish/truvari>

Used under license:
MIT


Structure creating script (makeroom_truvari_4.3.1.sh) moved to /sw/bioinfo/truvari/makeroom_4.3.1.sh

LOG
---

    makeroom.sh "-t" "truvari" "-v" "4.3.1" "-w" "https://github.com/ACEnglish/truvari" "-c" "bioinfo" "-l" "MIT" "-d" "Toolkit for benchmarking, merging, and annotating Structural Variants" "-s" "misc"
    ./makeroom_truvari_4.3.1.sh
    source /sw/bioinfo/truvari/SOURCEME_truvari_4.3.1 && cd $TOOLDIR
    cd $PREFIX
    git clone https://github.com/ACEnglish/truvari.git
    ml python/3.11.8
    ml gcc/14.2.0
    python -m venv --system-site-packages truvari-env
    . truvari-env/bin/activate
    which python
    which pip
    pip install truvari
    deactivate

