git/2.28.0
==========

<https://git-scm.com/>

Used under license:
LGPL 2.1

Structure creating script (makeroom_git_2.28.0.sh) moved to /sw/comp/git/makeroom_2.28.0.sh

LOG
---

    TOOL=git
    VERSION=2.28.0
    cd /sw/comp/git
    makeroom.sh -t $TOOL -v $VERSION -w https://git-scm.com/ -c comp -l "LGPL 2.1" -d "Source control management" -f
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION}
    cd ${VERSION}/
    cd src
    [[ -d git-${VERSION} ]] && rm -rf git-${VERSION}
    [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/git/git/archive/v${VERSION}.tar.gz
    tar xzf v${VERSION}.tar.gz 
    cd git-${VERSION}/
    make configure
    ./configure --with-pcre --prefix=$PREFIX
    make -j 4 all
    make install
    cd ..
    rm -rf git-${VERSION}

