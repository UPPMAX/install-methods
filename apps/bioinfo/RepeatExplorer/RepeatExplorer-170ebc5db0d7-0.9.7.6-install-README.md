# RepeatExplorer-170ebc5db0d7-0.9.7.6-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

RepeatExplorer 170ebc5db0d7 aka 0.9.7.6

Note that internally the version is provided as both the bitbucket repository
hash, and the developer version as determined from the repository tags (see
below).  The tags version (here 0.9.7.6) is used for the module version.


DESCRIPTION
-----------

Repeat discovery tool


WEBSITE
-------

    http://www.repeatexplorer.org


MODULE REQUIREMENTS
-------------------

This module has a lot of prerequisites.  Some are already Uppmax modules, some
are not.  There is number of additional dependencies not provided by
RepeatExplorer authors.  Some seem to be only required by a Galaxy install of
RepeatExplorer, but I am installing as many as I can regardless so full 
functionality is available to those who know how to get it.  Additional
programs required include:

R programming environment (http://www.r-project.org). Beside R core
installation, additional library must be installed: foreach, igraph, getopt,
R2HTML, lattice, doMC, multicore, ape and Biostrings (available from
http://www.bioconductor.org)

- *Perl programming language (http://http://www.perl.org/) with Bio::SeqIO module installed*

- *Python (http://www.python.org) version 2.6.x*

- *ImageMagick (http://www.imagemagick.org)*

TGICL TGICL is now provided with RepeatExplorer, see the directory tgicl_linux.

- *NCBI Basic Local Alignment Search Tool version 2.2.xx, available from
  ftp://ftp.ncbi.nlm.nih.gov/blast/executables/release//. version 2.2.21 was
tested*  

- *RepeatMasker executables and database (http://www.repeatmasker.org) must be installed*

- `bin/cross_match` *together with cross_match search engine
  http://www.phrap.org.* Built from my own licenced version, and placed in
`bin/` with permissions 771 to disallow copying as per licence.
$TOOLcross_match

RepeatMasker is provided with only a minimal database of repeats. To enhance
its functionality, Repbase, a database of repetitive DNA elements must be
obtained from http://www.girinst.org/. (see Repbase Update(2005), a database of
eukaryotic repetitive elements. Cytogentic and Genome Research 110:462-467 for
detailes)

- `module load emboss/6.4.0` *The European Molecular Biology Open Software
  Suite (EMBOSS) available from http://emboss.sourceforge.net*

- `module load muscle/3.8.31` *Muscle - Multiple sequence alignment program
  available from http://www.drive5.com/muscle/*

Graph based clustering is performed using the Louvain method. Original source
code which is available from https://sites.google.com/site/findcommunities was
modified to make it suitable for RepeatExplorer. Source is located in louvain
direcory must be compiled using make

fasty36 http://faculty.virginia.edu/wrpearson/fasta/

GNU parallel is now provided with RepeatExplorer http://www.gnu.org/software/parallel/

Conserve Domain Database (CDD) can be obtained from NCBI ftp
site:ftp://ftp.ncbi.nih.gov/pub/mmdb/cdd/


LOG
===

Following the install for a module system as described in the package README.txt:

    TOOL=/sw/apps/bioinfo/RepeatExplorer

The version is the bitbucket commit hash for the version we are downloading, we
only really know this once we have downloaded and unzipped the file.

    VERSION=170ebc5db0d7
    mkdir -p $TOOL/$VERSION/src
    cd $TOOL/$VERSION/src
    # get RepeatExplorer
    wget https://bitbucket.org/repeatexplorer/repeatexplorer/get/stable.zip
    unzip stable.zip
    CLUSTER=milou
    mv repeatexplorer-repeatexplorer-$VERSION/* ../$CLUSTER

What is our version?  Look for the latest tag

    cd repeatexplorer-repeatexplorer-$VERSION/*
    cat .hg_archival.txt
    cd ..
    REPOSITORY_VERSION=$VERSION
    VERSION=0.9.7.6
    ln -sf $REPOSITORY_VERSION $VERSION

This creates the milou directory.  Modify permissions and group.

    cd ..
    chmod -R g+w .
    chgrp -hR sw .

Get legacy blast, we do not have this version installed in the module system.

    wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/release/LATEST/blast-2.2.26-x64-linux.tar.gz 
    tar xvzf blast-2.2.26-x64-linux.tar.gz

Shift all perl and python files from #!/usr/bin/perl|python to 
#!/usr/bin/env perl|python.  Get the list of files needed.  A recent commit to
the bitbucket site for RepeatExplorer did this as well, but that is in a
development branch.  Edit all files which use this mechanism and verify that
all files are changed.  If either vi fails to open any files, then there are
no problems.

    vi $(find . -name "*.pl" -exec grep -lF '#!/usr/bin/perl' {} \;)
    vi $(find . -name "*.py" -exec grep -lF '#!/usr/bin/python' {} \;)
    find . -name "*.pl" -print -exec head -n 1 {} \;
    find . -name "*.py" -print -exec head -n 1 {} \;

Compile the local version of louvain for clustering

    cd louvain
    make
    cd ..

Make cross_match.

    cd $TOOL/cross_match
    make
    cd $TOOL/$VERSION/$CLUSTER
    mkdir bin
    chmod 775 bin
    cd bin
    cp $TOOL/cross_match/cross_match .
    chmod 771 cross_match
    cd ..

Install Python packages
------------------

We need the Python package Levenshtein for test5, so install some local packages
and add $TOOL/$VERSION/$CLUSTER/pyhon_packages/lib/python2.7/site-packages to
both PYTHONPATH and LD_LIBRARY_PATH.

    export RE_PYTHON=$TOOL/$VERSION/$CLUSTER/python_packages
    mkdir -p $RE_PYTHON
    pip install --install-option="--prefix=$RE_PYTHON" python-Levenshtein

Install R packages
------------------

Unclear if these are required for command-line operation
but they must be useful anyway.  First create the directory that will be added
to R_LIBS_USER when the user loads the module.

    R_LIBS_USER=$TOOL/$VERSION/milou/R_packages
    mkdir -p $R_LIBS_USER
    # Be sure to add this directory to R_LIBS_USER in the mf file

Now get the package sources.  The README.txt says it needs foreach, igraph,
getopt, R2HTML, lattice, doMC, multicore, ape and Biostrings; Biostrings
is available from http://www.bioconductor.org.  I do not know about prereqs
for the others yet, but I am guessing that Biostrings has a few others.  Any
other prereqs installed are included below.

As it turns out, the latest versions of most Bioconductor packages were not
used, because they required R 3.1 and we have R 3.0.1 on the nodes.  The wget
commands are for the specific versions that were used for this install, with
links to older versions from
http://www.bioconductor.org/packages/2.13/BiocViews.html#___Software.  It took
a bit of trial and error with `R CMD INSTALL` to figure out what needed to be
older and what did not.

    cd ../src
    wget http://bioconductor.org/packages/release/bioc/src/contrib/BiocGenerics_0.10.0.tar.gz
    wget http://www.bioconductor.org/packages/2.13/bioc/src/contrib/IRanges_1.20.7.tar.gz
    wget http://www.bioconductor.org/packages/2.13/bioc/src/contrib/XVector_0.2.0.tar.gz
    wget http://www.bioconductor.org/packages/2.13/bioc/src/contrib/Biostrings_2.30.1.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ BiocGenerics_0.10.0.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ IRanges_1.20.7.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ XVector_0.2.0.tar.gz
    R CMD INSTALL -l $R_LIBS_USER/ Biostrings_2.30.1.tar.gz

Other packages.

    wget http://cran.r-project.org/src/contrib/ape_3.1-1.tar.gz
    wget http://cran.r-project.org/src/contrib/multicore_0.1-7.tar.gz
    wget http://cran.r-project.org/src/contrib/foreach_1.4.2.tar.gz
    wget http://cran.r-project.org/src/contrib/igraph_0.7.1.tar.gz
    wget http://cran.r-project.org/src/contrib/getopt_1.20.0.tar.gz
    wget http://cran.r-project.org/src/contrib/R2HTML_2.2.1.tar.gz
    wget http://cran.r-project.org/src/contrib/lattice_0.20-29.tar.gz
    wget http://cran.r-project.org/src/contrib/doMC_1.3.3.tar.gz
    R CMD INSTALL -l $R_LIBS_USER ape_3.1-1.tar.gz
    R CMD INSTALL -l $R_LIBS_USER multicore_0.1-7.tar.gz
    wget http://cran.r-project.org/src/contrib/iterators_1.0.7.tar.gz
    R CMD INSTALL -l $R_LIBS_USER iterators_1.0.7.tar.gz
    R CMD INSTALL -l $R_LIBS_USER foreach_1.4.2.tar.gz
    R CMD INSTALL -l $R_LIBS_USER igraph_0.7.1.tar.gz
    R CMD INSTALL -l $R_LIBS_USER getopt_1.20.0.tar.gz
    R CMD INSTALL -l $R_LIBS_USER R2HTML_2.2.1.tar.gz
    R CMD INSTALL -l $R_LIBS_USER lattice_0.20-29.tar.gz
    R CMD INSTALL -l $R_LIBS_USER doMC_1.3.3.tar.gz


Install CDD database
--------------------

The CDD database was downloaded, we need the prepaired little-endian
versions, now available under

    /sw/data/uppnex/cdd/little_endian/

The table required was also downloaded and unpacked and is at

    /sw/data/uppnex/cdd/cddid_all.tbl
    
This page
<http://vcru.wisc.edu/simonlab/bioinformatics/programs/install/repeatexplorer.htm>
shows managing the CDD database as

    mkdir cdd && cd cdd
    wget -N ftp://ftp.ncbi.nih.gov/pub/mmdb/cdd/cddid.tbl.gz
    wget -N ftp://ftp.ncbi.nih.gov/pub/mmdb/cdd/little_endian/Cdd_LE.tar.gz
    tar -zxvf Cdd_LE.tar.gz
    gunzip cddid.tbl.gz
    export RPSBLAST_DATABASE=/usr/local/bin/repeatexplorer/cdd
    export RPSBLAST_DATABASE_ANNOTATION=/usr/local/bin/repeatexplorer/cdd/cddid.tbl

An open question is if I supply the directory name (as above) in the config.sh
or if I supply the "stem" of the database, as is typical with blast databases.
I currently am supplying the step but that might be wrong... hopefully we will
see after tests/test4.sh completes.


Configuration file config.sh
----------------------------

Commandline config file is the one for metacentrum.

    mv config.sh config_galaxy.sh
    mv config_metacentrum.sh config.sh

Modify config file to use RE_ROOT instead of ROOT, so set RE_ROOT in mf file

    vi config.sh


I do not know what else it might require as far as memory configuration etc.


Module file
-----------

It needs RepeatMasker and python >= 2.6, so add to mf file. Our RepeatMasker
version already includes the large database of repeats from www.girinst.org.  I
am also adding everything it says it needs for the Galaxy version, to have as
complete functionality as possible.

    module load RepeatMasker/4.0.1
    module load python/2.7.6
    module load BioPerl/1.6.1_PERL5.10.1
    module load emboss/6.4.0
    module load muscle/3.8.31
    module load fasta/36.3.6d

At least for this release, the mf file is named $REPOSITORY_VERSION and the
$VERSION is a symbolic link to this.


Testing
------

During testing, found several of these messages

	[blastall] ERROR: No argument value given for Database
	[blastall] ERROR: No argument value given for Database

I thought this was because of my changing the specification of the RPSBLAST
database in config.sh, so I changed it back to include the prefix but the
messages still appear.

