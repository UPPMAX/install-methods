SALSA/20220408-ed76685
========================

<https://github.com/marbl/SALSA>

Used under license:
MIT License


Structure creating script (makeroom_SALSA_20220408-ed76685.sh) moved to /sw/bioinfo/SALSA/makeroom_20220408-ed76685.sh

LOG
---

     TOOL=SALSA
    VERSION=20220408-ed76685

    makeroom.sh -t $TOOL -v $VERSION -w "https://github.com/marbl/SALSA" -c "bioinfo" -l "MIT License" -d "Scaffolding of long read assemblies using long range contact information." -s "pipelines" -f

    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}

    module load python/2.7.15
    module load gcc/9.3.0
    module load cmake/3.22.2   
    module load git/2.34.1

    cd $PREFIX

    git clone https://github.com/marbl/SALSA.git

    cd SALSA
    make

