panther/14.1
============

<http://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/data/>

Used under license:



Structure creating script (makeroom_panther_14.1.sh) moved to /sw/data/panther/makeroom_14.1.sh

LOG
---

    makeroom.sh "-f" "-t" "panther" "-v" "14.1" "-c" "data" "-w" "http://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/data/"
    ./makeroom_panther_14.1.sh

    source /sw/data/panther/SOURCEME_panther_14.1 && cd $SRCDIR
    wget http://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/data/panther-data-14.1.tar.gz
    wget http://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/data/panther-data-14.1.tar.gz.md5
    md5sum -c *md5

The MD5 sum is OK.

Now unpack the database directly into `PREFIX`, removing the `panther/14.1/` subdirectories.

    tar xf panther-data-14.1.tar.gz -C $PREFIX --strip-components=2

Make sure `PANTHER_ROOT` is correctly set in the mf.
