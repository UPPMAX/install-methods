sratools/3.0.0
========================

<https://github.com/ncbi/sra-tools>

Used under license:
custom
<https://github.com/ncbi/sra-tools/blob/master/LICENSE>

Structure creating script (makeroom_sratools_3.0.0.sh) moved to /sw/bioinfo/sratools/makeroom_3.0.0.sh

LOG
---

    /home/pmitev/GIT/install-methods/makeroom.sh "-t" "sratools" "-v" "3.0.0" "-w" "https://github.com/ncbi/sra-tools" "-l" "custom" "-L" "https://github.com/ncbi/sra-tools/blob/master/LICENSE" "-d" "The SRA Toolkit and SDK from NCBI is a collection of tools and libraries for using data in the INSDC Sequence Read Archives." "-f"
    ./makeroom_sratools_3.0.0.sh

    cd $SRCDIR
    wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/3.0.0/sratoolkit.3.0.0-centos_linux64.tar.gz
    tar -xvf sratoolkit.3.0.0-centos_linux64.tar.gz -C ../rackham/ --strip-components 1
