SMRT/13.0.0.207600
==================

<https://www.pacb.com/support/software-downloads>

Used under license:



Structure creating script (makeroom_SMRT_13.0.0.207600.sh) moved to /sw/bioinfo/SMRT/makeroom_13.0.0.207600.sh

LOG
---

    makeroom.sh -t "SMRT" -v "13.0.0.207600" -w "https://www.pacb.com/support/software-downloads" -d "PacBio's open-source SMRT Analysis software suite is designed for use Revio, Sequel II/IIE, command-line tools and chemistry bundle" -f
    ./makeroom_SMRT_13.0.0.207600.sh 
    source /sw/bioinfo/SMRT/SOURCEME_SMRT_13.0.0.207600

    cd $SRCDIR
    echo $PREFIX

    wget https://www.pacb.com/wp-content/uploads/SMRT-Link-Installation-v13.0.pdf
    wget https://downloads.pacbcloud.com/public/software/installers/smrtlink-release_13.0.0.207600.zip
    unzip smrtlink-release_13.0.0.207600.zip 
    md5sum -c *.md5
    export SMRT_ROOT=$PREFIX
    ./smrtlink-release_13.0.0.207600_linux_x86-64_libc-2.17_anydistro.run --rootdir $SMRT_ROOT

We should install the command-line tools only, but we need to get the chemistry bundle and install that separately.

Find the Chemistry bundle.

    cd $SMRT_ROOT
    find . -name "chemistry-pb*tar.gz"
    cp -av ./install/smrtlink-release_13.0.0.207600/bundles/smrtlink-analysisservices-gui/install/smrtlink-analysisservices-gui-release_13.0.0.207600/private/pacbio/smrtlink-analysisservices-gui/resources/pacbio-bundles/chemistry-pb-13.0.0.205983.tar.gz $SRCDIR/

It is version chemistry-pb-13.0.0.205983. Install it.

    cd $SRCDIR
    mkdir -p $SMRT_ROOT/userdata/chemistry/chemistry-pb-13.0.0.205983
    tar -C $SMRT_ROOT/userdata/chemistry/chemistry-pb-13.0.0.205983 -xf chemistry-pb-13.0.0.205983.tar.gz
    ln -s $SMRT_ROOT/userdata/chemistry/chemistry-pb-13.0.0.205983  $SMRT_ROOT/userdata/chemistry/chemistry-pb-active

    export SMRT_CHEMISTRY_BUNDLE_DIR=$SMRT_ROOT/userdata/chemistry/chemistry-pb-active
    ll $SMRT_CHEMISTRY_BUNDLE_DIR/

Place the definition of SMRT_CHEMISTRY_BUNDLE_DIR in the mf file using the line

    setenv SMRT_CHEMISTRY_BUNDLE_DIR $modroot/userdata/chemistry/chemistry-pb-active

Add $modroot/smrtcmds/bin to PATH in the mf file.

