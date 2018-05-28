haskell-stack/1.7.1
===================

<https://docs.haskellstack.org/en/stable/install_and_upgrade/#linux>

On milou, we need the 'legacy' precompiled version, for rackham and others, the
regular one.


LOG
---

    VERSION=1.7.1
    cd /sw/apps/haskell-stack/
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    [[ -f linux-x86_64-gmp4.tar.gz ]] || wget https://get.haskellstack.org/stable/linux-x86_64-gmp4.tar.gz
    [[ -f linux-x86_64.tar.gz ]] || wget https://get.haskellstack.org/stable/linux-x86_64.tar.gz
    tar xzf linux-x86_64-gmp4.tar.gz 
    mv stack-1.7.1-linux-x86_64-gmp4 ../milou
    tar xzf linux-x86_64.tar.gz 
    mv stack-1.7.1-linux-x86_64 ../rackham
    cd ..
    for CL in bianca irma ; do ln -s rackham $CL; done
