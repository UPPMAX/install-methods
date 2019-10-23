tigmint/1.1.2
=============


All the `*.py` scripts have their `#!` lines fixed, but not the `tigmint*` scripts.

    TOOL=tigmint
    VERSION=1.1.2
    PYTHONVERSION=3.7.2
    PYTHONMMVERSION=${PYTHONVERSION%.*}
    cd /sw/bioinfo
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p $VERSION
    cd $VERSION
    mkdir $CLUSTER
    PREFIX=$PWD/$CLUSTER
    [[ $CLUSTER == rackham ]] && ( for CL in irma bianca snowy ; do ( test -L $CL || ln -s $CLUSTER $CL ) ; done
    module load python/$PYTHONVERSION
    PYTHONUSERBASE=$PREFIX pip3 install --user tigmint
    cd $PREFIX/bin
    sed -i -e "s,/usr/local/opt/python/bin/python${PYTHONMMVERSION},/sw/comp/python/${PYTHONVERSION}_${CLUSTER}/bin/python${PYTHONMMVERSION},' tigm*
    head -1 *

Load the same version of python and add `$modroot/lib/python${PYTHONMMVERSION}/site-packages` to `PYTHONPATH`.
