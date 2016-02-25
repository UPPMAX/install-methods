# guile-1.8.8-install-README.md

guile/1.8.8
===========

<http://www.gnu.org/software/guile/>

Log
---

    cd /sw/comp
    mkdir guile
    cd guile/
    mkdir 1.8.8
    cd 1.8.8/
    mkdir milou src
    cd milou
    P=$PWD
    cd ../src
    wget ftp://ftp.gnu.org/gnu/guile/guile-1.8.8.tar.gz
    tar xzf guile-1.8.8.tar.gz 
    cd guile-1.8.8/
    module load gcc/5.3.0

Now, disable -Werror inclusion by setting, within `configure`,

    GUILE_ERROR_ON_WARNING="no"

If you fail to do this, it will fail with something like:

    async.c:243:14: error: variable ‘count’ set but not used [-Werror=unused-but-set-variable]

Continue with configure, and build/install.

    ./configure --prefix=$P
    make
    make install

Now use mf template from zlib, but add info and aclocal directories.

Repeat for tintin.
