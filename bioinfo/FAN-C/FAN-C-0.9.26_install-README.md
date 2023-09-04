FAN-C/0.9.26
========================

<https://vaquerizaslab.github.io/fanc/index.html>

Used under license:



Structure creating script (makeroom_FAN-C_0.9.26.sh) moved to /sw/bioinfo/FAN-C/makeroom_0.9.26.sh

LOG
---

    makeroom.sh "-t" "FAN-C" "-v" "0.9.26" "-c" "bioinfo" "-w" "https://vaquerizaslab.github.io/fanc/index.html" "-d" "Toolkit for the analysis and visualisation of Hi-C data." "-s" "misc"
    ./makeroom_FAN-C_0.9.26.sh
    
    source /sw/bioinfo/FAN-C/SOURCEME_FAN-C_0.9.26 && cd $SRCDIR

    module load python3/3.11.4 hdf5/1.14.0
    python3 -m venv --upgrade-deps $PREFIX
    source $PREFIX/bin/activate
    python3 -m pip install fanc

