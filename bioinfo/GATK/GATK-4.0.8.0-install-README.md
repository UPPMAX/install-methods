GATK/4.0.8.0-0
==========

<https://software.broadinstitute.org/gatk/download/>


LOG
---

Licence agreement accepted.  No cluster-specific subdirectory for GATK.

    VERSION=4.0.8.0
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/bioinfo/GATK
    mkdir $VERSION
    cd $VERSION

Brought over the tarball after downloading on office mac.

    mkdir src
    cd src
    wget https://github.com/broadinstitute/gatk/releases/download/4.0.8.0/gatk-4.0.8.0.zip
    unzip gatk-4.0.8.0.zip -d ../
    cd ..
    fixup -g

Get all the mf stuff installed.

I have NOT installed the `gatk.py` wrapper from bioconda https://github.com/bioconda/bioconda-recipes/tree/master/recipes/gatk since 4.0.8.0 comes with its own wrapper

To set the values for Xms and Xmx I added this line in the gatk wrapper.

...
PACKAGED_LOCAL_JAR_OPTIONS= ["-Dsamjdk.use_async_io_read_samtools=false",
                  "-Dsamjdk.use_async_io_write_samtools=true",
                  "-Dsamjdk.use_async_io_write_tribble=false",
                  "-Dsamjdk.compression_level=2",
                  "-Xms512M","-Xmx5G"] <--------- UPPMAX addition
