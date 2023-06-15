cactus/2.5.1
========================

<http://>

Used under license:



Structure creating script (makeroom_cactus_2.5.1.sh) moved to /sw/bioinfo/cactus/makeroom_2.5.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "cactus" "-v" "2.5.1" "-f"
    ./makeroom_cactus_2.5.1.sh


    TOOL=cactus
    VERSION=2.5.1

    module load python/3.9.5
    module load git/2.34.1
    module load gcc/12.2.0
    module load hdf5/1.10.9
    module load lzo/2.10
    module load xz/5.2.6
    module load binutils/2.38

# Download and checkout
    cd $PREFIX
    git clone https://github.com/ComparativeGenomicsToolkit/cactus.git --recursive
    cd $PREFIX/cactus
    git checkout v${VERSION}

"" FOR SNOWY WITHOUT AVX2 ""
# Download Old CPU binaries
    cd $PREFIX
    wget https://github.com/ComparativeGenomicsToolkit/cactus/releases/download/v${VERSION}/cactus-bin-legacy-v${VERSION}.tar.gz
    tar xfvz cactus-bin-legacy-v${VERSION}.tar.gz
    cd $PREFIX/cactus-bin-v${VERSION}/
    cd bin && for i in wigToBigWig faToTwoBit bedToBigBed bigBedToBed axtChain pslPosTarget bedSort hgGcPercent mafToBigMaf hgLoadMafSummary; do wget -q http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/${i}; chmod +x ${i}; done



# Create virtualenv
    cd $PREFIX
    python3 -m virtualenv -p python3.9 cactus_env
    echo "export PATH=$(pwd)/cactus-bin-v${VERSION}/bin:\$PATH" >> cactus_env/bin/activate
    echo "export PYTHONPATH=$(pwd)/cactus-bin-v${VERSION}/lib:\$PYTHONPATH" >> cactus_env/bin/activate

# Update python packages
    source cactus_env/bin/activate
    cd $PREFIX/cactus
    python3 -m pip install -U setuptools pip
    python3 -m pip install -U .
    pip install --upgrade pymesos
    #pip install --upgrade six
    python3 -m pip install -U -r ./toil-requirement.txt

"" ""

"" RACKHAM ""
# Create virtualenv
    cd $PREFIX
    python3 -m virtualenv -p python3.8 cactus_env

# Update python packages
    source cactus_env/bin/activate
    cd $PREFIX/cactus
    python3 -m pip install -U setuptools pip
    python3 -m pip install -U .
    pip install --upgrade pymesos
    #pip install --upgrade six
    python3 -m pip install -U -r ./toil-requirement.txt

"" 
# Compile
    unset PREFIX
    make -j 15
    make
    build-tools/downloadPangenomeTools
    pip install -U .

# Download the cactus singularity binary set
    source /sw/bioinfo/cactus/SOURCEME_cactus_${VERSION}
    cd $PREFIX
    singularity pull -F $PREFIX/cactus_v${VERSION}.sif docker://quay.io/comparative-genomics-toolkit/cactus:v${VERSION} 





# Test
# Run without docker/apptainer/singularity

# master
VERSION=2.5.1
module load bioinfo-tools mesos cactus/$VERSION
wd_controller=/proj/staff/bjornv/mesos-master/
port=5050
#export PATH=/sw/bioinfo/cactus/$VERSION/snowy/cactus-bin-v$VERSION/bin/:$PATH
#export PYTHONPATH=/sw/bioinfo/cactus/$VERSION/snowy/cactus-bin-v$VERSION/lib/:$PYTHONPATH
mesos-master --port=$port --work_dir=$wd_controller/${HOSTNAME}-$port --registry=in_memory --log_dir=$wd_controller/${HOSTNAME}-$port/log --cluster="UPPMAX Mesos"

