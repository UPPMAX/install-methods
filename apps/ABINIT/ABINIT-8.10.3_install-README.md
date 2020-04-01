ABINIT/8.10.3
=========


This was installed with EasyBuild.  The mf file is an 'alias' mf file that sets up and loads the EasyBuild module directly.


LOG
---

The certificate for abinit.org was not valid, so I had to download the source directly with wget into the EasyBuild tree.


    TOOL=ABINIT
    VERSION=8.10.3
    TOOLCHAIN=intel-2018b
    cd /sw/EasyBuild/
    source source-me-for-EasyBuild-4.1.1-rackham 
    eb --module-depends-on --module-syntax=Lua --robot --umask=002 ${TOOL}-${VERSION}-${TOOLCHAIN}.eb --dry-run

Download source.

    cd /sw/EasyBuild/rackham/sources/a/ABINIT
    wget --no-check-certificate https://www.abinit.org/sites/default/files/packages/abinit-${VERSION}.tar.gz
    cd /sw/EasyBuild
    eb --module-depends-on --module-syntax=Lua --robot --umask=002 ${TOOL}-${VERSION}-${TOOLCHAIN}.eb

    module load ${TOOL}/${VERSION}-${TOOLCHAIN}
    abinit --help
