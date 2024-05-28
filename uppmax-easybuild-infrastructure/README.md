Establishing infrastructure for EasyBuild builds
================================================

Here we gather scripts, tables, and other databases to help us switch our software builds over to easybuild.



Existing module versions and modification times
-----------------------------------------------

Build a table that gathers the existing versions for each module in the /sw tree together with modification times for the corresponding version directories.

This is accomplished with the `sw-version-table.pl` perl script.

Using this we create tables under `tables/` that begin with `sw.` for each of the `/sw/` subdirectories.

- `apps`
- `bioinfo`
- `build`
- `comp`
- `libs`
- `parallel`

Produce these tables with:


    module load perl_modules/5.32.1

    for D in apps bioinfo build comp libs parallel ; do ./sw-version-table.pl /sw/$D > tables/sw.$D.tsv 2>tables/sw.$D.errors; done



Associate our module names and versions with EasyBuild easyconfigs
------------------------------------------------------------------

Build a translation table between our module names and EasyBuild module names.

And our module versions and EasyBuild module versions.



EasyBuild installation solutions
--------------------------------

Build a table that documents EasyBuild build support, or lack thereof, for our modules.

