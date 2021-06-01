EDirect/15.1
========================

<https://www.ncbi.nlm.nih.gov/books/NBK179288/>

Used under license:
Public Domain


Structure creating script (makeroom_EDirect_15.1.sh) moved to /sw/bioinfo/EDirect/makeroom_15.1.sh

LOG
---

When updating, there's no easy indication I've found to indicate the latest version.  To learn this, go through these steps in some temp directory:

    wget ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh
    sed -i 's/cd ~/cd ./' install-edirect.sh 
    bash install-edirect.sh
    cd edirect
    ./elink -h | head -n 1
    ./efetch -h | head -n 1
    ./esearch -h | head -n 1

These should all agree on the latest version available.  I did this for a dummy module versioned 'later', then removed its environment after I learned 15.1 was the version.  I then followed these steps.

    makeroom.sh -f -t EDirect -v 15.1 -s misc -w https://www.ncbi.nlm.nih.gov/books/NBK179288/ -l "Public Domain" -d "EDirect provides access to the NCBI's suite of interconnected databases (publication, sequence, structure, gene, variation, expression, etc.) from a Unix terminal window"
    ./makeroom_EDirect_15.1.sh 
    source /sw/bioinfo/EDirect/SOURCEME_EDirect_15.1 && cd $TOOLDIR
    cd $SRCDIR
    wget ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh
    sed -i 's/cd ~/cd $SRCDIR/' install-edirect.sh 
    bash install-edirect.sh 

Just hit Return when it asks to add a directory to your .bash_profile.  Then make the edirect directory the prefix.

    rmdir $PREFIX && mv edirect $PREFIX
