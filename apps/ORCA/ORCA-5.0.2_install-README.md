ORCA/5.0.2
========================

<https://orcaforum.kofo.mpg.de/>

Used under license:



Structure creating script (makeroom_ORCA_5.0.2.sh) moved to /sw/apps/ORCA/makeroom_5.0.2.sh

LOG
---

    TOOL=ORCA
    VERSION=5.0.2
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/apps/ORCA/5.0.2/src


    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh -f" -t "ORCA" -v "5.0.2" -c "apps" -w "https://orcaforum.kofo.mpg.de/" -d "ORCA is a quantum-chemical software package consisting of methods in the fields of density functional theory as well as correlated wave-function based methods."
    ./makeroom_ORCA_5.0.2.sh

    cd /sw/apps/$TOOL/$VERSION/$CLUSTER/
    tar xvf orca_5_0_2_linux_x86-64_openmpi411_part1.tar.xz
    tar xvf orca_5_0_2_linux_x86-64_openmpi411_part2.tar.xz
    tar xvf orca_5_0_2_linux_x86-64_openmpi411_part3.tar.xz

# The tar files contain OpenMPI 4.1.1 and the precompiled ORCA binaries.
# Executables rearanged so that all are included in /sw/apps/$TOOL/$VERSION/$CLUSTER/bin/

# Sample Slurm script edited:
    vi /sw/apps/ORCA/jobscript

