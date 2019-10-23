Download libpsortb and psortb from http://www.psort.org

export INST=/sw/apps/bioinfo/psortb/3.0
export Cluster=milou

Unpack libpsortb-1.0.tar.gz into $INST/src
> cd $INST/src/libpsortb-1.0
> ./configure PREFIX=$INST/$Cluster
> make && make install
> export LD_LIBRARY_PATH=$INST/$Cluster/lib64:$LD_LIBRARY_PATH
The last command is a substitute for "ldconfig" in the package instructions

Unpack bio-tools-psort-all.3.0.3.tar.gz into $INST/src
> cd $INST/src/bio-tools-psort-all
> module load bioinfo-tools  pftools/2.3  blast/2.2.26  BioPerl/1.6.924_Perl5.18.4
Note that legacy blast is needed, despite the ambiguity in documentation

> perl Makefile.PL INSTALL_BASE=$INST/$Cluster
This script seems to ignore the INSTALL_BASE (PREFIX also tried) and asks for
the location of peices installed in "libpsortb", despite LD_LIBRARY_PATH
Just ignore the dire warnings that LD_LIBRARY_PATH will need to be set at
every invocation.

> make
> make test
> make install
> cp -rp psort/* $INST/$Cluster/
First copied psort folder under milou but found no clashes and it seemed more
natural this way.

Make local databases
> cd $INST/$Cluster/conf/analysis/sclblast
> ./makedb.sh

Edit first line of $INST/$Cluster/bin/psort from 
"/usr/bin/perl" to "/usr/bin/env perl" to avoid weird error message

Note that psort script defines pftools and blast variables so these were 
skipped in the module file.

Made a symbolic link to PSORTb in case users expected to use this name
