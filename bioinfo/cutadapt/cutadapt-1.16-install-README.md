cutadapt/1.16
=============

Following Marcel Martin's advice for installing on a cluster with a robust virtualenv:

<https://cutadapt.readthedocs.io/en/stable/installation.html#shared-installation-on-a-cluster>

LOG
---

    cd /sw/apps/bioinfo/cutadapt/
    VERSION=1.16
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    [[ $CLUSTER == rackham ]] && for CL in irma bianca ; do ln -s $CLUSTER $CL ; done
    cd $CLUSTER
    PFX=$PWD
    mkdir bin
    module load python/3.5.0
    virtualenv $PFX/venv
    $PFX/venv/bin/pip install --install-option="--install-scripts=$PFX/bin" cutadapt==$VERSION

Make sure the virtualenv's python can find the python .so.

    module unload python
    ldd $(head bin/cutadapt | cut -c3-)

All libraries should be located.

Add `$PFX/bin` to `PATH`.

Be a good citizen.

    cd ../..
    fixup -g 1.16

