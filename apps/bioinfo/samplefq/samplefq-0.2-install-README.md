    cd /sw/apps/bioinfo/samplefq/0.2
    mkdir milou tintin src
    ln -s ./milou halvan
    ln -s ./milou nestor
    cd src
    wget https://github.com/maaskola/samplefq/archive/0.2.tar.gz
    tar xzf 0.2.tar.gz
    cd samplefq-0.2/
    mkdir build
    cd build

On tintin, you must load build-tools first:

    module load build-tools

Set up build environment.

    module load gcc/4.9.2
    module load cmake
    module load boost/1.59.0_gcc4.9.2

Make note of boost message.

    cmake .. -DCMAKE_INSTALL_PREFIX=/sw/apps/bioinfo/samplefq/0.2/milou -DBoost_NO_BOOST_CMAKE=ON
    make
    make install

