FusionCatcher/1.10
==================

At first I put in quite a bit of time installing versions of tools we already
have that are required by FusionCatcher/1.10.  This led to some good updates
but it couldn't find everything, and some of the version pickiness didn't make
sense, for example it wanted two distinct versions of bowtie, which our module
system won't allow.  So, I loaded `python/2.7.15` and `biopython/1.73`
beforehand and let the install process take care of the rest.


LOG
---

    cd /sw/bioinfo
    cd FusionCatcher/
    VERSION=1.10
    mkdir $VERSION
    cd $VERSION
    mkdir $CLUSTER src
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ( test -L $CL || ln -s $CLUSTER $CL ) ; done
    PFX=$PWD/$CLUSTER
    cd src
    module load python/2.7.15
    module load bioinfo-tools biopython/1.73
    wget -O bootstrap.py http://sf.net/projects/fusioncatcher/files/bootstrap.py
    python bootstrap.py --installation-path=$PFX -x 

Several questions are asked during installation, if it is able to recognise the
tools from the modules loaded above.  I'll capture answers here.  To accept the
capitalised option, you can also just hit 'return'.  The short version of what
was done differently from the defaults:

- `python/2.7.15` loaded beforehand
- Default number of threads set to 0, for autodetect
- `biopython/1.73` loaded beforehand
- installed both of the human genome versions named at the end:
  o `/sw/bioinfo/FusionCatcher/1.10/rackham/bin/download-human_v95.sh`
  o `/sw/bioinfo/FusionCatcher/1.10/rackham/bin/build.sh`

