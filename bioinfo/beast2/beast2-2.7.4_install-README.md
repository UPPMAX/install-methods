beast2/2.7.4
============

<https://github.com/CompEvol/beast2>

Used under license:
LGPL v2.1

Structure creating script (makeroom_beast2_2.7.4/makeroom_2.7.4.sh

LOG
---

    makeroom.sh -f -t "beast2" -v "2.7.4" -w "https://github.com/CompEvol/beast2" -d "Bayesian Evolutionary Analysis by Sampling Trees" -l "LGPL v2.1"
    ./makeroom_beast2_2.7.4.sh

    source /sw/bioinfo/beast2/SOURCEME_beast2_2.7.4
    cd $SRCDIR
    wget https://github.com/CompEvol/beast2/releases/download/v${VERSION}/BEAST.v${VERSION}.Linux.x86.tgz
    tar xf BEAST.v${VERSION}.Linux.x86.tgz 

Replace `$PREFIX` with the unpacked package directory.

    rmdir $PREFIX
    mv beast $PREFIX


### Launch scripts: modify to have settable -Xmx value, and use packages from the module

    cd $PREFIX
    mkdir packages

We copy the launch scripts from 2.7.3, except for the `beast` script itself.

  - applauncher
  - beast - this script redid some architecture switches so I modified the new version
  - beauti
  - densitree
  - loganalyser
  - logcombiner
  - packagemanager
  - treeannotator

The changes:

1. Add definitions of `BEAST_PACKAGES` and `BEAST_XMX` below where `BEAST_LIB` is defined.
   Allow the second to be overridden by a definition from the environment.
   The default value of 8g is too much for a rackham single core.
   This means that, for example, after line 25 in the `beast` launcher, we add the lines

    BEAST_PACKAGES="$BEAST/packages"
    BEAST_XMX=${BEAST_XMX:-5g}

2. Modify the java launch line to use `BEAST_XMX` and add the option to use module-installed packages, `-Dbeast.system.package.dir="$BEAST_PACKAGES"`.

This means that, for example, in the `beast` launcher, the line

    "$JAVA" -Dlauncher.wait.for.exit=true -Xms256m -Xmx8g -Djava.library.path="$LD_LIBRARY_PATH" -Duser.language=en -cp "$BEAST_LIB/launcher.jar" beast.pkgmgmt.launcher.BeastLauncher $*

is changed to

    "$JAVA" -Dlauncher.wait.for.exit=true -Xms256m -Xmx${BEAST_XMX} -Djava.library.path="$LD_LIBRARY_PATH" -Dbeast.system.package.dir="$BEAST_PACKAGES" -Duser.language=en -cp "$BEAST_LIB/launcher.jar" beast.pkgmgmt.launcher.BeastLauncher $*

Some of the launchers do things to find beagle, expecting for example beagle to be in `/usr/local/lib`.


## Java and Beagle library

Installed `beagle/4.0.0`, which like this module depends on java 17. It and `java/OpenJDK_17+35` are loaded as dependencies.


## Local package directories

Install all available packages system-wide after the module is loaded with

    for P in $(packagemanager -list 2>/dev/null | grep -F '|' | grep -v 'Installed Version' | cut -f1 -d'|') ; do
        echo $P ...
        packagemanager -useAppDir -add $P
    done

For ticket #276111 the user requested, specifically, Mascot 3.0.3. The latest released through the packagemanager is 3.0.0. The latest official release at the Mascot repository <https://github.com/nicfel/Mascot> is 3.0.3, in March. It is a bit of a pain to install packages by hand, and Mascot 3.0.3 is released earlier than beast2/2.7.4, so I'll update the system package to Mascot 3.0.3.

    cd $PREFIX/packages/
    cd Mascot/
    mv Mascot.zip ..
    rm -rf *
    mv ../Mascot.zip .
    wget https://github.com/nicfel/Mascot/releases/download/v3.0.3/Mascot.v3.0.3.zip
    unzip -o Mascot.v3.0.3.zip

`packagemanager -list` shows that the installed Mascot version is 3.0.3, while the latest is 3.0.0. This is good.

We keep the default Mascot.zip around in case.
