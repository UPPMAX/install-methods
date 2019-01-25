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

pip install --user future
pip install --user pymo
pip install --user pysam
pip install --user table
pip install --user pandas==0.16.2
mkdir $APPS/$TOOL/$VERS/src
cd $APPS/$TOOL/$VERS/src
wget http://packages.seqan.de/razers3/razers3-3.5.4-Linux-x86_64_sse4.tar.xz
tar -xvf razers3-3.5.4-Linux-x86_64_sse4.tar.xz
cp razers3-3.5.4-Linux-x86_64_sse4/bin/razers3 $INST/bin/ 
git clone https://github.com/FRED-2/OptiType.git
cp OptiType/config.ini.example $INST/ 
cp -r OptiType/data  $INST/
cp -r OptiType/test  $INST/
cp  OptiType/LICENSE  $INST/
cp  OptiType/*.py  $INST/
cd $INST
cd ..
[[ $CLUSTER == rackham ]] && for CL in snowy bianca irma ; do ln -s $CLUSTER $CL ; done