The install process installs BioPython 1.73, but it is not found during the
second reference build.  So, load `biopython/1.73` and the second build works.
The mf file should include both python and biopython.

    rackham5: /sw/bioinfo/FusionCatcher/1.10/src $     wget -O bootstrap.py http://sf.net/projects/fusioncatcher/files/bootstrap.py
    rackham5: /sw/bioinfo/FusionCatcher/1.10/src $     python bootstrap.py --installation-path=$PFX -x
    Checking latest version of Ensembl database that is available...
       * Version v97 found!

    ...

    Current working directory: '/sw/bioinfo/FusionCatcher/1.10/src'
    Obtaining the absolute path of the Python executable...
      * Ok! '/sw/comp/python/2.7.15_rackham/bin/python' found!
    Python used for installation of FusionCatcher: '/sw/comp/python/2.7.15_rackham/bin/python'
      Do you accept this Python? [Y/n]:
    Checking Python version...
      * Ok! Found Python version: 2.7
    Checking if this environment is a 64-bit environment...
      * Ok! 64-bit environment found.

    Installing FusionCatcher from <http://github.com/ndaniel/fusioncatcher>
    ------------------------------------------------------------------------

    Path for installation of FusionCatcher: '/sw/bioinfo/FusionCatcher/1.10/rackham'
      Do you accept this path (WARNING: some files/directories within this path may be deleted/replaced/updated without warning)? [Y/n]:
    Checking latest version of Ensembl database that is available...
       * Version v97 found!
    Default number of threads/CPUs to be used by FusionCatcher (use 0 for using the number of CPUs detected at the runtime): '1'
      Do you accept? [Y/n]: n
      Type the new default for number of threads: 0
    Installing tool 'FusionCatcher (fusion genes finder in RNA-seq data)' at '/sw/bioinfo/FusionCatcher/1.10/rackham/bin' from 'http://sourceforge.net/projects/fusioncatcher/files/fusioncatcher_v1.10.zip'
        # mkdir -p /sw/bioinfo/FusionCatcher/1.10/rackham
        # rm -rf /sw/bioinfo/FusionCatcher/1.10/rackham/fusioncatcher_v1.10.zip
        # wget http://sourceforge.net/projects/fusioncatcher/files/fusioncatcher_v1.10.zip -O /sw/bioinfo/FusionCatcher/1.10/rackham/fusioncatcher_v1.10.zip --no-check-certificate
        # rm -rf /sw/bioinfo/FusionCatcher/1.10/rackham/bin
        # rm -rf /sw/bioinfo/FusionCatcher/1.10/rackham/fusioncatcher_v1.10
        # unzip -o /sw/bioinfo/FusionCatcher/1.10/rackham/fusioncatcher_v1.10.zip -d /sw/bioinfo/FusionCatcher/1.10/rackham
        # ln -s /sw/bioinfo/FusionCatcher/1.10/rackham/fusioncatcher_v1.10 /sw/bioinfo/FusionCatcher/1.10/rackham/bin
        # cd /sw/bioinfo/FusionCatcher/1.10/rackham/fusioncatcher_v1.10
        # chmod +x custom_install.sh
        # ./custom_install.sh
        # cd /sw/bioinfo/FusionCatcher/1.10/src
      * Done!
    Checking if the Python module named 'NumPy' is installed...
      * Ok! Python module 'NumPy' found at '/sw/comp/python/2.7.15_rackham/lib/python2.7/site-packages/numpy'!
    Checking if the Python module named 'BioPython' is installed...
      * WARNING: The Python module 'BioPython' is not installed!

    ...
    
      Do you accept to install the Python module 'BioPython' here '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/biopython'? [Y/n]:
    Installing Python module 'python-biopython' locally '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/biopython'...
        # mkdir -p /sw/bioinfo/FusionCatcher/1.10/rackham/tools
        # rm -rf /sw/bioinfo/FusionCatcher/1.10/rackham/tools/biopython-1.73.tar.gz
        # wget http://biopython.org/DIST/biopython-1.73.tar.gz -O /sw/bioinfo/FusionCatcher/1.10/rackham/tools/biopython-1.73.tar.gz --no-check-certificate
        # rm -rf /sw/bioinfo/FusionCatcher/1.10/rackham/tools/biopython
        # tar -xvzf /sw/bioinfo/FusionCatcher/1.10/rackham/tools/biopython-1.73.tar.gz -C /sw/bioinfo/FusionCatcher/1.10/rackham/tools
        # ln -s /sw/bioinfo/FusionCatcher/1.10/rackham/tools/biopython-1.73 /sw/bioinfo/FusionCatcher/1.10/rackham/tools/biopython
        # cd /sw/bioinfo/FusionCatcher/1.10/rackham/tools/biopython-1.73 ; /sw/comp/python/2.7.15_rackham/bin/python setup.py build
      * Done!
    Checking if the Python module named 'Xlrd' is installed...
      * WARNING: The Python module 'Xlrd' is not installed!
      Do you accept to install the Python module 'Xlrd' here '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/xlrd'? [Y/n]:
    Installing Python module 'python-xlrd' locally '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/xlrd'...
    Checking if the Python module named 'SetupTools' is installed...
      * Ok! Python module 'SetupTools' found at '/sw/comp/python/2.7.15_rackham/lib/python2.7/site-packages/setuptools'!
    Checking if the Python module named 'OpenPyXL' is installed...
      * WARNING: The Python module 'OpenPyXL' is not installed!
      Do you accept to install the Python module 'OpenPyXL' here '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/openpyxl'? [Y/n]:
    Installing Python module 'python-openpyxl' locally '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/openpyxl'...
      * Done!
    Checking if 'BOWTIE (short read aligner)' is installed...
      * WARNING: Not found!
      Do you accept to install the BOWTIE (short read aligner) here: /sw/bioinfo/FusionCatcher/1.10/rackham/tools/bowtie ? [Y/n]:
    Installing tool 'BOWTIE (short read aligner)' at '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/bowtie' from 'http://sourceforge.net/projects/bowtie-bio/files/bowtie/1.2.2/bowtie-1.2.2-linux-x86_64.zip'
      * Done!
    Checking if 'BOWTIE (short read aligner) -- older version' is installed...
      * WARNING: Not found!
      Do you accept to install the BOWTIE (short read aligner) -- older version here: /sw/bioinfo/FusionCatcher/1.10/rackham/tools/bowtie-old ? [Y/n]:
    Installing tool 'BOWTIE (short read aligner) -- older version' at '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/bowtie-old' from 'http://sourceforge.net/projects/bowtie-bio/files/bowtie/1.1.2/bowtie-1.1.2-linux-x86_64.zip'
      * Done!
    Checking if 'BOWTIE2 (short read aligner)' is installed...
      * WARNING: Not found!
      Do you accept to install the BOWTIE2 (short read aligner) here: /sw/bioinfo/FusionCatcher/1.10/rackham/tools/bowtie2 ? [Y/n]:
    Installing tool 'BOWTIE2 (short read aligner)' at '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/bowtie2' from 'http://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.2.9/bowtie2-2.2.9-linux-x86_64.zip'
      * Done!
    Checking if 'NCBI SRA Toolkit (SRA System Development Kit)' is installed...
      * WARNING: Not found!
      Do you accept to install the NCBI SRA Toolkit (SRA System Development Kit) here: /sw/bioinfo/FusionCatcher/1.10/rackham/tools/sratoolkit ? [Y/n]:
    Installing tool 'NCBI SRA Toolkit (SRA System Development Kit)' at '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/sratoolkit' from 'https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.9.6/sratoolkit.2.9.6-centos_linux64.tar.gz'
      * Done!
    Checking if 'LiftOver (Batch Coordinate Conversion)' is installed...
      * WARNING: Not found!
      Do you accept to install the LiftOver (Batch Coordinate Conversion) here: /sw/bioinfo/FusionCatcher/1.10/rackham/tools/liftover ? [Y/n]:
    Installing tool 'LiftOver (Batch Coordinate Conversion)' at '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/liftover' from 'http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/liftOver'
      * Done!
    Checking if 'BLAT (alignment tool)' is installed...
      * WARNING: Not found!
      Do you accept to install the BLAT (alignment tool) here: /sw/bioinfo/FusionCatcher/1.10/rackham/tools/blat ? [Y/n]:
    Installing tool 'BLAT (alignment tool)' at '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/blat' from 'http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/blat/blat'
      * Done!
      Do you accept to install the FaToTwoBit (companion of BLAT alignment tool) here: /sw/bioinfo/FusionCatcher/1.10/rackham/tools/fatotwobit ? [Y/n]:
    Installing tool 'FaToTwoBit (companion of BLAT alignment tool)' at '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/fatotwobit' from 'http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/faToTwoBit'
      * Done!
    Checking if 'SEQTK (Toolkit for processing sequences in FASTA/Q formats)' is installed...
      * WARNING: Not found!
      Do you accept to install the SEQTK (Toolkit for processing sequences in FASTA/Q formats) here: /sw/bioinfo/FusionCatcher/1.10/rackham/tools/seqtk ? [Y/n]:
    Installing tool 'SEQTK (Toolkit for processing sequences in FASTA/Q formats)' at '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/seqtk' from 'http://github.com/ndaniel/seqtk/archive/1.2-r101c.tar.gz'
      * Done!
    Checking if 'STAR (alignment tool)' is installed...
      * WARNING: Not found!
      Do you accept to install the STAR (alignment tool) here: /sw/bioinfo/FusionCatcher/1.10/rackham/tools/star ? [Y/n]:
    Installing tool 'STAR (alignment tool)' at '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/star' from 'https://github.com/alexdobin/STAR/archive/2.7.0f.tar.gz'
      * Done!
    Checking if 'BBMap short read aligner, and other bioinformatic tools.' is installed...
      * WARNING: Not found!
      Do you accept to install the BBMap short read aligner, and other bioinformatic tools. here: /sw/bioinfo/FusionCatcher/1.10/rackham/tools/bbmap ? [Y/n]:
    Installing tool 'BBMap short read aligner, and other bioinformatic tools.' at '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/bbmap' from 'https://sourceforge.net/projects/bbmap/files/BBMap_38.44.tar.gz'
      * Done!
    Checking if 'PICARD (Java-based command-line utilities that manipulate SAM files)' is installed...
      * WARNING: Not found!
      Do you accept to install the PICARD (Java-based command-line utilities that manipulate SAM files) here: /sw/bioinfo/FusionCatcher/1.10/rackham/tools/picard ? [Y/n]:
    Installing tool 'PICARD (Java-based command-line utilities that manipulate SAM files)' at '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/picard' from 'http://github.com/broadinstitute/picard/releases/download/2.19.0/picard.jar'
      * Done!
    Checking if 'BWA (alignment tool)' is installed...
      * WARNING: Not found!
      Do you accept to install the BWA (alignment tool) here: /sw/bioinfo/FusionCatcher/1.10/rackham/tools/bwa ? [Y/n]:
    Installing tool 'BWA (alignment tool)' at '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/bwa' from 'http://sourceforge.net/projects/bio-bwa/files/bwa-0.7.12.tar.bz2'
      * Done!
    Checking if 'SAMTOOLS (tools for manipulating alignments in the SAM format)' is installed...
      * WARNING: Not found!
      Do you accept to install the SAMTOOLS (tools for manipulating alignments in the SAM format) here: /sw/bioinfo/FusionCatcher/1.10/rackham/tools/samtools ? [Y/n]:
    Installing tool 'SAMTOOLS (tools for manipulating alignments in the SAM format)' at '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/samtools' from 'http://sourceforge.net/projects/samtools/files/samtools/0.1.19/samtools-0.1.19.tar.bz2'
      * Done!
    Checking if 'VELVET (sequence assembler for short reads)' is installed...
      * WARNING: Not found!
      Do you accept to install the VELVET (sequence assembler for short reads) here: /sw/bioinfo/FusionCatcher/1.10/rackham/tools/velvet ? [Y/n]:
    Installing tool 'VELVET (sequence assembler for short reads)' at '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/velvet' from 'http://www.ebi.ac.uk/~zerbino/velvet/velvet_1.2.10.tgz'
      * Done!
    Checking if 'LZO (LZO library for LZOP compression)' is installed...
      * WARNING: Not found!
      Do you accept to install the LZO (LZO library for LZOP compression) here: /sw/bioinfo/FusionCatcher/1.10/rackham/tools/lzo ? [Y/n]:
    Installing tool 'LZO (LZO library for LZOP compression)' at '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/lzo' from 'http://www.oberhumer.com/opensource/lzo/download/lzo-2.08.tar.gz'
      * Done!
    Checking if 'LZOP compression' is installed...
      * WARNING: Not found!
      Do you accept to install the LZOP compression here: /sw/bioinfo/FusionCatcher/1.10/rackham/tools/lzop ? [Y/n]:
    Installing tool 'LZOP compression' at '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/lzop' from 'http://www.lzop.org/download/lzop-1.03.tar.gz'
      * Done!
    Checking if 'PIGZ (GZIP parallel)' is installed...
      * Found at '/usr/bin/pigz'!
      * Test running:  '/usr/bin/pigz --version'
      * Found supported version '2.3'!
    Checking if 'GNU PARALLEL (shell tool for executing jobs in parallel)' is installed...
      * WARNING: Not found!
      Do you accept to install the GNU PARALLEL (shell tool for executing jobs in parallel) here: /sw/bioinfo/FusionCatcher/1.10/rackham/tools/parallel ? [Y/n]:
    Installing tool 'GNU PARALLEL (shell tool for executing jobs in parallel)' at '/sw/bioinfo/FusionCatcher/1.10/rackham/tools/parallel' from 'http://ftp.gnu.org/gnu/parallel/parallel-20170522.tar.bz2'
      * Done!
    Checking the shebang of FusionCatcher Python scripts...
      Shall the shebang of all Python scripts, belonging to FusionCatcher, be set/hardcoded to use this '/sw/comp/python/2.7.15_rackham/bin/python'? [Y/n]:
      * Updating the SHEBANG of Python scripts with '/sw/comp/python/2.7.15_rackham/bin/python'
      * Done!
    Updating the configuration file of FusionCatcher...
      * configuration file '/sw/bioinfo/FusionCatcher/1.10/rackham/etc/configuration.cfg'
    -------------------------------------------------------------------------------
    FusionCatcher is installed here:
      /sw/bioinfo/FusionCatcher/1.10/rackham
    FusionCatcher's scripts are here:
      /sw/bioinfo/FusionCatcher/1.10/rackham/bin
    FusionCatcher's dependencies and tools are installed here:
      /sw/bioinfo/FusionCatcher/1.10/rackham/tools
    FusionCatcher's organism data is here:
      /sw/bioinfo/FusionCatcher/1.10/rackham/data
    Run FusionCatcher as following:
      /sw/bioinfo/FusionCatcher/1.10/rackham/bin/fusioncatcher
    In order to download and build the files for FusionCatcher run the following:
      /sw/bioinfo/FusionCatcher/1.10/rackham/bin/fusioncatcher-build

    === Installed successfully! ===

    *****************************************************************
    *  DON'T FORGET to download (or build) the organism's data needed by FusionCatcher to run!
    *****************************************************************

    Several options to get the data needed by FusionCatcher are shown below (please try them in this order)!

    ---------------------------------------------------------------------------
    *  OPTION 1: Download the data needed by FusionCatcher from SOURCEFORGE!
                 THIS IS HIGHLY RECOMMENDED
    ---------------------------------------------------------------------------
    In order to download the latest human data files needed by FusionCatcher, please run these (it will take several hours):

    set -e
    rm -rf /sw/bioinfo/FusionCatcher/1.10/rackham/data/current
    rm -f /sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.tar.gz.*
    rm -rf /sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95
    rm -f /sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.md5
    mkdir -p /sw/bioinfo/FusionCatcher/1.10/rackham/data
    ln -s /sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95 /sw/bioinfo/FusionCatcher/1.10/rackham/data/current
    wget --no-check-certificate http://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.aa -O /sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.tar.gz.aa
    wget --no-check-certificate http://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ab -O /sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.tar.gz.ab
    wget --no-check-certificate http://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ac -O /sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.tar.gz.ac
    wget --no-check-certificate http://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ad -O /sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.tar.gz.ad
    wget --no-check-certificate http://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ae -O /sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.tar.gz.ae
    wget --no-check-certificate http://sourceforge.net/projects/fusioncatcher/files/data/human_v95.md5 -O /sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.md5
    cd /sw/bioinfo/FusionCatcher/1.10/rackham/data
    md5sum -c /sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.md5
    if [ "$?" -ne "0" ]; then
      echo -e "\n\n\n\033[33;7m   ERROR: The downloaded files from above have errors! MD5 checksums do not match! Please, download them again or re-run this script again!   \033[0m\n"
      exit 1
    fi
    cat /sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.tar.gz.* > /sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.tar.gz
    rm -f /sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.tar.gz.*
    if ! tar -xzf /sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.tar.gz -C /sw/bioinfo/FusionCatcher/1.10/rackham/data; then
        echo -e "\n\n\n\033[33;7m   ERROR: The downloaded files are corrupted!   \033[0m\n"
        exit 1
    fi
    rm -f /sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.tar.gz
    rm -f /sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.md5

    All these commands are saved in '/sw/bioinfo/FusionCatcher/1.10/rackham/bin/download-human_v95.sh' file! You may execute '/sw/bioinfo/FusionCatcher/1.10/rackham/bin/download-human_v95.sh' shell script or copy/paste all the previous commands and run them manually in the terminal!


    ---------------------------------------------------------------------------
    *  OPTION 2: Build yourself the data needed by FusionCatcher!
                 TRY THIS ONLY IF OPTION 1!
    ---------------------------------------------------------------------------
    In order to build yourself the latest human data files needed by FusionCatcher, please run these (it will take several hours):

    rm  -rf  /sw/bioinfo/FusionCatcher/1.10/rackham/data/current
    rm  -rf  /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97
    mkdir  -p  /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97
    ln  -s  /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97  /sw/bioinfo/FusionCatcher/1.10/rackham/data/current
    /sw/bioinfo/FusionCatcher/1.10/rackham/bin/fusioncatcher-build  -g  homo_sapiens  -o /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97

    All these commands are saved in '/sw/bioinfo/FusionCatcher/1.10/rackham/bin/build.sh' file! You may execute '/sw/bioinfo/FusionCatcher/1.10/rackham/bin/build.sh' shell script or copy/paste all the previous commands and run them manually in the terminal!

    ---------------------------------------------------------------------------

    --------------> THE END! <---------------------------


    *****************************************************************
    *  DON'T FORGET to download (or build) the organism's data needed
       by FusionCatcher to run (see above for options)!
    *****************************************************************
    rackham5: /sw/bioinfo/FusionCatcher/1.10/src $ /sw/bioinfo/FusionCatcher/1.10/rackham/bin/download-human_v95.sh
    --2019-08-06 13:29:25--  http://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.aa
    Resolving sourceforge.net (sourceforge.net)... 216.105.38.13
    Connecting to sourceforge.net (sourceforge.net)|216.105.38.13|:80... connected.
    HTTP request sent, awaiting response... 301 Moved Permanently
    Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.aa [following]
    --2019-08-06 13:29:26--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.aa
    Connecting to sourceforge.net (sourceforge.net)|216.105.38.13|:443... connected.
    HTTP request sent, awaiting response... 301 Moved Permanently
    Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.aa/ [following]
    --2019-08-06 13:29:27--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.aa/
    Reusing existing connection to sourceforge.net:443.
    HTTP request sent, awaiting response... 302 Found
    Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.aa/download [following]
    --2019-08-06 13:29:27--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.aa/download
    Reusing existing connection to sourceforge.net:443.
    HTTP request sent, awaiting response... 302 Found
    Location: https://downloads.sourceforge.net/project/fusioncatcher/data/human_v95.tar.gz.aa?r=&ts=1565090967&use_mirror=netcologne [following]
    --2019-08-06 13:29:27--  https://downloads.sourceforge.net/project/fusioncatcher/data/human_v95.tar.gz.aa?r=&ts=1565090967&use_mirror=netcologne
    Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 216.105.38.13
    Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|216.105.38.13|:443... connected.
    HTTP request sent, awaiting response... 302 Found
    Location: https://netcologne.dl.sourceforge.net/project/fusioncatcher/data/human_v95.tar.gz.aa [following]
    --2019-08-06 13:29:28--  https://netcologne.dl.sourceforge.net/project/fusioncatcher/data/human_v95.tar.gz.aa
    Resolving netcologne.dl.sourceforge.net (netcologne.dl.sourceforge.net)... 78.35.24.46, 2001:4dd0:1234:6::5f
    Connecting to netcologne.dl.sourceforge.net (netcologne.dl.sourceforge.net)|78.35.24.46|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 5200936960 (4.8G) [application/octet-stream]
    Saving to: '/sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.tar.gz.aa'

    100%[==========================================================================================================================================>] 5,200,936,960 75.8MB/s   in 75s

    2019-08-06 13:30:44 (65.9 MB/s) - '/sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.tar.gz.aa' saved [5200936960/5200936960]

    --2019-08-06 13:30:47--  http://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ab
    Resolving sourceforge.net (sourceforge.net)... 216.105.38.13
    Connecting to sourceforge.net (sourceforge.net)|216.105.38.13|:80... connected.
    HTTP request sent, awaiting response... 301 Moved Permanently
    Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ab [following]
    --2019-08-06 13:30:47--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ab
    Connecting to sourceforge.net (sourceforge.net)|216.105.38.13|:443... connected.
    HTTP request sent, awaiting response... 301 Moved Permanently
    Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ab/ [following]
    --2019-08-06 13:30:48--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ab/
    Reusing existing connection to sourceforge.net:443.
    HTTP request sent, awaiting response... 302 Found
    Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ab/download [following]
    --2019-08-06 13:30:48--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ab/download
    Reusing existing connection to sourceforge.net:443.
    HTTP request sent, awaiting response... 302 Found
    Location: https://downloads.sourceforge.net/project/fusioncatcher/data/human_v95.tar.gz.ab?r=&ts=1565091048&use_mirror=netix [following]
    --2019-08-06 13:30:48--  https://downloads.sourceforge.net/project/fusioncatcher/data/human_v95.tar.gz.ab?r=&ts=1565091048&use_mirror=netix
    Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 216.105.38.13
    Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|216.105.38.13|:443... connected.
    HTTP request sent, awaiting response... 302 Found
    Location: https://netix.dl.sourceforge.net/project/fusioncatcher/data/human_v95.tar.gz.ab [following]
    --2019-08-06 13:30:49--  https://netix.dl.sourceforge.net/project/fusioncatcher/data/human_v95.tar.gz.ab
    Resolving netix.dl.sourceforge.net (netix.dl.sourceforge.net)... 87.121.121.2
    Connecting to netix.dl.sourceforge.net (netix.dl.sourceforge.net)|87.121.121.2|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 5200936960 (4.8G) [application/octet-stream]
    Saving to: '/sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.tar.gz.ab'

    100%[==========================================================================================================================================>] 5,200,936,960 42.0MB/s   in 2m 58s

    2019-08-06 13:33:47 (27.9 MB/s) - '/sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.tar.gz.ab' saved [5200936960/5200936960]

    --2019-08-06 13:33:48--  http://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ac
    Resolving sourceforge.net (sourceforge.net)... 216.105.38.13
    Connecting to sourceforge.net (sourceforge.net)|216.105.38.13|:80... connected.
    HTTP request sent, awaiting response... 301 Moved Permanently
    Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ac [following]
    --2019-08-06 13:33:48--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ac
    Connecting to sourceforge.net (sourceforge.net)|216.105.38.13|:443... connected.
    HTTP request sent, awaiting response... 301 Moved Permanently
    Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ac/ [following]
    --2019-08-06 13:33:49--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ac/
    Reusing existing connection to sourceforge.net:443.
    HTTP request sent, awaiting response... 302 Found
    Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ac/download [following]
    --2019-08-06 13:33:49--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ac/download
    Reusing existing connection to sourceforge.net:443.
    HTTP request sent, awaiting response... 302 Found
    Location: https://downloads.sourceforge.net/project/fusioncatcher/data/human_v95.tar.gz.ac?r=&ts=1565091229&use_mirror=netix [following]
    --2019-08-06 13:33:49--  https://downloads.sourceforge.net/project/fusioncatcher/data/human_v95.tar.gz.ac?r=&ts=1565091229&use_mirror=netix
    Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 216.105.38.13
    Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|216.105.38.13|:443... connected.
    HTTP request sent, awaiting response... 302 Found
    Location: https://netix.dl.sourceforge.net/project/fusioncatcher/data/human_v95.tar.gz.ac [following]
    --2019-08-06 13:33:50--  https://netix.dl.sourceforge.net/project/fusioncatcher/data/human_v95.tar.gz.ac
    Resolving netix.dl.sourceforge.net (netix.dl.sourceforge.net)... 87.121.121.2
    Connecting to netix.dl.sourceforge.net (netix.dl.sourceforge.net)|87.121.121.2|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 5200936960 (4.8G) [application/octet-stream]
    Saving to: '/sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.tar.gz.ac'

    100%[==========================================================================================================================================>] 5,200,936,960 25.0MB/s   in 2m 31s

    2019-08-06 13:36:22 (32.8 MB/s) - '/sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.tar.gz.ac' saved [5200936960/5200936960]

    --2019-08-06 13:36:22--  http://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ad
    Resolving sourceforge.net (sourceforge.net)... 216.105.38.13
    Connecting to sourceforge.net (sourceforge.net)|216.105.38.13|:80... connected.
    HTTP request sent, awaiting response... 301 Moved Permanently
    Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ad [following]
    --2019-08-06 13:36:23--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ad
    Connecting to sourceforge.net (sourceforge.net)|216.105.38.13|:443... connected.
    HTTP request sent, awaiting response... 301 Moved Permanently
    Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ad/ [following]
    --2019-08-06 13:36:23--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ad/
    Reusing existing connection to sourceforge.net:443.
    HTTP request sent, awaiting response... 302 Found
    Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ad/download [following]
    --2019-08-06 13:36:24--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ad/download
    Reusing existing connection to sourceforge.net:443.
    HTTP request sent, awaiting response... 302 Found
    Location: https://downloads.sourceforge.net/project/fusioncatcher/data/human_v95.tar.gz.ad?r=&ts=1565091384&use_mirror=netix [following]
    --2019-08-06 13:36:24--  https://downloads.sourceforge.net/project/fusioncatcher/data/human_v95.tar.gz.ad?r=&ts=1565091384&use_mirror=netix
    Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 216.105.38.13
    Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|216.105.38.13|:443... connected.
    HTTP request sent, awaiting response... 302 Found
    Location: https://netix.dl.sourceforge.net/project/fusioncatcher/data/human_v95.tar.gz.ad [following]
    --2019-08-06 13:36:25--  https://netix.dl.sourceforge.net/project/fusioncatcher/data/human_v95.tar.gz.ad
    Resolving netix.dl.sourceforge.net (netix.dl.sourceforge.net)... 87.121.121.2
    Connecting to netix.dl.sourceforge.net (netix.dl.sourceforge.net)|87.121.121.2|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 5200936960 (4.8G) [application/octet-stream]
    Saving to: '/sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.tar.gz.ad'

    100%[==========================================================================================================================================>] 5,200,936,960 11.4MB/s   in 5m 13s

    2019-08-06 13:41:39 (15.8 MB/s) - '/sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.tar.gz.ad' saved [5200936960/5200936960]

    --2019-08-06 13:41:39--  http://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ae
    Resolving sourceforge.net (sourceforge.net)... 216.105.38.13
    Connecting to sourceforge.net (sourceforge.net)|216.105.38.13|:80... connected.
    HTTP request sent, awaiting response... 301 Moved Permanently
    Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ae [following]
    --2019-08-06 13:41:39--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ae
    Connecting to sourceforge.net (sourceforge.net)|216.105.38.13|:443... connected.
    HTTP request sent, awaiting response... 301 Moved Permanently
    Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ae/ [following]
    --2019-08-06 13:41:40--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ae/
    Reusing existing connection to sourceforge.net:443.
    HTTP request sent, awaiting response... 302 Found
    Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ae/download [following]
    --2019-08-06 13:41:40--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.tar.gz.ae/download
    Reusing existing connection to sourceforge.net:443.
    HTTP request sent, awaiting response... 302 Found
    Location: https://downloads.sourceforge.net/project/fusioncatcher/data/human_v95.tar.gz.ae?r=&ts=1565091701&use_mirror=netix [following]
    --2019-08-06 13:41:41--  https://downloads.sourceforge.net/project/fusioncatcher/data/human_v95.tar.gz.ae?r=&ts=1565091701&use_mirror=netix
    Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 216.105.38.13
    Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|216.105.38.13|:443... connected.
    HTTP request sent, awaiting response... 302 Found
    Location: https://netix.dl.sourceforge.net/project/fusioncatcher/data/human_v95.tar.gz.ae [following]
    --2019-08-06 13:41:41--  https://netix.dl.sourceforge.net/project/fusioncatcher/data/human_v95.tar.gz.ae
    Resolving netix.dl.sourceforge.net (netix.dl.sourceforge.net)... 87.121.121.2
    Connecting to netix.dl.sourceforge.net (netix.dl.sourceforge.net)|87.121.121.2|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 466626181 (445M) [application/octet-stream]
    Saving to: '/sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.tar.gz.ae'

    100%[============================================================================================================================================>] 466,626,181 21.3MB/s   in 36s

    2019-08-06 13:42:18 (12.4 MB/s) - '/sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.tar.gz.ae' saved [466626181/466626181]

    --2019-08-06 13:42:18--  http://sourceforge.net/projects/fusioncatcher/files/data/human_v95.md5
    Resolving sourceforge.net (sourceforge.net)... 216.105.38.13
    Connecting to sourceforge.net (sourceforge.net)|216.105.38.13|:80... connected.
    HTTP request sent, awaiting response... 301 Moved Permanently
    Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.md5 [following]
    --2019-08-06 13:42:18--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.md5
    Connecting to sourceforge.net (sourceforge.net)|216.105.38.13|:443... connected.
    HTTP request sent, awaiting response... 301 Moved Permanently
    Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.md5/ [following]
    --2019-08-06 13:42:19--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.md5/
    Reusing existing connection to sourceforge.net:443.
    HTTP request sent, awaiting response... 302 Found
    Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.md5/download [following]
    --2019-08-06 13:42:19--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v95.md5/download
    Reusing existing connection to sourceforge.net:443.
    HTTP request sent, awaiting response... 302 Found
    Location: https://downloads.sourceforge.net/project/fusioncatcher/data/human_v95.md5?r=&ts=1565091739&use_mirror=iweb [following]
    --2019-08-06 13:42:19--  https://downloads.sourceforge.net/project/fusioncatcher/data/human_v95.md5?r=&ts=1565091739&use_mirror=iweb
    Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 216.105.38.13
    Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|216.105.38.13|:443... connected.
    HTTP request sent, awaiting response... 302 Found
    Location: https://iweb.dl.sourceforge.net/project/fusioncatcher/data/human_v95.md5 [following]
    --2019-08-06 13:42:20--  https://iweb.dl.sourceforge.net/project/fusioncatcher/data/human_v95.md5
    Resolving iweb.dl.sourceforge.net (iweb.dl.sourceforge.net)... 192.175.120.182, 2607:f748:10:12::5f:2
    Connecting to iweb.dl.sourceforge.net (iweb.dl.sourceforge.net)|192.175.120.182|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 270 [application/octet-stream]
    Saving to: '/sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.md5'

    100%[============================================================================================================================================>] 270         --.-K/s   in 0s

    2019-08-06 13:42:21 (15.2 MB/s) - '/sw/bioinfo/FusionCatcher/1.10/rackham/data/human_v95.md5' saved [270/270]

    human_v95.tar.gz.aa: OK
    human_v95.tar.gz.ab: OK
    human_v95.tar.gz.ac: OK
    human_v95.tar.gz.ad: OK
    human_v95.tar.gz.ae: OK
    rackham5: /sw/bioinfo/FusionCatcher/1.10/src $ /sw/bioinfo/FusionCatcher/1.10/rackham/bin/build.sh
    WARNING: Cannot restart automatically because the previous log file '/sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/fusioncatcher-build.log' cannot be found!
    The workflow will be restarted from the beginning with step 1!
    Log of the pipeline:
    --------------------------------------------------------------------------------
    Starting execution with step 1.
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 1   Time: 14:04   Date: 2019-08-06 (elapsed time: 0d:0h:0m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10/src'
    python_version.py
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    Python version: 2.7.15 (default, Jun 19 2018, 16:16:29)
    [GCC 4.8.5 20150623 (Red Hat 4.8.5-28)]
    Python executable: /sw/comp/python/2.7.15_rackham/bin/python
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 0 minute(s), and 0 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 2   Time: 14:04   Date: 2019-08-06 (elapsed time: 0d:0h:0m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10/src'
    biopython_version.py
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    1.73
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 0 minute(s), and 0 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 3   Time: 14:04   Date: 2019-08-06 (elapsed time: 0d:0h:0m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10/src'
    printf \
    "homo_sapiens"  \
    > /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/organism.txt
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 0 minute(s), and 0 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 4   Time: 14:04   Date: 2019-08-06 (elapsed time: 0d:0h:0m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10/src'
    get_genome.py \
    --organism homo_sapiens \
    --server ftp.ensembl.org \
    --output /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    Downloading the genome of organism 'homo_sapiens' from Ensembl!
    230 Login successful.
    Downloading: /pub/current_fasta//homo_sapiens/dna/Homo_sapiens.GRCh38.dna.chromosome.MT.fa.gz
    Downloading: /pub/current_fasta//homo_sapiens/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz
    Executing:   gzip -d -f -c '/sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/Homo_sapiens.GRCh38.dna.chromosome.MT.fa.gz' > '/sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/Homo_sapiens.GRCh38.dna.chromosome.MT.fa'
    Executing:   gzip -d -f -c '/sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz' > '/sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/Homo_sapiens.GRCh38.dna.primary_assembly.fa'
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 0 minute(s), and 54 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 5   Time: 14:05   Date: 2019-08-06 (elapsed time: 0d:0h:1m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10/src'
    generate_chrom_lens.py \
    --input_genome /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/genome.fa \
    --output /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    Traceback (most recent call last):
      File "/sw/bioinfo/FusionCatcher/1.10/rackham/bin/generate_chrom_lens.py", line 67, in <module>
        import Bio.SeqIO
      File "/sw/bioinfo/FusionCatcher/1.10/rackham/tools/biopython/Bio/SeqIO/__init__.py", line 384, in <module>
        from Bio.Align import MultipleSeqAlignment
      File "/sw/bioinfo/FusionCatcher/1.10/rackham/tools/biopython/Bio/Align/__init__.py", line 29, in <module>
        raise new_exc
    ImportError: cannot import name _aligners: you should not import directly from the biopython source directory; please exit the source tree and re-launch your code from there


    ERROR: Workflow execution failed at step 5 while executing:
    ----------------
       generate_chrom_lens.py \
       --input_genome /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/genome.fa \
       --output /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/
    ----------------


    Executing second time the same step/command in order to capture error messages (i.e. STDERR)...

    -------------------------------------------
    Traceback (most recent call last):
      File "/sw/bioinfo/FusionCatcher/1.10/rackham/bin/generate_chrom_lens.py", line 67, in <module>
        import Bio.SeqIO
      File "/sw/bioinfo/FusionCatcher/1.10/rackham/tools/biopython/Bio/SeqIO/__init__.py", line 384, in <module>
        from Bio.Align import MultipleSeqAlignment
      File "/sw/bioinfo/FusionCatcher/1.10/rackham/tools/biopython/Bio/Align/__init__.py", line 29, in <module>
        raise new_exc
    ImportError: cannot import name _aligners: you should not import directly from the biopython source directory; please exit the source tree and re-launch your code from there


    ################################################################################
    ################################################################################
    TOTAL RUNNING TIME: 0 day(s), 0 hour(s), 0 minute(s), and 56 second(s)
    ################################################################################
    ################################################################################
    rackham5: /sw/bioinfo/FusionCatcher/1.10/src $ cd ..
    rackham5: /sw/bioinfo/FusionCatcher/1.10 $ ll
    total 8
    lrwxrwxrwx  1 douglas sw    7 Aug  6 13:20 bianca -> rackham
    lrwxrwxrwx  1 douglas sw    7 Aug  6 13:20 irma -> rackham
    drwxrwsr-x 10 douglas sw 4096 Aug  6 13:20 rackham
    lrwxrwxrwx  1 douglas sw    7 Aug  6 13:20 snowy -> rackham
    drwxrwsr-x  2 douglas sw 4096 Aug  6 13:20 src
    rackham5: /sw/bioinfo/FusionCatcher/1.10 $ /sw/bioinfo/FusionCatcher/1.10/rackham/bin/build.sh
    WARNING: Cannot restart automatically because the previous log file '/sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/fusioncatcher-build.log' cannot be found!
    The workflow will be restarted from the beginning with step 1!
    Log of the pipeline:
    --------------------------------------------------------------------------------
    Starting execution with step 1.
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 1   Time: 14:06   Date: 2019-08-06 (elapsed time: 0d:0h:0m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10'
    python_version.py
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    Python version: 2.7.15 (default, Jun 19 2018, 16:16:29)
    [GCC 4.8.5 20150623 (Red Hat 4.8.5-28)]
    Python executable: /sw/comp/python/2.7.15_rackham/bin/python
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 0 minute(s), and 0 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 2   Time: 14:06   Date: 2019-08-06 (elapsed time: 0d:0h:0m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10'
    biopython_version.py
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    1.73
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 0 minute(s), and 0 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 3   Time: 14:06   Date: 2019-08-06 (elapsed time: 0d:0h:0m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10'
    printf \
    "homo_sapiens"  \
    > /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/organism.txt
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 0 minute(s), and 0 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 4   Time: 14:06   Date: 2019-08-06 (elapsed time: 0d:0h:0m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10'
    get_genome.py \
    --organism homo_sapiens \
    --server ftp.ensembl.org \
    --output /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    Downloading the genome of organism 'homo_sapiens' from Ensembl!
    230 Login successful.
    Downloading: /pub/current_fasta//homo_sapiens/dna/Homo_sapiens.GRCh38.dna.chromosome.MT.fa.gz
    Downloading: /pub/current_fasta//homo_sapiens/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz
    Executing:   gzip -d -f -c '/sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/Homo_sapiens.GRCh38.dna.chromosome.MT.fa.gz' > '/sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/Homo_sapiens.GRCh38.dna.chromosome.MT.fa'
    Executing:   gzip -d -f -c '/sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz' > '/sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/Homo_sapiens.GRCh38.dna.primary_assembly.fa'
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 0 minute(s), and 54 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 5   Time: 14:07   Date: 2019-08-06 (elapsed time: 0d:0h:1m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10'
    generate_chrom_lens.py \
    --input_genome /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/genome.fa \
    --output /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    Traceback (most recent call last):
      File "/sw/bioinfo/FusionCatcher/1.10/rackham/bin/generate_chrom_lens.py", line 67, in <module>
        import Bio.SeqIO
      File "/sw/bioinfo/FusionCatcher/1.10/rackham/tools/biopython/Bio/SeqIO/__init__.py", line 384, in <module>
        from Bio.Align import MultipleSeqAlignment
      File "/sw/bioinfo/FusionCatcher/1.10/rackham/tools/biopython/Bio/Align/__init__.py", line 29, in <module>
        raise new_exc
    ImportError: cannot import name _aligners: you should not import directly from the biopython source directory; please exit the source tree and re-launch your code from there


    ERROR: Workflow execution failed at step 5 while executing:
    ----------------
       generate_chrom_lens.py \
       --input_genome /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/genome.fa \
       --output /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/
    ----------------


    Executing second time the same step/command in order to capture error messages (i.e. STDERR)...

    -------------------------------------------
    Traceback (most recent call last):
      File "/sw/bioinfo/FusionCatcher/1.10/rackham/bin/generate_chrom_lens.py", line 67, in <module>
        import Bio.SeqIO
      File "/sw/bioinfo/FusionCatcher/1.10/rackham/tools/biopython/Bio/SeqIO/__init__.py", line 384, in <module>
        from Bio.Align import MultipleSeqAlignment
      File "/sw/bioinfo/FusionCatcher/1.10/rackham/tools/biopython/Bio/Align/__init__.py", line 29, in <module>
        raise new_exc
    ImportError: cannot import name _aligners: you should not import directly from the biopython source directory; please exit the source tree and re-launch your code from there


    ################################################################################
    ################################################################################
    TOTAL RUNNING TIME: 0 day(s), 0 hour(s), 0 minute(s), and 55 second(s)
    ################################################################################
    ################################################################################
    rackham5: /sw/bioinfo/FusionCatcher/1.10 $ ml biopython
    Lmod has detected the following error:  These module(s) exist but cannot be loaded as requested: "biopython"
       Try: "module spider biopython" to see how to load the module(s).



    rackham5: /sw/bioinfo/FusionCatcher/1.10 $ ml bioinfo-tools biopython/1.73
    rackham5: /sw/bioinfo/FusionCatcher/1.10 $ /sw/bioinfo/FusionCatcher/1.10/rackham/bin/build.sh
    WARNING: Cannot restart automatically because the previous log file '/sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/fusioncatcher-build.log' cannot be found!
    The workflow will be restarted from the beginning with step 1!
    Log of the pipeline:
    --------------------------------------------------------------------------------
    Starting execution with step 1.
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 1   Time: 14:08   Date: 2019-08-06 (elapsed time: 0d:0h:0m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10'
    python_version.py
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    Python version: 2.7.15 (default, Jun 19 2018, 16:16:29)
    [GCC 4.8.5 20150623 (Red Hat 4.8.5-28)]
    Python executable: /sw/comp/python/2.7.15_rackham/bin/python
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 0 minute(s), and 0 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 2   Time: 14:08   Date: 2019-08-06 (elapsed time: 0d:0h:0m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10'
    biopython_version.py
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    1.73
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 0 minute(s), and 0 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 3   Time: 14:08   Date: 2019-08-06 (elapsed time: 0d:0h:0m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10'
    printf \
    "homo_sapiens"  \
    > /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/organism.txt
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 0 minute(s), and 0 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 4   Time: 14:08   Date: 2019-08-06 (elapsed time: 0d:0h:0m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10'
    get_genome.py \
    --organism homo_sapiens \
    --server ftp.ensembl.org \
    --output /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    Downloading the genome of organism 'homo_sapiens' from Ensembl!
    230 Login successful.
    Downloading: /pub/current_fasta//homo_sapiens/dna/Homo_sapiens.GRCh38.dna.chromosome.MT.fa.gz
    Downloading: /pub/current_fasta//homo_sapiens/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz
    Executing:   gzip -d -f -c '/sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/Homo_sapiens.GRCh38.dna.chromosome.MT.fa.gz' > '/sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/Homo_sapiens.GRCh38.dna.chromosome.MT.fa'
    Executing:   gzip -d -f -c '/sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz' > '/sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/Homo_sapiens.GRCh38.dna.primary_assembly.fa'
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 0 minute(s), and 49 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 5   Time: 14:09   Date: 2019-08-06 (elapsed time: 0d:0h:1m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10'
    generate_chrom_lens.py \
    --input_genome /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/genome.fa \
    --output /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/
    --------------------------------------------------------------------------------
    +-->EXECUTING...
      * chromosome 1 has length 248956422
      * chromosome 10 has length 133797422
      * chromosome 11 has length 135086622
      * chromosome 12 has length 133275309
      * chromosome 13 has length 114364328
      * chromosome 14 has length 107043718
      * chromosome 15 has length 101991189
      * chromosome 16 has length 90338345
      * chromosome 17 has length 83257441
      * chromosome 18 has length 80373285
      * chromosome 19 has length 58617616
      * chromosome 2 has length 242193529
      * chromosome 20 has length 64444167
      * chromosome 21 has length 46709983
      * chromosome 22 has length 50818468
      * chromosome 3 has length 198295559
      * chromosome 4 has length 190214555
      * chromosome 5 has length 181538259
      * chromosome 6 has length 170805979
      * chromosome 7 has length 159345973
      * chromosome 8 has length 145138636
      * chromosome 9 has length 138394717
      * chromosome MT has length 16569
      * chromosome X has length 156040895
      * chromosome Y has length 57227415
      * chromosome KI270728.1 has length 1872759
      * chromosome KI270727.1 has length 448248
      * chromosome KI270442.1 has length 392061
      * chromosome KI270729.1 has length 280839
      * chromosome GL000225.1 has length 211173
      * chromosome KI270743.1 has length 210658
      * chromosome GL000008.2 has length 209709
      * chromosome GL000009.2 has length 201709
      * chromosome KI270747.1 has length 198735
      * chromosome KI270722.1 has length 194050
      * chromosome GL000194.1 has length 191469
      * chromosome KI270742.1 has length 186739
      * chromosome GL000205.2 has length 185591
      * chromosome GL000195.1 has length 182896
      * chromosome KI270736.1 has length 181920
      * chromosome KI270733.1 has length 179772
      * chromosome GL000224.1 has length 179693
      * chromosome GL000219.1 has length 179198
      * chromosome KI270719.1 has length 176845
      * chromosome GL000216.2 has length 176608
      * chromosome KI270712.1 has length 176043
      * chromosome KI270706.1 has length 175055
      * chromosome KI270725.1 has length 172810
      * chromosome KI270744.1 has length 168472
      * chromosome KI270734.1 has length 165050
      * chromosome GL000213.1 has length 164239
      * chromosome GL000220.1 has length 161802
      * chromosome KI270715.1 has length 161471
      * chromosome GL000218.1 has length 161147
      * chromosome KI270749.1 has length 158759
      * chromosome KI270741.1 has length 157432
      * chromosome GL000221.1 has length 155397
      * chromosome KI270716.1 has length 153799
      * chromosome KI270731.1 has length 150754
      * chromosome KI270751.1 has length 150742
      * chromosome KI270750.1 has length 148850
      * chromosome KI270519.1 has length 138126
      * chromosome GL000214.1 has length 137718
      * chromosome KI270708.1 has length 127682
      * chromosome KI270730.1 has length 112551
      * chromosome KI270438.1 has length 112505
      * chromosome KI270737.1 has length 103838
      * chromosome KI270721.1 has length 100316
      * chromosome KI270738.1 has length 99375
      * chromosome KI270748.1 has length 93321
      * chromosome KI270435.1 has length 92983
      * chromosome GL000208.1 has length 92689
      * chromosome KI270538.1 has length 91309
      * chromosome KI270756.1 has length 79590
      * chromosome KI270739.1 has length 73985
      * chromosome KI270757.1 has length 71251
      * chromosome KI270709.1 has length 66860
      * chromosome KI270746.1 has length 66486
      * chromosome KI270753.1 has length 62944
      * chromosome KI270589.1 has length 44474
      * chromosome KI270726.1 has length 43739
      * chromosome KI270735.1 has length 42811
      * chromosome KI270711.1 has length 42210
      * chromosome KI270745.1 has length 41891
      * chromosome KI270714.1 has length 41717
      * chromosome KI270732.1 has length 41543
      * chromosome KI270713.1 has length 40745
      * chromosome KI270754.1 has length 40191
      * chromosome KI270710.1 has length 40176
      * chromosome KI270717.1 has length 40062
      * chromosome KI270724.1 has length 39555
      * chromosome KI270720.1 has length 39050
      * chromosome KI270723.1 has length 38115
      * chromosome KI270718.1 has length 38054
      * chromosome KI270317.1 has length 37690
      * chromosome KI270740.1 has length 37240
      * chromosome KI270755.1 has length 36723
      * chromosome KI270707.1 has length 32032
      * chromosome KI270579.1 has length 31033
      * chromosome KI270752.1 has length 27745
      * chromosome KI270512.1 has length 22689
      * chromosome KI270322.1 has length 21476
      * chromosome GL000226.1 has length 15008
      * chromosome KI270311.1 has length 12399
      * chromosome KI270366.1 has length 8320
      * chromosome KI270511.1 has length 8127
      * chromosome KI270448.1 has length 7992
      * chromosome KI270521.1 has length 7642
      * chromosome KI270581.1 has length 7046
      * chromosome KI270582.1 has length 6504
      * chromosome KI270515.1 has length 6361
      * chromosome KI270588.1 has length 6158
      * chromosome KI270591.1 has length 5796
      * chromosome KI270522.1 has length 5674
      * chromosome KI270507.1 has length 5353
      * chromosome KI270590.1 has length 4685
      * chromosome KI270584.1 has length 4513
      * chromosome KI270320.1 has length 4416
      * chromosome KI270382.1 has length 4215
      * chromosome KI270468.1 has length 4055
      * chromosome KI270467.1 has length 3920
      * chromosome KI270362.1 has length 3530
      * chromosome KI270517.1 has length 3253
      * chromosome KI270593.1 has length 3041
      * chromosome KI270528.1 has length 2983
      * chromosome KI270587.1 has length 2969
      * chromosome KI270364.1 has length 2855
      * chromosome KI270371.1 has length 2805
      * chromosome KI270333.1 has length 2699
      * chromosome KI270374.1 has length 2656
      * chromosome KI270411.1 has length 2646
      * chromosome KI270414.1 has length 2489
      * chromosome KI270510.1 has length 2415
      * chromosome KI270390.1 has length 2387
      * chromosome KI270375.1 has length 2378
      * chromosome KI270420.1 has length 2321
      * chromosome KI270509.1 has length 2318
      * chromosome KI270315.1 has length 2276
      * chromosome KI270302.1 has length 2274
      * chromosome KI270518.1 has length 2186
      * chromosome KI270530.1 has length 2168
      * chromosome KI270304.1 has length 2165
      * chromosome KI270418.1 has length 2145
      * chromosome KI270424.1 has length 2140
      * chromosome KI270417.1 has length 2043
      * chromosome KI270508.1 has length 1951
      * chromosome KI270303.1 has length 1942
      * chromosome KI270381.1 has length 1930
      * chromosome KI270529.1 has length 1899
      * chromosome KI270425.1 has length 1884
      * chromosome KI270396.1 has length 1880
      * chromosome KI270363.1 has length 1803
      * chromosome KI270386.1 has length 1788
      * chromosome KI270465.1 has length 1774
      * chromosome KI270383.1 has length 1750
      * chromosome KI270384.1 has length 1658
      * chromosome KI270330.1 has length 1652
      * chromosome KI270372.1 has length 1650
      * chromosome KI270548.1 has length 1599
      * chromosome KI270580.1 has length 1553
      * chromosome KI270387.1 has length 1537
      * chromosome KI270391.1 has length 1484
      * chromosome KI270305.1 has length 1472
      * chromosome KI270373.1 has length 1451
      * chromosome KI270422.1 has length 1445
      * chromosome KI270316.1 has length 1444
      * chromosome KI270340.1 has length 1428
      * chromosome KI270338.1 has length 1428
      * chromosome KI270583.1 has length 1400
      * chromosome KI270334.1 has length 1368
      * chromosome KI270429.1 has length 1361
      * chromosome KI270393.1 has length 1308
      * chromosome KI270516.1 has length 1300
      * chromosome KI270389.1 has length 1298
      * chromosome KI270466.1 has length 1233
      * chromosome KI270388.1 has length 1216
      * chromosome KI270544.1 has length 1202
      * chromosome KI270310.1 has length 1201
      * chromosome KI270412.1 has length 1179
      * chromosome KI270395.1 has length 1143
      * chromosome KI270376.1 has length 1136
      * chromosome KI270337.1 has length 1121
      * chromosome KI270335.1 has length 1048
      * chromosome KI270378.1 has length 1048
      * chromosome KI270379.1 has length 1045
      * chromosome KI270329.1 has length 1040
      * chromosome KI270419.1 has length 1029
      * chromosome KI270336.1 has length 1026
      * chromosome KI270312.1 has length 998
      * chromosome KI270539.1 has length 993
      * chromosome KI270385.1 has length 990
      * chromosome KI270423.1 has length 981
      * chromosome KI270392.1 has length 971
      * chromosome KI270394.1 has length 970
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 0 minute(s), and 31 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 6   Time: 14:09   Date: 2019-08-06 (elapsed time: 0d:0h:2m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10'
    get_gtf.py \
    --organism homo_sapiens \
    --server ftp.ensembl.org \
    --output /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    230 Login successful.
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 0 minute(s), and 10 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 7   Time: 14:09   Date: 2019-08-06 (elapsed time: 0d:0h:2m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10'
    get_viruses.py \
    --server ftp.ncbi.nlm.nih.gov \
    --output /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    Downloading the viral genomes from NCBI server!
    230 Anonymous access granted, restrictions apply
    Downloading: ftp.ncbi.nlm.nih.gov/refseq/release/viral//viral.1.1.genomic.fna.gz
    Downloading: ftp.ncbi.nlm.nih.gov/refseq/release/viral//viral.2.1.genomic.fna.gz
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 0 minute(s), and 11 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 8   Time: 14:09   Date: 2019-08-06 (elapsed time: 0d:0h:2m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10'
    sed \
    's/ /_/g'  \
     /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/viruses.fa \
    > /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/viruses-noblanks.fa
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 0 minute(s), and 2 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 9   Time: 14:09   Date: 2019-08-06 (elapsed time: 0d:0h:2m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10'
    get_synonyms.py \
    --organism homo_sapiens \
    --server ftp.ensembl.org \
    --output /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    Downloading the MySQL files of organism 'homo_sapiens' from Ensembl!
    230 Login successful.
    Downloading: ftp.ensembl.org/pub/current_mysql/homo_sapiens_core_97_38/object_xref.txt.gz
    Downloading: ftp.ensembl.org/pub/current_mysql/homo_sapiens_core_97_38/xref.txt.gz
    Downloading: ftp.ensembl.org/pub/current_mysql/homo_sapiens_core_97_38/external_synonym.txt.gz
    Downloading: ftp.ensembl.org/pub/current_mysql/homo_sapiens_core_97_38/homo_sapiens_core_97_38.sql.gz
    Downloading: ftp.ensembl.org/pub/current_mysql/homo_sapiens_core_97_38/gene.txt.gz
    Decompressing files ...
    Parsing the tables in the SQL file...
    Joining all tables...
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 0 minute(s), and 46 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 10   Time: 14:10   Date: 2019-08-06 (elapsed time: 0d:0h:3m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10'
    generate_genes_symbols.py \
    --organism homo_sapiens \
    --output /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    Starting...
    End.
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 0 minute(s), and 20 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 11   Time: 14:11   Date: 2019-08-06 (elapsed time: 0d:0h:3m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10'
    get_genes_descriptions.py \
    --organism homo_sapiens \
    --server www.ensembl.org \
    --output /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    Starting...
    Downloaded:      4.56 MB
    Downloaded:      4.56 MB

    End.
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 0 minute(s), and 2 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 12   Time: 14:11   Date: 2019-08-06 (elapsed time: 0d:0h:3m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10'
    sed \
    -i  \
    's/glyceraldehyde-3-phosphate\ dehydrogenase/glyceraldehyde\ 3\ phosphate\ dehydrogenase/g'  \
     /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/descriptions.txt
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 0 minute(s), and 0 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 13   Time: 14:11   Date: 2019-08-06 (elapsed time: 0d:0h:3m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10'
    get_exons_positions.py \
    --organism homo_sapiens \
    --server www.ensembl.org \
    --threshold_length 150 \
    --output /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/
    --------------------------------------------------------------------------------
    +-->B
    FINISHED downloading:      9.16 MB

    chromosome = 18
    Downloaded:      2.85 MB
    FINISHED downloading:      2.85 MB

    chromosome = 19
    Downloaded:      8.80 MB
    FINISHED downloading:      8.80 MB

    chromosome = 2
    Downloaded:     12.23 MB
    FINISHED downloading:     12.23 MB

    chromosome = 20
    Downloaded:      3.67 MB
    FINISHED downloading:      3.67 MB

    chromosome = 21
    Downloaded:      1.88 MB
    FINISHED downloading:      1.88 MB

    chromosome = 22
    Downloaded:      3.39 MB
    FINISHED downloading:      3.39 MB

    chromosome = 3
    Downloaded:     10.54 MB
    FINISHED downloading:     10.54 MB

    chromosome = 4
    Downloaded:      6.34 MB
    FINISHED downloading:      6.34 MB

    chromosome = 5
    Downloaded:      7.21 MB
    FINISHED downloading:      7.21 MB

    chromosome = 6
    Downloaded:      7.23 MB
    FINISHED downloading:      7.23 MB

    chromosome = 7
    Downloaded:      7.60 MB
    FINISHED downloading:      7.60 MB

    chromosome = 8
    Downloaded:      5.84 MB
    FINISHED downloading:      5.84 MB

    chromosome = 9
    Downloaded:      5.59 MB
    FINISHED downloading:      5.59 MB

    chromosome = MT
    Downloaded:      0.00 MB
    FINISHED downloading:      0.00 MB

    chromosome = X
    Downloaded:      4.89 MB
    FINISHED downloading:      4.89 MB

    chromosome = Y
    Downloaded:      0.47 MB
    FINISHED downloading:      0.47 MB

    End.
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 17 minute(s), and 25 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 14   Time: 14:28   Date: 2019-08-06 (elapsed time: 0d:0h:21m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10'
    Copying from:
    '/sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/genes.txt'
    to:
    '/sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/genes_backup.txt'
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 0 minute(s), and 0 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 15   Time: 14:28   Date: 2019-08-06 (elapsed time: 0d:0h:21m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10'
    get_biotypes.py \
    --organism homo_sapiens \
    --server www.ensembl.org \
    --output /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    Starting...
    Downloaded:      1.89 MB
    Downloaded:      1.89 MB

    End.
    --------------------------------------------------------------------------------
    ==> Execution time: 0 day(s), 0 hour(s), 0 minute(s), and 2 second(s)
    ////////////////////////////////////////////////////////////////////////////////
      Running: step = 16   Time: 14:28   Date: 2019-08-06 (elapsed time: 0d:0h:21m)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    ==> Current working directory: '/sw/bioinfo/FusionCatcher/1.10'
    get_paralogs.py \
    --organism homo_sapiens \
    --server www.ensembl.org \
    --output /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/
    --------------------------------------------------------------------------------
    +-->EXECUTING...
    Starting...
    Downloaded:      1.29 MB
    Finished downloading:      1.29 MB

    chromosome = 1
    Downloaded:     10.33 MB
    Finished downloading:     10.33 MB

    chromosome = 10
    Downloaded:      4.79 MB
    Finished downloading:      4.79 MB

    chromosome = 11
    Downloaded:      4.48 MB
    Finished downloading:      4.48 MB

    chromosome = 12
    Downloaded:      5.49 MB
    Finished downloading:      5.49 MB

    chromosome = 13
    Downloaded:      2.78 MB
    Finished downloading:      2.78 MB

    chromosome = 14
    Downloaded:      3.92 MB
    Finished downloading:      3.92 MB

    chromosome = 15
    Downloaded:      4.70 MB
    Finished downloading:      4.70 MB

    chromosome = 16
    Downloaded:      2.94 MB
    Finished downloading:      2.94 MB

    chromosome = 17
    Downloaded:      5.05 MB
    Finished downloading:      5.05 MB

    chromosome = 18
    Downloaded:      2.55 MB
    Finished downloading:      2.55 MB

    chromosome = 19

    IOError = timed out


    ERROR: Workflow execution failed at step 16 while executing:
    ----------------
       get_paralogs.py \
       --organism homo_sapiens \
       --server www.ensembl.org \
       --output /sw/bioinfo/FusionCatcher/1.10/rackham/data/v97/
    ----------------


    Executing second time the same step/command in order to capture error messages (i.e. STDERR)...

    -------------------------------------------
    Starting...
    Downloaded:      1.29 MB
    Finished downloading:      1.29 MB

    chromosome = 1
    Downloaded:     10.33 MB
    Finished downloading:     10.33 MB

    chromosome = 10
    Downloaded:      4.79 MB
    Finished downloading:      4.79 MB

    chromosome = 11
    Downloaded:      4.48 MB
    Finished downloading:      4.48 MB

    chromosome = 12
    Downloaded:      5.49 MB
    Finished downloading:      5.49 MB

    chromosome = 13
    Downloaded:      2.78 MB
    Finished downloading:      2.78 MB

    chromosome = 14
    Downloaded:      3.92 MB
    Finished downloading:      3.92 MB

    chromosome = 15
    Downloaded:      4.70 MB
    Finished downloading:      4.70 MB

    chromosome = 16
    Downloaded:      2.94 MB
    Finished downloading:      2.94 MB

    chromosome = 17
    Downloaded:      5.05 MB
    Finished downloading:      5.05 MB

    chromosome = 18
    Downloaded:      2.55 MB
    Finished downloading:      2.55 MB

    chromosome = 19
    Downloaded:      3.73 MB
    Finished downloading:      3.73 MB

    chromosome = 2
    Downloaded:      8.77 MB
    Finished downloading:      8.77 MB

    chromosome = 20
    Downloaded:      2.64 MB
    Finished downloading:      2.64 MB

    chromosome = 21
    Downloaded:      1.18 MB
    Finished downloading:      1.18 MB

    chromosome = 22
    Downloaded:      2.19 MB
    Finished downloading:      2.19 MB

    chromosome = 3
    Downloaded:      6.90 MB
    Finished downloading:      6.90 MB

    chromosome = 4
    Downloaded:      5.94 MB
    Finished downloading:      5.94 MB

    chromosome = 5
    Downloaded:      5.67 MB
    Finished downloading:      5.67 MB

    chromosome = 6
    Downloaded:      5.73 MB
    Finished downloading:      5.73 MB

    chromosome = 7
    Downloaded:      5.71 MB
    Finished downloading:      5.71 MB

    chromosome = 8
    Downloaded:      4.32 MB
    Finished downloading:      4.32 MB

    chromosome = 9
    Downloaded:      4.20 MB
    Finished downloading:      4.20 MB

    chromosome = MT
    Downloaded:      0.00 MB
    Finished downloading:      0.00 MB

    chromosome = X
    Downloaded:      5.07 MB
    Finished downloading:      5.07 MB

    chromosome = Y
    Downloaded:      0.50 MB
    Finished downloading:      0.50 MB

    End.


    WARNING: First execution ended with error but second execution did not! Therefore cannot capture the STDERR!
    ################################################################################
    ################################################################################
    TOTAL RUNNING TIME: 0 day(s), 0 hour(s), 41 minute(s), and 19 second(s)
    ################################################################################
    ################################################################################
