# cmake-3.5.1-install-README.md


<https://cmake.org/>

LOG
---

I haven't installed it before, so learn where is it kept and set things up.

    module spider cmake
    module load cmake/2.8.12.2
    echo $PATH
    module unload cmake
    cd /sw/apps/build/cmake
    mkdir 3.5.1
    mkdir mf
    cd 3.5.1/
    mkdir milou src

Download and build.

    cd src/
    wget https://cmake.org/files/v3.5/cmake-3.5.1.tar.gz
    tar xzf cmake-3.5.1.tar.gz 
    cd cmake-3.5.1/
    view README.rst 

There is a bootstrap process, pretty straightforward.

    module load gcc/4.9.2
    ./bootstrap --prefix=/sw/apps/build/cmake/3.5.1/milou
    make
    make install
    cd ../../milou/bin
    ldd cmake
    module unload gcc/4.9.2
    ldd cmake

Seems the paths have been embedded in the executable, nice, so I don't have to include them in the mf.

After scanning the install directories, there are no standard libraries or man
pages, so the mf is very simple.  I will use an existing one.

    cd ../../mf
    cp /sw/mf/common/build-tools/cmake/2.8.12.2 3.5.1
    vi 3.5.1 

Only change: `${version}_${Cluster}` to `${version}/${Cluster}`.

Be a good citizen, and then repeat on tintin.

    cd ..
    fixup -g mf
    fixup -g 3.5.1
    cd 3.5.1/
    ln -s ./milou nestor
    ln -s ./milou irma
    ln -s ./milou halvan

