Roary/3.13.0
============

<http://sanger-pathogens.github.io/Roary/>

Used under license:
GPL-v3.0
<https://github.com/sanger-pathogens/Roary/blob/master/GPL-LICENSE>

Structure creating script (makeroom_Roary_3.13.0.sh) moved to /sw/bioinfo/Roary/makeroom_3.13.0.sh

LOG
---

    TOOL=Roary
    VERSION=3.13.0
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/Roary/3.13.0/src
    /home/laekl991/scripts/install-methods/makeroom.sh -t "Roary" -v "3.13.0" -s "misc" -w "http://sanger-pathogens.github.io/Roary/" -l "GPL-v3.0" -L "https://github.com/sanger-pathogens/Roary/blob/master/GPL-LICENSE" -d "Roary is a high speed stand alone pan genome pipeline\, which takes annotated assemblies in GFF3 format \(produced by Prokka \(Seemann\, 2014\)\) and calculates the pan genome" -f"
    ./makeroom_Roary_3.13.0.sh

     [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/sanger-pathogens/Roary/archive/v${VERSION}.tar.gz
     [[ -d Roary-${VERSION} ]] && rm -rf Roary-${VERSION}
     tar xzf v${VERSION}.tar.gz
     cd Roary-${VERSION}
     
     Check dependencies.  I think we have most/all of them from `Roary/3.12.0`.
     
     view install_dependencies.sh

*Don't* use install_dependecies.sh script. check if dependencies are in the module tree and load them accordingly
     
     mspid cd-Hit
     mspid bedtools
     mspid Prank
     mspid fasttree
     mspid mafft

     ml bioinfo-tools
     ml cd-hit/4.8.1
     ml BEDTools/2.29.2
     ml FastTree/2.1.10
     ml MAFFT/7.310
     ml prank/170427

     cp -a * ../../$CLUSTER/
     cd ../../$CLUSTER/
     chmod -x install_dependencies.sh  
     
modify mf file to load dependencies

