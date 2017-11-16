Module Installation Methods
===========================

This is a collection of READMEs generated during installation of software
applications on Uppmax clusters.  It is incomplete in terms of modules
available on Uppmax, and the individual READMEs may also be incomplete in terms
of what was actually done to install the modules.  We are publicising these in
the hopes that they can be helpful.

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

Testing -- [httpsreference][sreference] -- [numbersreference][1] -- [sreference][] -- [sreference].

[sreference]: https://www.ncbi.nlm.nih.gov/taxonomy
[1]: https://www.ncbi.nlm.nih.gov/taxonomy

Testing -- [httpsreference][reference] -- [numberreference][2] -- [reference][] -- [reference].

[reference]: http://www.ncbi.nlm.nih.gov/taxonomy
[2]: http://www.ncbi.nlm.nih.gov/taxonomy

Testing ftp -- [ftp][ftp] -- [numberftp][3] -- [ftp][] -- [ftp].

[ftp]: ftp://ftp.ncbi.nih.gov/pub/taxonomy
[3]: ftp://ftp.ncbi.nih.gov/pub/taxonomy

