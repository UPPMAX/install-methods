GATE/0.45
========================

<http://>

Used under license:
LGPL


Structure creating script (makeroom_GATE_0.45.sh) moved to /sw/bioinfo/GATE/makeroom_0.45.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "GATE" "-v" "0.45" "-l" "LGPL" "-d" "GATE (Genetic Analysis of Time-to-Event phenotypes) is an R package with Scalable and accurate genome-wide association analysis of censored survival data in large scale biobanks using frailty models." "-s" "annotation"
    ./makeroom_GATE_0.45.sh

    # Load modules
    module load conda/latest
    module load R_packages/4.3.1
    module load cmake/3.26.3


    cd $PREFIX

    git clone https://github.com/weizhou0/GATE.git

    # Create the conda with rackham1-3.
    conda env create -p RSAIGE_v0 -f GATE/conda_env/environment-RSAIGE_v0.yml
    conda activate $PREFIX/RSAIGE_v0
    #rm -rf $PREFIX/GATE
    mv GATE GATE_old

    export FLAGPATH=`which python | sed 's|/bin/python$||'`
    export LDFLAGS="-L${FLAGPATH}/lib"
    export CPPFLAGS="-I${FLAGPATH}/include"

    # Install GATE from the source code
    mkdir R_libs
    export R_LIBS_USER=$PREFIX/R_libs
    export src_branch=main
    export repo_src_url=https://github.com/weizhou0/GATE

    git clone --depth 1 -b $src_branch $repo_src_url
    #cd GATE
    #git reset --hard 962f102
    #cd $PREFIX

    module load gcc/12.3.0
    # Replace one line in GATE/configure
    sed -i.bak '/cget ignore xz/c\cget ignore --prefix thirdParty/cget xz' $PREFIX/GATE/configure
    Rscript ./GATE/extdata/install_packages_v0.R
    mkdir GATE_lib
    R CMD INSTALL --library=$PREFIX/GATE_LIB GATE

  library(GATE, lib.loc="$PREFIX/GATE_LIB")


When call GATE in R, set lib.loc=path_to_final_GATE_library.

  library(GATE, lib.loc=path_to_final_GATE_library)

In ./configure, cget ignore xz should be cget ignore --prefix thirdParty/cget xz. Otherwise you get the error:


    cd GATE


GATE/0.42
========================

<http://>

Used under license:
LGPL


Structure creating script (makeroom_GATE_0.42.sh) moved to /sw/bioinfo/GATE/makeroom_0.42.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "GATE" "-v" "0.42" "-l" "LGPL" "-d" "GATE (Genetic Analysis of Time-to-Event phenotypes) is an R package with Scalable and accurate genome-wide association analysis of censored survival data in large scale biobanks using frailty models." "-s" "annotation"

    # Load modules
    module load conda/latest
    module load zlib/1.3.1
    module load R_packages/4.3.1


    cd $PREFIX

    git clone https://github.com/weizhou0/GATE.git

    # Create the conda with rackham1-3.
    conda env create -p RSAIGE_v0 -f GATE/conda_env/environment-RSAIGE_v0.yml
    conda activate $PREFIX/RSAIGE_v0

    FLAGPATH=`which python | sed 's|/bin/python$||'`
    export LDFLAGS="-L${FLAGPATH}/lib"
    export CPPFLAGS="-I${FLAGPATH}/include"

    # Install GATE from the source code
    export R_LIBS_USER=$PREFIX
    export src_branch=main
    export repo_src_url=https://github.com/weizhou0/GATE

    git clone --depth 1 -b $src_branch $repo_src_url
    Rscript ./GATE/extdata/install_packages_v0.R
    R CMD INSTALL --library=$PREFIX/GATE_LIB GATE

  library(GATE, lib.loc=$PREFIX/GATE_LIB)


When call GATE in R, set lib.loc=path_to_final_GATE_library.

  library(GATE, lib.loc=path_to_final_GATE_library)

In ./configure, cget ignore xz should be cget ignore --prefix thirdParty/cget xz. Otherwise you get the error:


    cd GATE
