# MEMEsuite-4.11.1-install-README.md

MEMEsuite/4.11.1
==================

The MEME Suite: Motif-based sequence analysis tools


<http://meme-suite.org/tools/meme>


LOG
---

I simply rebuilt Wes's installation of MEMEsuite/4.11.1, following the script
for 4.11.2_1 except for loading gcc/4.9.2 beforehand since that seems to have
been used according to its config.log.  That also showed that python/2.7.6 was
used though that wasn't loaded by the mf file.

    mv meme_4.11.1 meme_4.11.1_prev
    tar xzf meme_4.11.1.tar.gz 
    cd meme_4.11.1
    ./configure --prefix=/sw/apps/bioinfo/MEMEsuite/4.11.1/milou --with-url=http://meme-suite.org
    make && make test && make install
