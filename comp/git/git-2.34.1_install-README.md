git/2.34.1
==========

<https://git-scm.com/>

Used under license:
LGPL 2.1


Structure creating script (makeroom_git_2.34.1.sh) moved to /sw/comp/git/makeroom_2.34.1.sh

LOG
---

    makeroom.sh -t git -v 2.34.1 -w https://git-scm.com/ -c comp -l "LGPL 2.1" -d "Source control management" -f
    ./makeroom_git_2.34.1.sh 
    source /sw/comp/git/SOURCEME_git_2.34.1 && cd $SRCDIR
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
    cd $TOOLDIR
    ./git-${VERSION}_post-install.sh 
