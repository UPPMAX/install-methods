Minimac4/4.1.6
========================

<https://github.com/statgen/Minimac4>

Used under license:
GPL-3.0
<https://github.com/statgen/Minimac4/blob/master/LICENSE>

Structure creating script (makeroom_Minimac4_4.1.6.sh) moved to /sw/bioinfo/Minimac4/makeroom_4.1.6.sh

LOG
---

    makeroom.sh "-t" "Minimac4" "-v" "4.1.6" "-w" "https://github.com/statgen/Minimac4" "-l" "GPL-3.0" "-L" "https://github.com/statgen/Minimac4/blob/master/LICENSE" "-d" "Minimac4 is a lower memory and more computationally efficient implementation of the genotype imputation algorithms in minimac/mininac2/minimac3" "-f"
    ./makeroom_Minimac4_4.1.6.sh
     
    source /sw/bioinfo/Minimac4/SOURCEME_Minimac4_4.1.6 && cd $PREFIX
    wget https://github.com/statgen/Minimac4/releases/download/v4.1.6/minimac4-4.1.6-Linux-x86_64.sh
    chmod +x minimac4-4.1.6-Linux-x86_64.sh
    ./minimac4-4.1.6-Linux-x86_64.sh --skip-license
    mv minimac4-4.1.6-Linux-x86_64.sh $SRCDIR

