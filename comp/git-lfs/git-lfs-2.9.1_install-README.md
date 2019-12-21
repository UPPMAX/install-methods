git-lfs/2.9.1
=============

<https://git-lfs.github.com/>

Used under license:
MIT

Structure creating script (makeroom_git-lfs_2.9.1.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/comp/git-lfs/makeroom_2.9.1.sh

LOG
---

    TOOL=git-lfs
    VERSION=2.9.1
    cd /sw/comp
    makeroom.sh  -t ${TOOL} -v ${VERSION} -c comp -w https://git-lfs.github.com/ -d "Git Large File Storage (LFS) replaces large files such as audio samples, videos, datasets, and graphics with text pointers inside Git, while storing the file contents on a remote server like GitHub.com or GitHub Enterprise." -l "MIT"
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION} 
    cd ${VERSION}/
    cd src/
    wget https://github.com/git-lfs/git-lfs/releases/download/v${VERSION}/${TOOL}-v${VERSION}.tar.gz

Verify the checksums against the download site.

    sha256sum ${TOOL}-v${VERSION}.tar.gz

All good.  Build it with Go.

    tar xzf ${TOOL}-v${VERSION}.tar.gz 
    cd ${TOOL}-${VERSION}/
    module load go/1.11.5
    make
    mv bin $PREFIX
    cd $PREFIX/bin
    module unload go
    ldd git-lfs 


