GeneMark/4.72-es
================

<http://exon.gatech.edu/GeneMark>

Used under license:
Custom
<http://exon.gatech.edu/GeneMark/license_download.cgi>

Structure creating script (makeroom_GeneMark_4.72-es.sh) moved to /sw/bioinfo/GeneMark/makeroom_4.72-es.sh

LOG
---

    makeroom.sh "-f" "-t" "GeneMark" "-v" "4.72-es" "-w" "http://exon.gatech.edu/GeneMark" "-d" "Gene prediction in eurkaryotes" "-l" "Custom" "-L" "http://exon.gatech.edu/GeneMark/license_download.cgi"
    ./makeroom_GeneMark_4.72-es.sh
    source /sw/bioinfo/GeneMark/SOURCEME_GeneMark_4.72-es

    PERLVERSION=5.26.2

    cd $SRCDIR

Actual addresses obtained after agreeing to licence.

    wget http://topaz.gatech.edu/GeneMark/tmp/XXXX/gmes_linux_64.tar.gz
    wget http://topaz.gatech.edu/GeneMark/tmp/XXXX/gm_key_64.gz

Place the key file in a common location.

    mkdir -p /sw/bioinfo/GeneMark/keyfile
    cp -av gm_key_64.gz gm_key_64.gz.20231108
    gunzip gm_key_64.gz 
    mv gm_key_64 /sw/bioinfo/GeneMark/keyfile/gm_key

Unpack the downloaded tarball and install.

    rmdir $PREFIX
    tar xf gmes_linux_64.tar.gz 
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

followed by what it says in the `README.md` there.  The CDSs all match:

    rackham5: /sw/bioinfo/GeneMark/4.72-es/rackham/GeneMark-E-tests/EP/test $  ../../../compare_intervals_exact.pl  --f1 genemark.gtf  --f2 ../output/genemark.gtf  --v
    # CDS in file genemark.gtf: 1461
    # CDS in file ../output/genemark.gtf: 1461

    #in match   unique  %match  CDS

    1461    1461    0   100.00  genemark.gtf
    1461    1461    0   100.00  ../output/genemark.gtf


Use the existing latest mf.

