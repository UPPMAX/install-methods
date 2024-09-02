Establishing infrastructure for EasyBuild builds
================================================

Here we gather scripts, tables, and other databases to help us switch our software builds over to easybuild.



Existing module versions and modification times
-----------------------------------------------

Build a table that gathers the existing versions for each module in the /sw tree together with modification times for the corresponding version directories.

This is accomplished with the `sw-version-table.pl` perl script.

Using this we create tables under `tables/` that begin with `sw.` for each of the `/sw/` subdirectories.

- `apps`  : `sw.apps.tsv` for the table and `sw.apps.errors` for errors and warnings, and so on
- `bioinfo`
- `build`
- `comp`
- `libs`
- `parallel`
- all together : `sw.tsv` for the full table and `sw.errors` for the full set of errors and warnings

Produce these tables with:

    module load perl_modules/5.32.1

    for D in apps bioinfo build comp libs parallel ; do ./sw-version-table.pl /sw/$D > tables/sw.$D.tsv 2>tables/sw.$D.errors; done
    ( cd tables && cat sw.*.tsv > sw.tsv && cat sw.*.errors > sw.errors )



Associate our module names and versions with EasyBuild easyconfigs
------------------------------------------------------------------

Build a translation table between our module names and EasyBuild module names.

And our module versions and EasyBuild module versions.

This is accomplished with the `uppmax-to-easybuild-map.pl` script.

The cloned repositories for us to search are under `easybuild-cloned-repositories/`.  This directory is added to our `.gitignore`.

    ml git/2.44.0
    git clone https://github.com/easybuilders/easybuild-easyconfigs

Fred Hutch easyconfigs.

    git clone https://github.com/FredHutch/easybuild-life-sciences
    cd fh_easyconfigs



EasyBuild installation solutions
--------------------------------

Build a table that documents EasyBuild build support, or lack thereof, for our modules.

