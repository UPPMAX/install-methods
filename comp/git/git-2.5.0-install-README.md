    TOOL=/sw/comp/git
    VERSION=2.5.0
    VERSIONDIR=$TOOL/$VERSION
    mkdir -p $VERSIONDIR
    cd $VERSIONDIR
    mkdir -p src
    CLUSTER=milou
    mkdir -p $CLUSTER
    CLUSTERDIR=$VERSIONDIR/$CLUSTER
    cd src
    wget https://github.com/git/git/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz 
    cd git-${VERSION}/
    make configure
    ./configure --prefix=/sw/comp/git/$VERSION/$CLUSTER
    make all

'make doc' will not work, we are missing asciidoc and perhaps other tools.  It
does not matter, there are lots and lots of git resources available online, and
there is very good in-tool help as well.

    make install

Set up mf file.

    cd /sw/mf/common/
    cd compilers/
    mkdir -p git
    chgrp sw git
    cd git
    cp /sw/comp/git/mf/$VERSION .
    chgrp sw $VERSION 
    cd /sw/mf/milou/compilers/
    mkdir git
    cd git
    ln -s ../../../common/compilers/git/$VERSION .
    cd ..
    chgrp -hR sw git

Be a good citizen.

    cd /sw/comp
    chmod -R g+rwX,o+rX git
    chgrp -hR sw git
    find git -type d -exec chmod g+s {} \;

