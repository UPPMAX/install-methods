usearch 9.2.64
==============

<http://drive5.com/uparse/>

Log
---

    VERSION=9.2.64
    cd /sw/apps/bioinfo/usearch
    mkdir $VERSION
    cd $VERSION
    mkdir milou
    ln -s ./milou rackham
    ln -s ./milou irma
    ln -s ./milou bianca
    cd milou/

Get a download link from <http://www.drive5.com/usearch/download.html> emailed to you.
It is a generic Intel Linux executable, good for all clusters here.  Move it to milou/.

    chmod +x usearch${VERSION}_i86linux32
    ln -s usearch${VERSION}_i86linux32 usearch

