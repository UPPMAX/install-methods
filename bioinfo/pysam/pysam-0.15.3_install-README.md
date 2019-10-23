pysam/0.15.3
============

This installs `pysam/0.15.3-python3.6.8` and `pysam/0.15.3-python3.7.2`.

pysam: reading, manipulating and writing genomic data sets
<https://pypi.python.org/pypi/pysam>


    function python_user_install() {

        local PACKAGE_NAME=${1:?first argument is package name}
        local PACKAGE_VERSION=${2:?second argument is package version}
        local PYTHON_VERSION=${3:?third argument is python module version to load}

        local MODULE_VERSION=${PACKAGE_VERSION}-python${PYTHON_VERSION}
        local TOOLVERSION=/sw/bioinfo/$PACKAGE_NAME/$MODULE_VERSION
        local PREFIX=${TOOLVERSION}/$CLUSTER

        echo "installing $PACKAGE_NAME $PACKAGE_VERSION into $PREFIX using $PIP ..."

        module load python/$PYTHON_VERSION
        mkdir -p $PREFIX
        cd $TOOLVERSION
        for CL in irma snowy bianca ; do ( test -L $CL || ln -s $CLUSTER $CL ) ; done
        PYTHONUSERBASE=$PREFIX pip install --user $PACKAGE_NAME==$PACKAGE_VERSION
    }

    python_user_install pysam 0.15.3 3.6.8
    python_user_install pysam 0.15.3 3.7.2

