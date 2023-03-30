PCAngsd/1.11
============

<https://github.com/Rosemeis/pcangsd>

Used under license:
GPL v3


Structure creating script (makeroom_PCAngsd_1.11.sh) moved to /sw/bioinfo/PCAngsd/makeroom_1.11.sh


* This is built within a virtualenv and linked... it should work fine this way (we've tested)
* Test data is fetched and we tell users about it in the module help
* We also provide an executable version of the R script


LOG
---

    makeroom.sh "-t" "PCAngsd" "-s" "misc" "-v" "1.11" "-w" "https://github.com/Rosemeis/pcangsd" "-d" "framework for analyzing low depth NGS data in heterogeneous populations using PCA" "-l" "GPL v3" "-f"
    ./makeroom_PCAngsd_1.11.sh


    module load python/3.9.5
    module load gcc/10.3.0
    module load git/2.34.1

    source /sw/bioinfo/PCAngsd/SOURCEME_PCAngsd_1.11 && cd $SRCDIR
    git clone https://github.com/Rosemeis/pcangsd.git
    cd pcangsd/
    virtualenv --system-site-packages $PREFIX/venv
    $PREFIX/venv/bin/pip install .
    cd $PREFIX
    mkdir bin
    cd bin
    ln -s $PREFIX/venv/bin/pcangsd .

Add RPATH for gcc/10.3.0 to the .so files.

    cd $PREFIX/venv/lib/python3.9/site-packages/pcangsd/
    MY_RPATH="$LD_LIBRARY_PATH"
    module purge
    module load uppmax
    module load patchelf/0.10
    for F in $(file *.so | grep 'ELF 64-bit' | cut -f1 -d:) ; do
        CURRENT_RPATH=$(patchelf --print-rpath $F)
        NEW_RPATH=$(echo "$MY_RPATH:$CURRENT_RPATH" |  tr ':' '\n' | sort -Vu | tr '\n' ':')
        patchelf --set-rpath "$NEW_RPATH" $F
    done

    module purge
    ldd $(file *.so | grep 'ELF 64-bit' | cut -f1 -d:)


Provide R script referenced in help.

    cd $PREFIX/bin
    cp -av $SRCDIR/pcangsd/scripts/pcadapt.R .
    sed -i '1i #!/usr/bin/env Rscript' pcadapt.R
    chmod +x pcadapt.R

The user needs to load R_packages to run this script.


Run tests
---------

Provide test data for users in `$PREFIX`.

    cd $PREFIX
    mkdir -p test/output
    cd test
    wget popgen.dk/software/download/NGSadmix/data/Demo1input.gz
    wget popgen.dk/software/download/NGSadmix/data/Demo1pop.info
    $PREFIX/bin/pcangsd -b  Demo1input.gz -e 2 -t 10 -o output/Demo1PCANGSD_1
    $PREFIX/bin/pcangsd -b  Demo1input.gz -e 2 -t 10 -o output/Demo1PCANGSD_2 --selection --admix
    cd output

Test loading matrices in python.

    python

Then within python:

    import numpy as np
    C = np.genfromtxt("Demo1PCANGSD_2.cov") # Reads in estimated covariance matrix (text)
    D = np.load("Demo1PCANGSD_2.selection.npy") # Reads PC based selection statistics

And test within R.

    module load R_packages/4.1.1
    R

And then within R:

    library(RcppCNPy)

    C <- as.matrix(read.table("Demo1PCANGSD_2.cov")) # Reads in estimated covariance matrix
    D <- npyLoad("Demo1PCANGSD_2.selection.npy") # Reads PC based selection statistics

    # Plot PCA plot
    e <- eigen(C)
    plot(e$vectors[,1:2], xlab="PC1", ylab="PC2", main="PCAngsd")

    # Obtain p-values from selection scan
    p <- pchisq(D, 1, lower.tail=FALSE)


For the mf file
---------------

Add `$modroot/bin` to `PATH`, mention what needs to be done to run `pcadapt.R`, and the availability of the test data.

