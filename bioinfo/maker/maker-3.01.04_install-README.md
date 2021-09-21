maker/3.01.04
========================

<https://www.yandell-lab.org/software/maker.html>

Used under license:
Artistic License 2.0, GPL v3.0


Structure creating script (makeroom_maker_3.01.04.sh) moved to /sw/bioinfo/maker/makeroom_3.01.04.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh -f" -t "maker" -v "3.01.04" -w "https://www.yandell-lab.org/software/maker.html" -s "annotation" -l "Artistic License 2.0\, GPL v3.0" -d "Portable and easily configurable genome annotation pipeline"
    ./makeroom_maker_3.01.04.sh
maker/3.01.3
========================

<http://www.yandell-lab.org/software/maker.html>

Used under license:
Artistic 2.0; GPL v3
<http://www.yandell-lab.org/software/maker.html>

Structure creating script (makeroom_maker_3.01.3.sh) moved to /sw/bioinfo/maker/makeroom_3.01.3.sh

LOG
---

    /home/douglas/bin/makeroom.sh -f" -t "maker" -v "3.01.3" -c "bioinfo" -s "annotation" -w "http://www.yandell-lab.org/software/maker.html" -l "Artistic 2.0\; GPL v3" -L "http://www.yandell-lab.org/software/maker.html" -d "portable and easily configurable genome annotation pipeline"
    ./makeroom_maker_3.01.3.sh
maker/2.31.10
========================

<https://www.yandell-lab.org/software/maker.html>

Used under license:
Artistic License 2.0, GPL v3.0

Structure creating script (makeroom_maker_2.31.10.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/maker/makeroom_2.31.10.sh

    TOOL=maker
    VERSION=2.31.10
    cd /sw/bioinfo/${TOOL}/
    makeroom.sh -f -t ${TOOL} -v ${VERSION} -w https://www.yandell-lab.org/software/maker.html -s annotation -l "Artistic License 2.0, GPL v3.0" -d "Portable and easily configurable genome annotation pipeline"
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION} 
    cd $VERSIONDIR
    rmdir $CLUSTER
    cd $VERSIONDIR/src
    wget http://yandell.topaz.genetics.utah.edu/maker_downloads/8CCB/324F/42F0/11AE6994043489A60A12166E4261/${TOOL}-${VERSION}.tgz
    tar xzf ${TOOL}-${VERSION}.tgz 
    mv ${TOOL} $PREFIX
    cd $PREFIX


    module load gcc/8.3.0
    module load openmpi/3.1.3
    module load perl/5.24.1
    module load perl_modules/5.24.1
    module load bioinfo-tools
    module load BioPerl/1.7.2_Perl5.24.1
    module load RepeatMasker/4.0.7_Perl5.24.1
    module load augustus/3.2.3_Perl5.24.1
    module load blast/2.7.1+
    module load snap/2013-11-29
    module load exonerate/2.4.0
    module load tRNAscan-SE/1.3.1
    module load GeneMark/4.38-es


    cd src
    perl Build.PL

This is the configurations tep.  It will complain about not finding `DBD::Pg`
but we don't care.  It should auto-detect the location of `mpicc` and directory
of `mpi.h` correctly.  If they have not been detected, there might be some
problem with the openmpi/gcc combination.  After this is complete, you will see
a number of lines with the results:


    MAKER supports distributed parallelization via MPI.
    Would you like to configure MAKER for MPI (This
    requires that you have an MPI client installed)? [N ]Y

    Please specify the path to 'mpicc' on your system: [/opt/openmpi/3.1.3gcc8.3.0/bin/mpicc ]
    /opt/openmpi/3.1.3gcc8.3.0/bin/mpicc

    Please specify the path to the directory containing 'mpi.h': [/opt/openmpi/3.1.3gcc8.3.0/include ]
    /opt/openmpi/3.1.3gcc8.3.0/include
    Created MYMETA.yml and MYMETA.json
    Creating new 'Build' script for 'MAKER' version 'v2.31.10'


    The file 'Build' has been created for you to finish installing MAKER.


    ==============================================================================
    STATUS MAKER v2.31.10
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




