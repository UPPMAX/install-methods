progressiveCactus 2016-12-01
============================

<https://github.com/douglasgscofield/progressiveCactus>

This is built around creating a Python virtualenv.  Given the large number of
tools involved, I decided to keep it this way.  Wes installed the previous
version virtualenv-free, so see his mf for an idea how that might be done.  I
am simply adding a directory link to allow for tintin as whole genome alignment
tends to be memory-hungry and those nodes likely have too little RAM for most
jobs.

    VERSION=2016-12-01
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/
    cd progressiveCactus/
    module load git
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src_$CLUSTER
    cd src_$CLUSTER
    module load python/2.7.6
    module load gcc/5.3.0

Note we are using the default gcc (4.4.7).  It compiles much easier this way.

    git clone git://github.com/glennhickey/progressiveCactus.git
    cd progressiveCactus
    git pull
    git submodule update --init

# is this still true??
#
#Despite the ease of compilation, we still need to make some modifications to
#the `hal/` submodule, see `hal-20151218-install-README.md` for the necessary
#makefile modifications.
#
#    cd hal/src
#    ....

Now make the whole thing, this should just work.  Note we are building in what
should be the final install directory rather than a separate `src/`.

    make

One of the products of this build is the file `environment`, which is meant to
be `source`d to set up the virtualenv, `PATH`, etc.  See the `environment` file
for this version to see how to set up a flexible root via the `PSROOT`
variable.  If later versions do not add additional variables you should be able
to use the one from this version.  Note I also added a line adding `$PSROOT/bin`
to `PATH` so the `runProgressiveCactus.sh` script is available in the virtualenv
as well.

Also, create an `mf` file that sets `PSROOT` and instructs users to load the
virtualenv by doing `source $PSROOT/environment`.

