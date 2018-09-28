mip/6.0.0
========================

<http://>

LOG
---

I did this by installing conda locally in the MIP dir, creating a local dir for perl modules and then running the installation steps.

    TOOL=mip
    VERSION=6.0.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    /home/jonass/uppmax/bin/makeroom.sh
    ./makeroom_mip_6.0.0.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src
    mkdir MIP-6.0.0.conda_version
    cd MIP-6.0.0.conda_version/
    ml python/3.6.0
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash Miniconda3-latest-Linux-x86_64.sh
    unset PERL5LIB
    module load perl/5.26.2
    module load perl_modules/5.26.2
    export MIP_DEPS=/sw/apps/bioinfo/${TOOL}/${VERSION}/${CLUSTER}
    wget -O- http://cpanmin.us | perl - -l $MIP_DEPS --force App::cpanminus local::lib
    echo "export MIP_DEPS=$MIP_DEPS" > ${CLUSTER}-mip-deps-setup
    echo 'eval `perl -I $MIP_DEPS/lib/perl5 -Mlocal::lib=$MIP_DEPS`' >> ${CLUSTER}-mip-deps-setup
    echo "export PATH=$MIP_DEPS/bin:\$PATH" >> ${CLUSTER}-mip-deps-setup
    echo "# now to find cpanm" >> ${CLUSTER}-mip-deps-setup
    echo "export PATH=$MIP_DEPS:\$PATH" >> ${CLUSTER}-mip-deps-setup
    source ${CLUSTER}-mip-deps-setup
    cd $MIP_DEPS
    mv bin/cpanm .
echo $PERL5LIB
/sw/apps/bioinfo/mip/6.0.0/rackham/lib/perl5:/sw/comp/perl_modules/5.26.2/rackham/lib/perl5:/sw/comp/perl_modules/5.26.2/rackham/lib/perl5/x86_64-linux-thread-multi:/sw/comp/perl/5.26.2/rackham/lib

    cd ../src/MIP-6.0.0.conda_version
    export PATH=/sw/apps/bioinfo/mip/6.0.0/src/MIP-6.0.0.conda_version/miniconda3/bin:$PATH
    git clone https://github.com/Clinical-Genomics/MIP.git
    cd MIP/definitions/
    ml gcc/4.9.4
    cpanm -l $MIP_DEPS --installdeps .
    cd ../t; prove mip_install.t
    cd ..
    This should have worked, but VEP was installed with a different perl version #perl mip_install.pl --skip_program VEP; #ml VEP/92
    perl mip_install.pl

    bash mip.sh
    cd t; prove -r
