FusionCatcher/1.33
========================

<https://github.com/ndaniel/fusioncatcher>

Used under license:
GPLv3


Structure creating script (makeroom_FusionCatcher_1.33.sh) moved to /sw/bioinfo/FusionCatcher/makeroom_1.33.sh

LOG
---

    /home/douglas/bin/makeroom.sh -f" -t "FusionCatcher" -v "1.33" -w "https://github.com/ndaniel/fusioncatcher" -d "Finder of somatic fusion-genes in RNA-seq data" -l "GPLv3"
    ./makeroom_FusionCatcher_1.33.sh
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

FusionCatcher-1.33_install-README.md

Last login: Thu Dec  2 18:48:03 2021 from fb166.ebc.uu.se
-bash: warning: setlocale: LC_CTYPE: cannot change locale (): No such file or directory
-bash: warning: setlocale: LC_CTYPE: cannot change locale (): No such file or directory
 _   _ ____  ____  __  __    _    __  __
| | | |  _ \|  _ \|  \/  |  / \   \ \/ /   | System:    rackham5
| | | | |_) | |_) | |\/| | / _ \   \  /    | User:      douglas
| |_| |  __/|  __/| |  | |/ ___ \  /  \    |
 \___/|_|   |_|   |_|  |_/_/   \_\/_/\_\   |

###############################################################################

        User Guides: http://www.uppmax.uu.se/support/user-guides
        FAQ: http://www.uppmax.uu.se/support/faq

        Write to support@uppmax.uu.se, if you have questions or comments.


Active notices for rackham:

  December maintenance window
  http://status.uppmax.uu.se/2021-11-24/december-maintenance/

bashswap: .bashrc and .bash_profile are *simple*
rackham5: ~ $ cd /sw/bioinfo/FusionCatcher/
rackham5: /sw/bioinfo/FusionCatcher $ ll
total 128
drwxrwsr-x 3 douglas sw  4096 Dec 18  2017 0.99.3e
drwxrwsr-x 4 douglas sw  4096 Dec 18  2017 0.99.5a
drwxrwsr-x 6 douglas sw  4096 Sep 25  2018 1.00
drwxrwsr-x 4 douglas sw  4096 Aug  6  2019 1.10
-rw-rw-r-- 1 jonass  sw   286 Nov 24 14:15 FusionCatcher-0.99.3e.DRAFT.yaml
-rw-rw-r-- 1 jonass  sw   286 Nov 24 14:15 FusionCatcher-0.99.5a.DRAFT.yaml
-rw-rw-r-- 1 douglas sw  4299 Dec 18  2017 FusionCatcher-1.00-install-README.md
-rw-rw-r-- 1 jonass  sw   414 Nov 24 14:14 FusionCatcher-1.00.DRAFT.yaml
-rw-rw-r-- 1 douglas sw 80426 Sep  9  2019 FusionCatcher-1.10-install-README.md
-rw-rw-r-- 1 jonass  sw   403 Nov 24 14:14 FusionCatcher-1.10.DRAFT.yaml
drwxrwsr-x 2 douglas sw  4096 Aug  6  2019 mf
rackham5: /sw/bioinfo/FusionCatcher $ cat FusionCatcher-1.10-install-README.md
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
rackham5: /sw/bioinfo/FusionCatcher $ pushd .
/sw/bioinfo/FusionCatcher /sw/bioinfo/FusionCatcher
rackham5: /sw/bioinfo/FusionCatcher $ cd ..
rackham5: /sw/bioinfo $ makeroom.sh -t fastqtk ^C
rackham5: /sw/bioinfo $ mspid fastqtk
Lmod has detected the following error:  Unable to find: "fastqtk".



rackham5: /sw/bioinfo $ makeroom.sh -t fastqtk -v 0.27 -w https://github.com/ndaniel/fastqtk -d "fast and lightweight tool for interleaving/deinterleaving/counting/trimming FASTQ files" -l MIT
Found tools at /domus/h1/douglas/github-sync/local/install-methods/


### fastqtk is a new software. You need to provide a SECTION with -s
Choose from the following:
alignment
annotation
assembly
deprecated
misc
phylogeny
pipelines
sw_collections
rackham5: /sw/bioinfo $ makeroom.sh -t fastqtk -v 0.27 -s misc -w https://github.com/ndaniel/fastqtk -d "fast and lightweight tool for interleaving/deinterleaving/counting/trimming FASTQ files" -l MIT
Found tools at /domus/h1/douglas/github-sync/local/install-methods/

No files yet created in the file tree, but you can run this to get your variables set:
source /scratch/TMPFILE_fastqtk_0.27
rackham5: /sw/bioinfo $ ./makeroom_fastqtk_0.27.sh

No previous module file found
/sw/bioinfo/fastqtk

Making a new module file /sw/bioinfo/fastqtk/mf/0.27

Making a new readme file /sw/bioinfo/fastqtk/fastqtk-0.27_install-README.md

MODULE: To get a funcioning module, first, please modify /sw/bioinfo/fastqtk/mf/0.27 if needed.
    If new, it contains some examples that will most likely need to be changed

    After you are finished withe the module file, run /sw/bioinfo/fastqtk/fastqtk-0.27_post-install.sh to copy it and invoke all_mflink correctly.


Also, please modify /sw/bioinfo/fastqtk/fastqtk-0.27_install-README.md



For Singularity, make a bash file in a directory you include in the module file, like this:

echo '#!/bin/bash' > /sw/bioinfo/fastqtk/0.27/rackham/bin/fastqtk
echo 'singularity exec _ROOT/fastqtk.sif fastqtk "$@"' >> /sw/bioinfo/fastqtk/0.27/rackham/bin/fastqtk


This might help too:

[bio] fastqtk/0.27 installed on all systems
fastqtk (fast and lightweight tool for interleaving/deinterleaving/counting/trimming FASTQ files) version 0.27 installed on all systems as module fastqtk/0.27.
https://github.com/ndaniel/fastqtk
rackham, irma, bianca, snowy
0.27
MIT
Run this to set your variables and go to :

source /sw/bioinfo/fastqtk/SOURCEME_fastqtk_0.27 && cd $TOOLDIR
rackham5: /sw/bioinfo $ source /sw/bioinfo/fastqtk/SOURCEME_fastqtk_0.27 && cd $TOOLDIR
rackham5: /sw/bioinfo/fastqtk $ cd $SRCDIR
rackham5: /sw/bioinfo/fastqtk/0.27/src $ wget https://github.com/ndaniel/fastqtk/archive/refs/tags/v0.27.tar.gz
--2021-12-03 11:13:28--  https://github.com/ndaniel/fastqtk/archive/refs/tags/v0.27.tar.gz
Resolving github.com (github.com)... 140.82.121.4
Connecting to github.com (github.com)|140.82.121.4|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://codeload.github.com/ndaniel/fastqtk/tar.gz/refs/tags/v0.27 [following]
--2021-12-03 11:13:28--  https://codeload.github.com/ndaniel/fastqtk/tar.gz/refs/tags/v0.27
Resolving codeload.github.com (codeload.github.com)... 140.82.121.9
Connecting to codeload.github.com (codeload.github.com)|140.82.121.9|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [application/x-gzip]
Saving to: 'v0.27.tar.gz'

    [ <=>                                                                                                                               ] 11,948      --.-K/s   in 0.02s

2021-12-03 11:13:29 (508 KB/s) - 'v0.27.tar.gz' saved [11948]

rackham5: /sw/bioinfo/fastqtk/0.27/src $ tar xf v0.27.tar.gz
rackham5: /sw/bioinfo/fastqtk/0.27/src $ ll
total 16
drwxrwsr-x 2 douglas sw  4096 Mar 14  2021 fastqtk-0.27
-rw-rw-r-- 1 douglas sw 11948 Dec  3 11:13 v0.27.tar.gz
rackham5: /sw/bioinfo/fastqtk/0.27/src $ cd fastqtk-0.27/
rackham5: /sw/bioinfo/fastqtk/0.27/src/fastqtk-0.27 $ ll
total 132
-rw-rw-r-- 1 douglas sw   1105 Mar 14  2021 LICENSE
-rw-rw-r-- 1 douglas sw    188 Mar 14  2021 Makefile
-rw-rw-r-- 1 douglas sw   4855 Mar 14  2021 README.md
-rw-rw-r-- 1 douglas sw 105206 Mar 14  2021 fastqtk.c
-rwxrwxr-x 1 douglas sw   1866 Mar 14  2021 test.sh
-rwxrwxr-x 1 douglas sw   4014 Mar 14  2021 test_debug.sh
rackham5: /sw/bioinfo/fastqtk/0.27/src/fastqtk-0.27 $ cat Makefile
CC=gcc
CFLAGS=-g -Wall -O2 -Wno-unused-function

all:fastqtk

fastqtk:fastqtk.c
        $(CC) $(CFLAGS) fastqtk.c -o $@ -lz -lm

