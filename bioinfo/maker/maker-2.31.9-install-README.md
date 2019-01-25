maker 2.31.9
============

Built with MPI support, and (improving on 2.31.8) used updated gcc and openmpi,
installed an updated RepeatMasker, snap, augustus, blast+, and added
GeneMark/4.32-es to the set of things installed.  I'm sticking with
blast/2.4.0+ rather than the newer 2.6.0+, since NCBI is phasing out the use if
GIs and this shows up with later versions of blast.

Unfortunately, it detects the `/pica` head symlink so all the configured paths
will include it.  Nothing can be done about it.


LOG
---

    VERSION=2.31.9
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/bioinfo/maker
    mkdir -p $VERSION
    cd $VERSION
    mkdir -p src
    cd src

Get the maker 2.31.9 tarball from
http://yandell.topaz.genetics.utah.edu/cgi-bin/maker_license.cgi and move it to
Uppmax.  Let's assume it is moved to `$VERSION/src` already.

    tar xzf maker-${VERSION}.tgz

Move the `maker` directory to be the new `$CLUSTER` directory, and continue the
build there.

    mv maker ../$CLUSTER
    cd ../$CLUSTER

Load prerequisites.

    module load gcc/6.3.0
    module load openmpi/2.1.0
    module load bioinfo-tools
    module load perl/5.18.4
    module load perl_modules/5.18.4
    module load BioPerl/1.6.924_Perl5.18.4
    module load RepeatMasker/4.0.7
    module load blast/2.4.0+
    module load snap/2013-11-29
    module load exonerate/2.2.0
    module load augustus/3.2.3
    module load tRNAscan-SE/1.3.1
    module load GeneMark/4.32-es

    cd src
    perl Build.PL

This is the configurations tep.  It will complain about not finding `DBD::Pg`
but we don't care.  It should auto-detect the location of `mpicc` and directory
of `mpi.h` correctly.  If they have not been detected, there might be some
problem with the openmpi/gcc combination.  After this is complete, you will see
a number of lines with the results:

    ==============================================================================
    STATUS MAKER v2.31.9
    ==============================================================================
    PERL Dependencies:    VERIFIED
    External Programs:    VERIFIED
    External C Libraries:    VERIFIED
    MPI SUPPORT:        ENABLED
    MWAS Web Interface:    DISABLED
    MAKER PACKAGE:        CONFIGURATION OK

Then build it:

    ./Build install

This is it.  Make sure the mf file is updated with the modules loaded above.

