STAR
====

Spliced Transcripts Alignment to a Reference  
<https://github.com/alexdobin/STAR>

Installation
-------------
The top-level Makefile doesn't have alternative targets but the executables
are relocatable. So, just make in the source folder and copy the created
executables into the cluster folders. Compiled default and "long" versions.

Downloaded source for desired version from https://github.com/alexdobin/STAR
Unpack to "src" in version folder

Skipping the highest level makefile to avoid the long list of dependencies
for the documentation ... which is better read online anyway.

Log
----
    module load gcc/4.9.2
    cd src/source

    make clean   # clean is incomplete
    cd htslib ; make clean ; cd ..

    make
    cp STAR ../../$CLUSTER/bin

    make clean
    cd htslib ; make clean ; cd ..

    make STARlong
    cp STARlong ../../$CLUSTER/bin

    cd ../../$CLUSTER/bin
    ln -s STAR star
    ln -s STARlong starlong
