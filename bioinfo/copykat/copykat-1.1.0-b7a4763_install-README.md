copykat/1.1.0-b7a4763
========================

<http://>

Used under license:
Copyright


Structure creating script (makeroom_copykat_1.1.0-b7a4763.sh) moved to /sw/bioinfo/copykat/makeroom_1.1.0-b7a4763.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "copykat" "-d" "Inference of genomic copy number and subclonal structure of human tumors from high-throughput single cell RNAseq data" "-v" "1.1.0-b7a4763" "-l" "Copyright" "-s" "annotation"
    ./makeroom_copykat_1.1.0-b7a4763.sh

    # Load modules
    module load R_packages/4.3.1

    export R_LIBS_USER=$PREFIX/R_lib
    Rscript -e "library(devtools); install_github('navinlabcode/copykat',upgrade = 'never')"

    # Test so that you can load the package
    Rscript -e "library(copykat)"