# slave
VERSION=2.5.1
module load bioinfo-tools mesos cactus/$VERSION
wd_agent=/proj/staff/bjornv/mesos-slave/
controller=s89
port=5050
#export PATH=/sw/bioinfo/cactus/$VERSION/snowy/cactus-bin-v$VERSION/bin/:$PATH
#export PYTHONPATH=/sw/bioinfo/cactus/$VERSION/snowy/cactus-bin-v$VERSION/lib/:$PYTHONPATH
mesos-agent --master=$controller:$port --work_dir=$wd_agent/${HOSTNAME}-$port --no-switch_user --no-systemd_enable_support --log_dir=$wd_agent/${HOSTNAME}-$port/log/ --executor_environment_variables=`echo {\"PATH\":\"$PATH\"}`


VERSION=2.5.1
controller=s89
port=5050
module load bioinfo-tools mesos/1.9.0 cactus/$VERSION
#export VERSION=$VERSION
#export SINGULARITY_BIND='/sw'
#export PATH=/sw/bioinfo/cactus/$VERSION/snowy/cactus-bin-v${VERSION}/bin/:$PATH
#export PYTHONPATH=/sw/bioinfo/cactus/$VERSION/snowy/cactus-bin-v${VERSION}/lib/:$PYTHONPATH
cactus \
           --batchSystem mesos \
           --mesosEndpoint $controller:$port \
           --consCores 16 \
           --binariesMode singularity \ 
           /proj/staff/bjornv/cactus_test/jobStore_${RANDOM} \
           /sw/bioinfo/cactus/${VERSION}/rackham/cactus/examples/evolverMammals.txt \
           output_cactus_${RANDOM}.hal






cactus/2.5.0
========================

<http://>

Used under license:



Structure creating script (makeroom_cactus_2.5.0.sh) moved to /sw/bioinfo/cactus/makeroom_2.5.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "cactus" "-v" "2.5.0" "-f"
    ./makeroom_cactus_2.5.0.sh

    TOOL=cactus
    VERSION=2.5.0

    module load python/3.8.7
    module load git/2.34.1
    module load gcc/12.2.0
    module load hdf5/1.10.9
    module load lzo/2.10
    module load xz/5.2.6
    module load binutils/2.38

# Download and checkout
    cd $PREFIX
    git clone https://github.com/ComparativeGenomicsToolkit/cactus.git --recursive
    cd $PREFIX/cactus
    git checkout v${VERSION}

"" FOR SNOWY WITHOUT AVX2 ""
# Download Old CPU binaries
    cd $PREFIX
    wget https://github.com/ComparativeGenomicsToolkit/cactus/releases/download/v2.5.0/cactus-bin-legacy-v${VERSION}.tar.gz
    tar xfvz cactus-bin-legacy-v${VERSION}.tar.gz
    cd $PREFIX/cactus-bin-v${VERSION}/
    cd bin && for i in wigToBigWig faToTwoBit bedToBigBed bigBedToBed axtChain pslPosTarget bedSort hgGcPercent mafToBigMaf hgLoadMafSummary; do wget -q http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/${i}; chmod +x ${i}; done


# Create virtualenv
    cd $PREFIX
    pynthon3 -m virtualenv -p python3.8 cactus_env
    echo "export PATH=$(pwd)/cactus-bin-v${VERSION}/bin:\$PATH" >> cactus_env/bin/activate
    echo "export PYTHONPATH=$(pwd)/cactus-bin-v${VERSION}/lib:\$PYTHONPATH" >> cactus_env/bin/activate

# Update python packages
    source cactus_env/bin/activate
    cd $PREFIX/cactus
    python3 -m pip install -U setuptools pip
    python3 -m pip install -U .
    pip install --upgrade pymesos
    #pip install --upgrade six
    python3 -m pip install -U -r ./toil-requirement.txt

"" ""

"" RACKHAM ""
# Create virtualenv
    cd $PREFIX
    python3 -m virtualenv -p python3.8 cactus_env

# Update python packages
    source cactus_env/bin/activate
    cd $PREFIX/cactus
    python3 -m pip install -U setuptools pip
    python3 -m pip install -U .
    pip install --upgrade pymesos
    #pip install --upgrade six
    python3 -m pip install -U -r ./toil-requirement.txt

"" 
# Compile
    unset PREFIX
    make -j 15
    build-tools/downloadPangenomeTools
    pip install -U .

