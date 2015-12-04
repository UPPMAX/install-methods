Install eXpress.

    cd /sw/apps/bioinfo
    mkdir eXpress
    cd eXpress/
    mkdir 1.5.1 mf
    cd 1.5.1
    wget http://bio.math.berkeley.edu/eXpress/downloads/express-1.5.1/express-1.5.1-linux_x86_64.tgz
    tar xzf express-1.5.1-linux_x86_64.tgz 
    mv express-1.5.1-linux_x86_64 milou
    chmod -R g+rwX,o+rX milou/
    ln -s ./milou tintin
    ln -s ./milou halvan
    ln -s ./milou nestor

Create mf.  We only need to add /sw/apps/bioinfo/eXpress/1.5.1/$CLUSTER to the PATH.

    cd ../mf/
    cp ../../deepTools/mf/1.5.11 1.5.1
    vi 1.5.1 

Install mf.

    cd /sw/mf/common/bioinfo-tools/misc
    mkdir eXpress
    cd eXpress/
    cp /sw/apps/bioinfo/eXpress/mf/1.5.1 .
    cd ..
    chgrp -hR sw eXpress/
    cd /sw/mf/milou/bioinfo-tools/misc/
    mkdir eXpress && cd eXpress && ln -s ../../../../common/bioinfo-tools/misc/eXpress/1.5.1 . && cd .. && chgrp -hR sw eXpress
    cd /sw/mf/tintin/bioinfo-tools/misc/
    mkdir eXpress && cd eXpress && ln -s ../../../../common/bioinfo-tools/misc/eXpress/1.5.1 . && cd .. && chgrp -hR sw eXpress

