beast/1.8.4
===========

<http://beast.community/>

LOG
---

    CL=rackham
    VERSION=1.8.4
    cd /sw/apps/bioinfo/beast
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    wget https://github.com/beast-dev/beast-mcmc/releases/download/v${VERSION}/BEASTv${VERSION}.tgz
    tar xvzf BEASTv${VERSION}.tgz 
    mv BEASTv${VERSION} ../$CL
    cd ..
    for C in milou irma bianca ; do ln -s rackham $C; done

Now for the mf file, create a separate one for this version of beast.  Load the
latest java 8, and load `beagle/2.1.2` if another beagle is not loaded.

