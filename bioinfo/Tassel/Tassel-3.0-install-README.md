Tassel 3.0
==========

    cd /sw/apps/bioinfo
    mkdir Tassel
    cd Tassel
    mkdir 3.0
    cd 3.0/
    mkdir milou src

Java program, so we can link tintin here as well.

    ln -s ./milou tintin
    ln -s ./milou halvan
    ln -s ./milou nestor

    cd src/

Go here to generate a tarball to your local computer, then transfer that to milou.

    http://sourceforge.net/p/tassel/tassel3-standalone/ci/master/tarball

Transfer...

    scp tassel-tassel3-standalone-ac05ba464cf8a865d683ec0fb52d4bc1795ab12a.zip douglas@milou-b.uppmax.uu.se:/sw/apps/bioinfo/Tassel/3.0/src/

Back on milou, unpack and straighten the name up.

    unzip tassel-tassel3-standalone-ac05ba464cf8a865d683ec0fb52d4bc1795ab12a.zip
    mv tassel-tassel3-standalone-ac05ba464cf8a865d683ec0fb52d4bc1795ab12a tassel-tassel3-standalone

Change the format of the perl scripts, update the perl #! lines, set -Xmx3500m
by default, and deactivate the bat files.

    dos2unix *.pl
    vi *.pl
    chmod -x *.bat

Copy to install directory

    cp -a * ../../milou

Make sure it works, this one needs java 6.

    module load java/sun_jdk1.6.0_18
    ./start_tassel.pl 

For the mf file, must load java 6, see above.
