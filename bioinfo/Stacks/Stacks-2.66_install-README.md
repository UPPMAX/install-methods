Stacks/2.66
===========

<http://catchenlab.life.illinois.edu/stacks/>


Used under license:
GPL v3

Structure creating script (makeroom_Stacks_2.66.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/Stacks/makeroom2.66.sh


Many things about Stacks are different from earlier versions. Fewer perl
scripts use-ing standard perl modules, new python scripts import-ing standard
python packages, and more compiled code that handles its own RPATH information
correction.

Also, fix up 2.62.

The mf file only needs to add `$modroot/bin` to `PATH`.

LOG
---

    TOOL=Stacks
    VERSION=2.66
    makeroom.sh -f -t $TOOL -v $VERSION -w http://catchenlab.life.illinois.edu/stacks/ -s misc -l "GPL v3" -d "Software pipeline for building loci from short-read sequences"
    ./makeroom_${TOOL}_${VERSION}.sh

    source /sw/bioinfo/Stacks/SOURCEME_Stacks_2.66
    cd $SRCDIR

    [[ -f stacks-${VERSION}.tar.gz ]] || wget https://catchenlab.life.illinois.edu/stacks/source/stacks-${VERSION}.tar.gz
    tar xzf stacks-${VERSION}.tar.gz
    cd stacks-${VERSION}

    module load gcc/12.3.0

    echo $PREFIX
    ./configure --prefix=$PREFIX
    make -j5
    make install

Now check the scripts.

    cd $PREFIX
    cd bin/

Which perl interpreter and which modules?

    head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
    grep -P '^use\s' $(file * | grep 'Perl script' | cut -f1 -d:)

Uses `/usr/bin/env` to find `perl`, that's fine.

Uses only standard perl modules.

Now for the python scripts.

    head -n 1 $(file * | grep 'Python script' | cut -f1 -d:)
    grep -P 'import ' $(file * | grep 'Python script' | cut -f1 -d:)

Uses `/usr/bin/env` to find `python3`, that's fine.

Uses only standard python modules.

Replace the `#!` line with one from a perl module.

    ml python/3.9.5
    which python3

    sed -i '1i#!'"$(which python3)" $(file * | grep 'Python script' | cut -f1 -d:)
    head -n 2 $(file * | grep 'Python script' | cut -f1 -d:)

Check library loads, all fine.

    ml purge
    ldd *

Edit mf and wrap up..

    vi $TOOLDIR/mf/2.66
    ./Stacks-2.66_post-install.sh
