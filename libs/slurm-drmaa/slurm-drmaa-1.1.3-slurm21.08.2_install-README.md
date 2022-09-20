slurm-drmaa/1.1.3-slurm21.08.2
========================

<https://github.com/natefoo/slurm-drmaa>

Used under license:
GPL-3.0


Structure creating script (makeroom_slurm-drmaa_1.1.3-slurm21.08.2.sh) moved to /sw/libs/slurm-drmaa/makeroom_1.1.3-slurm21.08.2.sh

LOG
---

    makeroom.sh "-u" "miarka" "-f" "-c" "libs" "-t" "slurm-drmaa" "-v" "1.1.3-slurm21.08.2" "-w" "https://github.com/natefoo/slurm-drmaa" "-d" "DRMAA for Slurm Workload Manager (Slurm) is an implementation of Open Grid Forum Distributed Resource Management Application API (DRMAA) version 1 for submission and control of jobs to Slurm. Using DRMAA, grid applications builders, portal developers and ISVs can use the same high-level API to link their software with different cluster/resource management systems. Built against SLURM 21.08.2" "-l" "GPL-3.0"
    ./makeroom_slurm-drmaa_1.1.3-slurm21.08.2.sh

    source /sw/libs/slurm-drmaa/SOURCEME_slurm-drmaa_1.1.3-slurm21.08.2 && cd $SRCDIR

Use source form existing installation.

    wget https://github.com/natefoo/slurm-drmaa/releases/download/1.1.3/slurm-drmaa-1.1.3.tar.gz
    tar xf slurm-drmaa-1.1.3.tar.gz 

It should be able to find all slurm libraries and includes automatically.  It does.

    cd slurm-drmaa-1.1.3/
    ./configure --prefix=$PREFIX
    make -j10
    make check

`make check` failed because `bats` cannot be found:


    ================================================
       DRMAA for Slurm 1.1.3: test/test-suite.log
    ================================================

    # TOTAL: 1
    # PASS:  0
    # SKIP:  0
    # XFAIL: 0
    # FAIL:  1
    # XPASS: 0
    # ERROR: 0

    .. contents:: :depth: 2

    FAIL: functional-basic
    ======================

    ../scripts/test-driver: line 109: bats: command not found
    FAIL functional-basic.bats (exit status: 127)


The FedSuite test passed. Go ahead and install.

    make install

