maker/3.01.2-beta and maker/3.01.2-beta-mpi
=================

Built without and with MPI support.

Switching everything to perl/5.24.1

There is also a new augustus/3.3 which I am not yet installing.

LOG
---

    VERSION=3.01.2-beta
    TOOLVERSION=3.01.02-beta
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/bioinfo/maker
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p src
    [[ "$CLUSTER" == "irma" ]] && ln -s $CLUSTER bianca
    cd src

Get the maker 3.01.02-beta tarball from
http://yandell.topaz.genetics.utah.edu/cgi-bin/maker_license.cgi and move it to
Uppmax.  Let's assume it is moved to `$VERSION/src` already.

    [[ -f maker-${TOOLVERSION}.tgz ]] && tar xzf maker-${TOOLVERSION}.tgz

Move the `maker` directory to be the new `$CLUSTER` directory, and continue the
build there.

    mv maker ../$CLUSTER
    cd ../$CLUSTER

Load prerequisites.  Move forward to `perl/5.24.1` etc.

    module load gcc/6.3.0
    module load perl/5.24.1
    module load perl_modules/5.24.1
    module load sqlite/3.16.2
    module load bioinfo-tools
    module load BioPerl/1.7.1_Perl5.24.1
    module load RepeatMasker/4.0.7_Perl5.24.1
    module load blast/2.6.0+
    module load snap/2013-11-29
    module load exonerate/2.2.0
    module load augustus/3.2.3_Perl5.24.1
    module load tRNAscan-SE/1.3.1
    module load GeneMark/4.33-es_Perl5.24.1

    cd src
    perl Build.PL

This is the configurations step.  It will complain about not finding `DBD::Pg`
but we don't care.  That is used in some chado-gff3 interchange scripts.  After
this is complete, you will see a number of lines with the results:

    ==============================================================================
    STATUS MAKER v3.1.2
    ==============================================================================
    PERL Dependencies:    VERIFIED
    External Programs:    VERIFIED
    External C Libraries:    VERIFIED
    MPI SUPPORT:        DISABLED
    MWAS Web Interface:    DISABLED
    MAKER PACKAGE:        CONFIGURATION OK

Then build it:

    ./Build install

This is it.  Make sure the mf file is updated with the modules loaded above.


maker/3.01.2-beta-mpi
=================

    VERSION=3.01.2-beta-mpi
    TOOLVERSION=3.01.02-beta
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/bioinfo/maker
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p src
    [[ "$CLUSTER" == "irma" ]] && ln -s $CLUSTER bianca
    cd src

Get the tarball from 3.01.2-beta.

    cp -av ../../3.01.2-beta/src/maker-${TOOLVERSION}.tgz .
    [[ -f maker-${TOOLVERSION}.tgz ]] && tar xzf maker-${TOOLVERSION}.tgz
    mv maker ../$CLUSTER
    cd ../$CLUSTER

    module load gcc/6.3.0
    module load openmpi/2.1.0    # this is the difference
    module load perl/5.24.1
    module load perl_modules/5.24.1
    module load sqlite/3.16.2
    module load bioinfo-tools
    module load BioPerl/1.7.1_Perl5.24.1
    module load RepeatMasker/4.0.7_Perl5.24.1
    module load blast/2.6.0+
    module load snap/2013-11-29
    module load exonerate/2.2.0
    module load augustus/3.2.3_Perl5.24.1
    module load tRNAscan-SE/1.3.1
    module load GeneMark/4.33-es_Perl5.24.1

Set up `LD_PRELOAD`.

    export LD_PRELOAD=$MPI_ROOT/lib/libmpi.so

    cd src
    perl Build.PL

This is the configurations step.  'Y' to configure for MPI.

It will complain about not finding `DBD::Pg` but we don't care.  That is used
in some chado-gff3 interchange scripts.  It should auto-detect the location of
`mpicc` and directory of `mpi.h` correctly.  If they have not been detected,
there might be some problem with the openmpi/gcc combination.  After this is
complete, you will see a number of lines with the results:

    ==============================================================================
    STATUS MAKER v3.1.2
    ==============================================================================
    PERL Dependencies:    VERIFIED
    External Programs:    VERIFIED
    External C Libraries:    VERIFIED
    MPI SUPPORT:        ENABLED
    MWAS Web Interface:    DISABLED
    MAKER PACKAGE:        CONFIGURATION OK

Then build it:

    ./Build install

