In these instructions, "x.xx" represented "1.64" but should be applicable to later versios as well.

0. mkdir -p /sw/apps/bioinfo/biopython/x.xx/$CLUSTER
1. wget http://biopython.org/DIST/biopython-x.xx.tar.gz
2. cd /sw/apps/bioinfo/biopython/x.xx
3. tar xzf biopython-x.xx.tar.gz
4. mv biopython-x.xx src
5. cd src
6. module load python/2.7.6
7. python setup.py install --prefix=/sw/apps/bioinfo/biopython/x.xx/$CLUSTER

Set up module file in the appropriate manner
