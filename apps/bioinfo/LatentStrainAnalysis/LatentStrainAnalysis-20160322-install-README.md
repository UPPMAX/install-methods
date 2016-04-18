LatentStrainAnalysis 20160322
=============================

<http://latentstrainanalysis.readthedocs.org/en/latest/>

<https://github.com/brian-cleary/LatentStrainAnalysis>

The most recent commit at that repository is 20150429 and there seems not to
have been much communication from the developer in a while.  Nevertheless we
forge onward.

It seems dependent upon working in place, so I fork and add some mods to allow
running the bash scripts directly and the use of a `LSA` environment variable
to find the python scripts.  Another fork contained a bugfix, so that is what I
forked from:

<https://github.com/sunitj/LatentStrainAnalysis>

I commited those edits and now I am testing.

<https://github.com/douglasgscofield/LatentStrainAnalysis>

    mkdir /sw/apps/bioinfo/LatentStrainAnalysis
    cd /sw/apps/bioinfo/LatentStrainAnalysis
    mkdir 20160322 mf
    mkdir milou src

Install python prerequisites.

    cd milou
    P=$PWD
    module load python/2.7.9
    module load gcc/4.9.2
    module load libcurl/7.45.0
    PYTHONUSERBASE=$P pip install NumPy SciPy Cython Gensim Pyro4 --user

Check that gnuparallel does not have the issue noted in the readthedocs page.

    module load gnuparallel
    parallel --version

Now get my fork.

    cd ../src
    git clone git://github.com/douglasgscofield/LatentStrainAnalysis.git
    cp -avr LatentStrainAnalysis ../milou/

Set up mf file that sets LSA, loads python/2.7.9 and gnuparallel/20140222, and
sets PYTHONPATH and LD_LIBRARY_PATH appropriately.

