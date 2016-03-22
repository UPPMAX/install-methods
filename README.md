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


Installation directories
--------------------

The directories contain software installations in major subject areas.

### apps/

General applications.

### apps/bioinfo/

Bioinformatics applications.

### libs/

Libraries.

### comp/

Compilers, interpreters, build tools.

