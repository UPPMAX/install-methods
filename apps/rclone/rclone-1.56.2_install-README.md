rclone/1.56.2
=============

<https://rclone.org>

Used under license:
MIT


    makeroom.sh -t "rclone" -v "1.56.2" -c "apps" -l "MIT" -w https://rclone.org -d "a command line program to manage files on cloud storage\, supporting over 40 cloud storage products"

    ./makeroom_rclone_1.56.2.sh 
    source /sw/apps/rclone/SOURCEME_rclone_1.56.2
    cd $SRCDIR
    wget https://rclone.org/install.sh
    cp -av install.sh install.sh.orig

Hack together a local install. The result of

    diff install.sh.orig install.sh

is

    149,152c149,152
    <     cp rclone /usr/bin/rclone.new
    <     chmod 755 /usr/bin/rclone.new
    <     chown root:root /usr/bin/rclone.new
    <     mv /usr/bin/rclone.new /usr/bin/rclone
    ---
    >     mkdir -p $PREFIX/bin
    >     cp rclone $PREFIX/bin/rclone.new
    >     chmod 755 $PREFIX/bin/rclone.new
    >     mv $PREFIX/bin/rclone.new $PREFIX/bin/rclone
    157,159c157,158
    <         mkdir -p /usr/local/share/man/man1
    <         cp rclone.1 /usr/local/share/man/man1/
    <         mandb
    ---
    >         mkdir -p $PREFIX/local/share/man/man1
    >         cp rclone.1 $PREFIX/local/share/man/man1/
    188c187
    < version=$(rclone --version 2>>errors | head -n 1)
    ---
    > version=$($PREFIX/bin/rclone --version 2>>errors | head -n 1)

This means in the mf we add `$modroot/bin` to `PATH` and `$modroot/local/share/man` to `MANPATH`.

Now install from `install.sh`.

    rackham5: /sw/apps/rclone/1.56.2/src $ bash install.sh
    Archive:  rclone-current-linux-amd64.zip
       creating: tmp_unzip_dir_for_rclone/rclone-v1.56.2-linux-amd64/
      inflating: tmp_unzip_dir_for_rclone/rclone-v1.56.2-linux-amd64/git-log.txt  [text]
      inflating: tmp_unzip_dir_for_rclone/rclone-v1.56.2-linux-amd64/rclone  [binary]
      inflating: tmp_unzip_dir_for_rclone/rclone-v1.56.2-linux-amd64/README.txt  [text]
      inflating: tmp_unzip_dir_for_rclone/rclone-v1.56.2-linux-amd64/README.html  [text]
      inflating: tmp_unzip_dir_for_rclone/rclone-v1.56.2-linux-amd64/rclone.1  [text]

     has successfully installed.
    Now run "rclone config" for setup. Check https://rclone.org/docs/ for more details.

The adventure continues. Let's see what `rclone config` has in store for us.
