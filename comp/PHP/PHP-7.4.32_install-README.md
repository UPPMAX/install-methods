PHP/7.4.32
========================

<https://www.php.net>

Used under license:
PHP License v.3.0.1
<https://www.php.net/license/3_01.txt>

Structure creating script (makeroom_PHP_7.4.32.sh) moved to /sw/comp/PHP/makeroom_7.4.32.sh

LOG
---

    /home/iusan/UPPMAX-tools/install-methods/makeroom.sh "-f" "-t" "PHP" "-v" "7.4.32" "-c" "comp" "-w" "https://www.php.net" "-l" "PHP License v.3.0.1" "-L" "https://www.php.net/license/3_01.txt" "-d" "a popular general-purpose scripting language that is especially suited to web development."
    ./makeroom_PHP_7.4.32.sh
    source SOURCEME_PHP_7.4.32
    cd $SRCDIR
    wget https://www.php.net/distributions/php-7.4.32.tar.gz
    tar xf php-7.4.32.tar.gz
    cd php-7.4.32/
    ./configure --help
    ./configure --prefix=$PREFIX --disable-cgi
    make -j 4
    make -j 4 test
    make install
    vi $TOOLDIR/mf/$VERSION
    cd $TOOLDIR
    ./PHP-7.4.32_post-install.sh
