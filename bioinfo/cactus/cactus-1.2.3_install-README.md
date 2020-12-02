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


To run cactus:

    # set up working directories and/or variables for
    # (1) the mesos controller
    # (2) the mesos agents
    # (3) the mesos controller node hostname
    # (4) the port you will use for communication between the nodes
    1: /proj/staff/douglas/mesos-controller
    2: /proj/staff/douglas/mesos-agent
    3: $HOSTNAME after ssh-ing into the node you've chosen for the mesos controller
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
    module load bioinfo-tools cactus/1.2.3

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
    module load bioinfo-tools cactus/1.2.3
    controller=$HOSTNAME
    port=5050
    export SINGULARITY_BIND='/sw'

    mkdir -p $runwd && cd $runwd
    toil clean $jobdata && \
    cactus \
        --binariesMode singularity \
        --batchSystem Mesos \
        --mesosMaster $controller:$port \
        --setEnv SINGULARITY_BIND=$SINGULARITY_BIND \
        --containerImage $CACTUS_SINGULARITY_IMG \
        $jobdata \
        --defaultMemory 7Gi \
        --defaultDisk 10Gi \
        $datawd/genomes/evolverMammalsLocalLarge.txt \
        output_cactus_${RANDOM}.hal



