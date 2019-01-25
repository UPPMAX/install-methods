HiSeq/0.9
=========

Simple "rpm -i --prefix ..." failed because it couldn't find gnuplot.

    error: Failed dependencies: gnuplot >= 4.0 ...

Loading gnuplot module did not fix this.

Running rpm with "--nodeps" failed:

    error: can't create transaction lock on /var/lib/rpm/.rpm.lock (Permission denied)

This error suggests that the RPM really wants to be installed as root
(which is of course normal)

Decided to build local RPM DB to try to get around root requirement.

    export HISEQ_HOME=/sw/apps/bioinfo/HiSeq/0.9
    mkdir -p $HISEQ_HOME/local/lib/rpm
    rpm --initdb --root $HISEQ_HOME/local --dbpath $HISEQ_HOME/local/lib/rpm

This is followed by a localized install

    rpm -ivh --root $HISEQ_HOME/local --dbpath $HISEQ_HOME/local/lib/rpm --relocate /usr=$HISEQ_HOME/local --nodeps HiSeqAnalysisSoftware-2.3.20-4.x86_64.rpm

This failed to fool the RPM:

    error: Unable to change root directory: Operation not permitted

As alternative, I avoided the relocate and root and just went with the usual
"prefix" arg with the local rpmdb:

    rpm -ivh --dbpath $HISEQ_HOME/local/lib/rpm --prefix $HISEQ_HOME/milou --nodeps HiSeqAnalysisSoftware-2.3.20-4.x86_64.rpm

Surprisingly, this seemed to work. Must of course check that the "nodep" was
allowed but could certainly build missing dependencies into this local area.
The dependencies seem (rpm -qpR rpm-file) to be: gnuplot >= 4.0, ImageMagick,
libxslt and python >= 2.4.

Checked installation with: 

    $HISEQ_HOME/illumina/scratch/InstallValidationData/ValidateInstall

The script reported success.


Fetched Reference Genome:

    cd /sw/apps/bioinfo/HiSeq/0.9/milou/data
    wget -q ftp://webdata:webdata@ussd-ftp.illumina.com/Data/ReferenceGenomes/HiSeqAnalysisSoftware_UCSC_hg19.tar.gz

Grabbed a few procs with:

    salloc -A staff -n 4 -t 3:15:00

Processed the Ref with:

    ../illumina/HiSeqAnalysisSoftware/unpackIsisReference.py --input HiSeqAnalysisSoftware_UCSC_hg19.tar.gz --jobs 4 --genomes-root=/sw/apps/bioinfo/HiSeq/0.9/milou/illumina/HiSeqAnalysisSoftware/Genomes --isaac-path=/sw/apps/bioinfo/HiSeq/0.9/milou/illumina/Isaac/stable

Took about 1 hour (on 4 procs).

