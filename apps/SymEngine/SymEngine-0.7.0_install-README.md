SymEngine/0.7.0
========================

<https://github.com/symengine/symengine/releases/download/v0.7.0/symengine-0.7.0.tar.gz>

Used under license:
MIT


Structure creating script (makeroom_SymEngine_0.7.0.sh) moved to /sw/apps/SymEngine/makeroom_0.7.0.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh -f" -c "apps" -t "SymEngine" -v "0.7.0" -l "MIT" -w "https://github.com/symengine/symengine/releases/download/v0.7.0/symengine-0.7.0.tar.gz" -d "SymEngine is a standalone fast C++ symbolic manipulation library"
    ./makeroom_SymEngine_0.7.0.sh
    cd $SRCDIR

    #wget https://github.com/symengine/symengine/releases/download/v0.7.0/symengine-0.7.0.tar.gz

    #tar xvf symengine-0.7.0.tar.gz
    git clone https://github.com/symengine/symengine.git
    git checkout bb386f47369500d76cda07e6e9f014bfe6339f64
    cd symengine

    cmake -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX
    make
    make install

    ctest
    
All tests should pass, then finally run 
    ./SymEngine-0.7.0_post-install.sh
