# h5utils-1.12.1-install-README.md

h5utils/1.12.1
==============

Small set of utilities for manipulating hdf4 and hdf5 files

<http://ab-initio.mit.edu/wiki/index.php/H5utils>


Log
---

    cd /sw/apps/
    mkdir h5utils
    module load gcc/4.9.2

Download from above directory.

Install Gnu libmatheval, which requires adding `%option yywrap` to
`lib/scanner.l`, see
<http://stackoverflow.com/questions/1811125/undefined-reference-to-yywrap>.

Load guile, hdf4 and hdf5.  The configure for h5utils will not find libdf,
which it should, but according to h5utils documentation the conversion
utilities in later hdf4/hdf5 are better than the h5utils versions.

Sorry it is not more explicit, the major stumbling block is the `yywrap` thing
above.

