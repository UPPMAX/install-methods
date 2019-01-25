cutadapt/1.14
=============

Following Marcel Martin's advice for installing on a cluster with a robust virtualenv:

<https://cutadapt.readthedocs.io/en/stable/installation.html#shared-installation-on-a-cluster>

LOG
---

    cd /sw/apps/bioinfo/cutadapt/
    VERSION=1.14
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    cd $CLUSTER
    mkdir bin
    module load python/2.7.6
    which virtualenv
    P=$PWD
    virtualenv $P/venv
    source $P/venv/bin/activate

Make sure environment variables were inherited.

    [[ "$P" ]] || echo "P not set"
    [[ "$VERSION" ]] || echo "VERSION not set"
    [[ "$LD_RUN_PATH" ]] || echo "LD_RUN_PATH not set"

Change rpath for the virtualenv's python if it is not already set.

    if which chrpath >& /dev/null ; then
        chrpath `which python` || ( module load patchelf/0.8 && patchelf --set-rpath "$LD_RUN_PATH" --force-rpath `which python` )
        chrpath `which python` || echo "**** could not set RPATH"
    else
        ( module load patchelf/0.8 && patchelf --set-rpath "$LD_RUN_PATH" --force-rpath `which python` )
    fi

Now install cutadapt using pip:

    $P/venv/bin/pip install --install-option="--install-scripts=$P/bin" cutadapt==$VERSION

and leave the virtualenv:

    deactivate

For the mf file, remove everything including the python module load, and only
keep the `PATH` setting.

Be a good citizen.

    cd ../..
    fixup -g 1.14

