perl/5.26.2
===========

<https://www.perl.org/>

Used under license:
GPL v1+ or Artistic License
<https://dev.perl.org/licenses/>

Structure creating script (makeroom_perl_5.32.1.sh) moved to /sw/comp/perl/makeroom_5.32.1.sh

Following Perl's own instructions.  We build all perl modules since 5.24 with
64-bit ints and pointers.


LOG
---

    makeroom.sh -f -c comp -t perl -v 5.32.1 -w https://www.perl.org/ -l "GPL v1+ or Artistic License" -L https://dev.perl.org/licenses/ -d "Perl is a highly capable, feature-rich programming language with over 30 years of development. Perl runs on over 100 platforms from portables to mainframes and is suitable for both rapid prototyping and large scale development projects."
    ./makeroom_perl_5.32.1.sh 
    source /sw/comp/perl/SOURCEME_perl_5.32.1
    cd $SRCDIR
    [[ -f perl-${VERSION}.tar.gz ]] || wget http://www.cpan.org/src/5.0/perl-${VERSION}.tar.gz
    tar xf perl-${VERSION}.tar.gz
    cd perl-${VERSION}

    ml gcc/12.3.0
    ml binutils/2.41
    # don't know how many of these we might need
    ml zlib/1.2.12
    ml bzip2/1.0.8
    ml xz/5.2.6

    ./Configure -des -Dusethreads -Duse64bitall -Dprefix=$PREFIX
    make -j10
    make test
    make install

Wrap up.

    cd $TOOLDIR
    ./perl-5.32.1_post-install.sh
