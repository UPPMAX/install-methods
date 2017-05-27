TEtools/1.0.0-283c1ca
=====================

<https://github.com/l-modolo/TEtools>

Version based on tool's stated version (1.0.0), but there have been 108 commits
since the initial one carrying that version in the source.  So, append the hash
for the latest commit from the original repository above.  My fork has further
commits, but we don't use those to set the version.

Some options for TEcount are not available through the command line options.
They are defined in a TEcount.ini file. This file contains options like the
size of a siRNA, the number of threads to use or the path of the different
programs called by TEcount. By defaut, this TEcount.ini file is created with
default options, if not found in the same directory as the file TEcount.py.

Fork the repository, now in <https://github.com/douglasgscofield/TEtools>. 

  * `TEcount.ini`: move `sirna_size` and `thread` from config to options
  * `PingPong.ini`: move `min-alignment-length`, `max-alignment-length` and `thread` from config to options
  * changing `#!` lines to `#!/usr/bin/env python3`
  * setting +x on the .py scripts and removing it from one of the xml scripts

Unstated R library requirements:

    suppressMessages(require(genefilter, quietly = TRUE))
    suppressMessages(require(DESeq2, quietly = TRUE))
    suppressMessages(require(gplots, quietly = TRUE))
    suppressMessages(require(ggplot2, quietly = TRUE))
    suppressMessages(require(RColorBrewer, quietly = TRUE))

These can all be handled by loading `R_packages/3.3.2`.

LOG
---

    VERSION=1.0.0-283c1ca
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    cd /sw/apps/bioinfo/
    mkdir TEtools
    cd TEtools
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    cd $CLUSTER
    PFX=$PWD
    cd ../src

    module load R_packages/3.3.2
    module load python/3.5.0

This python3 versions is on all systems.  The README for the project says it
needs `configparser` python package installed, but it is already part of the
`python/3.5.0` module.  No other prereqs, the stated dependency libxml2-dev
appears to be satisfied as well.

    git clone git@github.com:douglasgscofield/TEtools.git
    cd TEtools/
    vi TEcount.py 
    vi TEdiff.py
    vi PingPong.py

In these edits, change hash-bang lines, move some variables to command-line
options, correct a typo refering to the `pingpongpro` executable, etc.  See
commit history.

    chmod +x TEcount.py 
    chmod -x TEcount.xml 
    chmod +x TEdiff.R
    chmod +x fix_rosette.py 
    chmod +x PingPong.py 

Generate TEcount.ini and PingPong.ini files.

    ./TEcount.py -h
    ./PingPong.py -h

Modify `.gitignore` to ignore the .ini files, and commit/push to my fork.

Now, copy over to cluster directory.

    cp -av * $PFX/

For the module file, we load `R_packages/3.3.2` and `python/3.5.0` and just the
cluster directory to `PATH`.  The same cluster directory should work for all
systems.

