ml python/2.7.11
ml bioinfo-tools
ml hdf5/1.8.18
ml samtools
ml glpk
export PYTHONUSERBASE='/sw/apps/bioinfo/OptiType/1.3.1/rackham/python_libs'
# export HDF5_DIR=/path
# numpy does not need to be installed localy as numpy an scipy is auto loaded  by the pot lib is done ython module 
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

