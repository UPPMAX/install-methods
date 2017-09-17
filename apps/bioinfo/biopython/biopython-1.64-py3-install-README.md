In these instructions, "x.xx" represented "1.64" but should be applicable to later versios as well.
[Likely that the source has already been downloaded but safer to unpack a fresh copy.]

0. mkdir -p /sw/apps/bioinfo/biopython/x.xx-py3/$CLUSTER
1. wget http://biopython.org/DIST/biopython-x.xx.tar.gz
2. cd /sw/apps/bioinfo/biopython/x.xx
3. tar xzf biopython-x.xx.tar.gz
4. mv biopython-x.xx src
5. cd src
6. module load python/3.3.1
7. python3 setup.py install --prefix=/sw/apps/bioinfo/biopython/x.xx-py3/$CLUSTER

Set up module file in the appropriate manner
