bgen/1.1.6
========================

<https://enkre.net/cgi-bin/code/bgen/dir?ci=trunk>

Used under license:
Boost Software License v1.0


Structure creating script (makeroom_bgen_1.1.6.sh) moved to /sw/bioinfo/bgen/makeroom_1.1.6.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "bgen" "-v" "1.1.6" "-s" "misc" "-w" "https://enkre.net/cgi-bin/code/bgen/dir?ci=trunk" "-l" "Boost Software License v1.0" "-d" "Reference implementation of the BGEN format" "-f"
    ./makeroom_bgen_1.1.6.sh
    source /sw/bioinfo/bgen/SOURCEME_bgen_1.1.6 && cd $SRCDIR
    wget http://code.enkre.net/bgen/tarball/release/bgen.tgz
    tar xzvf bgen.tgz
    mv bgen.tgz bgen
    cd bgen
   # which gcc? system or 9.3.0
    ./waf configure
    ./waf
    ./build/test/unit/test_bgen    
    ./build/apps/bgenix -g example/example.16bits.bgen -list

    ./waf install --prefix=$PREFIX

In the mf file, add `$modroot/bin` to `PATH`.
