igv-reports/1.12.0-python3.9.5
========================

<https://github.com/igvteam/igv-reports>

Used under license:
MIT


Structure creating script (makeroom_igv-reports_1.12.0-python3.9.5.sh) moved to /sw/bioinfo/igv-reports/makeroom_1.12.0-python3.9.5.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "igv-reports" "-v" "1.12.0-python3.9.5" "-w" "https://github.com/igvteam/igv-reports" "-d" "Python application to generate self-contained pages embedding IGV visualizations, with no dependency on original input files." "-l" "MIT" "-s" "annotation"
    ./makeroom_igv-reports_1.12.0-python3.9.5.sh

# Load modules
    module load python/3.9.5

# Pip install
    cd $PREFIX
    python -m venv venv
    source venv/bin/activate

    pip install igv-reports==${VERSION%-*}
    pip install urllib3==1.26.18 # Downgrade urllib3

# Liftout and add libs to PYTHONPATH in the mf file
    mkdir  $PREFIX/bin/
    cp $PREFIX/venv/bin/{create_datauri,create_report,normalizer} $PREFIX/bin/

