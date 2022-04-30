SQuIRE/885bf4d-20190301
========================

<https://github.com/wyang17/SQuIRE>

Used under license:
GPL v3


Structure creating script (makeroom_SQuIRE_885bf4d-20190301.sh) moved to /sw/bioinfo/SQuIRE/makeroom_885bf4d-20190301.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "SQuIRE" "-v" "885bf4d-20190301" "-w" "https://github.com/wyang17/SQuIRE" "-c" "bioinfo" "-l" "GPL v3" "-d" "Software for Quantifying Interspersed Repeat Expression" "-x" "install" "-s" "misc"
    ./makeroom_SQuIRE_885bf4d-20190301.sh
    cd $SRCDIR
    ml git/2.34.1
    git clone https://github.com/wyang17/SQuIRE
    cd SQuIRE
    ml python/2.7.15 R_packages/4.1.1 star/2.5.3a BEDTools/2.25.0 samtools/1.1 StringTie/1.3.3 IGVtools/2.3.98 ucsc-utilities/v421
    PYTHONUSERBASE=$PREFIX pip install --user setuptools_scm==5.0.2
    PYTHONUSERBASE=$PREFIX pip install --user -e .

