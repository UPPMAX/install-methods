ORCA/6.0.0
========================

<https://orcaforum.kofo.mpg.de/>

Used under license:



Structure creating script (makeroom_ORCA_6.0.0.sh) moved to /sw/apps/ORCA/makeroom_6.0.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "ORCA" "-v" "6.0.0" "-w" "https://orcaforum.kofo.mpg.de/" "-d" "ORCA is a quantum-chemical software package consisting of methods in the fields of density functional theory as well as correlated wave-function based methods." "-c" "apps" "-f"
    ./makeroom_ORCA_6.0.0.sh

    # Download prebuilt binaries from https://orcaforum.kofo.mpg.de/app.php/dlext/?cat=23
    # Theres is a non AVX2 version that will be installed on snowy
    
    # Log in to their forum and download through a browser
    # orca_6_0_0_linux_x86-64_avx2_shared_openmpi416.tar.xz
    # orca_6_0_0_linux_x86-64_shared_openmpi416.tar.xz

    # load modules
    module load gcc/14.1.0 
    module load openmpi/4.1.6

### rackham ###
    cd $SRCDIR
    tar xfl orca_6_0_0_linux_x86-64_avx2_shared_openmpi416.tar.xz
    mv orca_6_0_0_shared_openmpi416_avx2 $PREFIX/bin
    cd $PREFIX/bin
    ldd * | grep "not found"
    mv Third_Party_Licenses_Academic_6.0.0.pdf CompoundScripts/ EULA_ORCA_2021.pdf ../

### Snowy ###
    cd $SRCDIR
    tar xfl orca_6_0_0_linux_x86-64_shared_openmpi416.tar.xz
    mv orca_6_0_0_shared_openmpi416/ $TOOLDIR/$VERSION/snowy/bin
    cd $TOOLDIR/$VERSION/snowy/bin
    ldd * | grep "not found"


    # Test
    cd $PREFIX/CompoundScripts/UserContributed/XYG3TypeDoubleHybrids/
    $PREFIX/bin/orca test_Compound_0.inp 







ORCA/5.0.4
========================

<https://orcaforum.kofo.mpg.de/>

Used under license:



Structure creating script (makeroom_ORCA_5.0.4.sh) moved to /sw/apps/ORCA/makeroom_5.0.4.sh

LOG
---

    /home/matpiq/install-methods/makeroom.sh "-f" "-t" "ORCA" "-v" "5.0.4" "-c" "apps" "-w" "https://orcaforum.kofo.mpg.de/" "-d" "ORCA is a quantum-chemical software package consisting of methods in the fields of density functional theory as well as correlated wave-function based methods."
    ./makeroom_ORCA_5.0.4.sh
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

