BinSanity/0.5.4
========================

<https://github.com/edgraham/BinSanity/wiki/>

Used under license:
GPL v3 license


Structure creating script (makeroom_BinSanity_0.5.4.sh) moved to /sw/bioinfo/BinSanity/makeroom_0.5.4.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "BinSanity" -v "0.5.4" -w "https://github.com/edgraham/BinSanity/wiki/" -c "bioinfo" -l "GPL v3 license" -d "suite a scripts designed to cluster contigs generated from metagenomic assembly into putative genomes." -x "INSTALL" -s "misc" -f
    ./makeroom_BinSanity_0.5.4.sh
     source /sw/bioinfo/BinSanity/SOURCEME_BinSanity_0.5.4 && cd $TOOLDIR
     cd $SRCDIR
     ml git/2.28.0 bioinfo-tools biopython/1.78 CheckM/1.1.3 subread/2.0.0
     git clone https://github.com/edgraham/BinSanity
     cd BinSanity
     PYTHONUSERBASE=$PREFIX pip install --user scikit-learn
     PYTHONUSERBASE=$PREFIX pip install --user .
#     PYTHONUSERBASE=$PREFIX pip install --user BinSanity
    


    cp -r example $PREFIX/
# after fixing module file and loaded it
    cd $PREFIX
    cd example/
    Binsanity -f . -l igm.fa -p -10 -c Infant_gut_assembly.cov.x100.lognorm
