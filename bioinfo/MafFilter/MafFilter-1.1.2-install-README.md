MafFilter 1.1.2
===============

<http://biopp.univ-montp2.fr/forge/maffilter>


    cd /sw/apps/bioinfo/
    mkdir MafFilter
    cd MafFilter
    mkdir 1.1.2 mf
    cd 1.1.2/

Installing the prebuilt linux-64 executables.  Shoudl be good for all systems.

    mkdir milou
    ln -s ./milou nestor
    ln -s ./milou halvan
    ln -s ./milou tintin

Unpack them into a src directory.

    mkdir src
    cd src/
    wget http://biopp.univ-montp2.fr/repos/exe/lin64/maffilter/maffilter-x86_64-bin-static-1.1.2-1.tar.gz
    wget http://biopp.univ-montp2.fr/repos/exe/lin64/maffilter/maffilter-x86_64-bin-static-1.1.2-1.tar.gz.md5
    md5sum -c *.md5
    tar xvzf maffilter-x86_64-bin-static-1.1.2-1.tar.gz 

Move the executable to the cluster directory.

    cp MafFilter/maffilter ../milou
    cd ..

Get a simple mf file and edit it.

    cd mf
    cp ../../RACA/mf/0.9.1.1 1.1.2
    vi 1.1.2