# Download the cactus singularity binary set
    source /sw/bioinfo/cactus/SOURCEME_cactus_${VERSION}
    cd $PREFIX
    singularity pull -F $PREFIX/cactus_v${VERSION}.sif docker://quay.io/comparative-genomics-toolkit/cactus:v${VERSION} 






# Test with both the local binaries which works. The singularity binaries do not work and I am getting some userspace errors. 
# You also have to save the jobstore at a location that singularity binds. I could not find the variable to bind /home. /proj works so use that.

# master
module load bioinfo-tools mesos cactus/2.5.0
wd_controller=/proj/staff/bjornv/mesos-master/
port=5050
#export PATH=/sw/bioinfo/cactus/2.5.0/snowy/cactus-bin-v2.5.0/bin/:$PATH
#export PYTHONPATH=/sw/bioinfo/cactus/2.5.0/snowy/cactus-bin-v2.5.0/lib/:$PYTHONPATH
mesos-master --port=$port --work_dir=$wd_controller/${HOSTNAME}-$port --registry=in_memory --log_dir=$wd_controller/${HOSTNAME}-$port/log --cluster="UPPMAX Mesos"

# slave
module load bioinfo-tools mesos cactus/2.5.0
wd_agent=/proj/staff/bjornv/mesos-slave/
controller=s204.uppmax.uu.se
port=5050
#export PATH=/sw/bioinfo/cactus/2.5.0/snowy/cactus-bin-v2.5.0/bin/:$PATH
#export PYTHONPATH=/sw/bioinfo/cactus/2.5.0/snowy/cactus-bin-v2.5.0/lib/:$PYTHONPATH
mesos-agent --master=$controller:$port --work_dir=$wd_agent/${HOSTNAME}-$port --no-switch_user --no-systemd_enable_support --log_dir=$wd_agent/${HOSTNAME}-$port/log/ --executor_environment_variables=`echo {\"PATH\":\"$PATH\"}`


module load bioinfo-tools mesos/1.9.0 cactus/2.5.0
export VERSION=2.5.0
export SINGULARITY_BIND='/sw'
#export PATH=/sw/bioinfo/cactus/2.5.0/snowy/cactus-bin-v2.5.0/bin/:$PATH
#export PYTHONPATH=/sw/bioinfo/cactus/2.5.0/snowy/cactus-bin-v2.5.0/lib/:$PYTHONPATH
cactus \
           --batchSystem mesos \
           --mesosEndpoint $controller:$port \
           --consCores 16 \
           /proj/staff/bjornv/cactus_test/jobStore_${RANDOM} \
           /sw/bioinfo/cactus/${VERSION}/rackham/cactus/examples/evolverMammals.txt \
           output_cactus_${RANDOM}.hal



cactus/2.4.1
========================

<https://github.com/ComparativeGenomicsToolkit/cactus>

Used under license:
AS IS


Structure creating script (makeroom_cactus_2.4.1.sh) moved to /sw/bioinfo/cactus/makeroom_2.4.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "cactus" "-v" "2.4.1" "-w" "https://github.com/ComparativeGenomicsToolkit/cactus" "-l" "AS IS" "-f"
    ./makeroom_cactus_2.4.1.sh
    TOOL   =cactus
    VERSION=2.4.1

    module load python/3.8.7
    module load git/2.34.1
    module load gcc/12.2.0
    module load hdf5/1.10.9
    module load lzo/2.10
    module load xz/5.2.6
    module load binutils/2.38

# Download and checkout
    cd $PREFIX
    git clone https://github.com/ComparativeGenomicsToolkit/cactus.git --recursive
    cd $PREFIX/cactus
    git checkout v${VERSION}

# Create virtualenv
    cd $PREFIX
    python3 -m virtualenv -p python3.8 cactus_env

# Update python packages
    source cactus_env/bin/activate
    cd $PREFIX/cactus
    python3 -m pip install -U setuptools pip
    python3 -m pip install -U .
    pip install --upgrade pymesos
    pip install --upgrade six
    python3 -m pip install -U -r ./toil-requirement.txt

