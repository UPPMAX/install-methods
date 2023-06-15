fineSTRUCTURE/4.1.1
===================

<https://people.maths.bris.ac.uk/~madjl/finestructure/finestructure.html>

Used under license:
Free for noncommercial use

Structure creating script (makeroom_fineSTRUCTURE_4.1.1.sh) moved to /sw/bioinfo/fineSTRUCTURE/makeroom_4.1.1.sh

LOG
---

    VERSION=4.1.1
    cd /sw/bioinfo/
    mkdir fineSTRUCTURE
    cd fineSTRUCTURE/
    mkdir $VERSION
    cd $VERSION
    #  mkdir $CLUSTER  don't make the $CLUSTER directory, we will move the unpacked directory to that name
    [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src/
    wget https://people.maths.bris.ac.uk/~madjl/finestructure/fs_${VERSION}.zip
    unzip fs_4.0.1.zip 
    cd fs_4.0.1
    ldd fs_linux_glibc2.3 
    ln -s fs_linux_glibc2.3 fs

Change `#!/usr/bin/perl` to `#!/usr/bin/env perl`.

    vi  *.pl

In the mf file define `FINESTRUCTURE_ROOT` and make sure module help directs
people to use it to access example directories and manual.

Also, load perl_modules/5.26.2 for the fineSTRUCTURE/Chromopainter perl
scripts, and note the need to load an R_packages module to load the
fineSTRUCTURE R library-ish file.



fineSTRUCTUREgui
----------------


Attempted to compile with several different versions of gcc, and with gsl/2.6 and wxWidgets/3.1.3-gtk2 loaded.
Always the below error compilining about a #define. Odd, but it's deprecated anyway.


    /sw/comp/gcc/9.3.0_rackham/include/c++/9.3.0/backward/binders.h:108:11: note: declared here
      108 |     class binder1st
          |           ^~~~~~~~~
    In file included from ../inf1.h:6,
                     from inputdata.h:22,
                     from reorderall.h:11,
                     from reorderall.cpp:6:
    /sw/comp/gcc/9.3.0_rackham/include/c++/9.3.0/bits/locale_facets_nonio.tcc: In member function '_InIter std::__cxx11::time_get<_CharT, _InIter>::_M_extract_name(std::__cxx11::time_get<_CharT, _InIter>::iter_type, std::__cxx11::time_get<_CharT, _InIter>::iter_type, int&, const _CharT**, std::size_t, std::ios_base&, std::ios_base::iostate&) const':
    ../rng.h:12:18: error: expected unqualified-id before '(' token
       12 | #define min(a,b) ((a) <= (b) ? (a) : (b))
          |                  ^
    /sw/comp/gcc/9.3.0_rackham/include/c++/9.3.0/bits/locale_conv.h: In member function 'bool std::wbuffer_convert<_Codecvt, _Elem, _Tr>::_M_conv_get()':
    ../rng.h:12:18: error: expected unqualified-id before '(' token
       12 | #define min(a,b) ((a) <= (b) ? (a) : (b))
          |                  ^
    ../rng.h:12:18: error: expected unqualified-id before '(' token
       12 | #define min(a,b) ((a) <= (b) ? (a) : (b))
          |                  ^
    In file included from ../eigen/Eigen/Core:124,
                     from ../eigen/Eigen/QR:4,
                     from ../pcadata.h:9,
                     from ../state.h:6,
                     from ../inf1.h:5,
                     from inputdata.h:22,
                     from reorderall.h:11,
                     from reorderall.cpp:6:


Adding additional features
--------------------------

A user was working through examples that referenced scripts not included in the release package. Turns out the main website and the developer's Github repository are out of sync in some ways; I am sticking with the main site for the tool release, but providing additional scripts from the repository. Also, providing the rather old R examples from the main site as well. See the mf file for an explanation.


### R library

    cd $SRCDIR
    mkdir R
    cd R
    wget https://people.maths.bris.ac.uk/~madjl/finestructure/FinestructureRcode.zip
    wget https://people.maths.bris.ac.uk/~madjl/finestructure/FinestructureRexampledata.zip
    wget https://people.maths.bris.ac.uk/~madjl/finestructure/ChromoPainterExampleHGDPdata.zip
    wget https://people.maths.bris.ac.uk/~madjl/finestructure/FinestructureRexampleresults.zip
    wget https://people.maths.bris.ac.uk/~madjl/finestructure/ContinentAndLabelRscripts.zip
    wget https://people.maths.bris.ac.uk/~madjl/finestructure/HGDPcontinentsExample.zip
    mkdir R_library
    cd R_library
    for Z in ../*.zip ; do unzip -q $Z; done
    cd ..
    mv R_library $PREFIX/


### Repository scripts

    cd $SRCDIR
    ml git/2.34.1
    git clone --recursive https://github.com/danjlawson/finestructure4
    cd finestructure4/
    cd scripts/
    head -n 1 *

As for the main scripts, I have straightened up usage for these scripts to reflect that they have their own `#!` lines and are within `PATH`.

Need to make some changes to the `#!` lines after copying over to their `PREFIX` subdirectory

    mkdir $PREFIX/reposcripts
    cp -av * $PREFIX/reposcripts
    sed -i 's,^#!/usr/bin/perl.*$,#!/usr/bin/env perl,' *.pl
    sed -i 's,^#!/bin/\(bash\|sh\)$,#!/bin/bash,' *.sh

Prepend `$modroot/reposcripts` to `PATH` before `$modroot` to keep priority. Explain this all in the mf.

