# Stampy-1.0.27-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    Stampy 1.0.27

DESCRIPTION
-----------

    Stampy short read aligner

    Lunter G, Goodson M.  2011.  Stampy: a statistical algorithm for sensitive and
    fast mapping of Illumina sequence reads. Genome Res. 21:936-939.


WEBSITE
-------

    http://www.well.ox.ac.uk/project-stampy

MODULE REQUIREMENTS
-------------------

    Add /sw/apps/bioinfo/Stampy/1.0.27/milou to the user PATH, and load python/2.7.6
    with the module.

Note that I modified the makefiles to use -L and -Wl,-rpath,... options to hard-code
the name of the python2.8 library into the executables.

