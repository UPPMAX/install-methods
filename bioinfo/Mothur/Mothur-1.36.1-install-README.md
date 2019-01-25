Mothur 1.36.1
=============

<http://www.mothur.org/>

Wes downloaded the tarfile several weeks ago, I finished up the installation.
Note that 1.33.1 was MPI-enabled, but MPI is planned on being removed
(<http://www.mothur.org/forum/viewtopic.php?t=3465>).  The build instructions
for 1.36.1 do not mention it, so I am building without it.

    cd /sw/apps/Mothur/1.36.1
    mkdir src milou
    ln -s ./milou halvan
    ln -s ./milou nestor
    mv v1.36.1.tar.gz  src/
    cd src/
    tar xzf v1.36.1.tar.gz 
    cd mothur-1.36.1/
    module load gcc/4.9.2
    module load boost/1.59.0_gcc4.9.2
    module load zlib

Now edit the `makefile` as follows.  It comes assuming OSX by default, and
fixed directories for Boost, and zlib.a rather than libz.a for ZLIB.  Comment
out the BOOST_INCLUDE_DIR because appropriate environment vars are set by the
`boost/1.59.0_gcc4.9.2` module.  Also, note that the default SL6.7 boost
libraries will not work since it does not supply static libraries.  There are
static libraries in the module.

**SEE BELOW** for issues that require us to instead comment out the tune and
arch options.

````
milou1: /sw/apps/bioinfo/Mothur/1.36.1/src/mothur-1.36.1 $ diff makefile.orig makefile
26c26
<     TARGET_ARCH += -arch x86_64
---
>     #TARGET_ARCH += -arch x86_64
34c34
<     #CXXFLAGS += -mtune=native -march=native
---
>     CXXFLAGS += -mtune=native -march=native
67,68c67,68
<     BOOST_INCLUDE_DIR="/usr/local/include"
<     BOOST_LIBRARY_DIR="/usr/local/lib"
---
>     #BOOST_INCLUDE_DIR="/usr/local/include"
>     #BOOST_LIBRARY_DIR="/usr/local/lib"
73,74c73,74
<     ${BOOST_LIBRARY_DIR}/libboost_iostreams.a \
<     ${BOOST_LIBRARY_DIR}/zlib.a
---
>     /sw/apps/build/boost/1.59.0_gcc4.9.2/milou/lib/libboost_iostreams.a \
>     /sw/libs/zlib/1.2.8/lib/libz.a
````

Now make and copy executables over to `bin/`.

    make
    cd ../../
    cd milou/
    mkdir bin
    cd bin
    cp ../../src/mothur-1.36.1/{mothur,uchime} .

Copy over the `blast/2.2.25` executables from 1.33.1.

    cp -av ../../../1.33.3/milou/bin/blast .

Repeat from the beginning for tintin.  On tintin, `module load build-tools` is
necessary before loading boost.


Special compilation for halvan
------------------------------

Normally we have no special compilation required for the same executables to
work on milou and halvan.  But (I think) `-mtune=native -march=native` ends up
adding non-halvan instructions which result in "Illegal instruction (core
dumped)" when run on halvan (Uppmax support ticket #125774).  So, I compiled
specifically on halvan and it seems to work.

    ssh h1  # this gets you to halvan from a milou or tintin login node

Then proceed as above.

Well... this is not actually true.  The getCluster function within the mf file
returns 'milou' when run on h1, so I cannot effectively create a
halvan-specific executable tree.  Submitted a ticket to figure out why this is.

So what I have done is comment out the `-march=native -mtune=native` line in
the Mothur makefile, rebuilt on milou, and verified that this ran on halvan.
Then I moved the existing executables to `{mothur,uchime}-milou-specific`,
added these new executables as `{mothur,uchime}-generic` and provided symbolic
links to these from `mothur` and `uchime`.

Turns out there is a bug in the module system, but fixing it is not worthwhile
as halvan will be decommissioned soon.  I moved the halvan executables to the
milou/bin/ folder and deleted the halvan-specific bin tree.

