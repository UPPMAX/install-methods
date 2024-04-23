duplex-tools/0.3.3
========================

<https://github.com/nanoporetech/duplex-tools>

Used under license:
MPL 2.0


Structure creating script (makeroom_duplex-tools_0.3.3.sh) moved to /sw/bioinfo/duplex-tools/makeroom_0.3.3.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "duplex-tools" "-v" "0.3.3" "-w" "https://github.com/nanoporetech/duplex-tools" "-d" "Splitting of sequence reads by internal adapter sequence search" "-l" "MPL 2.0" "-s" "annotation"
    ./makeroom_duplex-tools_0.3.3.sh
    
    # Load modules
    module load python/3.12.1 
    module load gcc/9.3.0

    # Install
    cd $PREFIX
    python -m venv venv --prompt duplex
    . venv/bin/activate
    pip install duplex_tools
