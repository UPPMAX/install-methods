eXpress/1.5.1
=============

Install eXpress.

    cd /sw/apps/bioinfo
    mkdir eXpress
    cd eXpress/
    mkdir 1.5.1 mf
    cd 1.5.1
    wget http://bio.math.berkeley.edu/eXpress/downloads/express-1.5.1/express-1.5.1-linux_x86_64.tgz
    tar xzf express-1.5.1-linux_x86_64.tgz 
    mv express-1.5.1-linux_x86_64 milou
    for C in rackham irma bianca ; do ln -s milou $C; done

Create mf.  We only need to add `/sw/apps/bioinfo/eXpress/1.5.1/$CLUSTER` to the `PATH`.

