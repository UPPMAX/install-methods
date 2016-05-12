# FastQC-0.11.5-install-README.md

<http://www.bioinformatics.babraham.ac.uk/projects/download.html#fastqc>

Log
---

    cd /sw/apps/bioinfo/fastqc
    mkdir 0.11.5
    cd 0.11.5/
    mkdir milou src
    ln -s ./milou irma
    cd src
    wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.5.zip
    unzip fastqc_v0.11.5.zip 
    cd FastQC/
    mv * ../../milou/
    cd ..
    rmdir FastQC/
    cd ../milou/
    chmod +x fastqc
    ./fastqc --version
