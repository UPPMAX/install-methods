cactus/2.2.1
========================

<https://github.com/ComparativeGenomicsToolkit/cactus>

Used under license:
AS IS


Structure creating script (makeroom_cactus_2.2.1.sh) moved to /sw/bioinfo/cactus/makeroom_2.2.1.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "cactus" "-v" "2.2.1" "-w" "https://github.com/ComparativeGenomicsToolkit/cactus" "-x" "INSTALL" "-l" "AS IS" "-f"
    ./makeroom_cactus_2.2.1.sh


    TOOL=cactus
    VERSION=2.2.1

    module load python/3.9.5
    module load git/2.34.1
    module load gcc/9.3.0
    module load hdf5/1.10.5
    module load lzo/2.10
    module load xz/5.2.2
    module load binutils/2.38

    cd $PREFIX
    git clone https://github.com/ComparativeGenomicsToolkit/cactus.git --recursive
    cd $PREFIX/cactus
    git checkout v${VERSION}

    cd $PREFIX
    python3 -m virtualenv -p python3.9 cactus_env

    source cactus_env/bin/activate
    cd $PREFIX/cactus
    pip install --upgrade setuptools pip
    # pip install --upgrade toil[aws,mesos,google,encryption,cwl]
    # pip install --upgrade .
    python3 -m pip install -U -r ./toil-requirement.txt
    python3 -m pip install -U .

#Remove CMD 'CMDLDFLAGS =  -static' from kyoto Makefiles due to errors. Ugly but works.
    unset PREFIX
    make -j 15

    # Download the cactus singularity binary set
    source /sw/bioinfo/cactus/SOURCEME_cactus_2.0.5
    singularity pull -F $PREFIX/cactus_v${VERSION}.sif docker://quay.io/comparative-genomics-toolkit/cactus:v${VERSION} 



# Test with both the local binaries and the singularity ones

    module load bioinfo-tools cactus/2.0.5
    cactus \\
        jobStore${RANDOM} \\
        /sw/bioinfo/cactus/2.0.5/rackham/cactus/examples/evolverMammals.txt \\
        /sw/bioinfo/cactus/2.0.5/rackham/cactus/examples/evolverMammals.hal \\
        --root mr

    cactus \\
        --binariesMode singularity \\
        --containerImage $CACTUS_SINGULARITY_IMG \\
        jobStore${RANDOM} \\
        /sw/bioinfo/cactus/2.0.5/rackham/cactus/examples/evolverMammals.txt \\
        /sw/bioinfo/cactus/2.0.5/rackham/cactus/examples/evolverMammals.hal \\
        --root mr














cactus/2.0.5
========================

<https://github.com/ComparativeGenomicsToolkit/cactus>

Used under license:



Structure creating script (makeroom_cactus_2.0.5.sh) moved to /sw/bioinfo/cactus/makeroom_2.0.5.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "cactus" "-v" "2.0.5" "-w" "https://github.com/ComparativeGenomicsToolkit/cactus" "-f"
    ./makeroom_cactus_2.0.5.sh
    source /sw/bioinfo/cactus/SOURCEME_cactus_2.0.5 && cd $TOOLDIR
    TOOL=cactus
    VERSION=2.0.5

    module load python/3.8.7
    module load git/2.34.1
    module load gcc/4.9.4
    module load hdf5/1.10.5
    module load lzo/2.10
    module load xz/5.2.2

    cd $PREFIX
    git clone https://github.com/ComparativeGenomicsToolkit/cactus.git --recursive
    cd $PREFIX/cactus
    git checkout v${VERSION}

    cd $PREFIX
    python3 -m virtualenv -p python3.8 cactus_env

    source cactus_env/bin/activate
    cd $PREFIX/cactus
    pip install --upgrade setuptools pip
# pip install --upgrade -r toil-requirement.txt it tries to install a python2 module with all.
    pip install --upgrade toil[aws,mesos,google,encryption,cwl]
    pip install --upgrade .

#Remove CMD 'CMDLDFLAGS =  -static' from kyoto Makefiles due to errors. Ugly but works.
    unset PREFIX
    make -j 15

    # Download the cactus singularity binary set
    source /sw/bioinfo/cactus/SOURCEME_cactus_2.0.5
    singularity pull -F $PREFIX/cactus_v${VERSION}.sif docker://quay.io/comparative-genomics-toolkit/cactus:v${VERSION} 



