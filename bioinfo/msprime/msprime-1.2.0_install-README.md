msprime/1.2.0
========================

<https://msprime.readthedocs.io/en/latest/>

Used under license:
GPLv3


Structure creating script (makeroom_msprime_1.2.0.sh) moved to /sw/bioinfo/msprime/makeroom_1.2.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "msprime" "-v" "1.2.0" "-s" "annotation" "-w" "https://msprime.readthedocs.io/en/latest/" "-l" "GPLv3" "-d" "msprime is a Python API and command line interface for simulating the coalescent with recombination based on tskit." "-f"
    ./makeroom_msprime_1.2.0.sh


    cd /sw/bioinfo/msprime/
    source SOURCEME_msprime_1.2.0

    module load gsl/2.6
    module load python/3.7.2

Install as a virtual environment
    virtualenv ${PREFIX}/venv
    ${PREFIX}/venv/bin/pip install msprime==${VERSION}
    mkdir ${PREFIX}/bin
    cd ${PREFIX}/bin
    ln -s ../venv/bin/msp
    ln -s ../venv/bin/mspms
    ln -s ../venv/bin/tskit
    ldd $(head -n 1 msp | cut -c3-)




LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "msprime" -v "0.7.4" -s "annotation" -w "https://msprime.readthedocs.io/en/latest/" -l "GPLv3" -d "msprime is a Python API and command line interface for simulating the coalescent with recombination based on tskit."
    ./makeroom_msprime_0.7.4.sh

    cd /sw/bioinfo/msprime/
    source SOURCEME_msprime_0.7.4

    module load gsl/2.6
    module load python/3.7.2

Install as a virtual environment
    virtualenv ${PREFIX}/venv
    ${PREFIX}/venv/bin/pip install msprime==${VERSION}
    mkdir ${PREFIX}/bin
    cd ${PREFIX}/bin
    ln -s ../venv/bin/msp
    ln -s ../venv/bin/mspms
    ln -s ../venv/bin/tskit
    ldd $(head -n 1 msp | cut -c3-)
