Stampy/1.0.32
=====

Stampy short read aligner

Lunter G, Goodson M.  2011.  Stampy: a statistical algorithm for sensitive and
fast mapping of Illumina sequence reads. Genome Res. 21:936-939.

<http://www.well.ox.ac.uk/project-stampy>

LOG
---

Add `-L/sw/comp/python/2.7.15_rackham/lib -Wl,-rpath,/sw/comp/python/2.7.15_rackham/lib -Wl,-rpath,/sw/comp/gcc/5.4.0_rackham/lib64` to the final link line for Linux.
It seeds to find the python .so and the gcc libraries.

    VERSION=1.0.32
    cd /sw/apps/bioinfo/Stampy
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    wget http://www.well.ox.ac.uk/bioinformatics/Software/Stampy-latest.tgz
    tar xvzf Stampy-latest.tgz 
    cd stampy-$VERSION
    module load gcc/5.4.0
    module load python/2.7.15

Now edit `makefile` to add 
`-L/sw/comp/python/2.7.15_rackham/lib -Wl,-rpath,/sw/comp/python/2.7.15_rackham/lib -Wl,-rpath,/sw/comp/gcc/5.4.0_rackham/lib64` to the final link line for Linux.
It adds paths to `maptools.so` RPATH to find the python .so and the gcc libraries.

Also, move this directory up to the cluster directory.

    make
    cd ..
    mv stampy-$VERSION ../rackham
    cd ..
    for CL in bianca irma snowy ; do ln -s rackham $CL ; done
