GATK/4.6.2.0
========================

<http://>

Used under license:
copyright


Structure creating script (makeroom_GATK_4.6.2.0.sh) moved to /sw/bioinfo/GATK/makeroom_4.6.2.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "GATK" "-v" "4.6.2.0" "-d" "GATK4 aims to bring together well-established tools from the GATK and Picard codebases under a streamlined framework" "-l" "copyright" "-f"
    ./makeroom_GATK_4.6.2.0.sh

# Download and extract
    cd $SRCDIR
    wget https://github.com/broadinstitute/gatk/releases/download/${VERSION}/gatk-${VERSION}.zip
    unzip gatk-${VERSION}.zip 
    mv gatk-${VERSION}/* $PREFIX

# Add "-Xms512M","-Xmx5G" to gatk
    cd $PREFIX
    sed -r "s/(PACKAGED_LOCAL_JAR_OPTIONS= \[\"-Dsamjdk.use_async_io_read_samtools=false\",)/\1 \"-Xms512M\", \"-Xmx5G\", /" gatk

Rackham 5 is blocked by conda for some reason according to Jonas Söderberg. Do these following steps on one of the other login nodes.
    TOOL=GATK
    version=4.6.2.0
    source /sw/bioinfo/${TOOL}/SOURCEME_${TOOL}_${version}
    cd $PREFIX
    mkdir envs
    export CONDA_ENVS_PATH=$PREFIX/envs:$CONDA_ENVS_PATH
    module load conda/latest
    conda-env create --name gatk -f gatkcondaenv.yml





GATK/4.3.0.0
========================

<http://>

Used under license:



Structure creating script (makeroom_GATK_4.3.0.0.sh) moved to /sw/bioinfo/GATK/makeroom_4.3.0.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "GATK" "-v" "4.3.0.0" "-f"
    ./makeroom_GATK_4.3.0.0.sh

    TOOL=GATK
    VERSION=4.3.0.0

# Download and extract
    cd $SRCDIR
    wget https://github.com/broadinstitute/gatk/releases/download/4.3.0.0/gatk-${VERSION}.zip
    unzip gatk-${VERSION}.zip 
    mv gatk-${VERSION}/* $PREFIX

# Add "-Xms512M","-Xmx5G" to gatk
    cd $PREFIX
    sed -r "s/(PACKAGED_LOCAL_JAR_OPTIONS= \[\"-Dsamjdk.use_async_io_read_samtools=false\",)/\1 \"-Xms512M\", \"-Xmx5G\", /" gatk

Rackham 5 is blocked by conda for some reason according to Jonas Söderberg. Do these following steps on one of the other login nodes.
    TOOL=GATK
    version=4.3.0.0
    source /sw/bioinfo/${TOOL}/SOURCEME_${TOOL}_${version}
    cd $PREFIX
    mkdir envs
    export CONDA_ENVS_PATH=$PREFIX/envs
    module load conda/latest
    conda-env create --name gatk -f gatkcondaenv.yml

I am not updating the resource bundle (/sw/data/GATK) available at https://gatk.broadinstitute.org/hc/en-us/articles/360035890811-Resource-bundle. It has not been updated since 2016.




GATK/4.2.0.0
========================

<https://github.com/broadinstitute/gatk>

Used under license:

<>

Structure creating script (makeroom_GATK_4.2.0.0.sh) moved to /sw/bioinfo/GATK/makeroom_4.2.0.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "GATK" -v "4.2.0.0" -w "https://github.com/broadinstitute/gatk" -d "GATK4 aims to bring together well-established tools from the GATK and Picard codebases under a streamlined framework\, and to enable selected tools to be run in a massively parallel way on local clusters" -f
    ./makeroom_GATK_4.2.0.0.sh

    TOOL=GATK
    version=4.2.0.0
    source /sw/bioinfo/${TOOL}/SOURCEME_${TOOL}_${version}
    cd $SRCDIR
    wget https://github.com/broadinstitute/gatk/releases/download/4.2.0.0/gatk-${version}.zip
    unzip gatk-${version}.zip 
    mv gatk-${version}/* $PREFIX

To set the values for `-Xms` and `-Xmx` I added this line in the gatk wrapper.
    PACKAGED_LOCAL_JAR_OPTIONS= ["-Dsamjdk.use_async_io_read_samtools=false",
                      "-Dsamjdk.use_async_io_write_samtools=true",
                      "-Dsamjdk.use_async_io_write_tribble=false",
                      "-Dsamjdk.compression_level=2",
                      "-Xms512M","-Xmx5G"] <--------- UPPMAX addition

Rackham 5 is blocked by conda for some reason according to Jonas Söderberg. Do these following steps on one of the other login nodes.
    TOOL=GATK
    version=4.2.0.0
    source /sw/bioinfo/${TOOL}/SOURCEME_${TOOL}_${version}
    cd $PREFIX
    mkdir envs
    export CONDA_ENVS_PATH=$PREFIX/envs
    module load conda/latest
    conda-env create --name gatk -f gatkcondaenv.yml

I am not updating the resource bundle (/sw/data/GATK) available at https://gatk.broadinstitute.org/hc/en-us/articles/360035890811-Resource-bundle. It has not been updated since 2016.





GATK/4.1.4.1
============

<https://software.broadinstitute.org/gatk/>

LOG
---

    TOOL=/sw/bioinfo/GATK
    VERSION=4.1.4.1
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir -p $TOOL/$VERSION
    cd $TOOL/$VERSION
    [[ $CLUSTER == rackham ]] && for CL in irma snowy bianca ; do test -L $CL || ln -sf $CLUSTER $CL; done
    PREFIX=$PWD/$CLUSTER
    mkdir src
    cd src
    wget https://github.com/broadinstitute/gatk/releases/download/${VERSION}/gatk-${VERSION}.zip
    unzip gatk-${VERSION}.zip 
    mv gatk-${VERSION} $PREFIX

As for 4.0.8.0 and 4.1.0.0, I have NOT installed the `gatk.py` wrapper from
bioconda https://github.com/bioconda/bioconda-recipes/tree/master/recipes/gatk
since this comes with its own wrapper.

To set the values for `-Xms` and `-Xmx` I added this line in the gatk wrapper.

    PACKAGED_LOCAL_JAR_OPTIONS= ["-Dsamjdk.use_async_io_read_samtools=false",
                      "-Dsamjdk.use_async_io_write_samtools=true",
                      "-Dsamjdk.use_async_io_write_tribble=false",
                      "-Dsamjdk.compression_level=2",
                      "-Xms512M","-Xmx5G"] <--------- UPPMAX addition

Now install the GATK conda environment.  This is needed for some tools.

    cd $PREFIX
    mkdir envs
    export CONDA_ENVS_PATH=$PREFIX/envs
    module load conda/latest
    conda env create -n gatk -f gatkcondaenv.yml

This takes a while for conda to do its thing.

