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

