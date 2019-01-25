# TrimGalore-0.4.1-install-README.md

<http://www.bioinformatics.babraham.ac.uk/projects/trim_galore/>

Log
---

    cd /sw/apps/bioinfo/TrimGalore/
    mkdir 0.4.1
    cd 0.4.1/
    mkdir milou
    ln -s ./milou irma
    mkdir src
    cd src/
    wget http://www.bioinformatics.babraham.ac.uk/projects/trim_galore/trim_galore_v0.4.1.zip
    unzip trim_galore_v0.4.1.zip 
    cd trim_galore_zip/
    mv * ../../milou/
    cd ..
    rmdir trim_galore_zip/
    cd ..
    cd milou/
    view trim_galore 

