Ragout/2.1.1
========================

<https://github.com/fenderglass/Ragout>

Used under license:
BSD, GPL v3

Structure creating script (makeroom_Ragout_2.1.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/Ragout/makeroom_2.1.1.sh


    mkdir Ragout
    cd Ragout/
    VERSION=2.1.1
    mkdir ${VERSION}
    cd ${VERSION}
    mkdir $CLUSTER src
    [[ $CLUSTER == rackham ]] && for CL in irma snowy bianca ; ln -s $CLUSTER $CL ; done
    cd src
    [[ -f ${VERSION}.tar.gz ]] || wget --timestamping https://github.com/fenderglass/Ragout/archive/${VERSION}.tar.gz
    [[ -d ]] && rm -rf 
    tar xzf 
    cd Ragout/
    module load bioinfo-tools
    module load python/2.7.15
    module load gcc/6.3.0
    module load hal/20161130
    module load SiBELia/3.0.7
    make
    view ragout.py 
    which python2.7

Now to test.

    ./ragout.py examples/E.Coli/ecoli.rcp --outdir examples/E.Coli/out/ --refine

If it worked:

    rm -rf examples/E.Coli/out/
