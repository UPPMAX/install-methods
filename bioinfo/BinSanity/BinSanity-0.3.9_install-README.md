BinSanity/0.3.9
========================

<https://github.com/edgraham/BinSanity/wiki/>

Used under license:
GPL v3 license
<>

Structure creating script (makeroom_BinSanity_0.3.9.sh) moved to /sw/bioinfo/BinSanity/makeroom_0.3.9.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "BinSanity" -v "0.3.9" -w "https://github.com/edgraham/BinSanity/wiki/" -c "bioinfo" -l "GPL v3 license" -d "suite a scripts designed to cluster contigs generated from metagenomic assembly into putative genomes." -x "INSTALL" -s "misc"
    ./makeroom_BinSanity_0.3.9.sh
BinSanity/0.2.10
========================

<https://github.com/edgraham/BinSanity/wiki/>

Used under license:
GPL v3 license
<>

Structure creating script (makeroom_BinSanity_0.2.10.sh) moved to /sw/bioinfo/BinSanity/makeroom_0.2.10.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "BinSanity" -v "0.2.10" -w "https://github.com/edgraham/BinSanity/wiki/" -c "bioinfo" -l "GPL v3 license" -d "suite a scripts designed to cluster contigs generated from metagenomic assembly into putative genomes." -x "INSTALL" -s "misc"
    ./makeroom_BinSanity_0.2.10.sh
    cd $SRCDIR
    wget https://github.com/edgraham/BinSanity/archive/refs/tags/v0.3.9.zip
    unzip v0.3.9.zip
    cd BinSanity-0.3.9/
    ml biopython/1.73 hmmer/3.1b2 checkM/1.0.12 subread/2.0.0 subread
    PYTHONUSERBASE=$PREFIX pip install --user scikit-learn
    PYTHONUSERBASE=$PREFIX pip install --user .
    cp example $PREFIX/
# after fixing module file and loaded it
    cd $PREFIX
    cd example/
    Binsanity -f . -l igm.fa -p -10 -c Infant_gut_assembly.cov.x100.lognorm
