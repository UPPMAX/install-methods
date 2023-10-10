slurm-drmaa/1.1.4-slurm23.02.5
==============================

<https://github.com/natefoo/slurm-drmaa>

Used under license:
GPL-3.0


Structure creating script (makeroom_slurm-drmaa_1.1.4-slurm23.02.5.sh) moved to /sw/libs/slurm-drmaa/makeroom_1.1.4-slurm23.02.5.sh

LOG
---

    makeroom.sh "-f" "-c" "libs" "-t" "slurm-drmaa" "-v" "1.1.4-slurm23.02.5" "-w" "https://github.com/natefoo/slurm-drmaa" "-d" "DRMAA for Slurm Workload Manager (Slurm) is an implementation of Open Grid Forum Distributed Resource Management Application API (DRMAA) version 1 for submission and control of jobs to Slurm. Using DRMAA, grid applications builders, portal developers and ISVs can use the same high-level API to link their software with different cluster/resource management systems. Built against SLURM 23.02.5" "-l" "GPL-3.0"
    ./makeroom_slurm-drmaa_1.1.4-slurm23.02.5.sh

    source /sw/libs/slurm-drmaa/SOURCEME_slurm-drmaa_1.1.4-slurm23.02.5
    cd $SRCDIR

Fetch source tarball.

    wget https://github.com/natefoo/slurm-drmaa/releases/download/1.1.4/slurm-drmaa-1.1.4.tar.gz
    wget https://github.com/natefoo/slurm-drmaa/releases/download/1.1.4/slurm-drmaa-1.1.4.tar.gz.sha512
    sha512sum -c slurm-drmaa-1.1.4.tar.gz.sha512
    tar xf slurm-drmaa-1.1.4.tar.gz 

It should be able to find all slurm libraries and includes automatically.  It does.

    cd slurm-drmaa-1.1.4/
    ./configure --prefix=$PREFIX
    make -j10
    make check


`make check` failed because `bats` cannot be found.  Same error as before.


    ================================================
       DRMAA for Slurm 1.1.4: test/test-suite.log
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


Build separately on miarka3?
