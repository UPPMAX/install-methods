#zsh 5.7.1
#==========

#<https://www.zsh.org>

#LOG
#---

    VERSION=5.7.1
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/
    mkdir zsh
    cd zsh
    mkdir $VERSION
    cd $VERSION
    mkdir src_$CLUSTER $CLUSTER
    cd $CLUSTER
    P=$PWD
    cd ../src_$CLUSTER/
		wget https://downloads.sourceforge.net/project/zsh/zsh/${VERSION}/zsh-${VERSION}.tar.xz
    tar xJvf zsh-${VERSION}.tar.xz 
    cd zsh-${VERSION}/
    ./configure --prefix=$P
    make 
		make check
    make install
		cd ..
		rm -rf zsh-${VERSION}
    cd $P
