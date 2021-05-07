BamM/1.7.3
========================

<https://github.com/Ecogenomics/BamM>

Used under license:
GPL v3 license
<>

Structure creating script (makeroom_BamM_1.7.3.sh) moved to /sw/bioinfo/BamM/makeroom_1.7.3.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "BamM" -v "1.7.3" -w "https://github.com/Ecogenomics/BamM" -c "bioinfo" -l "GPL v3 license" -d "provide a faster\, more stable interface to parsing BAM files than PySam\, but doesn\'t implement all/any of PySam\'s features." -x "INSTALL" -s "misc"
    ./makeroom_BamM_1.7.3.sh
    cd $SRCDIR
    git clone https://github.com/Ecogenomics/BamM --recursive
    cd BamM/
    ml biopython/1.73 automake biopython/1.73 zlib libtool gcc/8.3.0 
    PYTHONUSERBASE=$PREFIX pip install --user pysam
    PYTHONUSERBASE=$PREFIX pip install --user .




