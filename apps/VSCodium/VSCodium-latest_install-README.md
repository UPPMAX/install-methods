VSCodium/latest
========================

<https://vscodium.com/>

Used under license:
MIT


Structure creating script (makeroom_VSCodium_latest.sh) moved to /sw/apps/VSCodium/makeroom_latest.sh

LOG
---

    /home/matpiq/install-methods/makeroom.sh "-f" "-t" "VSCodium" "-v" "latest" "-c" "apps" "-w" "https://vscodium.com/" "-l" "MIT" " " "│"
    ./makeroom_VSCodium_latest.sh
VSCodium/1.75.23040
========================

<https://vscodium.com/>

Used under license:
MIT


Structure creating script (makeroom_VSCodium_1.75.23040.sh) moved to /sw/apps/VSCodium/makeroom_1.75.23040.sh

LOG
---

    /home/matpiq/install-methods/makeroom.sh "-f" "-t" "VSCodium" "-v" "1.75.23040" "-c" "apps" "-w" "https://vscodium.com/" "-l" "MIT" "-d" "VSCodium is a community-driven, freely-licensed binary distribution of Microsoft’s editor VS Code."
    ./makeroom_VSCodium_1.75.23040.sh
    cd $SRCDIR

Start by downloading the latest release of precompiled binaries

   cd $PREFIX
   wget https://github.com/VSCodium/vscodium/releases/download/1.75.1.23040/VSCodium-linux-x64-1.75.1.23040.tar.gz


A newer version of `libstdc++` than whats installed on the system level is
required. Patching the executable as follows:

   patchelf --add-needed /sw/comp/gcc/10.3.0_rackham/lib64/libstdc++.so.6.0.28 codium

does not work properly. VSCode is launched but the terminal still complains. Instead copy the library 

   cp /sw/comp/gcc/10.3.0_rackham/lib64/libstdc++.so.6 $PREFIX/vscodium

And add the following line to the mf-file

   prepend-path LD_LIBRARY_PATH $modroot/vscodium

Next, create a directory that holds global extensions for offline usage (Bianca)

   mkdir $PREFIX/extensions

Start up VSCode and install a set of common extensions directly from the marketplace.

   ./codium --extensions-dir $PREFIX/extensions

Lock the extensions so that it's not writable.

   chmod -R -w $PREIX/extensions

Symlink the new version to latest and make sure there is only one mf for
`latest`

    ln -s 1.75.2304 latest

Note: Do not run ./post_install for the new version (Just make sure latests
picks it up correctly).
