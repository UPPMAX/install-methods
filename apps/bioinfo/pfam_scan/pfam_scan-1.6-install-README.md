pfam_scan/1.6
=============

<https://xfam.wordpress.com/2017/03/08/pfam-31-0-is-released>

<ftp://ftp.ebi.ac.uk/pub/databases/Pfam/Tools/PfamScan.tar.gz>

LOG
---

Check `ChangeLog` for the version of the script.

    cd /sw/apps/bioinfo/pfam_scan/
    mkdir tmpver
    cd tmpver
    mkdir src
    cd src
    wget ftp://ftp.ebi.ac.uk/pub/databases/Pfam/Tools/PfamScan.tar.gz
    tar xvzf PfamScan.tar.gz 
    cat PfamScan/ChangeLog

We learn that the script version is 1.6

    mv PfamScan ../milou
    cd ..
    ln -s ./milou rackham
    ln -s ./milou irma
    ln -s ./milou bianca
    cd ../..
    mv tmpver 1.6

In the mf file, load hmmer-3.1b2.

