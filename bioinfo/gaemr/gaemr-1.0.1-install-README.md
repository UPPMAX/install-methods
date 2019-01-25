gaemr/1.0.1
===========

Lots of expectations for prereq locations via hard-coded paths in
`gaemr/PlatformConstants.py`.  I generalised that a bit and also load those
prereqs as modules in the mf file just to make sure they are available on the
cluster on which we are running.  Also, we needed to load biopython and pysam.

The relevant portion of `gaemr/PlatformConstants.py`:

    import os

    class PlatformConstant(object):
        """A unified class to contain all platform constants"""

        CLUSTER=os.getenv("CLUSTER")

        MIN_GAP_SIZE=10
        MIN_CONTIG_SIZE=200
        MIN_SCAFFOLD_SIZE=1000
        QUAL_MAX=93
        MAX_INSERT_SIZE=50000
        TABLE_DELIMITER=" | "
        MUMMER_PATH="/sw/apps/bioinfo/MUMmer/3.23/" + CLUSTER + "/"
        BLAST_DIR="/sw/apps/bioinfo/blast/2.2.31+/" + CLUSTER + "/bin/"

        SAMTOOLS="/sw/apps/bioinfo/samtools/0.1.19/" + CLUSTER + "/bin/samtools"
        PICARD="/sw/apps/bioinfo/picard/1.118/" + CLUSTER + "/"
        PICARD_TMP_DIR="."
        BLAST_NT="/sw/data/uppnex/blast_databases/nt"
        BLAST_UNIVEC="/sw/data/uppnex/blast_databases/UniVec"
        BLAST_rRNA="/sw/apps/bioinfo/gaemr/1.0.1/data/rrna/release11_3_Bacteria_unaligned.fa"
        BLAST_MITOGCONTAM="/sw/apps/bioinfo/gaemr/1.0.1/data/mitogcontam"
        BLAST_NODES="/sw/data/uppnex/ncbi_taxonomy/latest/nodes.dmp"
        BLAST_NAMES="/sw/data/uppnex/ncbi_taxonomy/latest/names.dmp"
        RNAMMER="/sw/apps/bioinfo/rnammer/1.2/" + CLUSTER + "/rnammer"
        RDP="/sw/apps/bioinfo/rdp-classifier/2.4/" + CLUSTER + "/rdp_classifier-2.4.jar"

        BLASTDBCMD=BLAST_DIR + "blastdbcmd"
        MAKEBLASTDB=BLAST_DIR + "makeblastdb"
        NUCMER=MUMMER_PATH + "nucmer"
        PROMER=MUMMER_PATH + "promer"
        SHOWTILING=MUMMER_PATH + "show-tiling"
        MUMMERPLOT=MUMMER_PATH + "mummerplot"

        BWA="/sw/apps/bioinfo/bwa/0.7.10/" + CLUSTER + "/bin"
        GAEMR="/sw/apps/bioinfo/gaemr/1.0.1/" + CLUSTER + "/bin"
        BOWTIE="/sw/apps/bioinfo/bowtie2/2.3.2/" + CLUSTER + "/bin"
        PLOT_COLORS=['green','blue','red','orange','magenta','black','grey']

        #detect user, environment and populate field
        def __init__(self):
            """populate class fields"""
            self.user_name = os.getenv("USER")
            self.operating_system = os.getenv("OSTYPE")