# Compile
    unset PREFIX
    make -j 15
    build-tools/downloadPangenomeTools
    pip install -U .

# Download the cactus singularity binary set
    source /sw/bioinfo/cactus/SOURCEME_cactus_${VERSION}
    cd $PREFIX
    singularity pull -F $PREFIX/cactus_v${VERSION}.sif docker://quay.io/comparative-genomics-toolkit/cactus:v${VERSION} 

# Test with both the local binaries which works. The singularity binaries do not work and I am getting some userspace errors. 
# You also have to save the jobstore at a location that singularity binds. I could not find the variable to bind /home. /proj works so use that.

# master
module load bioinfo-tools mesos cactus/2.4.1
wd_controller=/proj/staff/bjornv/mesos-master/
port=5050
mesos-master --port=$port --work_dir=$wd_controller/${HOSTNAME}-$port --registry=in_memory --log_dir=$wd_controller/${HOSTNAME}-$port/log --cluster="UPPMAX Mesos"

# slave
module load bioinfo-tools mesos cactus/2.4.1
wd_agent=/proj/staff/bjornv/mesos-slave/
controller=r285.uppmax.uu.se
port=5050
mesos-agent --master=$controller:$port --work_dir=$wd_agent/${HOSTNAME}-$port --no-switch_user --no-systemd_enable_support --log_dir=$wd_agent/${HOSTNAME}-$port/log/ --executor_environment_variables=`echo {\"PATH\":\"$PATH\"}`


module load bioinfo-tools mesos/1.9.0 cactus/2.4.1
export VERSION=2.4.1
export SINGULARITY_BIND='/sw'
cactus \
           --batchSystem mesos \
           --mesosEndpoint $controller:$port \
           --consCores 20 \
           /proj/staff/bjornv/cactus_test/jobStore_${RANDOM} \
           /sw/bioinfo/cactus/${VERSION}/rackham/cactus/examples/evolverMammals.txt \
           output_cactus_${RANDOM}.hal






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

    source /sw/bioinfo/cactus/SOURCEME_cactus_2.2.1
    TOOL=cactus
    VERSION=2.2.1

    module load python/3.8.7
    module load git/2.34.1
    module load gcc/8.4.0
    module load hdf5/1.10.1
    module load lzo/2.10
    module load xz/5.2.2
    module load binutils/2.38

# Download and checkout
    cd $PREFIX
    git clone https://github.com/ComparativeGenomicsToolkit/cactus.git --recursive
    cd $PREFIX/cactus
    git checkout v${VERSION}

# Create virtualenv
    cd $PREFIX
    python3 -m virtualenv -p python3.8 cactus_env

# Update python packages
    source cactus_env/bin/activate
    cd $PREFIX/cactus
    pip install --upgrade setuptools pip
    python3 -m pip install -U -r ./toil-requirement.txt
    python3 -m pip install -U .

# Compile
    unset PREFIX
    make -j 15

# Download the cactus singularity binary set
    source /sw/bioinfo/cactus/SOURCEME_cactus_${VERSION}
    cd $PREFIX
    singularity pull -F $PREFIX/cactus_v${VERSION}.sif docker://quay.io/comparative-genomics-toolkit/cactus:v${VERSION} 



# Test with both the local binaries and the singularity ones

    VERSION=2.4.1
    module load bioinfo-tools cactus/${VERSION}
    cactus \\
        jobStore${RANDOM} \\
        /sw/bioinfo/cactus/${VERSION}/rackham/cactus/examples/evolverMammals.txt \\
        /sw/bioinfo/cactus/${VERSION}/rackham/cactus/examples/evolverMammals.hal \\
        --root mr

    cactus \\
        --binariesMode singularity \\
        --containerImage $CACTUS_SINGULARITY_IMG \\
        jobStore${RANDOM} \\
        /sw/bioinfo/cactus/${VERSION}/rackham/cactus/examples/evolverMammals.txt \\
        /sw/bioinfo/cactus/${VERSION}/rackham/cactus/examples/evolverMammals.hal \\
        --root mr






