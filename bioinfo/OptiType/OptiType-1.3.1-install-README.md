ml python/2.7.11
ml bioinfo-tools
ml hdf5/1.8.18
ml samtools
ml glpk
export PYTHONUSERBASE='/sw/apps/bioinfo/OptiType/1.3.1/rackham/python_libs'
  TOOL=OptiType

    VERS=1.3.1
    APPS=/sw/apps/bioinfo
    INST=$APPS/$TOOL/$VERS/$CLUSTER


# export HDF5_DIR=/path
# numpy does not need to be installed localy as numpy an scipy is auto loaded  by the pot lib is done ython module 
#from pysam installation file to figure out a good strategy for installing
#installation
#------------
#
#Installed via Python's pip. If there's reason to suspect that
#PYTHONPATH isn't empty, could prepend to the old value.
#Can change the object of the pip command to "$TOOL==$VERS"
#(double equals) to install a version other than the latest.
#
##    TOOL=pysam
#    VERS=0.9.1.4
#    module load python/2.7.6
#
#    # The remainder should be the same for most python-based modules
#    APPS=/sw/apps/bioinfo
#    INST=$APPS/$TOOL/$VERS/$CLUSTER
#    echo $INST # sanity check
#    mkdir -p $INST
#    export PYTHONPATH=$INST/lib/python2.7/site-packages
#    pip install --install-option="--prefix=$INST" $TOOL

pip install --user future
pip install --user pymo
pip install --user pysam
pip install --user table
pip install --user pandas==0.16.2
git clone https://github.com/FRED-2/OptiType.git
cp OptiType/config.ini.example ../
cp -r OptiType/data  ../
cp -r OptiType/test  ../
cp  OptiType/LICENSE  ../
cp  OptiType/*.py ../
mv *.py bin/

