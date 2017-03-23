Ragout-2.0-20170312-install-README.md
=====================================

    mkdir Ragout
    cd Ragout/
    mkdir 2.0-20170312
    cd 2.0-20170312/
    mkdir milou src_milou
    cd src_milou/
    module load git/2.10.2
    git clone --recursive https://github.com/fenderglass/Ragout.git
    cd Ragout/
    module load bioinfo-tools
    module load python/2.7.6
    module load gcc/6.3.0
    module load hal/20161130
    module load SiBELia/3.0.6
    make
    view ragout.py 
    which python2.7

Now to test.

    ./ragout.py examples/E.Coli/ecoli.rcp --outdir examples/E.Coli/out/ --refine

If it worked:

    rm -rf examples/E.Coli/out/
