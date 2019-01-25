mip/6.0.0
========================

<https://github.com/Clinical-Genomics/MIP>

LOG
---

I did this by installing conda locally in the MIP dir, creating a local dir for perl modules and then running the installation steps.

    TOOL=mip
    VERSION=6.0.0
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    /home/jonass/uppmax/bin/makeroom.sh
    ./makeroom_mip_6.0.0.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src
    git clone https://github.com/Clinical-Genomics/MIP.git
    mkdir MIP-6.0.0.conda_version
    cd MIP-6.0.0.conda_version/
    ml python/3.6.0
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
    export MIP_DEPS=/sw/apps/bioinfo/${TOOL}/${VERSION}/${CLUSTER}
    bash Miniconda3-latest-Linux-x86_64.sh
yes
$MIP_DEPS
    unset PERL5LIB
    module load perl/5.26.2
    module load perl_modules/5.26.2
    wget -O- http://cpanmin.us | perl - -l $MIP_DEPS --force App::cpanminus local::lib
    echo "export MIP_DEPS=$MIP_DEPS" > ${CLUSTER}-mip-deps-setup
    echo 'eval `perl -I $MIP_DEPS/lib/perl5 -Mlocal::lib=$MIP_DEPS`' >> ${CLUSTER}-mip-deps-setup
    echo "export PATH=$MIP_DEPS/bin:\$PATH" >> ${CLUSTER}-mip-deps-setup
    echo "# now to find cpanm" >> ${CLUSTER}-mip-deps-setup
    echo "export PATH=$MIP_DEPS:\$PATH" >> ${CLUSTER}-mip-deps-setup
    source ${CLUSTER}-mip-deps-setup
    cd $MIP_DEPS
    mv bin/cpanm .
    export PERL5LIB=/sw/apps/bioinfo/mip/6.0.0/rackham/lib/perl5:$PERL5LIB

echo $PERL5LIB
/sw/apps/bioinfo/mip/6.0.0/rackham/lib/perl5:/sw/comp/perl_modules/5.26.2/rackham/lib/perl5:/sw/comp/perl_modules/5.26.2/rackham/lib/perl5/x86_64-linux-thread-multi:/sw/comp/perl/5.26.2/rackham/lib

    cd ../src/MIP-6.0.0.conda_version
    export PATH=/sw/apps/bioinfo/mip/6.0.0/src/MIP-6.0.0.conda_version/miniconda3/bin:$PATH
    cd definitions/
    ml gcc/4.9.4
# I changed the module to include 'cc'
    cpanm -l $MIP_DEPS --installdeps .
    cd ../t; prove mip_install.t
    cd ..
#    This should have worked, but VEP was installed with a different perl version #perl mip_install.pl --skip_program VEP; #ml VEP/92
    perl mip_install.pl
    bash mip.sh
    cd t; prove -r
## Python 3 tools
    perl mip_install.pl -env mip_pyv3.6 --python_version 3.6 --select_program genmod --select_program chanjo --select_program variant_integrity --select_program multiqc
    bash mip.sh

## Freebayes
    perl mip_install.pl -env mip_freebayes --select_program freebayes
    bash mip.sh

## Peddy
    perl mip_install.pl -env mip_peddy --select_program peddy
    bash mip.sh

## SVDB
    perl mip_install.pl -env mip_svdb --select_program svdb
    bash mip.sh

## VEP added cc to the module gcc/4.9.4
    perl mip_install.pl -env mip_vep --select_program vep
    bash mip.sh

## TIDDIT
    perl mip_install.pl -env mip_tiddit --select_program tiddit
    bash mip.sh

## CNVnator
    perl mip_install.pl -env mip_cnvnator --select_program cnvnator
    bash mip.sh

#Made an example file for the config
    vim ../6.0.0/rackham/config.yaml
