sratools/3.0.7
========================

<https://github.com/ncbi/sra-tools>

Used under license:
custom
<https://github.com/ncbi/sra-tools/blob/master/LICENSE>

Structure creating script (makeroom_sratools_3.0.7.sh) moved to /sw/bioinfo/sratools/makeroom_3.0.7.sh

LOG
---

    makeroom.sh "-t" "sratools" "-v" "3.0.7" "-w" "https://github.com/ncbi/sra-tools" "-l" "custom" "-L" "https://github.com/ncbi/sra-tools/blob/master/LICENSE" "-d" "The SRA Toolkit and SDK from NCBI is a collection of tools and libraries for using data in the INSDC Sequence Read Archives." "-f"
    ./makeroom_sratools_3.0.7.sh

    source /sw/bioinfo/sratools/SOURCEME_sratools_3.0.7
    cd $SRCDIR

    wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/3.0.7/sratoolkit.3.0.7-centos_linux64.tar.gz
    tar xf sratoolkit.3.0.7-centos_linux64.tar.gz -C $PREFIX --strip-components 1

    cd $TOOLDIR
    ./sratools-3.0.7_post-install.sh
