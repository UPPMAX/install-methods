GroopM/0.3.5
========================

<http://ecogenomics.github.io/GroopM/>

Used under license:
GPL v3 license
<>

Structure creating script (makeroom_GroopM_0.3.5.sh) moved to /sw/bioinfo/GroopM/makeroom_0.3.5.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "GroopM" -v "0.3.5" -w "http://ecogenomics.github.io/GroopM/" -c "bioinfo" -l "GPL v3 license" -d "metagenomic binning toolset. It leverages spatio-temporal dynamics \\(differential coverage\\) to accurately \\(and almost automatically\\) extract population genomes from multi-sample metagenomic datasets." -x "INSTALL" -s "misc"
    ./makeroom_GroopM_0.3.5.sh
    
    cd /sw/bioinfo/GroopM/
    . SOURCEME_GroopM_0.3.5
    cd $SRCDIR
    ml git bioinfo-tools biopython/1.73 
    git clone https://github.com/ecogenomics/GroopM
    cd GroopM/
    PYTHONUSERBASE=$PREFIX pip install --user .
    
