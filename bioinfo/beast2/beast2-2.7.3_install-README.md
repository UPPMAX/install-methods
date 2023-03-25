beast2/2.7.3
============

<https://github.com/CompEvol/beast2>

Used under license:
LGPL v2.1

Structure creating script (makeroom_beast2_2.7.3/makeroom_2.7.3.sh

LOG
---

    makeroom.sh -f -t "beast2" -v "2.7.3" -w "https://github.com/CompEvol/beast2" -d "Bayesian Evolutionary Analysis by Sampling Trees" -l "LGPL v2.1"
    ./makeroom_beast2_2.7.3.sh

    source /sw/bioinfo/beast2/SOURCEME_beast2_2.7.3
    cd $SRCDIR
    wget https://github.com/CompEvol/beast2/releases/download/v${VERSION}/BEAST.v${VERSION}.Linux.x86.tgz
    tar xf BEAST.v${VERSION}.Linux.x86.tgz 

Replace `$PREFIX` with the unpacked package directory.

    rmdir $PREFIX
    mv beast $PREFIX


### Launch scripts: modify to have settable -Xmx value, and use packages from the module

    cd $PREFIX
    mkdir packages

The instructions for 2.6.2 included modifying the launch scripts. We could just copy these to 2.6.3.
Unfortunately for 2.7.3, the launch scripts have changed, so we need to apply our own changes.

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


### Local package directories

Install all available packages system-wide after the module is loaded with

    for P in $(packagemanager -list | grep -F '|' | grep -v 'Installed Version' | cut -f1 -d'|') ; do
        echo $P ...
        packagemanager -useAppDir -add $P
    done

