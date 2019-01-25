cutadapt 1.13
=============

Following Marcel Martin's advice for installing on a cluster with a robust virtualenv:

<https://cutadapt.readthedocs.io/en/stable/installation.html#shared-installation-on-a-cluster>

LOG
---

    cd /sw/apps/bioinfo/cutadapt/
    VERSION=1.13
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    cd $CLUSTER
    mkdir bin
    module load python/2.7.6
    which virtualenv

If no virtualenv installed, go install it for that python module version.  Back
in business here:

    P=$PWD
    virtualenv $P/venv

Now this **must** be activated, otherwise it will try to install into the
module python.  Make sure it is active by checking for the `(venv)` prefix on
the command prompt.

    source $P/venv/bin/activate

Make sure environment variables were inherited.

    [[ "$P" ]] || echo "P not set"
    [[ "$VERSION" ]] || echo "VERSION not set"
    [[ "$LD_RUN_PATH" ]] || echo "LD_RUN_PATH not set"

Change rpath for the virtualenv's python if it is not already set.  First, see if there is `chrpath`.

    which chrpath >/dev/null 2>&1 || echo "**** chrpath not found"

If `chrpath` was found (no message), then do:

    chrpath `which python` || ( module load patchelf/0.8 && patchelf --set-rpath "$LD_RUN_PATH" --force-rpath `which python` )
    chrpath `which python` || echo "**** could not set RPATH"

If `chrpath` was not found, then do:

    ( module load patchelf/0.8 && patchelf --print-rpath `which python` )

If that did not show the path for python 2.7.6 for the cluster, then do

    ( module load patchelf/0.8 && patchelf --set-rpath "$LD_RUN_PATH" --force-rpath `which python` )

Now install cutadapt using pip:

    $P/venv/bin/pip install --install-option="--install-scripts=$P/bin" cutadapt==$VERSION

and leave the virtualenv:

    deactivate

For the mf file, remove everything including the python module load, and only
keep the `PATH` setting.  **ALSO** set up `.version` so default version is 1.13.

Be a good citizen.

    cd ../..
    fixup -g 1.13

