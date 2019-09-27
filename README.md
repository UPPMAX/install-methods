Module Installation Methods
===========================

This is a collection of READMEs generated during installation of software
applications on Uppmax clusters.  It is incomplete in terms of modules
available on Uppmax, and the individual READMEs may also be incomplete in terms
of what was actually done to install the modules.  We are publicising these in
the hopes that they can be helpful.

Example workflow of a basic installation
-------
1. Clone the install methods git repo (`git clone https://github.com/UPPMAX/install-methods.git`)
1. Add the repo to your `$PATH` and source the `uppmax_functions.sh` file to get access to the functions.
1. Run `run_makeroom` with at least `-t` and `-v`, to generate a `.sh` (`makeroom_toolname_version.sh`) file that will create the directory structure needed in `/sw`
1. Run the `.sh` file created in the directory you are standing to create the directory structure (`/sw/category/toolname/` and `/sw/mf/common/category`) and template files.
1. Put the source code for the program in `/sw/category/toolname/version/src`
1. Compile and/or install the tool in `/sw/category/toolname/version/cluster/bin` etc.
1. Edit the readme file, explaining how you did the installation, in `/sw/category/toolname/toolname-version_install-README.md`
1. Edit the template module file `/sw/category/toolname/mf/version` to do what you want when the module loads.
1. Copy the module file to the live location, `/sw/mf/common/category/[section]/toolname`
1. Run `all_mflink toolname version` to create links for all clusters to the module file in `/sw/mf/common/category/[section]/toolname`
1. Run `fixup /sw/category/toolname/version /sw/mf/common/category/[section]/toolname` to make sure the ownership and permissions are ok.

Scripts
-------

`gather-READMEs.sh` - bash script to scan installation directories, looking for
README files having a particular filename format that we create during
installation of tools

`fixup` - bash script fixing up permissions and group membership within
installation trees; our local installation group is `sw`. With the `-g` option,
this script will `chmod g+s` directories in the tree, too.

`uppmax-functions.sh` - bash helper functions for SLURM job viewing and various
module-related tasks, mostly to do with setting up mf files for loading
modules; the latter require appexpert privileges.  Source these from `.bashrc`.

Installation directories
------------------------

The directories contain software installations in major subject areas.

### apps/

General applications.

### apps/bioinfo/

Bioinformatics applications.

### libs/

Libraries.

### comp/

Compilers, interpreters, build tools.


Database directories
--------------------

These directories cover installations of databases updated either manually, or via update scripts.

### data_uppnex/

Installation instructions for databases under `/sw/data/uppnex/`.  Database
directories containing `*-install-README.md` files are updated manually.
Database directories containing `*-db-README.md` files and scripts (currently,
`Kraken`, `diamond_databases` and `RTG`) are updated monthly via crontab entries.

Blast database updates are included here, and involve multiple scripts, crontab
entries and a test directory.  These are updated monthly via crontab entries.

### data_other/

Installation instructions for databases under other locations, currently just
`BUSCO` lineage sets, which are kept in the module installation directory.
These are updated monthly via crontab entries.

