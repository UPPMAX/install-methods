libSBML/5.20.2
==============

<https://sbml.org/software/libsbml/>

Used under license:
LGPL v2.1


Structure creating script (makeroom_libSBML_5.20.0.sh) moved to /sw/libs/libSBML/makeroom_5.20.0.sh

LOG
---

    makeroom.sh "-f" "-t" "libSBML" "-v" "5.20.2" "-c" "libs" "-l" "LGPL v2.1" "-w" "https://sbml.org/software/libsbml/" "-d" "free, open-source programming library to help you read, write, manipulate, translate, and validate SBML files and data streams"
    ./makeroom_libSBML_5.20.2.sh
    source /sw/libs/libSBML/SOURCEME_libSBML_5.20.2
    cd $SRCDIR
    wget https://github.com/sbmlteam/libsbml/archive/refs/tags/v5.20.2.tar.gz
    tar xf v5.20.2.tar.gz
    ml cmake/3.26.3
    ml gcc/12.3.0

