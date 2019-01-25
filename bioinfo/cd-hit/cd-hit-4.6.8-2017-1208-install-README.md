cd-hit/4.6.8-2017-1208
======================

<https://github.com/weizhongli/cdhit>

LOG
---

Replace `#!/usr/bin/perl` with `#!/usr/bin/env perl`.
Make cd-hit and install the top-level executables and the auxtools.
Also add the psi-cd-hit/ directory to `PATH`.


    VERSION=4.6.8-2017-1208
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/
    mkdir cd-hit
    cd cd-hit/
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    PFX=$PWD/$CLUSTER
    [[ "$CLUSTER" == "rackham" ]] && for CL in bianca irma ; do ln -s $CLUSTER $CL; done
    cd src
    [[ -f cd-hit-v${VERSION}-source.tar.gz ]] || wget https://github.com/weizhongli/cdhit/releases/download/V${VERSION%%-*}/cd-hit-v${VERSION}-source.tar.gz

    [[ -d cd-hit-v${VERSION} ]] && rm -rf cd-hit-v${VERSION}
    tar xzf cd-hit-v${VERSION}-source.tar.gz
    cd cd-hit-v${VERSION}

    for F in *.pl; do sed -i 's,^#!/usr/bin/perl.*$,#!/usr/bin/env perl,' $F; done
    cd cd-hit-auxtools/
    for F in *.pl; do sed -i 's,^#!/usr/bin/perl.*$,#!/usr/bin/env perl,' $F; done
    cd ../psi-cd-hit/
    for F in *.pl; do sed -i 's,^#!/usr/bin/perl.*$,#!/usr/bin/env perl,' $F; done
    cd ..

    module load gcc/4.9.4
    make
    cd cd-hit-auxtools/
    make
    cd ..
    PREFIX=$PFX make install
    cd cd-hit-auxtools/
    cp -i cd-hit-dup cd-hit-dup-PE-out.pl cd-hit-lap read-linker $PFX/
    cd ..

    cp -av psi-cd-hit $PFX/

    cd ..
    rm -rf cd-hit-v${VERSION}

