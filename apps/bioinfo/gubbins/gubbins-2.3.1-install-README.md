gubbins/2.3.1
=============

This version no longer creates a subdirectory `python_packages`, it just
installs them into the `$PFX` tree alonside everything else.  Simpler
installation here and one fewer addition to `PATH` in the mf file.

There might be some errors in the `autoreconf -i` step.  It needs to be done
before a Perl module is loaded since `autoreconf` hardcodes `#!/usr/bin/perl`
and you get an error like

    /usr/bin/perl: symbol lookup error: /sw/comp/perl_modules/5.24.1/milou/lib/perl5/x86_64-linux-thread-multi/auto/List/Util/Util.so: undefined symbol: Perl_xs_handshake

The `make install` will fail when attemtping to do the python installations,
because the python module directory is not writable.  Thank goodness.  We then
go to the src's `python/` subdirectory and do `python3 setup.py install
--prefix=$PFX`, return one level up, and `make -k install` to keep going
through errors.  The python component is last (for now) but this will have make
to any final installations and cleanup if any.

The mf file is similar to 1.4.2 with versio updates, but no need to load FastML
as that has been removed from gubbins 2
(<https://github.com/sanger-pathogens/gubbins/issues/167>).  I've also added
settings of `LD_LIBRARY_PATH` and `LIBRARY_PATH` since it provides both dynamic
and static `libgubbins`.  It is not required for the gubbins executable since
that has RPATH set correctly.


LOG
---

    VERSION=2.3.1
    mkdir -p /sw/apps/bioinfo/gubbins
    cd /sw/apps/bioinfo/gubbins
    mkdir $VERSION
    cd $VERSION
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir $CLUSTER
    [[ "$CLUSTER" == "rackham" ]] && for CC in bianca irma ; do ln -s $CLUSTER $CC; done
    PFX=$PWD/$CLUSTER
    mkdir $PFX
    mkdir src
    cd src
    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/sanger-pathogens/gubbins/archive/v${VERSION}.tar.gz
    [[ -d gubbins-${VERSION} ]] && rm -rf gubbins-${VERSION}
    tar xzf v${VERSION}.tar.gz
    cd gubbins-${VERSION}
    [[ "$CLUSTER" == "milou" ]] && module load autoconf/2.69
    autoreconf -i --force
    [[ "$CLUSTER" == "milou" ]] && module unload autoconf/2.69


    module load gcc/6.3.0
    module load python/3.4.3
    module load bioinfo-tools
    module load biopython/1.68-py3
    module load perl/5.24.1
    module load perl_modules/5.24.1
    module load BioPerl/1.7.1_Perl5.24.1
    module load raxml/8.2.10-gcc
    module load FastTree/2.1.8

    PYTHONUSERBASE=$PFX pip3 install --user DendroPy Reportlab nose pillow

    export PYTHONPATH=$PFX/lib/python3.4/site-packages:$PYTHONPATH
    export PATH=$PFX/bin:$PATH

    ./configure --prefix=$PFX
    make
    make install

    cd python
    python3 setup.py install --prefix=$PFX
    cd ..
    make -k install
    cd ..

    rm -rf gubbins-${VERSION}
    cd $PFX/bin
    chmod -x easy_install* nosetests* pip*

