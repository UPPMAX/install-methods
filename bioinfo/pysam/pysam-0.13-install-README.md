pysam/0.13
==========

This installs `pysam/0.13-python2.7.11` and `pysam/0.13-python3.6.0`.

pysam: reading, manipulating and writing genomic data sets
<https://pypi.python.org/pypi/pysam>


    function python_user_install() {

        local PACKAGE_NAME=${1:?first argument is package name}
        local PACKAGE_VERSION=${2:?second argument is package version}
        local PYTHON_VERSION=${3:?third argument is python module version to load}

        [[ ${PYTHON_VERSION%%.*} == 3 ]] && PIP=pip3 || PIP=pip

        local MODULE_VERSION=${PACKAGE_VERSION}-python${PYTHON_VERSION}
        local PREFIX=/sw/apps/bioinfo/$PACKAGE_NAME/$MODULE_VERSION/$CLUSTER

        echo "installing $PACKAGE_NAME $PACKAGE_VERSION into $PREFIX using $PIP ..."

        module load python/$PYTHON_VERSION
        mkdir -p $PREFIX
        PYTHONUSERBASE=$PREFIX $PIP install --user $PACKAGE_NAME==$PACKAGE_VERSION
    }

    python_user_install pysam 0.13 2.7.11
    python_user_install pysam 0.13 3.6.0
