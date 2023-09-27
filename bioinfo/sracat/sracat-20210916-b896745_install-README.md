sracat/20210916-b896745
========================

<https://github.com/lanl/sracat>

Used under license:
BSD 3-Clause
<https://raw.githubusercontent.com/lanl/sracat/main/LICENSE>

Structure creating script (makeroom_sracat_20210916-b896745.sh) moved to /sw/bioinfo/sracat/makeroom_20210916-b896745.sh

LOG
---

    makeroom.sh -c bioinfo -s misc -t sracat -v 20210916-b896745 -w https://github.com/lanl/sracat -l "BSD 3-Clause" -L https://raw.githubusercontent.com/lanl/sracat/main/LICENSE -d "Quickly extract sequence (and quality scores) from Sequence Read Archive records"
    ./makeroom_sracat_20210916-b896745.sh 
    source /sw/bioinfo/sracat/SOURCEME_sracat_20210916-b896745 && cd $SRCDIR
    ml git/2.34.1
    git clone https://github.com/lanl/sracat


    ml gcc/12.3.0
    ml zlib/1.2.12
    ml bioinfo-tools
    ml sratools/3.0.7

    make SRA_PATH=$SRATOOLS_ROOT/fromsource

What about RPATH...

    ldd sracat

We're missing

    libncbi-ngs.so
    libngs-c++.so

Are they at:

    ll $SRATOOLS_ROOT/fromsource/lib64

Yes. So update RPATH.

    patchelf --print-rpath sracat
    patchelf --set-rpath "$SRATOOLS_ROOT/fromsource/lib64:$(patchelf --print-rpath sracat)" sracat

Test.

    ml purge

    ldd sracat

Install.

    cp -av sracat $PREFIX/

    vi 20210916-b896745 

Wrap up.

    ./sracat-20210916-b896745_post-install.sh 

