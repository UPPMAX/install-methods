    cd /sw/apps/bioinfo
    mkdir poretools
    cd poretools/
    mkdir 0.5.1-devel
    cd 0.5.1-devel/
    mkdir milou src
    git clone https://github.com/arq5x/poretools
    module load gcc/4.9.2 
    module load python/2.7.9

It asks for hdf5 1.8.7 but during build h5py says 1.8.5, even when I do 'module load fysast hdf5'.

    PFX=/sw/apps/bioinfo/poretools/0.5.1-devel/milou/bin
    python setup.py install --prefix=$PFX
    export PYTHONPATH=/sw/apps/bioinfo/poretools/0.5.1-devel/milou/lib/python2.7/site-packages/
    python setup.py install --prefix=$PFX

    export PATH=/sw/apps/bioinfo/poretools/0.5.1-devel/milou/bin:$PATH
    which poretools
    poretools --help

