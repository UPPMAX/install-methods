GeneMark/4.57-es
================

<http://exon.biology.gatech.edu/GeneMark/gmes_instructions.html>

LOG
---

    cd /sw/bioinfo/GeneMark/
    VERSION=4.57-es
    PERLVERSION=5.26.2
    mkdir $VERSION
    cd $VERSION
    PREFIX=$PWD/rackham
    mkdir src 
    for CL in irma bianca snowy ; do test -L $CL || ln -sf rackham $CL ; done
    cd src

Actual addresses obtained after agreeing to licence.

    wget http://topaz.gatech.edu/GeneMark/tmp/xxxx/gm_et_linux_64.tar.gz
    wget http://topaz.gatech.edu/GeneMark/tmp/xxxx/gm_key_64.gz

Place the key file in a common location.

    cd /sw/bioinfo/GeneMark
    mkdir -p /sw/bioinfo/GeneMark/keyfile
    gunzip gm_key_64.gz 
    mv gm_key_64 /sw/bioinfo/GeneMark/keyfile/gm_key

Unpack the downloaded tarball and install.

    tar xzf gmes_linux_64.tar.gz 
    mv gmes_linux_64 $PREFIX
    cd $PREFIX

Point to the just-downloaded key.

    rm -f gm_key
    ln -s /sw/bioinfo/GeneMark/keyfile/gm_key .

Get actual version of this download from `gmes.cfg`, and make sure it matches what we think it is.

    grep 'version:' gmes.cfg

Now make sure we have the perl prerequisites, and change the perl path using the included script.

    module load perl_modules/$PERLVERSION

    ./check_install.bash 
    ./change_path_in_perl_scripts.pl "/usr/bin/env perl"

Run some tests, make sure the `perl_modules/$PERLVERSION` and associated `perl/$PERLVERSION` modules are loaded and do

    cd GeneMark-E-tests/EP

followed by what it says in the `README.md` there.  The CDSs all match.

Use the mf file from 4.38-es but update the perl version.
