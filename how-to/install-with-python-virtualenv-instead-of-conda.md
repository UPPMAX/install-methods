How to install with a python virtualenv instead of conda
========================================================

Here we replace a conda envirnment with a python virtualenv and module loads.

This is based on the installation of read2tree/0.1.5-20240117-ff2d167.

<https://github.com/DessimozLab/read2tree>

In this example, the installation instructions recommend a conda environment,
but do a good job listing the separate requirements of the tool: python
packages separate from executable tools. Most of the tools we have as modules.
the one we didn't was a long-read aligner that looks really good, so I
installed that as a separate module.


#### Versioning the installation

There are various updates in the main github branch that look important, but
are not yet bundled into a version.  So I base our module off the main branch
and give it a useful version that reflects this.  The most recent version was
0.1.5, while the most recent commit was on 20240117 with commit hash beginning
with ff2d167. So, I give this module the version 0.1.5-20240117-ff2d167.

**It is very important to use the order version-date-hash** when versioning
this way, so the module version sort order is sensible. Date is formatted
YYYYMMDD. With this composite name, this version sorts *after* the base 0.1.5
version. If there are further interim versions after this but before the next
base version, using the date right after the base version will ensure a newer
interim version with a later date will sort after this one.


#### Python dependency

Issues in the issue tracker at the github repository suggest that installing
with other than a python 3.10.z might not work, so we'll start with our module
python/3.10.8.


#### Explicit python package dependencies

It lists python package dependencies numpy, scipy, cython, lxml, tqdm, pysam,
pyparsing, requests, filelock, natsort, pyyaml, biopython, ete3, dendropy.


#### Implicit python package dependencies

In its own `environment.yaml` and `setup.py` it also includes pyham.


#### Explicit module dependencies

It lists MAFFT, samtools, NextGenMap, ngmlr, iqtree as dependencies. We have
all of these but ngmlr, which looks like a great long-read mapper, so I
installed that as a new module.


#### Implicit module dependencies

It also uses, later in the instructions, the executable name `iqtree`, which
means that its version of `iqtree` must be one of the 1.y.z versions rather
than one of the 2.y.z versions, which have executable names that begin within
`iqtree2`. So, we'll make sure to use an iqtree 1 module.


### The installation

I'm assuming you've `makeroom.sh`-d an environment and have source'd the
SOURCEME file.


#### Fixing on the right version

We clone the github repository and reset the head to the commit we're
versioning on. This way, if we reinstall, this will still be fixed at this
commit even if there are later ones.

    cd $SRCDIR
    ml git/2.34.1
    git clone --recursive https://github.com/DessimozLab/read2tree
    cd read2tree/
    git reset --hard ff2d167
    ml -git


#### Creating the virtualenv

After observing the above, we set up a virtualenv under `PREFIX`. Make sure the
python3 and pip3 comes from the virtualenv, and then install the python package
dependencies.


    cd $PREFIX
    ml python/3.10.8
    virtualenv venv
    source venv/bin/activate
    ml -python
    which python3
    which pip3
    pip3 install biopython numpy Cython ete3 lxml tqdm scipy pyparsing requests natsort pyyaml filelock dendropy pysam pyham


We wait to set up the tool itself till a bit later.


#### Loading dependent modules

Prior to installing the tool, we load the dependent modules in case it
checks for their executables during its installation.


    ml bioinfo-tools
    ml MAFFT/7.407 
    ml samtools/1.19
    ml NextGenMap/0.5.5
    ml ngmlr/0.2.7-20210816-a2a31fb
    ml iqtree/1.6.12-omp-mpi


Make sure to include these in `depends-on` lines within the mf file.


#### Installing the tool itself

The tool includes a `setup.py` so it should be directly installable using pip3.
Head back over to the cloned repository and install from there. We use `pip3`
which is still from the virtualenv, so this should install directly into our
virtualenv.

This will also do any further installations it thinks it needs; this is where I
noticed that they had left pyham out of the list of python package
dependencies.


    cd $SRCDIR
    cd read2tree/
    pip3 install .


That went well.


#### Populating the bin/ directory for the module

We do not activate the virtualenv to use the module. Instead, we 'lift out'
symlinks to the executables needed for running the tool. These will run within
the virtualenv and get their python dependencies from there. They will get
their tool dependencies from `PATH` after loading module dependencies.

**Do not add the virtualenv's own `bin/` to `PATH`**.  That directory will be
littered with executables that should not be exposed: pip3, python3, f2c, etc.
We only want to expose the executables that are required for running the tool.

Instead, create a `$PREFIX/bin/` directory and within that, symlinks to
relevant executables from the virtualenv. Examining the virtualenv's `bin/` we
see `read2tree` as well as some others related to the dendropy, ete3 and
natsort packages. These might or might not be required, but it should not hurt
to include them. The tool might expect these to be available in `PATH`.


    cd $PREFIX
    mkdir bin
    cd bin
    ln -s $PREFIX/venv/bin/{dendropy-format,ete3,natsort,read2tree,sumlabels.py,sumtrees.py} .


#### Verify that the python in the virtualenv is being used

Verify that the #! lines refer to the python3 within the virtualenv.


    head -n 1 *


Deactivate the environment and test the help for `read2tree`.


    deactivate
    ./read2tree


#### Testing

This tool also includes a test data suite, so run on this as well. That should
be done by loading the newly installed module. Be sure the mf file is ready.
Run the module's `post-install.sh` script, load the module, and run the test
suite.


    ml bioinfo-tools
    ml read2tree/0.1.5-20240117-ff2d167

    cd /sw/bioinfo/read2tree/0.1.5-20240117-ff2d167/src/read2tree/test

    read2tree --debug --tree --standalone_path marker_genes/ --reads sample_1.fastq sample_2.fastq --output_path output.1853 --dna_reference dna_ref.fa


Running this, the output looked ok, but there was an error from numpy and the
tree branch lengths weren't quite right, so I opened an issue at github. Turns
out the results were fine
(<https://github.com/DessimozLab/read2tree/issues/57>).
