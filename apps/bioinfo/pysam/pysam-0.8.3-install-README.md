Fortunately, pip worked fine for the new pysam version!

export PYTHONPATH=/sw/apps/bioinfo/pysam/0.8.3-py27/milou/lib/python2.7/site-packages
mkdir -p /sw/apps/bioinfo/pysam/0.8.3-py27/milou/lib/python2.7/site-packages
pip install --install-option="--prefix=/sw/apps/bioinfo/pysam/0.8.3-py27/milou" pysam

export PYTHONPATH=/sw/apps/bioinfo/pysam/0.8.3/milou/lib/python2.7/site-packages
mkdir -p /sw/apps/bioinfo/pysam/0.8.3/milou/lib/python2.7/site-packages
pip install --install-option="--prefix=/sw/apps/bioinfo/pysam/0.8.3/milou" pysam

mkdir -p /sw/apps/bioinfo/pysam/0.8.3-py3/milou/lib/python3.4/site-packages
export PYTHONPATH=/sw/apps/bioinfo/pysam/0.8.3-py3/milou/lib/python3.4/site-packages
pip3 install --install-option="--prefix=/sw/apps/bioinfo/pysam/0.8.3-py3/milou" pysam
