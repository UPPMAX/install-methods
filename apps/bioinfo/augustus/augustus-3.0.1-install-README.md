augustus 3.0.1
==============

Precompiled executables do not work.  They want libc 2.14 or 2.15, and boost
1.46.0.  Need to compile from source.

This took quite a bit of tweaking, not for the main tool but for tools under
`auxprogs/`.  I modified the mf file for bamtools/2.3.0 to define CPATH,
BAMTOOLS and LD_RUN_PATH so it could be compiled against when the module is
loaded.  Then I editted the bamtools-referring Makefiles there, and also the
samtools references so they pointed to the src directory for samtools/0.1.19.

    cd /sw/apps/bioinfo/augustus
    mkdir 3.0.1
    cd 3.0.1
    mkdir milou src
    cd src

Get the augustus bundle and unpack it.
 
    wget wget http://bioinf.uni-greifswald.de/augustus/binaries/augustus.3.0.1.tar.gz
    tar xzf augustus.3.0.1.tar.gz
    cd augustus-3.0.1/

We will not build the comparative gene prediction version.  We could, but no
one has asked for this yet.

Assuming you have made the appropriate Makefile edits in `auxprogs/` as
described above, build things:

    module load zlib gcc/4.9.2
    module load boost/1.59.0_gcc4.9.2
    module load bioinfo-tools bamtools/2.3.0
    make

Dip into `auxprogs/` and copy new executables up to bin/.

Once everything is built, copy the whole tree over to the cluster directory.
We require the config/ directory contents, might as well copy everything.

    cp -av ../../milou/

We can use the mf file from augustus/2.7.  All we need to do is add
$modroot/bin to PATH and set AUGUSTUS_CONFIG_PATH to $modroot/config, and the
one for 2.7 already does that.

Set up mf links for milou and add tintin.

