sratools/2.10.9
========================

<https://github.com/ncbi/sra-tools>

Used under license:
custom
<https://github.com/ncbi/sra-tools/blob/master/LICENSE>

Structure creating script (makeroom_sratools_2.10.9.sh) moved to /sw/bioinfo/sratools/makeroom_2.10.9.sh

LOG
---

    /home/jonass/uppmax/install-methods/makeroom.sh -t "sratools" -v "2.10.9" -w "https://github.com/ncbi/sra-tools" -l "custom" -L "https://github.com/ncbi/sra-tools/blob/master/LICENSE" -d "The SRA Toolkit and SDK from NCBI is a collection of tools and libraries for using data in the INSDC Sequence Read Archives." -f"
    ./makeroom_sratools_2.10.9.sh

    cd $SRCDIR
    wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.10.9/sratoolkit.2.10.9-centos_linux64.tar.gz
    tar xvfz sratoolkit.2.10.9-centos_linux64.tar.gz
    rm -rf ../rackham
    mv sratoolkit.2.10.9-centos_linux64 ../rackham