clean:
        rm -fr *.o ext/*.o a.out fastqtk *~ *.a *.dSYM session*
rackham5: /sw/bioinfo/fastqtk/0.27/src/fastqtk-0.27 $ make
gcc -g -Wall -O2 -Wno-unused-function fastqtk.c -o fastqtk -lz -lm
fastqtk.c:42:22: warning: initializer element is not a constant expression [enabled by default]
 const int CARS_LEN = strlen(CARS);
                      ^
fastqtk.c: In function 'main':
fastqtk.c:3516:1: warning: control reaches end of non-void function [-Wreturn-type]
 }
 ^
rackham5: /sw/bioinfo/fastqtk/0.27/src/fastqtk-0.27 $ make gcc/9.3.0
make: *** No rule to make target `gcc/9.3.0'.  Stop.
rackham5: /sw/bioinfo/fastqtk/0.27/src/fastqtk-0.27 $ cd ..
rackham5: /sw/bioinfo/fastqtk/0.27/src $ ll
total 16
drwxrwsr-x 2 douglas sw  4096 Dec  3 11:13 fastqtk-0.27
-rw-rw-r-- 1 douglas sw 11948 Dec  3 11:13 v0.27.tar.gz
rackham5: /sw/bioinfo/fastqtk/0.27/src $ rm -rf fastqtk-0.27/
rackham5: /sw/bioinfo/fastqtk/0.27/src $ tar xf v0.27.tar.gz
rackham5: /sw/bioinfo/fastqtk/0.27/src $ ml gcc/9.3.0
rackham5: /sw/bioinfo/fastqtk/0.27/src $ cd fastqtk-0.27/
rackham5: /sw/bioinfo/fastqtk/0.27/src/fastqtk-0.27 $ make
gcc -g -Wall -O2 -Wno-unused-function fastqtk.c -o fastqtk -lz -lm
rackham5: /sw/bioinfo/fastqtk/0.27/src/fastqtk-0.27 $ ll
total 312
-rw-rw-r-- 1 douglas sw   1105 Mar 14  2021 LICENSE
-rw-rw-r-- 1 douglas sw    188 Mar 14  2021 Makefile
-rw-rw-r-- 1 douglas sw   4855 Mar 14  2021 README.md
-rwxrwxr-x 1 douglas sw 179904 Dec  3 11:14 fastqtk
-rw-rw-r-- 1 douglas sw 105206 Mar 14  2021 fastqtk.c
-rwxrwxr-x 1 douglas sw   1866 Mar 14  2021 test.sh
-rwxrwxr-x 1 douglas sw   4014 Mar 14  2021 test_debug.sh
rackham5: /sw/bioinfo/fastqtk/0.27/src/fastqtk-0.27 $ cat test.sh
#!/usr/bin/env bash


FILE=reads_1.fq
if [ ! -f "$FILE" ]; then
    wget https://sourceforge.net/projects/fusioncatcher/files/test/reads_1.fq.gz -O reads_1.fq.gz
    wget https://sourceforge.net/projects/fusioncatcher/files/test/reads_2.fq.gz -O reads_2.fq.gz
    gzip -f -d *.gz
fi


echo "Testing.."
./fastqtk interleave reads_1.fq reads_2.fq - | ./fastqtk deinterleave - r1.fq r2.fq

if diff "reads_1.fq" "r1.fq" >/dev/null ; then
  echo -e "  * Test 1 -> Ok!\n"
else
  echo -e "\n\n\n\033[33;7m   ERROR: Something wrong with FASTQTK! Testing did not go well!   \033[0m\n"
  exit 1
fi

if diff "reads_2.fq" "r2.fq" >/dev/null ; then
  echo -e "  * Test 2 -> Ok!\n"
else
  echo -e "\n\n\n\033[33;7m   ERROR: Something wrong with FASTQTK! Testing did not go well!   \033[0m\n"
  exit 1
fi

cat reads_1.fq | echo $((`wc -l`/4)) > n_wc.txt
./fastqtk count reads_1.fq  n_ftk.txt

if diff "n_wc.txt" "n_ftk.txt" >/dev/null ; then
  echo -e "  * Test 3 -> ok!\n"
else
  echo -e "\n\n\n\033[33;7m   ERROR: Something wrong with FASTQTK! Testing did not go well!   \033[0m\n"
  exit 1
fi

./fastqtk count-lengths reads_1.fq c_ftk.txt l_ftk.txt
cat reads_1.fq | echo $((`wc -l`/4)) > c_wc.txt

cat reads_1.fq | paste - - - - | cut -f 2 | LC_ALL=C awk '{ print length($0) }' | sort -run > l_awk.txt

if diff "c_wc.txt" "c_ftk.txt" >/dev/null ; then
  echo -e "  * Test 4 -> ok!\n"
else
  echo -e "\n\n\n\033[33;7m   ERROR: Something wrong with FASTQTK! Testing did not go well!   \033[0m\n"
  exit 1
fi


if diff "l_awk.txt" "l_ftk.txt" >/dev/null ; then
  echo -e "  * Test 5 -> ok!\n"
else
  echo -e "\n\n\n\033[33;7m   ERROR: Something wrong with FASTQTK! Testing did not go well!   \033[0m\n"
  exit 1
fi



echo -e "\n\033[33;7m   Testing of FASTQTK went fine!   \033[0m\n"

rm c_wc.txt
rm c_ftk.txt
rm l_ftk.txt
rm l_awk.txt
rm r1.fq
rm r2.fq
rm n_wc.txt
rm n_ftk.txt
rackham5: /sw/bioinfo/fastqtk/0.27/src/fastqtk-0.27 $ ll
.total 312
-rw-rw-r-- 1 douglas sw   1105 Mar 14  2021 LICENSE
-rw-rw-r-- 1 douglas sw    188 Mar 14  2021 Makefile
-rw-rw-r-- 1 douglas sw   4855 Mar 14  2021 README.md
-rwxrwxr-x 1 douglas sw 179904 Dec  3 11:14 fastqtk
-rw-rw-r-- 1 douglas sw 105206 Mar 14  2021 fastqtk.c
-rwxrwxr-x 1 douglas sw   1866 Mar 14  2021 test.sh
-rwxrwxr-x 1 douglas sw   4014 Mar 14  2021 test_debug.sh
rackham5: /sw/bioinfo/fastqtk/0.27/src/fastqtk-0.27 $ ./test.sh
--2021-12-03 11:14:23--  https://sourceforge.net/projects/fusioncatcher/files/test/reads_1.fq.gz
Resolving sourceforge.net (sourceforge.net)... 204.68.111.105
Connecting to sourceforge.net (sourceforge.net)|204.68.111.105|:443... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://sourceforge.net/projects/fusioncatcher/files/test/reads_1.fq.gz/ [following]
--2021-12-03 11:14:24--  https://sourceforge.net/projects/fusioncatcher/files/test/reads_1.fq.gz/
Reusing existing connection to sourceforge.net:443.
HTTP request sent, awaiting response... 302 Found
Location: https://sourceforge.net/projects/fusioncatcher/files/test/reads_1.fq.gz/download [following]
--2021-12-03 11:14:24--  https://sourceforge.net/projects/fusioncatcher/files/test/reads_1.fq.gz/download
Reusing existing connection to sourceforge.net:443.
HTTP request sent, awaiting response... 302 Found
Location: https://downloads.sourceforge.net/project/fusioncatcher/test/reads_1.fq.gz?ts=gAAAAABhqe4A0_2riNKR-FdAnBqtVW-SkLLp9ttPW11elMV3Z94d6MOQab3hkemxg_WoqjSr5Sve_DOrssbOIMj8_rRVP2qiXg%3D%3D&use_mirror=master&r= [following]
--2021-12-03 11:14:24--  https://downloads.sourceforge.net/project/fusioncatcher/test/reads_1.fq.gz?ts=gAAAAABhqe4A0_2riNKR-FdAnBqtVW-SkLLp9ttPW11elMV3Z94d6MOQab3hkemxg_WoqjSr5Sve_DOrssbOIMj8_rRVP2qiXg%3D%3D&use_mirror=master&r=
Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 204.68.111.105
Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|204.68.111.105|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://master.dl.sourceforge.net/project/fusioncatcher/test/reads_1.fq.gz?viasf=1 [following]
--2021-12-03 11:14:25--  https://master.dl.sourceforge.net/project/fusioncatcher/test/reads_1.fq.gz?viasf=1
Resolving master.dl.sourceforge.net (master.dl.sourceforge.net)... 216.105.38.12
Connecting to master.dl.sourceforge.net (master.dl.sourceforge.net)|216.105.38.12|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 780364 (762K) [application/x-gzip]
Saving to: 'reads_1.fq.gz'

100%[==================================================================================================================================>] 780,364     1.10MB/s   in 0.7s

2021-12-03 11:14:27 (1.10 MB/s) - 'reads_1.fq.gz' saved [780364/780364]

--2021-12-03 11:14:27--  https://sourceforge.net/projects/fusioncatcher/files/test/reads_2.fq.gz
Resolving sourceforge.net (sourceforge.net)... 204.68.111.105
Connecting to sourceforge.net (sourceforge.net)|204.68.111.105|:443... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://sourceforge.net/projects/fusioncatcher/files/test/reads_2.fq.gz/ [following]
--2021-12-03 11:14:28--  https://sourceforge.net/projects/fusioncatcher/files/test/reads_2.fq.gz/
Reusing existing connection to sourceforge.net:443.
HTTP request sent, awaiting response... 302 Found
Location: https://sourceforge.net/projects/fusioncatcher/files/test/reads_2.fq.gz/download [following]
--2021-12-03 11:14:28--  https://sourceforge.net/projects/fusioncatcher/files/test/reads_2.fq.gz/download
Reusing existing connection to sourceforge.net:443.
HTTP request sent, awaiting response... 302 Found
Location: https://downloads.sourceforge.net/project/fusioncatcher/test/reads_2.fq.gz?ts=gAAAAABhqe4ENq3M4sWrPJOleSlAzhf10Qr59R5x32xXEckKlQUDZkb6Utm4kBOWtKq3QwlXn_TQCnWUGs-VBlr5X95_3jHslQ%3D%3D&use_mirror=master&r= [following]
--2021-12-03 11:14:28--  https://downloads.sourceforge.net/project/fusioncatcher/test/reads_2.fq.gz?ts=gAAAAABhqe4ENq3M4sWrPJOleSlAzhf10Qr59R5x32xXEckKlQUDZkb6Utm4kBOWtKq3QwlXn_TQCnWUGs-VBlr5X95_3jHslQ%3D%3D&use_mirror=master&r=
Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 204.68.111.105
Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|204.68.111.105|:443... connected.
HTTP request sent, awaiting response... 302 Found
    /home/douglas/bin/makeroom.sh -t "fastqtk" -v "0.27" -s "misc" -w "https://github.com/ndaniel/fastqtk" -d "fast and lightweight tool for interleaving/deinterleaving/counting/trimming FASTQ files" -l "MIT"
    ./makeroom_fastqtk_0.27.sh
    cd $SRCDIR
    wget http://
    tar xvf
    make

   36  cat run_tsebra_example.sh
   37  cd ..
   38  ll
   39  cd bin/
   40  ll
   41  cd ..
   42  ll
   43  cd config/
   44  ll
   45  cat default.cfg
   46  cat keep_ab_initio.cfg
   47  cat pref_braker1.cfg
   48  eb --module-depends-on --module-syntax=Lua --robot --umask=002 --experimental --rpath fosscuda-2020b.eb
   49  eb --module-depends-on --module-syntax=Lua --robot --umask=002 --experimental --rpath  Bonito-0.3.8-fosscuda-2020b.eb --dry-run
   50  cd ../RNAseq-alignments/
   51  ll
   52  chmod +x split-stranded.sh
   53  ll
   54  vi split-stranded.sh
   55  cd ../../..
   56  ll
   57  rm -rf 1.0.3-20211126-336c380/
   58  mshow braker/2.1.6
   59  mshow braker/2.1.3
   60  mfshow braker
   61  mshow braker/2.1.5
   62  ll
   63  vi TSEBRA-1.0.2-20210716-1f167ad_install-README.md
   64  ll
   65  vi TSEBRA-1.0.3-20211126-336c380_install-README.md
   66  ml
   67  vi TSEBRA-1.0.3-20211126-336c380_install-README.md
   68  ll
   69  rm -f TSEBRA-1.0.3-20211126-336c380.yaml TSEBRA-1.0.3-20211126-336c380_post-install.sh
   70  ll
   71  cat TSEBRA-1.0.3-20211126-336c380_install-README.md
   72  rm -f SOURCEME_TSEBRA_1.0.3-20211126-336c380
   73   ./makeroom_TSEBRA_${VERSION}.sh
   74      source /sw/bioinfo/TSEBRA/SOURCEME_TSEBRA_${VERSION} && cd $TOOLDIR
   75      cd $VERSION
   76      cd src/
   77      ml git/2.28.0
   78      git clone https://github.com/Gaius-Augustus/TSEBRA
fastqtk-0.27_install-README.md [+]                                                                                                                        59,11           1%
Location: https://master.dl.sourceforge.net/project/fusioncatcher/test/reads_2.fq.gz?viasf=1 [following]
--2021-12-03 11:14:29--  https://master.dl.sourceforge.net/project/fusioncatcher/test/reads_2.fq.gz?viasf=1
Resolving master.dl.sourceforge.net (master.dl.sourceforge.net)... 216.105.38.12
Connecting to master.dl.sourceforge.net (master.dl.sourceforge.net)|216.105.38.12|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 801210 (782K) [application/x-gzip]
Saving to: 'reads_2.fq.gz'

100%[==================================================================================================================================>] 801,210     1.11MB/s   in 0.7s

2021-12-03 11:14:31 (1.11 MB/s) - 'reads_2.fq.gz' saved [801210/801210]

Testing..
  * Test 1 -> Ok!

  * Test 2 -> Ok!

  * Test 3 -> ok!

  * Test 4 -> ok!

  * Test 5 -> ok!


   Testing of FASTQTK went fine!

rackham5: /sw/bioinfo/fastqtk/0.27/src/fastqtk-0.27 $ ll
total 5480
-rw-rw-r-- 1 douglas sw    1105 Mar 14  2021 LICENSE
-rw-rw-r-- 1 douglas sw     188 Mar 14  2021 Makefile
-rw-rw-r-- 1 douglas sw    4855 Mar 14  2021 README.md
-rwxrwxr-x 1 douglas sw  179904 Dec  3 11:14 fastqtk
-rw-rw-r-- 1 douglas sw  105206 Mar 14  2021 fastqtk.c
-rw-rw-r-- 1 douglas sw 2631710 Jun 27  2017 reads_1.fq
-rw-rw-r-- 1 douglas sw 2631130 Jun 27  2017 reads_2.fq
-rwxrwxr-x 1 douglas sw    1866 Mar 14  2021 test.sh
-rwxrwxr-x 1 douglas sw    4014 Mar 14  2021 test_debug.sh
rackham5: /sw/bioinfo/fastqtk/0.27/src/fastqtk-0.27 $ cp -av fastqtk $PREFIX
'fastqtk' -> '/sw/bioinfo/fastqtk/0.27/rackham/fastqtk'
rackham5: /sw/bioinfo/fastqtk/0.27/src/fastqtk-0.27 $ cd ../../..
rackham5: /sw/bioinfo/fastqtk $ ll
total 36
drwxrwsr-x 4 douglas sw 4096 Dec  3 11:13 0.27
-rw-rw-r-- 1 douglas sw  516 Dec  3 11:13 SOURCEME_fastqtk_0.27
-rw-rw-r-- 1 douglas sw  412 Dec  3 11:13 fastqtk-0.27.yaml
-rw-rw-r-- 1 douglas sw  507 Dec  3 11:13 fastqtk-0.27_install-README.md
-rwxrwxr-x 1 douglas sw  822 Dec  3 11:13 fastqtk-0.27_post-install.sh
-rwxrwxr-x 1 douglas sw 9154 Dec  3 11:12 makeroom_fastqtk_0.27.sh
drwxrwsr-x 2 douglas sw 4096 Dec  3 11:13 mf
rackham5: /sw/bioinfo/fastqtk $ history >> fastqtk-0.27_install-README.md
rackham5: /sw/bioinfo/fastqtk $ vi fastqtk-0.27_install-README.md
F3 for ToggleMouse()
Press ENTER or type command to continue
rackham5: /sw/bioinfo/fastqtk $ cd mf
rackham5: /sw/bioinfo/fastqtk/mf $ ll
total 4
-rw-rw-r-- 1 douglas sw 1932 Dec  3 11:13 0.27
rackham5: /sw/bioinfo/fastqtk/mf $ vi 0.27
F3 for ToggleMouse()
Press ENTER or type command to continue
rackham5: /sw/bioinfo/fastqtk/mf $ cd ..
rackham5: /sw/bioinfo/fastqtk $ ll
total 36
drwxrwsr-x 4 douglas sw 4096 Dec  3 11:13 0.27
-rw-rw-r-- 1 douglas sw  516 Dec  3 11:13 SOURCEME_fastqtk_0.27
-rw-rw-r-- 1 douglas sw  412 Dec  3 11:13 fastqtk-0.27.yaml
-rw-rw-r-- 1 douglas sw  704 Dec  3 11:15 fastqtk-0.27_install-README.md
-rwxrwxr-x 1 douglas sw  822 Dec  3 11:13 fastqtk-0.27_post-install.sh
-rwxrwxr-x 1 douglas sw 9154 Dec  3 11:12 makeroom_fastqtk_0.27.sh
drwxrwsr-x 2 douglas sw 4096 Dec  3 11:13 mf
rackham5: /sw/bioinfo/fastqtk $ ./fastqtk-0.27_post-install.sh
++ args=("$@")
++ for arg in '${args[@]}'
++ chgrp -hR sw /sw/bioinfo/fastqtk/mf
++ chmod -R u+rwX,g+rwX,o+rX-w /sw/bioinfo/fastqtk/mf
++ [[ -n yes ]]
++ find /sw/bioinfo/fastqtk/mf -type d -print0
++ xargs -0 --no-run-if-empty chmod g+s
++ set +x
++ args=("$@")
++ for arg in '${args[@]}'
++ chgrp -hR sw /sw/bioinfo/fastqtk/0.27
++ chmod -R u+rwX,g+rwX,o+rX-w /sw/bioinfo/fastqtk/0.27
++ [[ -n yes ]]
++ find /sw/bioinfo/fastqtk/0.27 -type d -print0
++ xargs -0 --no-run-if-empty chmod g+s
++ set +x
'/sw/bioinfo/fastqtk/mf/0.27' -> '/sw/mf/common/bioinfo-tools/misc/fastqtk/0.27'
cluster=bianca
cluster=irma
cluster=rackham
cluster=snowy

*** FORCED

*** Done

*** mfshow -i fastqtk

/sw/mf/bianca/bioinfo-tools/misc/fastqtk/:
total 36
drwxrwsr-x   2 douglas sw  4096 Dec  3 11:16 .
drwxrwsr-x 337 douglas sw 28672 Dec  3 11:16 ..
lrwxrwxrwx   1 douglas sw    50 Dec  3 11:16 0.27 -> ../../../../common/bioinfo-tools/misc/fastqtk/0.27

/sw/mf/common/bioinfo-tools/misc/fastqtk/:
total 44
drwxrwsr-x   2 douglas sw  4096 Dec  3 11:16 .
drwxrwsr-x 391 johanhe sw 32768 Dec  3 11:13 ..
-rw-rw-r--   1 douglas sw   923 Dec  3 11:16 0.27

/sw/mf/irma/bioinfo-tools/misc/fastqtk/:
total 36
drwxrwsr-x   2 douglas sw  4096 Dec  3 11:16 .
drwxrwsr-x 337 douglas sw 28672 Dec  3 11:16 ..
lrwxrwxrwx   1 douglas sw    50 Dec  3 11:16 0.27 -> ../../../../common/bioinfo-tools/misc/fastqtk/0.27

/sw/mf/rackham/bioinfo-tools/misc/fastqtk/:
total 36
drwxrwsr-x   2 douglas sw  4096 Dec  3 11:16 .
drwxrwsr-x 337 root    sw 28672 Dec  3 11:16 ..
lrwxrwxrwx   1 douglas sw    50 Dec  3 11:16 0.27 -> ../../../../common/bioinfo-tools/misc/fastqtk/0.27

/sw/mf/snowy/bioinfo-tools/misc/fastqtk/:
total 36
drwxrwsr-x   2 douglas sw  4096 Dec  3 11:16 .
drwxrwsr-x 333 douglas sw 28672 Dec  3 11:16 ..
lrwxrwxrwx   1 douglas sw    50 Dec  3 11:16 0.27 -> ../../../../common/bioinfo-tools/misc/fastqtk/0.27
News:
[bio] fastqtk/0.27 installed on all systems
fastqtk (fast and lightweight tool for interleaving/deinterleaving/counting/trimming FASTQ files) version 0.27 installed on all systems as module fastqtk/0.27.
https://github.com/ndaniel/fastqtk
rackham, irma, bianca, snowy
0.27
MIT
rackham5: /sw/bioinfo/fastqtk $ ll
total 36
drwxrwsr-x 4 douglas sw 4096 Dec  3 11:13 0.27
-rw-rw-r-- 1 douglas sw  516 Dec  3 11:13 SOURCEME_fastqtk_0.27
-rw-rw-r-- 1 douglas sw  412 Dec  3 11:13 fastqtk-0.27.yaml
-rw-rw-r-- 1 douglas sw  704 Dec  3 11:15 fastqtk-0.27_install-README.md
-rwxrwxr-x 1 douglas sw  822 Dec  3 11:13 fastqtk-0.27_post-install.sh
-rwxrwxr-x 1 douglas sw 9154 Dec  3 11:12 makeroom_fastqtk_0.27.sh
drwxrwsr-x 2 douglas sw 4096 Dec  3 11:13 mf
rackham5: /sw/bioinfo/fastqtk $ cd ..
rackham5: /sw/bioinfo $
 Session Restarted
Last login: Fri Dec  3 11:09:01 2021 from c151-177-50-177.bredband.tele2.se
-bash: warning: setlocale: LC_CTYPE: cannot change locale (): No such file or directory
-bash: warning: setlocale: LC_CTYPE: cannot change locale (): No such file or directory
 _   _ ____  ____  __  __    _    __  __
| | | |  _ \|  _ \|  \/  |  / \   \ \/ /   | System:    rackham5
| | | | |_) | |_) | |\/| | / _ \   \  /    | User:      douglas
| |_| |  __/|  __/| |  | |/ ___ \  /  \    |
 \___/|_|   |_|   |_|  |_/_/   \_\/_/\_\   |

###############################################################################

        User Guides: http://www.uppmax.uu.se/support/user-guides
        FAQ: http://www.uppmax.uu.se/support/faq

        Write to support@uppmax.uu.se, if you have questions or comments.


Active notices for rackham:

  December maintenance window
  http://status.uppmax.uu.se/2021-11-24/december-maintenance/

bashswap: .bashrc and .bash_profile are *simple*
rackham5: ~ $ cd /sw/bioinfo/FusionCatcher/
rackham5: /sw/bioinfo/FusionCatcher $ ll
total 128
drwxrwsr-x 3 douglas sw  4096 Dec 18  2017 0.99.3e
drwxrwsr-x 4 douglas sw  4096 Dec 18  2017 0.99.5a
drwxrwsr-x 6 douglas sw  4096 Sep 25  2018 1.00
drwxrwsr-x 4 douglas sw  4096 Aug  6  2019 1.10
-rw-rw-r-- 1 jonass  sw   286 Nov 24 14:15 FusionCatcher-0.99.3e.DRAFT.yaml
-rw-rw-r-- 1 jonass  sw   286 Nov 24 14:15 FusionCatcher-0.99.5a.DRAFT.yaml
-rw-rw-r-- 1 douglas sw  4299 Dec 18  2017 FusionCatcher-1.00-install-README.md
-rw-rw-r-- 1 jonass  sw   414 Nov 24 14:14 FusionCatcher-1.00.DRAFT.yaml
-rw-rw-r-- 1 douglas sw 80426 Sep  9  2019 FusionCatcher-1.10-install-README.md
-rw-rw-r-- 1 jonass  sw   403 Nov 24 14:14 FusionCatcher-1.10.DRAFT.yaml
drwxrwsr-x 2 douglas sw  4096 Aug  6  2019 mf
rackham5: /sw/bioinfo/FusionCatcher $ cat FusionCatcher-1.10-install-README.md
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

FusionCatcher-1.10-install-README.md                                                                                                                      12,1           Top
"FusionCatcher-1.10-install-README.md" 1367L, 80426C
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
FusionCatcher-1.10-install-README.md                                                                                                                      55,5            3%
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
FusionCatcher-1.10-install-README.md                                                                                                                      102,5           7%
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
FusionCatcher-1.10-install-README.md                                                                                                                      187,7          13%
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
FusionCatcher-1.10-install-README.md                                                                                                                      235,5          17%
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
FusionCatcher-1.10-install-README.md                                                                                                                      226,5          13%
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
@
FusionCatcher-1.10-install-README.md                                                                                                                      178,7          10%
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
FusionCatcher-1.10-install-README.md                                                                                                                      136,5           7%
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
FusionCatcher-1.10-install-README.md                                                                                                                      75,9            5%
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
FusionCatcher-1.10-install-README.md                                                                                                                      163,7          11%
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
FusionCatcher-1.10-install-README.md                                                                                                                      207,5          15%
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
FusionCatcher-1.10-install-README.md                                                                                                                      157,7           8%

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
rackham5: /sw/bioinfo/FusionCatcher $ vi FusionCatcher-1.10-install-README.md
F3 for ToggleMouse()
Press ENTER or type command to continue
rackham5: /sw/bioinfo/FusionCatcher $ ll
total 128
drwxrwsr-x 3 douglas sw  4096 Dec 18  2017 0.99.3e
drwxrwsr-x 4 douglas sw  4096 Dec 18  2017 0.99.5a
drwxrwsr-x 6 douglas sw  4096 Sep 25  2018 1.00
drwxrwsr-x 4 douglas sw  4096 Aug  6  2019 1.10
-rw-rw-r-- 1 jonass  sw   286 Nov 24 14:15 FusionCatcher-0.99.3e.DRAFT.yaml
-rw-rw-r-- 1 jonass  sw   286 Nov 24 14:15 FusionCatcher-0.99.5a.DRAFT.yaml
-rw-rw-r-- 1 douglas sw  4299 Dec 18  2017 FusionCatcher-1.00-install-README.md
-rw-rw-r-- 1 jonass  sw   414 Nov 24 14:14 FusionCatcher-1.00.DRAFT.yaml
-rw-rw-r-- 1 douglas sw 80426 Sep  9  2019 FusionCatcher-1.10-install-README.md
-rw-rw-r-- 1 jonass  sw   403 Nov 24 14:14 FusionCatcher-1.10.DRAFT.yaml
drwxrwsr-x 2 douglas sw  4096 Aug  6  2019 mf
rackham5: /sw/bioinfo/FusionCatcher $ makeroom.sh -f -t FusionCatcher -v 1.33 -w https://github.com/ndaniel/fusioncatcher -d "Finder of somatic fusion-genes in RNA-seq data" -l GPLv3
Found tools at /domus/h1/douglas/github-sync/local/install-methods/


Forcing...


Exactly matching software already installed under name FusionCatcher

These versions are installed (according to the module system):
1.00
1.10

Forcing override using TOOL = FusionCatcher and VERSION = 1.33


Exactly matching software already installed under name FusionCatcher

These versions are installed (according to the module system):
1.00
1.10

Forcing override using TOOL = FusionCatcher, MODULENAME = FusionCatcher and VERSION = 1.33

No files yet created in the file tree, but you can run this to get your variables set:
source /scratch/TMPFILE_FusionCatcher_1.33
rackham5: /sw/bioinfo/FusionCatcher $ ./makeroom_FusionCatcher_1.33.sh

Found following module files:
1.10
1.00
0.99.5a
0.99.3e
1.10 looks like the best file on which to base a new module file
/sw/bioinfo/FusionCatcher

Copying 1.10 as the module file /sw/bioinfo/FusionCatcher/mf/1.33
'1.10' -> '/sw/bioinfo/FusionCatcher/mf/1.33'

Adding the old readme file FusionCatcher-1.10-install-README.md to the new readme file /sw/bioinfo/FusionCatcher/FusionCatcher-1.33_install-README.md

MODULE: To get a funcioning module, first, please modify /sw/bioinfo/FusionCatcher/mf/1.33 if needed.
    If new, it contains some examples that will most likely need to be changed

    After you are finished withe the module file, run /sw/bioinfo/FusionCatcher/FusionCatcher-1.33_post-install.sh to copy it and invoke all_mflink correctly.


Also, please modify /sw/bioinfo/FusionCatcher/FusionCatcher-1.33_install-README.md



For Singularity, make a bash file in a directory you include in the module file, like this:

echo '#!/bin/bash' > /sw/bioinfo/FusionCatcher/1.33/rackham/bin/FusionCatcher
echo 'singularity exec _ROOT/FusionCatcher.sif FusionCatcher "$@"' >> /sw/bioinfo/FusionCatcher/1.33/rackham/bin/FusionCatcher


This might help too:

[bio] FusionCatcher/1.33 installed on all systems
FusionCatcher (Finder of somatic fusion-genes in RNA-seq data) version 1.33 installed on all systems as module FusionCatcher/1.33.
https://github.com/ndaniel/fusioncatcher
rackham, irma, bianca, snowy
1.33
GPLv3
mv: '/sw/bioinfo/FusionCatcher/makeroom_FusionCatcher_1.33.sh' and '/sw/bioinfo/FusionCatcher/makeroom_FusionCatcher_1.33.sh' are the same file
Run this to set your variables and go to :

source /sw/bioinfo/FusionCatcher/SOURCEME_FusionCatcher_1.33 && cd $TOOLDIR
rackham5: /sw/bioinfo/FusionCatcher $ mfshow FusionCatcher
/sw/mf/bianca/bioinfo-tools/misc/FusionCatcher/:
total 36
drwxrwsr-x   2 douglas sw  4096 Aug  6  2019 .
drwxrwsr-x 337 douglas sw 28672 Dec  3 11:16 ..
lrwxrwxrwx   1 douglas sw    56 Dec 18  2017 1.00 -> ../../../../common/bioinfo-tools/misc/FusionCatcher/1.00
lrwxrwxrwx   1 douglas sw    56 Aug  6  2019 1.10 -> ../../../../common/bioinfo-tools/misc/FusionCatcher/1.10

/sw/mf/common/bioinfo-tools/misc/FusionCatcher/:
total 56
drwxrwsr-x   2 douglas sw  4096 Aug  6  2019 .
drwxrwsr-x 391 johanhe sw 32768 Dec  3 11:13 ..
-rw-rw-r--   1 douglas sw  1106 Dec 21  2015 0.99.3e
-rw-rw-r--   1 douglas sw  1239 Jan 26  2016 0.99.5a
-rw-rw-r--   1 douglas sw  1421 Aug  6  2019 1.00
-rw-rw-r--   1 douglas sw  1292 Aug  6  2019 1.10

/sw/mf/irma/bioinfo-tools/misc/FusionCatcher/:
total 36
drwxrwsr-x   2 douglas sw  4096 Aug  6  2019 .
drwxrwsr-x 337 douglas sw 28672 Dec  3 11:16 ..
lrwxrwxrwx   1 douglas sw    56 Dec 18  2017 1.00 -> ../../../../common/bioinfo-tools/misc/FusionCatcher/1.00
lrwxrwxrwx   1 douglas sw    56 Aug  6  2019 1.10 -> ../../../../common/bioinfo-tools/misc/FusionCatcher/1.10

/sw/mf/rackham/bioinfo-tools/misc/FusionCatcher/:
total 36
drwxrwsr-x   2 douglas sw  4096 Aug  6  2019 .
drwxrwsr-x 337 root    sw 28672 Dec  3 11:16 ..
lrwxrwxrwx   1 douglas sw    56 Dec 18  2017 1.00 -> ../../../../common/bioinfo-tools/misc/FusionCatcher/1.00
lrwxrwxrwx   1 douglas sw    56 Aug  6  2019 1.10 -> ../../../../common/bioinfo-tools/misc/FusionCatcher/1.10

/sw/mf/snowy/bioinfo-tools/misc/FusionCatcher/:
total 36
drwxrwsr-x   2 douglas sw  4096 Aug  6  2019 .
drwxrwsr-x 333 douglas sw 28672 Dec  3 11:16 ..
lrwxrwxrwx   1 douglas sw    56 Sep 25  2018 1.00 -> ../../../../common/bioinfo-tools/misc/FusionCatcher/1.00
lrwxrwxrwx   1 douglas sw    56 Aug  6  2019 1.10 -> ../../../../common/bioinfo-tools/misc/FusionCatcher/1.10
rackham5: /sw/bioinfo/FusionCatcher $ ll
total 240
drwxrwsr-x 3 douglas sw  4096 Dec 18  2017 0.99.3e
drwxrwsr-x 4 douglas sw  4096 Dec 18  2017 0.99.5a
drwxrwsr-x 6 douglas sw  4096 Sep 25  2018 1.00
drwxrwsr-x 4 douglas sw  4096 Aug  6  2019 1.10
drwxrwsr-x 4 douglas sw  4096 Dec  3 11:24 1.33
-rw-rw-r-- 1 jonass  sw   286 Nov 24 14:15 FusionCatcher-0.99.3e.DRAFT.yaml
-rw-rw-r-- 1 jonass  sw   286 Nov 24 14:15 FusionCatcher-0.99.5a.DRAFT.yaml
-rw-rw-r-- 1 douglas sw  4299 Dec 18  2017 FusionCatcher-1.00-install-README.md
-rw-rw-r-- 1 jonass  sw   414 Nov 24 14:14 FusionCatcher-1.00.DRAFT.yaml
-rw-rw-r-- 1 douglas sw 80426 Sep  9  2019 FusionCatcher-1.10-install-README.md
-rw-rw-r-- 1 jonass  sw   403 Nov 24 14:14 FusionCatcher-1.10.DRAFT.yaml
-rw-rw-r-- 1 douglas sw   397 Dec  3 11:24 FusionCatcher-1.33.yaml
-rw-rw-r-- 1 douglas sw 80877 Dec  3 11:24 FusionCatcher-1.33_install-README.md
-rwxrwxr-x 1 douglas sw   861 Dec  3 11:24 FusionCatcher-1.33_post-install.sh
-rw-rw-r-- 1 douglas sw   537 Dec  3 11:24 SOURCEME_FusionCatcher_1.33
-rwxrwxr-x 1 douglas sw  9507 Dec  3 11:24 makeroom_FusionCatcher_1.33.sh
drwxrwsr-x 2 douglas sw  4096 Dec  3 11:24 mf
rackham5: /sw/bioinfo/FusionCatcher $ source /sw/bioinfo/FusionCatcher/SOURCEME_FusionCatcher_1.33 && cd $TOOLDIR
rackham5: /sw/bioinfo/FusionCatcher $ cd $SRCDIR
rackham5: /sw/bioinfo/FusionCatcher/1.33/src $ ll
total 0
rackham5: /sw/bioinfo/FusionCatcher/1.33/src $ mspid biopython

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  biopython:
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
     Versions:
        biopython/1.68-py3
        biopython/1.68
        biopython/1.73-py3
        biopython/1.73
        biopython/1.76-py3
        biopython/1.78
     Other possible modules matches:
        Biopython

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  To find other possible module matches execute:

      $ module -r spider '.*biopython.*'

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  For detailed information about a specific "biopython" package (including how to load the modules) use the module's full name.
  Note that names that have a trailing (E) are extensions provided by other modules.
  For example:

     $ module spider biopython/1.78
------------------------------------------------------------------------------------------------------------------------------------------------------------------------



rackham5: /sw/bioinfo/FusionCatcher/1.33/src $ ml python/2.7.15 biopython/1.73
Lmod has detected the following error:  These module(s) or extension(s) exist but cannot be loaded as requested: "biopython/1.73"
   Try: "module spider biopython/1.73" to see how to load the module(s).



rackham5: /sw/bioinfo/FusionCatcher/1.33/src $ ml bioinfo-tools
rackham5: /sw/bioinfo/FusionCatcher/1.33/src $ ml python/2.7.15 biopython/1.73
rackham5: /sw/bioinfo/FusionCatcher/1.33/src $ cat ../../
0.99.3e/                              FusionCatcher-0.99.3e.DRAFT.yaml      FusionCatcher-1.10.DRAFT.yaml         makeroom_FusionCatcher_1.33.sh
0.99.5a/                              FusionCatcher-0.99.5a.DRAFT.yaml      FusionCatcher-1.33.yaml               mf/
1.00/                                 FusionCatcher-1.00-install-README.md  FusionCatcher-1.33_install-README.md
1.10/                                 FusionCatcher-1.00.DRAFT.yaml         FusionCatcher-1.33_post-install.sh
1.33/                                 FusionCatcher-1.10-install-README.md  SOURCEME_FusionCatcher_1.33
rackham5: /sw/bioinfo/FusionCatcher/1.33/src $ cat ../../FusionCatcher-1.10-install-README.md
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
rackham5: /sw/bioinfo/FusionCatcher/1.33/src $ head -n 50 ../../FusionCatcher-1.10-install-README.md
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
rackham5: /sw/bioinfo/FusionCatcher/1.33/src $ wget -O bootstrap.py http://sf.net/projects/fusioncatcher/files/bootstrap.py
--2021-12-03 11:25:53--  http://sf.net/projects/fusioncatcher/files/bootstrap.py
Resolving sf.net (sf.net)... 204.68.111.105
Connecting to sf.net (sf.net)|204.68.111.105|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://sf.net/projects/fusioncatcher/files/bootstrap.py [following]
--2021-12-03 11:25:54--  https://sf.net/projects/fusioncatcher/files/bootstrap.py
Connecting to sf.net (sf.net)|204.68.111.105|:443... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://sourceforge.net/projects/fusioncatcher/files/bootstrap.py [following]
--2021-12-03 11:25:54--  https://sourceforge.net/projects/fusioncatcher/files/bootstrap.py
Resolving sourceforge.net (sourceforge.net)... 204.68.111.105
Connecting to sourceforge.net (sourceforge.net)|204.68.111.105|:443... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://sourceforge.net/projects/fusioncatcher/files/bootstrap.py/ [following]
--2021-12-03 11:25:55--  https://sourceforge.net/projects/fusioncatcher/files/bootstrap.py/
Reusing existing connection to sourceforge.net:443.
HTTP request sent, awaiting response... 302 Found
Location: https://sourceforge.net/projects/fusioncatcher/files/bootstrap.py/download [following]
--2021-12-03 11:25:55--  https://sourceforge.net/projects/fusioncatcher/files/bootstrap.py/download
Reusing existing connection to sourceforge.net:443.
HTTP request sent, awaiting response... 302 Found
Location: https://downloads.sourceforge.net/project/fusioncatcher/bootstrap.py?ts=gAAAAABhqfC0cxSzOOHiA0z1_cb8fnCB5iQ4tE6fPRF044iL5hy2id8vyXGLBZorRmXWjMo-hAqXc0ieNck6ZJsRdiHXtiFnSg%3D%3D&use_mirror=netcologne&r= [following]
--2021-12-03 11:25:56--  https://downloads.sourceforge.net/project/fusioncatcher/bootstrap.py?ts=gAAAAABhqfC0cxSzOOHiA0z1_cb8fnCB5iQ4tE6fPRF044iL5hy2id8vyXGLBZorRmXWjMo-hAqXc0ieNck6ZJsRdiHXtiFnSg%3D%3D&use_mirror=netcologne&r=
Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 204.68.111.105
Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|204.68.111.105|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://netcologne.dl.sourceforge.net/project/fusioncatcher/bootstrap.py [following]
--2021-12-03 11:25:56--  https://netcologne.dl.sourceforge.net/project/fusioncatcher/bootstrap.py
Resolving netcologne.dl.sourceforge.net (netcologne.dl.sourceforge.net)... 78.35.24.46, 2001:4dd0:1234:6::5f
Connecting to netcologne.dl.sourceforge.net (netcologne.dl.sourceforge.net)|78.35.24.46|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 100548 (98K) [application/octet-stream]
Saving to: 'bootstrap.py'

100%[==================================================================================================================================>] 100,548     --.-K/s   in 0.06s

2021-12-03 11:25:57 (1.61 MB/s) - 'bootstrap.py' saved [100548/100548]

rackham5: /sw/bioinfo/FusionCatcher/1.33/src $ python bootstrap.py --installation-path=$PREFIX -t --download
Checking latest version of Ensembl database that is available...
   * Version v104 found!

================================================================================
NOTE: On a Ubuntu running these before installing FusionCatcher might make the installation go smoother:

sudo apt-get -y install \
build-essential\
libncurses5-dev \
default-jdk \
gawk \
gcc \
g++ \
bzip2 \
make \
cmake \
automake \
gzip \
zip \
unzip \
zlib1g-dev \
zlib1g \
wget \
curl \
pigz \
tar \
parallel \
libtbb-dev \
libtbb2 \
python \
python-dev \
python-numpy \
python-biopython \
python-xlrd \
python-openpyxl
================================================================================

^CTraceback (most recent call last):
  File "bootstrap.py", line 1168, in <module>
    time.sleep(5) # wait 5 seconds
KeyboardInterrupt
rackham5: /sw/bioinfo/FusionCatcher/1.33/src $ ml

Currently Loaded Modules:
  1) uppmax   2) bioinfo-tools   3) python/2.7.15   4) biopython/1.73



rackham5: /sw/bioinfo/FusionCatcher/1.33/src $ ml gcc/9.3.0
rackham5: /sw/bioinfo/FusionCatcher/1.33/src $ python bootstrap.py --installation-path=$PREFIX -t --download
Checking latest version of Ensembl database that is available...
   * Version v104 found!

================================================================================
NOTE: On a Ubuntu running these before installing FusionCatcher might make the installation go smoother:

sudo apt-get -y install \
build-essential\
libncurses5-dev \
default-jdk \
gawk \
gcc \
g++ \
bzip2 \
make \
cmake \
automake \
gzip \
zip \
unzip \
zlib1g-dev \
zlib1g \
wget \
curl \
pigz \
tar \
parallel \
libtbb-dev \
libtbb2 \
python \
python-dev \
python-numpy \
python-biopython \
python-xlrd \
python-openpyxl
================================================================================

Current working directory: '/sw/bioinfo/FusionCatcher/1.33/src'
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

Path for installation of FusionCatcher: '/sw/bioinfo/FusionCatcher/1.33/rackham'
  Do you accept this path (WARNING: some files/directories within this path may be deleted/replaced/updated without warning)? [Y/n]:
Checking latest version of Ensembl database that is available...
   * Version v104 found!
Default number of threads/CPUs to be used by FusionCatcher (use 0 for using the number of CPUs detected at the runtime): '1'
  Do you accept? [Y/n]: n
  Type the new default for number of threads: 0
Installing tool 'FusionCatcher (fusion genes finder in RNA-seq data)' at '/sw/bioinfo/FusionCatcher/1.33/rackham/bin' from 'http://sourceforge.net/projects/fusioncatcher/files/fusioncatcher_v1.33.zip'
    # mkdir -p /sw/bioinfo/FusionCatcher/1.33/rackham
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/fusioncatcher_v1.33.zip
    # wget http://sourceforge.net/projects/fusioncatcher/files/fusioncatcher_v1.33.zip -O /sw/bioinfo/FusionCatcher/1.33/rackham/fusioncatcher_v1.33.zip --no-check-certificate
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/bin
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/fusioncatcher_v1.33
    # unzip -o /sw/bioinfo/FusionCatcher/1.33/rackham/fusioncatcher_v1.33.zip -d /sw/bioinfo/FusionCatcher/1.33/rackham
    # ln -s /sw/bioinfo/FusionCatcher/1.33/rackham/fusioncatcher_v1.33 /sw/bioinfo/FusionCatcher/1.33/rackham/bin
    # cd /sw/bioinfo/FusionCatcher/1.33/rackham/fusioncatcher_v1.33
    # chmod +x custom_install.sh
    # ./custom_install.sh
    # cd /sw/bioinfo/FusionCatcher/1.33/src
  * Done!
Checking if the Python module named 'NumPy' is installed...
  * Ok! Python module 'NumPy' found at '/sw/comp/python/2.7.15_rackham/lib/python2.7/site-packages/numpy'!
Checking if the Python module named 'BioPython' is installed...
  * Ok! Python module 'BioPython' found at '/sw/bioinfo/biopython/1.73/rackham/lib/python2.7/site-packages/Bio'!
Checking if the Python module named 'Xlrd' is installed...
  * WARNING: The Python module 'Xlrd' is not installed!

             Please, install the Python module: Xlrd (see <http://pypi.python.org/pypi/xlrd> for more info). It is recommended
             that YOU the admin/root install this module, like for example using the commands:
               apt-get install python-xlrd
             or
               yum install python-xlrd
             or
               easy_install xlrd

  * HINTS: Please, also make sure that the following are installed also, before installing the above Python library:
     - Building tools:
         sudo apt-get install build-essential
         or
         sudo yum groupinstall "Development Tools"
         sudo yum install ncurses
         sudo yum install ncurses-devel
           or
         sudo zypper install --type pattern Basis-Devel
         sudo zypper in ncurses
         sudo zypper in ncurses-devel
     - Python development:
         sudo apt-get install python-dev
           or
         sudo yum install python-devel
     - GCC:
         sudo apt-get install gcc
           or
         sudo yum install gcc
     - ZLIB development:
         sudo apt-get install zlib-dev
           or
         sudo yum install zlib-devel
     - NumPy library:
         sudo apt-get install python-numpy
           or
         sudo yum install python-numpy
     - BioPython library:
         sudo apt-get install python-biopython
           or
         sudo yum install python-biopython
     - TBB:
         sudo apt-get install libtbb-dev
           or
         sudo yum install libtbb-dev

  * WARNING: Cannot find the path of the Python module 'Xlrd'!
  * WARNING! Python module 'Xlrd' not found!
  Do you accept to install the Python module 'Xlrd' here '/sw/bioinfo/FusionCatcher/1.33/rackham/tools/xlrd'? [Y/n]:
Installing Python module 'python-xlrd' locally '/sw/bioinfo/FusionCatcher/1.33/rackham/tools/xlrd'...
    # mkdir -p /sw/bioinfo/FusionCatcher/1.33/rackham/tools
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/xlrd-1.2.0.tar.gz
    # wget https://files.pythonhosted.org/packages/aa/05/ec9d4fcbbb74bbf4da9f622b3b61aec541e4eccf31d3c60c5422ec027ce2/xlrd-1.2.0.tar.gz -O /sw/bioinfo/FusionCatcher/1.33/rackham/tools/xlrd-1.2.0.tar.gz --no-check-certificate
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/xlrd
    # tar -xvzf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/xlrd-1.2.0.tar.gz -C /sw/bioinfo/FusionCatcher/1.33/rackham/tools
    # ln -s /sw/bioinfo/FusionCatcher/1.33/rackham/tools/xlrd-1.2.0 /sw/bioinfo/FusionCatcher/1.33/rackham/tools/xlrd
    # cd /sw/bioinfo/FusionCatcher/1.33/rackham/tools/xlrd-1.2.0 ; /sw/comp/python/2.7.15_rackham/bin/python setup.py build
  * Done!
Checking if the Python module named 'SetupTools' is installed...
  * Ok! Python module 'SetupTools' found at '/sw/comp/python/2.7.15_rackham/lib/python2.7/site-packages/setuptools'!
Checking if the Python module named 'OpenPyXL' is installed...
  * WARNING: The Python module 'OpenPyXL' is not installed!

             Please, install the Python module: OpenPyXL (see <http://pypi.python.org/pypi/openpyxl> for more info). It is recommended
             that YOU the admin/root install this module, like for example using the commands:
               apt-get install python-openpyxl
             or
               yum install python-openpyxl
             or
               easy_install openpyxl

  * HINTS: Please, also make sure that the following are installed also, before installing the above Python library:
     - Building tools:
         sudo apt-get install build-essential
         or
         sudo yum groupinstall "Development Tools"
         sudo yum install ncurses
         sudo yum install ncurses-devel
           or
         sudo zypper install --type pattern Basis-Devel
         sudo zypper in ncurses
         sudo zypper in ncurses-devel
     - Python development:
         sudo apt-get install python-dev
           or
         sudo yum install python-devel
     - GCC:
         sudo apt-get install gcc
           or
         sudo yum install gcc
     - ZLIB development:
         sudo apt-get install zlib-dev
           or
         sudo yum install zlib-devel
     - NumPy library:
         sudo apt-get install python-numpy
           or
         sudo yum install python-numpy
     - BioPython library:
         sudo apt-get install python-biopython
           or
         sudo yum install python-biopython
     - TBB:
         sudo apt-get install libtbb-dev
           or
         sudo yum install libtbb-dev

  * WARNING: Cannot find the path of the Python module 'OpenPyXL'!
  * WARNING! Python module 'OpenPyXL' not found!
  Do you accept to install the Python module 'OpenPyXL' here '/sw/bioinfo/FusionCatcher/1.33/rackham/tools/openpyxl'? [Y/n]:
Installing Python module 'python-openpyxl' locally '/sw/bioinfo/FusionCatcher/1.33/rackham/tools/openpyxl'...
    # mkdir -p /sw/bioinfo/FusionCatcher/1.33/rackham/tools
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/openpyxl-2.6.1.tar.gz
    # wget https://files.pythonhosted.org/packages/5f/f8/a5d3a4ab669f99154f87ab531192dd84ac79aae62efab662bd2d82a72194/openpyxl-2.6.1.tar.gz -O /sw/bioinfo/FusionCatcher/1.33/rackham/tools/openpyxl-2.6.1.tar.gz --no-check-certificate
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/openpyxl
    # tar -xvzf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/openpyxl-2.6.1.tar.gz -C /sw/bioinfo/FusionCatcher/1.33/rackham/tools
    # ln -s /sw/bioinfo/FusionCatcher/1.33/rackham/tools/openpyxl-2.6.1 /sw/bioinfo/FusionCatcher/1.33/rackham/tools/openpyxl
    # cd /sw/bioinfo/FusionCatcher/1.33/rackham/tools/openpyxl-2.6.1 ; PYTHONPATH=/sw/comp/python/2.7.15_rackham/lib/python2.7/site-packages/setuptools /sw/comp/python/2.7.15_rackham/bin/python setup.py build
  * Done!
  Do you accept to install the BOWTIE (short read aligner) here: /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bowtie ? [Y/n]:
Installing tool 'BOWTIE (short read aligner)' at '/sw/bioinfo/FusionCatcher/1.33/rackham/tools/bowtie' from 'https://github.com/BenLangmead/bowtie/releases/download/v1.2.3/bowtie-1.2.3-linux-x86_64.zip'
    # mkdir -p /sw/bioinfo/FusionCatcher/1.33/rackham/tools
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bowtie-1.2.3-linux-x86_64.zip
    # wget https://github.com/BenLangmead/bowtie/releases/download/v1.2.3/bowtie-1.2.3-linux-x86_64.zip -O /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bowtie-1.2.3-linux-x86_64.zip --no-check-certificate
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bowtie
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bowtie-1.2.3-linux-x86_64
    # unzip -o /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bowtie-1.2.3-linux-x86_64.zip -d /sw/bioinfo/FusionCatcher/1.33/rackham/tools
    # ln -s /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bowtie-1.2.3-linux-x86_64 /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bowtie
    # chmod -R +x /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bowtie
  * Done!
  Do you accept to install the BOWTIE2 (short read aligner) here: /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bowtie2 ? [Y/n]:
Installing tool 'BOWTIE2 (short read aligner)' at '/sw/bioinfo/FusionCatcher/1.33/rackham/tools/bowtie2' from 'https://github.com/BenLangmead/bowtie2/releases/download/v2.3.5.1/bowtie2-2.3.5.1-linux-x86_64.zip'
    # mkdir -p /sw/bioinfo/FusionCatcher/1.33/rackham/tools
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bowtie2-2.3.5.1-linux-x86_64.zip
    # wget https://github.com/BenLangmead/bowtie2/releases/download/v2.3.5.1/bowtie2-2.3.5.1-linux-x86_64.zip -O /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bowtie2-2.3.5.1-linux-x86_64.zip --no-check-certificate
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bowtie2
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bowtie2-2.3.5.1-linux-x86_64
    # unzip -o /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bowtie2-2.3.5.1-linux-x86_64.zip -d /sw/bioinfo/FusionCatcher/1.33/rackham/tools
    # ln -s /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bowtie2-2.3.5.1-linux-x86_64 /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bowtie2
    # chmod -R +x /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bowtie2
  * Done!
  Do you accept to install the NCBI SRA Toolkit (SRA System Development Kit) here: /sw/bioinfo/FusionCatcher/1.33/rackham/tools/sratoolkit ? [Y/n]:
Installing tool 'NCBI SRA Toolkit (SRA System Development Kit)' at '/sw/bioinfo/FusionCatcher/1.33/rackham/tools/sratoolkit' from 'https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.9.6/sratoolkit.2.9.6-centos_linux64.tar.gz'
    # mkdir -p /sw/bioinfo/FusionCatcher/1.33/rackham/tools
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/sratoolkit.2.9.6-centos_linux64.tar.gz
    # wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.9.6/sratoolkit.2.9.6-centos_linux64.tar.gz -O /sw/bioinfo/FusionCatcher/1.33/rackham/tools/sratoolkit.2.9.6-centos_linux64.tar.gz --no-check-certificate
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/sratoolkit
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/sratoolkit.2.9.6-centos_linux64
    # tar --overwrite -xvzf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/sratoolkit.2.9.6-centos_linux64.tar.gz -C /sw/bioinfo/FusionCatcher/1.33/rackham/tools
    # ln -s /sw/bioinfo/FusionCatcher/1.33/rackham/tools/sratoolkit.2.9.6-centos_linux64 /sw/bioinfo/FusionCatcher/1.33/rackham/tools/sratoolkit
    # chmod -R +x /sw/bioinfo/FusionCatcher/1.33/rackham/tools/sratoolkit
  * Done!
  Do you accept to install the LiftOver (Batch Coordinate Conversion) here: /sw/bioinfo/FusionCatcher/1.33/rackham/tools/liftover ? [Y/n]:
Installing tool 'LiftOver (Batch Coordinate Conversion)' at '/sw/bioinfo/FusionCatcher/1.33/rackham/tools/liftover' from 'http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/liftOver'
    # mkdir -p /sw/bioinfo/FusionCatcher/1.33/rackham/tools/liftover
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/liftover/liftOver
    # wget http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/liftOver -O /sw/bioinfo/FusionCatcher/1.33/rackham/tools/liftover/liftOver --no-check-certificate
    # chmod +x /sw/bioinfo/FusionCatcher/1.33/rackham/tools/liftover/liftOver
  * Done!
  Do you accept to install the BLAT (alignment tool) here: /sw/bioinfo/FusionCatcher/1.33/rackham/tools/blat ? [Y/n]:
Installing tool 'BLAT (alignment tool)' at '/sw/bioinfo/FusionCatcher/1.33/rackham/tools/blat' from 'http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/blat/blat'
    # mkdir -p /sw/bioinfo/FusionCatcher/1.33/rackham/tools/blat
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/blat/blat
    # wget http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/blat/blat -O /sw/bioinfo/FusionCatcher/1.33/rackham/tools/blat/blat --no-check-certificate
    # chmod +x /sw/bioinfo/FusionCatcher/1.33/rackham/tools/blat/blat
  * Done!
  Do you accept to install the FaToTwoBit (companion of BLAT alignment tool) here: /sw/bioinfo/FusionCatcher/1.33/rackham/tools/fatotwobit ? [Y/n]:
Installing tool 'FaToTwoBit (companion of BLAT alignment tool)' at '/sw/bioinfo/FusionCatcher/1.33/rackham/tools/fatotwobit' from 'http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/faToTwoBit'
    # mkdir -p /sw/bioinfo/FusionCatcher/1.33/rackham/tools/fatotwobit
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/fatotwobit/faToTwoBit
    # wget http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/faToTwoBit -O /sw/bioinfo/FusionCatcher/1.33/rackham/tools/fatotwobit/faToTwoBit --no-check-certificate
    # chmod +x /sw/bioinfo/FusionCatcher/1.33/rackham/tools/fatotwobit/faToTwoBit
  * Done!
  Do you accept to install the SEQTK (Toolkit for processing sequences in FASTA/Q formats) here: /sw/bioinfo/FusionCatcher/1.33/rackham/tools/seqtk ? [Y/n]:
Installing tool 'SEQTK (Toolkit for processing sequences in FASTA/Q formats)' at '/sw/bioinfo/FusionCatcher/1.33/rackham/tools/seqtk' from 'http://github.com/ndaniel/seqtk/archive/1.2-r101c.tar.gz'
    # mkdir -p /sw/bioinfo/FusionCatcher/1.33/rackham/tools
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/1.2-r101c.tar.gz
    # wget http://github.com/ndaniel/seqtk/archive/1.2-r101c.tar.gz -O /sw/bioinfo/FusionCatcher/1.33/rackham/tools/1.2-r101c.tar.gz --no-check-certificate
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/seqtk
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/1.2-r101c
    # tar --overwrite -xvzf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/1.2-r101c.tar.gz -C /sw/bioinfo/FusionCatcher/1.33/rackham/tools
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/1.2-r101c
    # mv /sw/bioinfo/FusionCatcher/1.33/rackham/tools/seqtk-1.2-r101c /sw/bioinfo/FusionCatcher/1.33/rackham/tools/1.2-r101c
    # ln -s /sw/bioinfo/FusionCatcher/1.33/rackham/tools/1.2-r101c /sw/bioinfo/FusionCatcher/1.33/rackham/tools/seqtk
    # make -C /sw/bioinfo/FusionCatcher/1.33/rackham/tools/1.2-r101c
    # chmod -R +x /sw/bioinfo/FusionCatcher/1.33/rackham/tools/seqtk
  * Done!
  Do you accept to install the FASTQ-LEAVE (lightweight tools for FASTQ files) here: /sw/bioinfo/FusionCatcher/1.33/rackham/tools/fastqtk ? [Y/n]:
Installing tool 'FASTQ-LEAVE (lightweight tools for FASTQ files)' at '/sw/bioinfo/FusionCatcher/1.33/rackham/tools/fastqtk' from 'https://github.com/ndaniel/fastqtk/archive/v0.27.tar.gz'
    # mkdir -p /sw/bioinfo/FusionCatcher/1.33/rackham/tools
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/v0.27.tar.gz
    # wget https://github.com/ndaniel/fastqtk/archive/v0.27.tar.gz -O /sw/bioinfo/FusionCatcher/1.33/rackham/tools/v0.27.tar.gz --no-check-certificate
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/fastqtk
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/v0.27
    # tar --overwrite -xvzf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/v0.27.tar.gz -C /sw/bioinfo/FusionCatcher/1.33/rackham/tools
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/v0.27
    # mv /sw/bioinfo/FusionCatcher/1.33/rackham/tools/fastqtk-0.27 /sw/bioinfo/FusionCatcher/1.33/rackham/tools/v0.27
    # ln -s /sw/bioinfo/FusionCatcher/1.33/rackham/tools/v0.27 /sw/bioinfo/FusionCatcher/1.33/rackham/tools/fastqtk
    # make -C /sw/bioinfo/FusionCatcher/1.33/rackham/tools/v0.27
    # chmod -R +x /sw/bioinfo/FusionCatcher/1.33/rackham/tools/fastqtk
  * Done!
  Do you accept to install the STAR (alignment tool) here: /sw/bioinfo/FusionCatcher/1.33/rackham/tools/star ? [Y/n]:
Installing tool 'STAR (alignment tool)' at '/sw/bioinfo/FusionCatcher/1.33/rackham/tools/star' from 'https://github.com/alexdobin/STAR/archive/2.7.2b.tar.gz'
    # mkdir -p /sw/bioinfo/FusionCatcher/1.33/rackham/tools
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/2.7.2b.tar.gz
    # wget https://github.com/alexdobin/STAR/archive/2.7.2b.tar.gz -O /sw/bioinfo/FusionCatcher/1.33/rackham/tools/2.7.2b.tar.gz --no-check-certificate
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/star
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/2.7.2b
    # tar --overwrite -xvzf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/2.7.2b.tar.gz -C /sw/bioinfo/FusionCatcher/1.33/rackham/tools
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/2.7.2b
    # mv /sw/bioinfo/FusionCatcher/1.33/rackham/tools/STAR-2.7.2b /sw/bioinfo/FusionCatcher/1.33/rackham/tools/2.7.2b
    # ln -s /sw/bioinfo/FusionCatcher/1.33/rackham/tools/2.7.2b /sw/bioinfo/FusionCatcher/1.33/rackham/tools/star
    # cd /sw/bioinfo/FusionCatcher/1.33/rackham/tools/2.7.2b
    # chmod +x custom_install.sh
    # ./custom_install.sh
    # cd /sw/bioinfo/FusionCatcher/1.33/src
  * Done!
  Do you accept to install the BBMap short read aligner, and other bioinformatic tools. here: /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bbmap ? [Y/n]:
Installing tool 'BBMap short read aligner, and other bioinformatic tools.' at '/sw/bioinfo/FusionCatcher/1.33/rackham/tools/bbmap' from 'https://sourceforge.net/projects/bbmap/files/BBMap_38.44.tar.gz'
    # mkdir -p /sw/bioinfo/FusionCatcher/1.33/rackham/tools
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/BBMap_38.44.tar.gz
    # wget https://sourceforge.net/projects/bbmap/files/BBMap_38.44.tar.gz -O /sw/bioinfo/FusionCatcher/1.33/rackham/tools/BBMap_38.44.tar.gz --no-check-certificate
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bbmap
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/BBMap_38.44
    # tar --overwrite -xvzf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/BBMap_38.44.tar.gz -C /sw/bioinfo/FusionCatcher/1.33/rackham/tools
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/BBMap_38.44
    # mv /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bbmap /sw/bioinfo/FusionCatcher/1.33/rackham/tools/BBMap_38.44
    # ln -s /sw/bioinfo/FusionCatcher/1.33/rackham/tools/BBMap_38.44 /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bbmap
    # chmod -R +x /sw/bioinfo/FusionCatcher/1.33/rackham/tools/bbmap
  * Done!
  Do you accept to install the PICARD (Java-based command-line utilities that manipulate SAM files) here: /sw/bioinfo/FusionCatcher/1.33/rackham/tools/picard ? [Y/n]:
Installing tool 'PICARD (Java-based command-line utilities that manipulate SAM files)' at '/sw/bioinfo/FusionCatcher/1.33/rackham/tools/picard' from 'https://github.com/broadinstitute/picard/releases/download/2.21.2/picard.jar'
    # mkdir -p /sw/bioinfo/FusionCatcher/1.33/rackham/tools/picard
    # rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/tools/picard/picard.jar
    # wget https://github.com/broadinstitute/picard/releases/download/2.21.2/picard.jar -O /sw/bioinfo/FusionCatcher/1.33/rackham/tools/picard/picard.jar --no-check-certificate
    # chmod +x /sw/bioinfo/FusionCatcher/1.33/rackham/tools/picard/picard.jar
  * Done!
Checking the shebang of FusionCatcher Python scripts...
  Shall the shebang of all Python scripts, belonging to FusionCatcher, be set/hardcoded to use this '/sw/comp/python/2.7.15_rackham/bin/python'? [Y/n]:
  * Updating the SHEBANG of Python scripts with '/sw/comp/python/2.7.15_rackham/bin/python'
  * Done!
Updating the configuration file of FusionCatcher...
  * configuration file '/sw/bioinfo/FusionCatcher/1.33/rackham/etc/configuration.cfg'
-------------------------------------------------------------------------------
FusionCatcher is installed here:
  /sw/bioinfo/FusionCatcher/1.33/rackham
FusionCatcher's scripts are here:
  /sw/bioinfo/FusionCatcher/1.33/rackham/bin
FusionCatcher's dependencies and tools are installed here:
  /sw/bioinfo/FusionCatcher/1.33/rackham/tools
FusionCatcher's organism data is here:
  /sw/bioinfo/FusionCatcher/1.33/rackham/data
Run FusionCatcher as following:
  /sw/bioinfo/FusionCatcher/1.33/rackham/bin/fusioncatcher
In order to download and build the files for FusionCatcher run the following:
  /sw/bioinfo/FusionCatcher/1.33/rackham/bin/fusioncatcher-build

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
rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/data/current
rm -f /sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.tar.gz.*
rm -rf /sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102
rm -f /sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.md5
mkdir -p /sw/bioinfo/FusionCatcher/1.33/rackham/data
ln -s /sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102 /sw/bioinfo/FusionCatcher/1.33/rackham/data/current
wget --no-check-certificate http://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.aa -O /sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.tar.gz.aa
wget --no-check-certificate http://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ab -O /sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.tar.gz.ab
wget --no-check-certificate http://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ac -O /sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.tar.gz.ac
wget --no-check-certificate http://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ad -O /sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.tar.gz.ad
wget --no-check-certificate http://sourceforge.net/projects/fusioncatcher/files/data/human_v102.md5 -O /sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.md5
cd /sw/bioinfo/FusionCatcher/1.33/rackham/data
md5sum -c /sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.md5
if [ "$?" -ne "0" ]; then
  echo -e "\n\n\n\033[33;7m   ERROR: The downloaded files from above have errors! MD5 checksums do not match! Please, download them again or re-run this script again!   \033[0m\n"
  exit 1
fi
cat /sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.tar.gz.* > /sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.tar.gz
rm -f /sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.tar.gz.*
if ! tar -xzf /sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.tar.gz -C /sw/bioinfo/FusionCatcher/1.33/rackham/data; then
    echo -e "\n\n\n\033[33;7m   ERROR: The downloaded files are corrupted!   \033[0m\n"
    exit 1
fi
rm -f /sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.tar.gz
rm -f /sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.md5

All these commands are saved in '/sw/bioinfo/FusionCatcher/1.33/rackham/bin/download-human_v102.sh' file! You may execute '/sw/bioinfo/FusionCatcher/1.33/rackham/bin/download-human_v102.sh' shell script or copy/paste all the previous commands and run them manually in the terminal!


---------------------------------------------------------------------------
*  OPTION 2: Build yourself the data needed by FusionCatcher!
             TRY THIS ONLY IF OPTION 1!
---------------------------------------------------------------------------
In order to build yourself the latest human data files needed by FusionCatcher, please run these (it will take several hours):

rm  -rf  /sw/bioinfo/FusionCatcher/1.33/rackham/data/current
rm  -rf  /sw/bioinfo/FusionCatcher/1.33/rackham/data/v104
mkdir  -p  /sw/bioinfo/FusionCatcher/1.33/rackham/data/v104
ln  -s  /sw/bioinfo/FusionCatcher/1.33/rackham/data/v104  /sw/bioinfo/FusionCatcher/1.33/rackham/data/current
/sw/bioinfo/FusionCatcher/1.33/rackham/bin/fusioncatcher-build  -g  homo_sapiens  -o /sw/bioinfo/FusionCatcher/1.33/rackham/data/v104

All these commands are saved in '/sw/bioinfo/FusionCatcher/1.33/rackham/bin/build.sh' file! You may execute '/sw/bioinfo/FusionCatcher/1.33/rackham/bin/build.sh' shell script or copy/paste all the previous commands and run them manually in the terminal!

---------------------------------------------------------------------------
---------------------------------------------------------------------------
Downloading and installing the databases required by FusionCatcher
---------------------------------------------------------------------------
--2021-12-03 11:33:20--  http://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.aa
Resolving sourceforge.net (sourceforge.net)... 204.68.111.105
Connecting to sourceforge.net (sourceforge.net)|204.68.111.105|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.aa [following]
--2021-12-03 11:33:21--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.aa
Connecting to sourceforge.net (sourceforge.net)|204.68.111.105|:443... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.aa/ [following]
--2021-12-03 11:33:22--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.aa/
Reusing existing connection to sourceforge.net:443.
HTTP request sent, awaiting response... 302 Found
Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.aa/download [following]
--2021-12-03 11:33:22--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.aa/download
Reusing existing connection to sourceforge.net:443.
HTTP request sent, awaiting response... 302 Found
Location: https://downloads.sourceforge.net/project/fusioncatcher/data/human_v102.tar.gz.aa?ts=gAAAAABhqfJy-KaUJyrKIwPuZQDr15bcO3GHTAXN5UPSk1mpk1xbmddKoVvDqNZuFZNhnb-_YtLtHGmJbZ-LtCL2T6Jn2jx4wg%3D%3D&use_mirror=netix&r= [following]
--2021-12-03 11:33:22--  https://downloads.sourceforge.net/project/fusioncatcher/data/human_v102.tar.gz.aa?ts=gAAAAABhqfJy-KaUJyrKIwPuZQDr15bcO3GHTAXN5UPSk1mpk1xbmddKoVvDqNZuFZNhnb-_YtLtHGmJbZ-LtCL2T6Jn2jx4wg%3D%3D&use_mirror=netix&r=
Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 204.68.111.105
Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|204.68.111.105|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://netix.dl.sourceforge.net/project/fusioncatcher/data/human_v102.tar.gz.aa [following]
--2021-12-03 11:33:23--  https://netix.dl.sourceforge.net/project/fusioncatcher/data/human_v102.tar.gz.aa
Resolving netix.dl.sourceforge.net (netix.dl.sourceforge.net)... 87.121.121.2
Connecting to netix.dl.sourceforge.net (netix.dl.sourceforge.net)|87.121.121.2|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 4718592000 (4.4G) [application/octet-stream]
Saving to: '/sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.tar.gz.aa'

100%[================================================================================================================================>] 4,718,592,000 12.9MB/s   in 2m 13s

2021-12-03 11:35:36 (33.9 MB/s) - '/sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.tar.gz.aa' saved [4718592000/4718592000]

--2021-12-03 11:35:36--  http://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ab
Resolving sourceforge.net (sourceforge.net)... 204.68.111.105
Connecting to sourceforge.net (sourceforge.net)|204.68.111.105|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ab [following]
--2021-12-03 11:35:36--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ab
Connecting to sourceforge.net (sourceforge.net)|204.68.111.105|:443... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ab/ [following]
--2021-12-03 11:35:37--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ab/
Reusing existing connection to sourceforge.net:443.
HTTP request sent, awaiting response... 302 Found
Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ab/download [following]
--2021-12-03 11:35:37--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ab/download
Reusing existing connection to sourceforge.net:443.
HTTP request sent, awaiting response... 302 Found
Location: https://downloads.sourceforge.net/project/fusioncatcher/data/human_v102.tar.gz.ab?ts=gAAAAABhqfL6UbX6xGscG26Ml4fODIjxUEKtj2pqIcVzezWU-aFWUF-CpKNBSNP9qo1s1q9MRBYbxzi3xeqq09dfEPaDpQHj2A%3D%3D&use_mirror=deac-riga&r= [following]
--2021-12-03 11:35:38--  https://downloads.sourceforge.net/project/fusioncatcher/data/human_v102.tar.gz.ab?ts=gAAAAABhqfL6UbX6xGscG26Ml4fODIjxUEKtj2pqIcVzezWU-aFWUF-CpKNBSNP9qo1s1q9MRBYbxzi3xeqq09dfEPaDpQHj2A%3D%3D&use_mirror=deac-riga&r=
Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 204.68.111.105
Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|204.68.111.105|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://deac-riga.dl.sourceforge.net/project/fusioncatcher/data/human_v102.tar.gz.ab [following]
--2021-12-03 11:35:38--  https://deac-riga.dl.sourceforge.net/project/fusioncatcher/data/human_v102.tar.gz.ab
Resolving deac-riga.dl.sourceforge.net (deac-riga.dl.sourceforge.net)... 89.111.52.100
Connecting to deac-riga.dl.sourceforge.net (deac-riga.dl.sourceforge.net)|89.111.52.100|:443... connected.
HTTP request sent, awaiting response... 302 Moved Temporarily
Location: https://downloads.sourceforge.net/project/fusioncatcher/data/human_v102.tar.gz.ab?download&failedmirror=deac-riga.dl.sourceforge.net [following]
--2021-12-03 11:35:38--  https://downloads.sourceforge.net/project/fusioncatcher/data/human_v102.tar.gz.ab?download&failedmirror=deac-riga.dl.sourceforge.net
Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|204.68.111.105|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://netcologne.dl.sourceforge.net/project/fusioncatcher/data/human_v102.tar.gz.ab [following]
--2021-12-03 11:35:40--  https://netcologne.dl.sourceforge.net/project/fusioncatcher/data/human_v102.tar.gz.ab
Resolving netcologne.dl.sourceforge.net (netcologne.dl.sourceforge.net)... 78.35.24.46, 2001:4dd0:1234:6::5f
Connecting to netcologne.dl.sourceforge.net (netcologne.dl.sourceforge.net)|78.35.24.46|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 4718592000 (4.4G) [application/octet-stream]
Saving to: '/sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.tar.gz.ab'

100%[================================================================================================================================>] 4,718,592,000 80.6MB/s   in 64s

2021-12-03 11:36:45 (70.0 MB/s) - '/sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.tar.gz.ab' saved [4718592000/4718592000]

--2021-12-03 11:36:46--  http://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ac
Resolving sourceforge.net (sourceforge.net)... 204.68.111.105
Connecting to sourceforge.net (sourceforge.net)|204.68.111.105|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ac [following]
--2021-12-03 11:36:46--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ac
Connecting to sourceforge.net (sourceforge.net)|204.68.111.105|:443... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ac/ [following]
--2021-12-03 11:36:47--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ac/
Reusing existing connection to sourceforge.net:443.
HTTP request sent, awaiting response... 302 Found
Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ac/download [following]
--2021-12-03 11:36:47--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ac/download
Reusing existing connection to sourceforge.net:443.
HTTP request sent, awaiting response... 302 Found
Location: https://downloads.sourceforge.net/project/fusioncatcher/data/human_v102.tar.gz.ac?ts=gAAAAABhqfM_61uoVAz1ZF6Q3Ogjqp8VvgNimL7tSXYxi6b1hgx5qPjGOP3AB7QeEYs9AMQWZIsTYO0sdi5mK475biYiYiqHJw%3D%3D&use_mirror=netcologne&r= [following]
--2021-12-03 11:36:47--  https://downloads.sourceforge.net/project/fusioncatcher/data/human_v102.tar.gz.ac?ts=gAAAAABhqfM_61uoVAz1ZF6Q3Ogjqp8VvgNimL7tSXYxi6b1hgx5qPjGOP3AB7QeEYs9AMQWZIsTYO0sdi5mK475biYiYiqHJw%3D%3D&use_mirror=netcologne&r=
Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 204.68.111.105
Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|204.68.111.105|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://netcologne.dl.sourceforge.net/project/fusioncatcher/data/human_v102.tar.gz.ac [following]
--2021-12-03 11:36:48--  https://netcologne.dl.sourceforge.net/project/fusioncatcher/data/human_v102.tar.gz.ac
Resolving netcologne.dl.sourceforge.net (netcologne.dl.sourceforge.net)... 78.35.24.46, 2001:4dd0:1234:6::5f
Connecting to netcologne.dl.sourceforge.net (netcologne.dl.sourceforge.net)|78.35.24.46|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 4718592000 (4.4G) [application/octet-stream]
Saving to: '/sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.tar.gz.ac'

100%[================================================================================================================================>] 4,718,592,000 80.0MB/s   in 56s

2021-12-03 11:37:45 (79.8 MB/s) - '/sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.tar.gz.ac' saved [4718592000/4718592000]

--2021-12-03 11:37:45--  http://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ad
Resolving sourceforge.net (sourceforge.net)... 204.68.111.105
Connecting to sourceforge.net (sourceforge.net)|204.68.111.105|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ad [following]
--2021-12-03 11:37:45--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ad
Connecting to sourceforge.net (sourceforge.net)|204.68.111.105|:443... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ad/ [following]
--2021-12-03 11:37:46--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ad/
Reusing existing connection to sourceforge.net:443.
HTTP request sent, awaiting response... 302 Found
Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ad/download [following]
--2021-12-03 11:37:46--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.tar.gz.ad/download
Reusing existing connection to sourceforge.net:443.
HTTP request sent, awaiting response... 302 Found
Location: https://downloads.sourceforge.net/project/fusioncatcher/data/human_v102.tar.gz.ad?ts=gAAAAABhqfN6hCI5Xw1wlIT0vIIY0TEvL8qDkpALrNfSf7i0L-YgcJ37yThIQbSJprCyMhkE6YCbxPptsk0CYe3aInLac1KjpQ%3D%3D&use_mirror=netcologne&r= [following]
--2021-12-03 11:37:46--  https://downloads.sourceforge.net/project/fusioncatcher/data/human_v102.tar.gz.ad?ts=gAAAAABhqfN6hCI5Xw1wlIT0vIIY0TEvL8qDkpALrNfSf7i0L-YgcJ37yThIQbSJprCyMhkE6YCbxPptsk0CYe3aInLac1KjpQ%3D%3D&use_mirror=netcologne&r=
Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 204.68.111.105
Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|204.68.111.105|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://netcologne.dl.sourceforge.net/project/fusioncatcher/data/human_v102.tar.gz.ad [following]
--2021-12-03 11:37:47--  https://netcologne.dl.sourceforge.net/project/fusioncatcher/data/human_v102.tar.gz.ad
Resolving netcologne.dl.sourceforge.net (netcologne.dl.sourceforge.net)... 78.35.24.46, 2001:4dd0:1234:6::5f
Connecting to netcologne.dl.sourceforge.net (netcologne.dl.sourceforge.net)|78.35.24.46|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 4437006861 (4.1G) [application/octet-stream]
Saving to: '/sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.tar.gz.ad'

100%[================================================================================================================================>] 4,437,006,861 80.2MB/s   in 51s

2021-12-03 11:38:38 (83.6 MB/s) - '/sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.tar.gz.ad' saved [4437006861/4437006861]

--2021-12-03 11:38:38--  http://sourceforge.net/projects/fusioncatcher/files/data/human_v102.md5
Resolving sourceforge.net (sourceforge.net)... 204.68.111.105
Connecting to sourceforge.net (sourceforge.net)|204.68.111.105|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.md5 [following]
--2021-12-03 11:38:38--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.md5
Connecting to sourceforge.net (sourceforge.net)|204.68.111.105|:443... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.md5/ [following]
--2021-12-03 11:38:39--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.md5/
Reusing existing connection to sourceforge.net:443.
HTTP request sent, awaiting response... 302 Found
Location: https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.md5/download [following]
--2021-12-03 11:38:39--  https://sourceforge.net/projects/fusioncatcher/files/data/human_v102.md5/download
FusionCatcher/1.33
========================

<https://github.com/ndaniel/fusioncatcher>

Used under license:
GPLv3


Structure creating script (makeroom_FusionCatcher_1.33.sh) moved to /sw/bioinfo/FusionCatcher/makeroom_1.33.sh

LOG
---

    /home/douglas/bin/makeroom.sh -f" -t "FusionCatcher" -v "1.33" -w "https://github.com/ndaniel/fusioncatcher" -d "Finder of somatic fusion-genes in RNA-seq data" -l "GPLv3"
    ./makeroom_FusionCatcher_1.33.sh
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
FusionCatcher-1.33_install-README.md [+]                                                                                                                  1,1            Top

- `python/2.7.15` loaded beforehand
- Default number of threads set to 0, for autodetect
- `biopython/1.73` loaded beforehand
- installed both of the human genome versions named at the end:
  o `/sw/bioinfo/FusionCatcher/1.10/rackham/bin/download-human_v95.sh`
  o `/sw/bioinfo/FusionCatcher/1.10/rackham/bin/build.sh`

The install process installs BioPython 1.73, but it is not found during the
second reference build.  So, load `biopython/1.73` and the second build works.
The mf file should include both python and biopython.

FusionCatcher-1.33_install-README.md

Last login: Thu Dec  2 18:48:03 2021 from fb166.ebc.uu.se
-bash: warning: setlocale: LC_CTYPE: cannot change locale (): No such file or directory
-bash: warning: setlocale: LC_CTYPE: cannot change locale (): No such file or directory
 _   _ ____  ____  __  __    _    __  __
 | | | |  _ \|  _ \|  \/  |  / \   \ \/ /   | System:    rackham5
 | | | | |_) | |_) | |\/| | / _ \   \  /    | User:      douglas
 | |_| |  __/|  __/| |  | |/ ___ \  /  \    |
  \___/|_|   |_|   |_|  |_/_/   \_\/_/\_\   |

###############################################################################

        User Guides: http://www.uppmax.uu.se/support/user-guides
                FAQ: http://www.uppmax.uu.se/support/faq

                        Write to support@uppmax.uu.se, if you have questions or comments.


Active notices for rackham:

  December maintenance window
    http://status.uppmax.uu.se/2021-11-24/december-maintenance/

    bashswap: .bashrc and .bash_profile are *simple*
    rackham5: ~ $ cd /sw/bioinfo/FusionCatcher/
    rackham5: /sw/bioinfo/FusionCatcher $ ll
    total 128
    drwxrwsr-x 3 douglas sw  4096 Dec 18  2017 0.99.3e
    drwxrwsr-x 4 douglas sw  4096 Dec 18  2017 0.99.5a
    drwxrwsr-x 6 douglas sw  4096 Sep 25  2018 1.00
    drwxrwsr-x 4 douglas sw  4096 Aug  6  2019 1.10
    -rw-rw-r-- 1 jonass  sw   286 Nov 24 14:15 FusionCatcher-0.99.3e.DRAFT.yaml
    -rw-rw-r-- 1 jonass  sw   286 Nov 24 14:15 FusionCatcher-0.99.5a.DRAFT.yaml
    -rw-rw-r-- 1 douglas sw  4299 Dec 18  2017 FusionCatcher-1.00-install-README.md
    -rw-rw-r-- 1 jonass  sw   414 Nov 24 14:14 FusionCatcher-1.00.DRAFT.yaml
    -rw-rw-r-- 1 douglas sw 80426 Sep  9  2019 FusionCatcher-1.10-install-README.md
    -rw-rw-r-- 1 jonass  sw   403 Nov 24 14:14 FusionCatcher-1.10.DRAFT.yaml
    drwxrwsr-x 2 douglas sw  4096 Aug  6  2019 mf
FusionCatcher-1.33_install-README.md [+]                                                                                                                  54,3            0%
    -rw-rw-r-- 1 jonass  sw   403 Nov 24 14:14 FusionCatcher-1.10.DRAFT.yaml
    drwxrwsr-x 2 douglas sw  4096 Aug  6  2019 mf
    rackham5: /sw/bioinfo/FusionCatcher $ cat FusionCatcher-1.10-install-README.md
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
                                                    - - Default number of threads set to 0, for autodetect
                                                    - - `biopython/1.73` loaded beforehand
                                                    - - installed both of the human genome versions named at the end:
                                                    -   o `/sw/bioinfo/FusionCatcher/1.10/rackham/bin/download-human_v95.sh`
                                                    -     o `/sw/bioinfo/FusionCatcher/1.10/rackham/bin/build.sh`
                                                    -
                                                    -     The install process installs BioPython 1.73, but it is not found during the
                                                    -     second reference build.  So, load `biopython/1.73` and the second build works.
                                                    -     The mf file should include both python and biopython.
                                                    -
                                                    -         rackham5: /sw/bioinfo/FusionCatcher/1.10/src $     wget -O bootstrap.py http://sf.net/projects/fusioncatcher/files/bootstrap.py
                                                    -             rackham5: /sw/bioinfo/FusionCatcher/1.10/src $     python bootstrap.py --installation-path=$PFX -x
                                                    -                 Checking latest version of Ensembl database that is available...
FusionCatcher-1.33_install-README.md [+]                                                                                                                  103,0-1         1%
6150 fewer lines; before #3  11:51:21
Reusing existing connection to sourceforge.net:443.
HTTP request sent, awaiting response... 302 Found
Location: https://downloads.sourceforge.net/project/fusioncatcher/data/human_v102.md5?ts=gAAAAABhqfOvVJ4XtM-KkKZhMmsEu0bevLraIrGLGTuxA38Ulr3FWQmSF046spNxMsaMO2yPwvzN16sudIhlsGlLid8bl9I55g%3D%3D&use_mirror=netactuate&r= [following]
--2021-12-03 11:38:39--  https://downloads.sourceforge.net/project/fusioncatcher/data/human_v102.md5?ts=gAAAAABhqfOvVJ4XtM-KkKZhMmsEu0bevLraIrGLGTuxA38Ulr3FWQmSF046spNxMsaMO2yPwvzN16sudIhlsGlLid8bl9I55g%3D%3D&use_mirror=netactuate&r=
Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 204.68.111.105
Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|204.68.111.105|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://netactuate.dl.sourceforge.net/project/fusioncatcher/data/human_v102.md5 [following]
--2021-12-03 11:38:40--  https://netactuate.dl.sourceforge.net/project/fusioncatcher/data/human_v102.md5
Resolving netactuate.dl.sourceforge.net (netactuate.dl.sourceforge.net)... 104.225.3.66
Connecting to netactuate.dl.sourceforge.net (netactuate.dl.sourceforge.net)|104.225.3.66|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 220 [application/octet-stream]
Saving to: '/sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.md5'

100%[==================================================================================================================================>] 220         --.-K/s   in 0s

2021-12-03 11:38:41 (45.9 MB/s) - '/sw/bioinfo/FusionCatcher/1.33/rackham/data/human_v102.md5' saved [220/220]

human_v102.tar.gz.aa: OK
human_v102.tar.gz.ab: OK
human_v102.tar.gz.ac: OK
human_v102.tar.gz.ad: OK
--> DONE!

--------------> THE END! <---------------------------


rackham5: /sw/bioinfo/FusionCatcher/1.33/src $ cd ../..
rackham5: /sw/bioinfo/FusionCatcher $ ll
total 240
drwxrwsr-x 3 douglas sw  4096 Dec 18  2017 0.99.3e
drwxrwsr-x 4 douglas sw  4096 Dec 18  2017 0.99.5a
drwxrwsr-x 6 douglas sw  4096 Sep 25  2018 1.00
drwxrwsr-x 4 douglas sw  4096 Aug  6  2019 1.10
drwxrwsr-x 4 douglas sw  4096 Dec  3 11:24 1.33
-rw-rw-r-- 1 jonass  sw   286 Nov 24 14:15 FusionCatcher-0.99.3e.DRAFT.yaml
-rw-rw-r-- 1 jonass  sw   286 Nov 24 14:15 FusionCatcher-0.99.5a.DRAFT.yaml
-rw-rw-r-- 1 douglas sw  4299 Dec 18  2017 FusionCatcher-1.00-install-README.md
-rw-rw-r-- 1 jonass  sw   414 Nov 24 14:14 FusionCatcher-1.00.DRAFT.yaml
-rw-rw-r-- 1 douglas sw 80426 Sep  9  2019 FusionCatcher-1.10-install-README.md
-rw-rw-r-- 1 jonass  sw   403 Nov 24 14:14 FusionCatcher-1.10.DRAFT.yaml
-rw-rw-r-- 1 douglas sw   397 Dec  3 11:24 FusionCatcher-1.33.yaml
-rw-rw-r-- 1 douglas sw 80877 Dec  3 11:24 FusionCatcher-1.33_install-README.md
-rwxrwxr-x 1 douglas sw   861 Dec  3 11:24 FusionCatcher-1.33_post-install.sh
-rw-rw-r-- 1 douglas sw   537 Dec  3 11:24 SOURCEME_FusionCatcher_1.33
-rwxrwxr-x 1 douglas sw  9507 Dec  3 11:24 makeroom_FusionCatcher_1.33.sh
drwxrwsr-x 2 douglas sw  4096 Dec  3 11:24 mf
rackham5: /sw/bioinfo/FusionCatcher $ vi FusionCatcher-1.33_install-README.md
F3 for ToggleMouse()
Press ENTER or type command to continue
rackham5: /sw/bioinfo/FusionCatcher $ cat ~/.vimrc
" now I have to figure out how to have a .txt-specific
" set textwidth=78.

"------- begin Vundle requirements
"-------
"------- from https://github.com/gmarik/Vundle.vim
"
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Git plugin not hosted on GitHub
""Plugin 'git://git.wincent.com/command-t.git'
" Keep Plugin commands between vundle#begin/end.
"
"" Git plugin
"Plugin 'tpope/vim-fugitive'

" find-files pluggin
Plugin 'wincent/command-t'
set wildignore+=*.o,*.obj,*.pdf,*.zip,*.gz,*.bz2,*.jpg,*.png,*.eps,*.ps,.git,latex.out,_minted-*,materials,*.toc,*.flx,*.xlsx,*.docx,*.pptx
" https://stackoverflow.com/questions/6159555/macvim-command-t-plugin-how-open-in-new-tab-by-default
let g:CommandTAcceptSelectionTabMap = '<CR>'  " Opens file in new tab
let g:CommandTAcceptSelectionMap = '<C-t>'    " Opens file in same tab

" LaTeX
Plugin 'lervag/vimtex'

"" YouCompleteMe
"Plugin 'Valloric/YouCompleteMe'
"set encoding=utf-8  " is this a general setting

"" tags in general
"Plugin 'ludovicchabant/vim-gutentags'
"" let g:gutentags_generate_on_write = 0   " only update tags manually
"" :GutentagsUpdate                        " the manual command to update tags

" awesome: visual line, select, :Tab /&  or whatever
Plugin 'godlygeek/tabular'

" Vim Markdown from https://github.com/plasticboy/vim-markdown
Plugin 'plasticboy/vim-markdown'
" no folding in markdown, ever
let g:vim_markdown_folding_disabled=1

"" Better status line
"Plugin 'vim-airline/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"-------
"-------
"------- end Vundle requirements

" Mac vs Linux specifics
let s:uname = substitute(system("uname -s"), '\n', '', '')
if has("unix")
    if has("mac") || s:uname == "Darwin"
        set guifont=Menlo:h12
        set rubydll=/opt/local/lib/libruby.2.6.dylib
    else
        " When copying to Uppmax, don't forget:
        "
        " module load ruby/2.6.2
        " cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t
        " ruby extconf.rb && make
        "
        """"" not needed, vim/8.1-1053 is compiled with this already in there
        " set rubydll=/sw/comp/ruby/2.6.2/rackham/lib/libruby.so.2.6.2
        " Don't grab the mouse, annoying when this happens when using vim
        " within iTerm2 window
        set mouse=
    endif
endif

" enable 256 colors
"set t_Co=256
"set t_AB=^[[48;5;%dm
"#set t_AF=^[[38;5;%dm

set background=light
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
colorscheme scofield
set history=5000
set nofoldenable

set wrap
set linebreak
set textwidth=0
set scrolloff=5

set breakat=" "
set showbreak="°°°"

""""
" VIM status line, work in progress
set laststatus=2

" set nolist " list disables linebreak
" set textwidth=0
" set wrapmargin=0
" set formatoptions+=1


"filetype plugin on
"syntax enable

set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
" set shiftround
set expandtab

" Using rmd.vim syntax highlighting from
" https://github.com/jcfaria/Vim-R-plugin/blob/master/syntax/rmd.vim
" this option allows syntax highlighting within R chunks
" what do I want my R shiftwidth to be...
let rmd_syn_hl_chunk = 1
au BufNewFile,BufRead *.rmd,*.Rmd setf rmd

" au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.md setf markdown

let g:is_bash=1  " .sh syntax highlighting always bash
let g:leave_my_textwidth_alone=1

behave mswin

function! ToggleMouse()
    " deals with whether vim captures mouse movements or not
    " disable if enabled, enable nv (not in INSERT) if disabled
    if &mouse != ""
        set mouse=
    else
        set mouse=nv
    endif
    echo "mouse="&mouse
endfunc

""""
" improve searching
set incsearch
set ignorecase
set smartcase

""""""""""""""""""""""""""""""""""""
" keymaps
""""""""""""""""""""""""""""""""""""

" prep using comma for command leader
let mapleader = '§'
nnoremap <Leader>§ §
let maplocalleader = ','
nnoremap <LocalLeader>, ,

" for ragtag.vim
inoremap <M-o> <Esc>o
inoremap <C-j> <Down>
let g:ragtag_global_maps = 1

" Shift-TAB in Insert inserts hard TAB
:inoremap <S-Tab> <C-V><Tab>

" deal with sudden remap of find
map  <C-F>         <PageDown>

""""
" Function key mappings
map  <F3>          :call ToggleMouse()<CR>
imap <F3>          <ESC>:call ToggleMouse()<CR>a
"map  <F3> <ESC>:exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>
"imap  <F3>          <ESC>:exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>a

" highlight search on/off active in both modes
set hlsearch
map  <F4>          :set hlsearch!<CR>
imap <F4>          <ESC>:set hlsearch!<CR>a
nmap <Leader>hl    :set hlsearch!<CR>

""""
" line numbers
map  <F5>          :set invnumber!<CR>
imap <F5>          <ESC>:set invnumber!<CR>a
nmap <Leader>n     :set invnumber!<CR>
nmap <Leader>rn    :set invrelativenumber!<CR>

""""
" paste mode for code, disabling autoindent, etc.
set pastetoggle=<F6>

""""
" (r)eplace all of word under cursor with typed word, confirm each
nnoremap <leader>r yiw:%s/\<<C-r>"\>//gc<left><left><left>
" (R)eplace all of word under cursor with typed word without confirmation
nnoremap <leader>R yiw:%s/\<<C-r>"\>//g<left><left>

" paragraph wrap active in both modes; note that
" I really should solve the 'moving cursor' problem
" because the wrap puts me after the paragraph, and
" a mark set in the paragraph is cleared.
map  <C-P>         gqap
imap <C-P>         <ESC>gqap

" remap <C-S> to save in both insert and normal modes
map  <C-S>         :w<CR>
imap <C-S>         <ESC>:w<CR>a

set hl=

"""""""""""""""""""""
" wildmenu

set wildmenu
set wildmode=longest:list,full

"""""""""""""""""""""
"""""""""""""""""""""
"""""""""""""""""""""
" LaTeX
"

" Tabular  ------------------------
"
noremap <leader>b   :Tabular/

" my formatting hacks, would be better to figure out how to do these
" mappings via VimTex
"
nmap <Leader>wtt    "zyiwdiwi\texttt{<ESC>"zpa}<ESC>
nmap <Leader>wem    "zyiwdiwi\emph{<ESC>"zpa}<ESC>
nmap <Leader>wtx    "zyiwdiwi\text{<ESC>"zpa}<ESC>
nmap <Leader>wbf    "zyiwdiwi\textbf{<ESC>"zpa}<ESC>
nmap <Leader>wmm    "zyiwdiwi$<ESC>"zpa$<ESC>

" expand the list of characters considered part of a word (right?)
"
let g:tex_isk='48-57,a-z,A-Z,192-255,:,_'


" VimTex ----------------------------
" and some of my hacks, probably better to do a more comprehensive mapping
" like https://github.com/lervag/vimtex/issues/455
" Mac mappings based on results of Alt- key
"  Alt-i inserts \item<space> only in insert mode
inoremap ı \item<space>
"  Alt-t \task<space> only in insert mode
inoremap † \task<space>
""  Alt-t inserts \true only in insert mode
"inoremap † \true
""  Alt-f inserts \false only in insert mode
"inoremap ƒ \false

"  Alt-v enters Visual Block mode
" nmap ‹ <C-V>
"  Visual Block mode is entered via C-Q

let g:vimtex_fold_enabled = 1

let g:vimtex_latexmk_continuous = 0
"let g:vimtex_latexmk_options = '-pdf -shell-escape -verbose -file-line-error -output-dir=latex.out -synctex=1 -interaction=nonstopmode'
"let g:vimtex_compiler_latexmk = {
"    \ 'background' : 1,
"    \ 'build_dir' : 'latex.out',
"    \ 'callback' : 1,
"    \ 'continuous' : 1,
"    \ 'executable' : 'latexmk',
"    \ 'options' : [
"    \   '-pdf',
"    \   '-shell-escape',
"    \   '-verbose',
"    \   '-file-line-error',
"    \   '-synctex=1',
"    \   '-interaction=nonstopmode',
"    \ ],
".    \}

" Latex semantic triggers for YouCompleteMe
"    \ 'tex' : ['re!(ref|cite|cite[tp]){'],
let g:ycm_semantic_triggers = {
    \ 'tex'  : ['{']
    \ }

" This keeps completion via semantic triggers but effectively disables
" identifier completer
" https://github.com/Valloric/YouCompleteMe/issues/1114
let g:ycm_min_num_of_chars_for_completion = 99

" Turn off YCM
nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>
" Turn on YCM
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>

" minted environments within which to let vim do syntax highlighting
"
let g:vimtex_syntax_minted = [
    \ {
    \   'lang' : 'r',
    \   'commands' : [ 'Rline', 'rinli' ],
    \   'environments' : ['rcode', 'rcode*'],
    \ },
    \ {
    \   'lang' : 'c',
    \   'commands' : [ 'Cline', 'cinli' ],
    \   'environments' : ['ccode', 'ccode*'],
    \ },
    \ {
    \   'lang' : 'cpp',
    \   'commands' : [ 'Cppline', 'cppi' ],
    \   'environments' : ['cppcode', 'cppcode*'],
    \ },
    \ {
    \   'lang' : 'java',
    \   'commands' : [ 'Javaline', 'javai' ],
    \   'environments' : ['javacode', 'javacode*'],
    \ },
    \ {
    \   'lang' : 'python',
    \   'commands' : [ 'Pythline', 'pythi' ],
    \   'environments' : ['pythoncode', 'pythoncode*'],
    \   'ignore' : [
    \     'pythonEscape',
    \     'pythonBEscape',
    \     ],
    \ },
    \ {
    \   'lang' : 'perl',
    \   'commands' : [ 'Perlline', 'perli' ],
    \   'environments' : ['perlcode', 'perlcode*'],
    \ },
    \ {
    \   'lang' : 'bash',
    \   'syntax' : 'sh',
    \   'commands' : [ 'Bashline', 'bashi' ],
    \   'environments' : ['bashcode', 'bashcode*'],
    \ }
    \]


autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.bib set filetype=tex

"""""""""""""""""""""
"""""""""""""""""""""
"""""""""""""""""""""

    /home/douglas/bin/makeroom.sh -f" -t "FusionCatcher" -v "1.33" -w "https://github.com/ndaniel/fusioncatcher" -d "Finder of somatic fusion-genes in RNA-seq data" -l "GPL    /home/douglas/bin/makeroom.sh -f" -t "FusionCatcher" -v "1.33" -w "https://github.com/ndaniel/fusioncatcher" -d "Finder of somatic fusion-genes in RNA-seq data" -l "GPLv3"
    ./makeroom_FusionCatcher_1.33.sh
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

FusionCatcher-1.33_install-README.md


~
FusionCatcher-1.33_install-README.md [+]

