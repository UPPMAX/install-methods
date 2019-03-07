blasr/5.3.2
===========

Attempted to compile from source, using ninja/1.9.0 and meson/0.49.2, but
failed.  Some template issue involving an HDF5 constructor, it appeared.  So,
I'm moving to conda.

Define the install prefix by setting both `CONDA_ENVS_PATH` and the `-p
<prefix>` option to conda.

LOG
---

    VERSION=5.3.2
    cd /sw/bioinfo/blasr
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    PFX=$PWD/$CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in snowy bianca irma ; do ln -s $CLUSTER $CL; done
    mkdir src
    cd src
    module load python/2.7.15
    module load mc3
    which conda
    export CONDA_ENVS_PATH=$PFX
    export CONDA_ENVS_PATH=$PFX
    conda install -p $PFX -c bioconda blasr

