funannotate/1.8.17
========================

<https://github.com/nextgenusfs/funannotate>

Used under license:
BSD-2


Structure creating script (makeroom_funannotate_1.8.17.sh) moved to /sw/bioinfo/funannotate/makeroom_1.8.17.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "funannotate" "-v" "1.8.17" "-s" "annotation" "-l" "BSD-2" "-w" "https://github.com/nextgenusfs/funannotate" "-d" "Eukaryotic Genome Annotation Pipeline" "-f"
    ./makeroom_funannotate_1.8.17.sh

    # build sif file from docker
    cd $PREFIX
    echo -e "Bootstrap: docker\nFrom: nextgenusfs/funannotate::v1.8.17" > Singularity
    apptainer build funannotate.sif Singularity

    # create wrapper script
    mkdir bin
    echo -e "#/bin/bash\n\napptainer exec ${PREFIX}/funannotate.sif funannotate \${@}" > $PREFIX/bin/funannotate
    chmod 774 $PREFIX/bin/funannotate

    # Download all data into the data-module
    funannotate setup -i all -b all -w -d /sw/data/funannotate/1.8.17/rackham
    export FUNANNOTATE_DB=/sw/data/funannotate_data/1.8.17/rackham








    # Conda version. Works too but the run time was slower
    singularity 20 cores
    ##############################################
    SUCCESS: `funannotate compare` test complete.
    ##############################################
    real    57m14.186s

    conda 20 cores
    ##############################################
    SUCCESS: `funannotate compare` test complete.
    ##############################################
    real    74m55.413s

    # Load modules
    module load conda/latest
    
    # Conda 
    cd $PREFIX
    conda create -p funannotate "python>=3.6,<3.9" funannotate==1.8.17
    conda activate $PREFIX/funannotate
    conda install -p $PREFIX/funannotate iqtree==2.3.4
    conda install -p $PREFIX/funannotate evidencemodeler==1.1.1
    conda deactivate
    conda activate $PREFIX/funannotate

    pip install distro==1.9.0

    # Download all data into the data-module
    funannotate setup -i all -b all -w -d /sw/data/funannotate/1.8.17/rackham
    export FUNANNOTATE_DB=/sw/data/funannotate_data/1.8.17/rackham

    # Test 
    funannotate test -t all









funannotate/1.8.1
========================

<https://funannotate.readthedocs.io/en/latest/>

Used under license:
BSD 2-clause


LOG
---

    TOOL=funannotate
    VERSION=1.8.1
    makeroom.sh -f -t $TOOL -v $VERSION -s annotation -w https://funannotate.readthedocs.io/en/latest/ -l "BSD 2-clause" -d "genome prediction, annotation, and comparison software package" 
    ./makeroom_${TOOL}_${VERSION}.sh 
    cd /sw/bioinfo/$TOOL
    source SOURCEME_${TOOL}_${VERSION} 
    module load python/3.7.2
    PYTHONUSERBASE=$PREFIX pip install --user funannotate==${VERSION}

In the mf file, load python/3.7.2, and add the python3.7/site-packages directory to PYTHONPATH.
