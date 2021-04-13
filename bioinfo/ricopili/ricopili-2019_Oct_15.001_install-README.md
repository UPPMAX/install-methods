ricopili/2019_Oct_15.001
========================

<https://sites.google.com/a/broadinstitute.org/ricopili/home>

Used under license:
CC4.0
<>

Structure creating script (makeroom_ricopili_2019_Oct_15.001.sh) moved to /sw/bioinfo/ricopili/makeroom_2019_Oct_15.001.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "ricopili" -v "2019_Oct_15.001" -s "annotation" -d "Perl-based pipeline was developed to address the challenges of rapidly processing large-scale multi-cohort GWAS studies including quality control QC\, imputation and downstream analyses." -w "https://sites.google.com/a/broadinstitute.org/ricopili/home" -l "CC4.0"
    ./makeroom_ricopili_2019_Oct_15.001.sh

    cd /sw/bioinfo/ricopili
    source SOURCEME_ricopili_2019_Oct_15.001
    cd $PREFIX

#Download Ricopilo
    wget https://sites.google.com/a/broadinstitute.org/ricopili/download//rp_bin.2019_Oct_15.001.tar.gz
    tar xfvz rp_bin.2019_Oct_15.001.tar.gz 

2.1 #Download Ricopilo Dependencies
    wget https://personal.broadinstitute.org/sripke/share_links/JeklRDhPD6FKm8Gnda7JsUOsMan2P2_Ricopili_Dependencies.1118b.tar.gz/Ricopili_Dependencies.1118b.tar.gz
    wget https://personal.broadinstitute.org/sripke/share_links/JeklRDhPD6FKm8Gnda7JsUOsMan2P2_Ricopili_Dependencies.1118b.tar.gz/Ricopili_Dependencies.1118b.tar.gz.cksum.txt
    if [[ $(cat Ricopili_Dependencies.1118b.tar.gz.cksum.txt) == $(cksum Ricopili_Dependencies.1118b.tar.gz) ]] 
    then 
        echo "cksum OK" 
    else 
        echo "cksum not OK!" 
    fi

    mkdir Ricopili_Dependencies.1118b
    tar xfvz Ricopili_Dependencies.1118b.tar.gz -C Ricopili_Dependencies.1118b

#2.2.1
#Check ldd on dynamic binaries.
#Change perl path in  $PREFIX/Ricopili_Dependencies.1118b/eigensoft/EIG-6.1.4/bin/smartpca to "#!/usr/bin/env perl"
    
#2.2.3 bcftools dependencies
    cd $PREFIX/Ricopili_Dependencies.1118b/bcftools/resources
    wget http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/reference/human_g1k_v37.fasta.gz
    gzip -d human_g1k_v37.fasta.gz

#2.2.4 LDscore
    module load bioinfo-tools ldsc/1.0.1

#2.2.5 R
    module load R/3.6.0
    mkdir $PREFIX/Ricopili_Dependencies.1118b/R
    R CMD INSTALL -l $PREFIX/Ricopili_Dependencies.1118b/R $PREFIX/Ricopili_Dependencies.1118b/R_packages/rmeta_3.0.tar.gz

#2.2.9 Python 2.7
    module load python/2.7.15
    mkdir $PREFIX/Ricopili_Dependencies.1118b/python_modules
    pip install --target $PREFIX/Ricopili_Dependencies.1118b/python_modules --no-deps bitarray==0.8 pandas==0.20 pybedtools==0.7 pysam==0.15
    # Did a virtual install as well. Im not using it.
    virtualenv $PREFIX/Ricopili_Dependencies.1118b/python_venv
    $PREFIX/Ricopili_Dependencies.1118b/python_venv/bin/pip install bitarray==0.8 pandas==0.20 pybedtools==0.7 pysam==0.15

