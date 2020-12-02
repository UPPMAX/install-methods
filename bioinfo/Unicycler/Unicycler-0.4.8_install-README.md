Unicycler/0.4.8
=========


This was installed with EasyBuild.  The mf file is an 'alias' mf file that sets up and loads the EasyBuild module directly.


LOG
---

On rackham:

    TOOL=Unicycler
    VERSION=0.4.8
    TOOLCHAIN=gompi-2020a-Python-3.8.2
    cd /sw/EasyBuild/
    source source-me-for-EasyBuild-4.3.0-rackham 
    eb --module-depends-on --module-syntax=Lua --robot --umask=002 ${TOOL}-${VERSION}-${TOOLCHAIN}.eb --dry-run

and build.

    eb --module-depends-on --module-syntax=Lua --robot --umask=002 ${TOOL}-${VERSION}-${TOOLCHAIN}.eb

Repeat for snowy.
