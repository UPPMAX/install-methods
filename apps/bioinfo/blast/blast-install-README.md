# blast-install-README.md

blast_compile.README     pallol@tintin1.uppmax.uu.se     2012/02/28 07:57:14

##TITLE

Compilation/installation of BLAST

##DESCRIPTION

Just follow the online cookbook at ncbi	

##TODO


configuration (.ncbirc file or environment)


##LOG

### 2012-11-14
### Update to 2.2.27+

    wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.2.27+-src.tar.gz
    tar xzf ncbi-blast-2.2.27+-src.tar.gz
    cd ncbi-blast-2.2.27+-src/c++
    mkdir -p //////sw/apps/bioinfo/blast/2.2.27+/kalkyl
    ./configure --prefix=//////sw/apps/bioinfo/blast/2.2.27+/kalkyl
    make -j2
    make install



### update to 2.2.27
### on tintin:

    wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/ncbi-blast-2.2.25+-src.tar.gz
    tar xzf ncbi-blast-2.2.25+-src.tar.gz
    mkdir //////sw/apps/bioinfo/blast/2.2.25+/tintin
    ./configure --prefix=//////sw/apps/bioinfo/blast/2.2.25+/tintin/
    make -j4
    make install




AUTHOR

Pall Isolfur Olason, pall.olason@ebc.uu.se

Copyright (C) 2012 by Pall Isolfur Olason

Edited by Douglas Scofield, douglas.scofield@ebc.uu.se
