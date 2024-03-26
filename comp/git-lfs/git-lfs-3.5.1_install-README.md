git-lfs/3.5.1
=============

<https://git-lfs.github.com/>

Used under license:
MIT

Structure creating script (makeroom_git-lfs_3.5.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/comp/git-lfs/makeroom_3.5.1.sh

LOG
---

    TOOL=git-lfs
    VERSION=3.5.1
    makeroom.sh -f -t ${TOOL} -v ${VERSION} -c comp -w https://git-lfs.github.com/ -d "Git Large File Storage (LFS) replaces large files such as audio samples, videos, datasets, and graphics with text pointers inside Git, while storing the file contents on a remote server like GitHub.com or GitHub Enterprise." -l "MIT"
    ./makeroom_${TOOL}_${VERSION}.sh 
    source /sw/comp/$TOOL/SOURCEME_${TOOL}_${VERSION} 
    cd $SRCDIR

Get Linux AMD64 tarball.

    wget https://github.com/git-lfs/git-lfs/releases/download/v${VERSION}/${TOOL}-linux-amd64-v${VERSION}.tar.gz

Verify the checksums against the download site, https://github.com/git-lfs/git-lfs/releases?utm_source=gitlfs_site&utm_medium=releases_link&utm_campaign=gitlfs

    sha256sum ${TOOL}-linux-amd64-v${VERSION}.tar.gz

That's a match.  Install into PREFIX.

    tar xf ${TOOL}-linux-amd64-v${VERSION}.tar.gz 
    cd ${TOOL}-${VERSION}/
    ldd git-lfs 
    mkdir -p $PREFIX/{bin,share}
    cp -av git-lfs $PREFIX/bin/
    cp -av man $PREFIX/share/
    cd ..
    rm -rf ${TOOL}-${VERSION}/

Make sure to add $modroot/share/man to MANPATH and $modroot/bin to PATH

    cd $TOOLDIR/mv
    vi ${VERSION}

Wrap up.

    cd $TOOLDIR
    ./${TOOL}-${VERSION}_post-install.sh
