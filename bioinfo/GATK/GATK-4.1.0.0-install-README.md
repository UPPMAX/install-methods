GATK/4.1.0.0
============





Licence agreement accepted.  The unpacked directory becomes the `$CLUSTER` directory.


    TOOL=/sw/bioinfo/GATK
    VERSION=4.1.0.0
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir -p $TOOL/$VERSION
    cd $TOOL/$VERSION
    for CL in irma snowy bianca ; do
        ln -sf $CLUSTER $CL
    done
    mkdir src
    cd src
    wget https://github.com/broadinstitute/gatk/releases/download/${VERSION}/gatk-${VERSION}.zip
    unzip gatk-${VERSION}.zip 
    mv gatk-${VERSION} ../$CLUSTER
    for c in $OTHER_CLUSTERS; do
       ln -fs $CLUSTER $c
    done

I have NOT installed the `gatk.py` wrapper from bioconda https://github.com/bioconda/bioconda-recipes/tree/master/recipes/gatk since 4.0.8.0 comes with its own wrapper

To set the values for Xms and Xmx I added this line in the gatk wrapper.

    PACKAGED_LOCAL_JAR_OPTIONS= ["-Dsamjdk.use_async_io_read_samtools=false",
                      "-Dsamjdk.use_async_io_write_samtools=true",
                      "-Dsamjdk.use_async_io_write_tribble=false",
                      "-Dsamjdk.compression_level=2",
                      "-Xms512M","-Xmx5G"] <--------- UPPMAX addition
