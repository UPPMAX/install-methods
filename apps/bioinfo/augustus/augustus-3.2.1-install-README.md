augustus 3.2.1
==============

Precompiled executables do not work.  See notes for 3.0.1.

This took quite a bit of tweaking, not for the main tool but for tools under
`auxprogs/`.  I modified the mf file for bamtools/2.3.0 to define CPATH,
BAMTOOLS and LD_RUN_PATH so it could be compiled against when the module is
loaded.  Then I editted the bamtools-referring Makefiles there, and also the
samtools references so they pointed to the src directory for samtools/0.1.19.
I had to make some significant modifications to the one that wanted samtools,
since it wanted both htslib and samtools but was not prepared to deal with
a missing `bam_index_core` as is in samtools/1.2.  So I pointed it to the
appropriate directories for samtools/0.1.19.

    cd /sw/apps/bioinfo/augustus
    mkdir 3.2.1
    cd 3.2.1
    mkdir milou src
    cd src

Get the augustus bundle and unpack it.
 
     cd augustus-3.2.1/

We will not build the comparative gene prediction (CGP) version.  We could, but
no one has asked for this yet.  Be careful not to define SQLITE nor MYSQL
support in common.mk, otherwise it will assume you want CGP.

Assuming you have made the appropriate Makefile edits in `auxprogs/` as
described above, build things:

    module load zlib gcc/4.9.2
    module load boost/1.59.0_gcc4.9.2
    module load bioinfo-tools bamtools/2.3.0
    make

Since 3.0.1 many of the auxprogs/ Makefiles copy to bin/, except for
checkTargetSortedness, which I think is also the one that wants samtools.

Once everything is built, copy the whole tree over to the cluster directory.
We require the config/ directory contents, might as well copy everything.

    cp -av ../../milou/

We can use the mf file from augustus/2.7.  All we need to do is add
$modroot/bin to PATH and set AUGUSTUS_CONFIG_PATH to $modroot/config, and the
one for 2.7 already does that.

Set up mf links for milou and add tintin.


