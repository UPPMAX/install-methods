UniteM/0.0.18
========================

<https://github.com/dparks1134/UniteM>

Used under license:
GPL v3 license
<>

Structure creating script (makeroom_UniteM_0.0.18.sh) moved to /sw/bioinfo/UniteM/makeroom_0.0.18.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "UniteM" -v "0.0.18" -w "https://github.com/dparks1134/UniteM" -c "bioinfo" -l "GPL v3 license" -d "software toolkit implementing different ensemble binning strategies for producing a non-redundant set of bins from the output of multiple binning methods." -x "INSTALL" -s "misc"
    ./makeroom_UniteM_0.0.18.sh
    

    cd $SRCDIR
    ml git/2.28.0
    git clone https://github.com/dparks1134/UniteM
    cd UniteM
    ml bioinfo-tools biopython/1.78 GroopM/2.0.0 BinSanity/0.5.4 MetaBat/2.12.1 MaxBin/2.2.7
    PYTHONUSERBASE=$PREFIX pip install --user .
    cp -r example/ README.md unitem_manual.pdf $PREFIX/


