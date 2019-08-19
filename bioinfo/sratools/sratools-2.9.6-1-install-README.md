sratools/2.9.6-1
================

NCBI's SRA Toolkit

Auxiliary scripts for WGS and TSA repositories
----------------------------------------------

There are some auxiliary scripts required for getting WGS and TSA ids from taxon ids.  These are required for setting up blasts against SRA.  See

<ftp://ftp.ncbi.nlm.nih.gov/blast/WGS_TOOLS/README_BLASTWGS.txt>



LOG
---

Download precompiled versions for CentOS 64-bit.  The 'current' download
doesn't show the version, so wget directly from the versioned download.  Move
the directory unpacked from the tarball to the CLUSTER directory.

    TOOL=/sw/bioinfo/sratools
    VERSION=2.9.6-1
    mkdir -p $TOOL
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    [[ $CLUSTER == rackham ]] && for CL in bianca irma snowy ; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src
    wget --timestamping https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/${VERSION}/sratoolkit.${VERSION}-centos_linux64.tar.gz
    tar xzf sratoolkit.${VERSION}-centos_linux64.tar.gz 
    mv sratoolkit.${VERSION}-centos_linux64 ../$CLUSTER

    wget --timestamping ftp://ftp.ncbi.nlm.nih.gov/blast/WGS_TOOLS/taxid2tsa.pl
    wget --timestamping ftp://ftp.ncbi.nlm.nih.gov/blast/WGS_TOOLS/taxid2wgs.pl
    mkdir aux_scripts
    cp -av taxid2* aux_scripts/
    mv aux_scripts ../$CLUSTER/

Make sure to add both `$modroot/bin` and `$modroot/aux_scripts` to `PATH`, and set `SRATOOLS_ROOT` to `$modroot`.