# Test with both the local binaries and the singularity ones

    module load bioinfo-tools cactus/2.0.5
    cactus \\
        jobStore${RANDOM} \\
        /sw/bioinfo/cactus/2.0.5/rackham/cactus/examples/evolverMammals.txt \\
        /sw/bioinfo/cactus/2.0.5/rackham/cactus/examples/evolverMammals.hal \\
        --root mr

    cactus \\
        --binariesMode singularity \\
        --containerImage $CACTUS_SINGULARITY_IMG \\
        jobStore${RANDOM} \\
        /sw/bioinfo/cactus/2.0.5/rackham/cactus/examples/evolverMammals.txt \\
        /sw/bioinfo/cactus/2.0.5/rackham/cactus/examples/evolverMammals.hal \\
        --root mr









cactus/1.3.0
========================

<https://github.com/ComparativeGenomicsToolkit/cactus>

Used under license:
Copyright
<>

Structure creating script (makeroom_cactus_1.3.0.sh) moved to /sw/bioinfo/cactus/makeroom_1.3.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "cactus" -v "1.3.0" -s "annotation" -w "https://github.com/ComparativeGenomicsToolkit/cactus" -l "Copyright" -d "Cactus is a reference-free whole-genome multiple alignment program." -f""
    ./makeroom_cactus_1.3.0.sh
    TOOL=cactus
    VERSION=1.3.0
    cd /sw/bioinfo/$TOOL
    source SOURCEME_cactus_1.3.0

    module load python/3.8.7
    module load git/2.28.0
    module load gcc/4.9.4
    module load hdf5/1.10.5
    module load lzo/2.10
    module load xz/5.2.2

    cd $PREFIX
    git clone https://github.com/ComparativeGenomicsToolkit/cactus.git --recursive
    cd $PREFIX/cactus
    git checkout v${VERSION}

    cd $PREFIX
    #python3 -m pip install --upgrade --target $PREFIX/virtualenv virtualenv
    python3 -m virtualenv -p python3.8 cactus_env

    source cactus_env/bin/activate
    cd $PREFIX/cactus
    pip install --upgrade setuptools pip
    pip install --upgrade -r toil-requirement.txt
    pip install --upgrade .

#Remove CMD 'CMDLDFLAGS =  -static' from kyoto Makefiles due to errors. Ugly but works.
    unset PREFIX
    make -j 15
    sed -i.bak 's/-static//g' submodules/kyoto/kyotocabinet/Makefile
    make -j 15
    sed -i.bak 's/-static//g' submodules/kyoto/kyototycoon/Makefile
    make -j 15


    # Download the cactus singularity binary set
    singularity pull -F $PREFIX/cactus_v1.3.0.sif docker://quay.io/comparative-genomics-toolkit/cactus:v1.3.0 









cactus/1.2.3
========================

<https://github.com/ComparativeGenomicsToolkit/cactus>

Used under license:
Custom open-source AS IS

Structure creating script (makeroom_cactus_1.2.3.sh) moved to /sw/bioinfo/cactus/makeroom_1.2.3.sh

LOG
---

    TOOL=cactus
    VERSION=1.2.3
    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -s "alignment" -t "cactus" -v "1.2.3" -w "https://github.com/ComparativeGenomicsToolkit/cactus" -l "Custom open-source AS IS" -d "whole genome alignment"
    ./makeroom_cactus_1.2.3.sh
    source SOURCEME_cactus_1.2.3

    cd $PREFIX
    module load python/3.7.2
    module load git/2.28.0
    git clone https://github.com/ComparativeGenomicsToolkit/cactus.git --recursive
    cd $PREFIX/cactus
    git checkout v${VERSION}

    cd $PREFIX
    python3 -m pip install --upgrade --target $PREFIX/virtualenv virtualenv
    ./virtualenv/bin/virtualenv -p python3.7 cactus_env
    source cactus_env/bin/activate
    pip install --upgrade setuptools pip
    pip install --upgrade -r $PREFIX/cactus/toil-requirement.txt

    cd $PREFIX/cactus
    pip install --upgrade .



    # Download the cactus singularity binary set
    singularity pull -F $PREFIX/cactus_v1.2.3.sif docker://quay.io/comparative-genomics-toolkit/cactus:v1.2.3 





