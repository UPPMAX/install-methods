instanovo/1.1.1
========================

<https://github.com/instadeepai/InstaNovo>

Used under license:
Apache 2.0


Structure creating script (makeroom_instanovo_1.1.1.sh) moved to /sw/bioinfo/instanovo/makeroom_1.1.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "instanovo" "-v" "1.1.1" "-w" "https://github.com/instadeepai/InstaNovo" "-d" "De novo peptide sequencing with InstaNovo: Accurate, database-free peptide identification for large scale proteomics experiments" "-s" "annotation" "-l" "Apache 2.0"


    # Load modules
    module load python/3.11.8

    # Install uv
    python -m venv .venv
    source .venv/bin/activate
    #pip install uv

    # install instanovo
    pip install "instanovo"
    pip install "instanovo[cu124]"


    pip install -e $SRCDIR/InstaNovo-1.1.1

