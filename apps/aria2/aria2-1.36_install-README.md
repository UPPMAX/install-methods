aria2/1.36
========================

<https://github.com/aria2/aria2>

Used under license:
OpenSSL


Structure creating script (makeroom_aria2_1.36.sh) moved to /sw/apps/aria2/makeroom_1.36.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "aria2" "-v" "1.36" "-d" "aria2 is a utility for downloading files. The supported protocols are HTTP(S), FTP, SFTP, BitTorrent, and Metalink. aria2 can download a file from multiple sources/protocols and tries to utilize your maximum download bandwidth." "-l" "OpenSSL" "-w" "https://github.com/aria2/aria2" "-c" "apps"
    ./makeroom_aria2_1.36.sh

    TOOL=aria2
    VERSION=1.36

#Download
    cd $SRCDIR
    wget https://github.com/aria2/aria2/releases/download/release-1.36.0/aria2-1.36.0.tar.gz
    tar xfvz aria2-1.36.0.tar.gz --strip-components 1

# Install
    ml gcc/9.3.0
    autoreconf -i
    ./configure --prefix=$PREFIX
    make -j 20
    make install


