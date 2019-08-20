Installed manually, rather than PerlBrew, etc
=============================================

    wget http://www.cpan.org/src/5.0/perl-5.18.2.tar.gz
    tar -xzf perl-5.18.2.tar.gz
    cd perl-5.18.2
    ./Configure -des -Dprefix=/sw/comp/perl/5.18.2/milou
    make
    make test
    make install
