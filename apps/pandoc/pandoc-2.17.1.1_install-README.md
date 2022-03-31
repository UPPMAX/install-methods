pandoc/2.17.1.1
===============

<https://pandoc.org/>

Used under license:
GPL v3


Structure creating script (makeroom_pandoc_2.17.1.1.sh) moved to /sw/apps/pandoc/makeroom_2.17.1.1.sh

LOG
---

    VERSION=2.17.1.1

    makeroom.sh "-t" "pandoc" "-v" "${VERSION}" "-w" "https://pandoc.org/" "-c" "apps" "-l" "GPL v3" "-d" "Pandoc is a Haskell library for converting from one markup format to another, and a command-line tool that uses this library." "-f"
    ./makeroom_pandoc_${VERSION}.sh
    ./makeroom_pandoc_${VERSION}0.1.sh 
    source /sw/apps/pandoc/SOURCEME_pandoc_${VERSION} && cd $SRCDIR
    wget https://github.com/jgm/pandoc/releases/download/${VERSION}/pandoc-${VERSION}-linux-amd64.tar.gz
    tar xf pandoc-${VERSION}-linux-amd64.tar.gz
    rmdir $PREFIX
    mv pandoc-${VERSION} $PREFIX

