cdd 3.16
========

<ftp://ftp.ncbi.nih.gov/pub/mmdb/cdd/>

LOG
---

    VERSION=3.16
    mkdir -p /sw/data/uppnex/cdd
    cd /sw/data/uppnex/cdd
    mkdir $VERSION
    chgrp sw $VERSION
    chmod g+s $VERSION
    cd $VERSION
    echo "mget -d *" | lftp ftp://ftp.ncbi.nih.gov/pub/mmdb/cdd/

Update groups and permissions.

    cd ..
    chgrp -hR sw $VERSION
    chmod -R g+rwX,o+rX $VERSION

