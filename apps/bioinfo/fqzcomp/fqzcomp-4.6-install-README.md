# fqzcomp-4.6-install-README.md

fqzcomp/4.6
==========

Specialised FastQ compression/decompression utility.

    <https://sourceforge.net/projects/fqzcomp/>

    <http://www.ncbi.nlm.nih.gov/pubmed/23533605>

Log
---

    cd /sw/apps/bioinfo/
    mkdir fqzcomp
    cd fqzcomp/
    mkdir mf 4.6
    cd 4.6/
    mkdir milou src
    cd src
    wget http://downloads.sourceforge.net/project/fqzcomp/fqzcomp-4.6.tar.gz
    tar xzf fqzcomp-4.6.tar.gz 
    cd fqzcomp-4.6/
    module load gcc/5.2.0
    make
    cp fqz_comp /sw/apps/bioinfo/fqzcomp/4.6/milou/

Make sure the 5.2.0 libraries can be found.

    module unload gcc
    ldd fqz_comp

Use a basic mf file from ADMIXTURE, and redo compilation for tintin.
