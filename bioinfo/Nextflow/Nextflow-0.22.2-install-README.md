nextflow 0.22.2
===============

Data pipeline tool

<https://www.nextflow.io/>

The major challenge with this installation is to keep nextflow from requiring
its java launcher to be written to a module-resident directory.  Since it has
no provision for using anything other than NXF_HOME, which needs to be set to
the module directory, I modified the main script to use NXF_TEMP for that and
to generate an error if it can't be used.

I forked the repository for these changes, but haven't settled on final
changes.  I think using something like NXF_LAUNCHDIR and then falling back on
NXF_TEMP and only then attempting NXF_HOME would be a reasonable cascade, but I
haven't implemented all of that yet.

<https://github.com/douglasgscofield/nextflow>

LOG
---

    cd /sw/apps/bioinfo/Nextflow/
    mkdir -p 0.22.2/milou
    cd 0.22.2/milou

During installation, set `NXF_HOME` to a subdirectory of the installation
directory so that the Java jars get installed to a within-module location.

    mkdir nxf_home
    export NXF_HOME=$PWD/nxf_home

    wget -qO- get.nextflow.io | bash

Unfortunately this has the side effect of attempting to install the launchers
there as well, in `$NXF_HOME/tmp`.  After a bit of trial and error, I realised
the need to make my own fork, modify the `nextflow` file,  and install from that.

    wget -qO- https://raw.githubusercontent.com/douglasgscofield/nextflow/master/nextflow | bash

Now the `nextflow` script needs `NXF_TEMP` to be set to run for users, and the
mf file produces a message to that effect.
