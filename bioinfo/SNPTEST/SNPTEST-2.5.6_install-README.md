SNPTEST/2.5.6
========================

<https://bioinformaticshome.com/tools/gwas/descriptions/SNPTEST.html>

Used under license:



Structure creating script (makeroom_SNPTEST_2.5.6.sh) moved to /sw/bioinfo/SNPTEST/makeroom_2.5.6.sh

LOG
---
    VERSION=2.5.6
    makeroom.sh -t "SNPTEST" -v "2.5.6" -c "bioinfo" -w "https://bioinformaticshome.com/tools/gwas/descriptions/SNPTEST.html" -d "SNPTEST is a tool to analyze a single SNP association in genome-wide association studies (GWAS)" -f
    ./makeroom_SNPTEST_2.5.6.sh
    source /sw/bioinfo/SNPTEST/SOURCEME_SNPTEST_2.5.6 && cd $SRCDIR
    wget https://www.chg.ox.ac.uk/~gav/resources/snptest_v${VERSION}_CentOS_Linux7.8-x86_64_dynamic.tgz
    tar xvf snptest_v${VERSION}_CentOS_Linux7.8-x86_64_dynamic.tgz
    snptest_v2.5.6_CentOS_Linux7.8.2003-x86_64_dynamic
    ln -s ./snptest_v${VERSION} snptest
    cd ..
    mv snptest_v2.5.6_CentOS_Linux7.8.2003-x86_64_dynamic ../$CLUSTER
    
    cd ../$CLUSTER
    ml gcc/14.2.0 patchelf
    ldd snptest           
    echo $LD_LIBRARY_PATH 
    patchelf --set-rpath $LD_LIBRARY_PATH snptest_v2.5.6
    ml -gcc
    ldd snptest