### To run cactus: ###

    # set up working directories and/or variables for
    # (1) the mesos controller
    # (2) the mesos agents
    # (3) the mesos controller node hostname
    # (4) the port you will use for communication between the nodes
    1: /proj/staff/douglas/mesos-controller
    2: /proj/staff/douglas/mesos-agent
    3: $HOSTNAME after ssh-ing into the node you have chosen for the mesos controller
    4: 5050

    # Start Mesos
    ## First allocate as many nodes as you want, for now the mesos controller will also run on a node:
    salloc -A staff -M snowy -p node -n nodes*16 -t 10-00:00:00 --no-shell

    ## Start the mesos controller. For now you have to copy the controller $HOSTNAME and paste it into the agent command on row 22 and in cactus on row 38.
    ## SSH into one node and start a screen. Then run:
    module load mesos/1.9.0
    port=5050

    # On this node, do 'hostname' and save its value

    mesos-master --port=$port --work_dir=/proj/staff/douglas/mesos-controller/${HOSTNAME}-$port --registry=in_memory --log_dir=/proj/staff/douglas/mesos-controller/${HOSTNAME}-$port/log --cluster="UPPMAX Mesos"

    ## Start the mesos agents
    ## SSH into the remaining nodes and run these commands on each of them:
    module load mesos/1.9.0
    module load bioinfo-tools cactus/1.3.0

    port=5050

    mesos-agent --master=($HOSTNAME ON CONTROLLER):$port --work_dir=/proj/staff/douglas/mesos-agent/${HOSTNAME}-$port --no-switch_user --no-systemd_enable_support --log_dir=/proj/staff/douglas/mesos-agent/${HOSTNAME}-$port/log/ --executor_environment_variables=`echo {\"PATH\":\"$PATH\"}`

    For example:

    wd=/proj/staff/douglas
    awd=$wd/mesos-agent
    mesos-agent --master=s122.uppmax.uu.se:$port --work_dir=$awd/${HOSTNAME}-$port --no-switch_user --no-systemd_enable_support --log_dir=$awd/${HOSTNAME}-$port/log/ --executor_environment_variables=`echo {\"PATH\":\"$PATH\"}`

    ## The mesos system is now up and running. You can start a remote firefox and login to the "controllers $HOSTNAME":5050 to get the mesos interface.

    # on a login node

    # firefox &
    #    then ...
    # http://$controller:$port

    # Start cactus
    ## You can choose to either run the cactus job on the booked controller node or add a node in the salloc command.
    ## I will default to running it on the controller, which is easiest
    ## SSH into your chosen node and run:
    ssh s122

    wd=/proj/staff/douglas
    runwd=$wd/cactus_test
    datawd=$wd/cactus_test_data
    jobdata=jobStore
    module load bioinfo-tools cactus/1.3.0
    controller=$HOSTNAME
    port=5050
    export SINGULARITY_BIND='/sw'

    mkdir -p $runwd && cd $runwd

    # You can choose if you want to run cactus with local built binaries or to use the binaries from the cactus image. The local binaries might be slightly faster.

    toil clean $jobdata && \
    cactus \
        --binariesMode singularity \
        --batchSystem Mesos \
        --mesosMaster $controller:$port \
        --setEnv SINGULARITY_BIND=$SINGULARITY_BIND \
        $jobdata \
        --defaultMemory 7Gi \
        --defaultDisk 10Gi \
        $datawd/genomes/evolverMammalsLocalLarge.txt \
        output_cactus_${RANDOM}.hal


    toil clean $jobdata && \
    cactus \
        --binariesMode singularity \
        --containerImage $CACTUS_SINGULARITY_IMG \
        --batchSystem Mesos \
        --mesosMaster $controller:$port \
        --setEnv SINGULARITY_BIND=$SINGULARITY_BIND \
        $jobdata \
        --defaultMemory 7Gi \
        --defaultDisk 10Gi \
        $datawd/genomes/evolverMammalsLocalLarge.txt \
        output_cactus_${RANDOM}.hal


