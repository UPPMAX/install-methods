progressiveCactus/0.1-c4bed56
============================

<https://github.com/glennhickey/progressiveCactus>

This is built around creating a Python virtualenv.  Given the large number of
tools involved, I decided to keep it this way.  Wes installed the previous
version virtualenv-free, so see his mf for an idea how that might be done.  I
am simply adding a directory link to allow for tintin as whole genome alignment
tends to be memory-hungry and those nodes likely have too little RAM for most
jobs.

    VERSION=0.1-c4bed56
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/
    cd progressiveCactus/
    module load git
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER
    cd $CLUSTER
    module load python/2.7.15
    module load gcc/4.9.4
    git clone git://github.com/glennhickey/progressiveCactus.git
    cd progressiveCactus
    PFX=$PWD
    git pull
    git submodule update --init
    make

One of the products of this build is the file `$PFX/environment`, which is meant to
be `source`d to set up the virtualenv, `PATH`, etc.  See the `environment` file
for this version to see how to set up a flexible root via the `PSROOT`
variable.  If later versions do not add additional variables you should be able
to use the one from this version.  Note I also added a line adding `$PSROOT/bin`
to `PATH` so the `runProgressiveCactus.sh` script is available in the virtualenv
as well.

Also, create an `mf` file that sets `PSROOT` and instructs users to load the
virtualenv by doing `source $PSROOT/environment`.

