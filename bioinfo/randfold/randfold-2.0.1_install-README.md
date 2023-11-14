randfold/2.0.1
==============

<http://bioinformatics.psb.ugent.be/supplementary_data/erbon/nov2003/>

Used under license:



Structure creating script (makeroom_randfold_2.0.1.sh) moved to /sw/bioinfo/randfold/makeroom_2.0.1.sh


Note that there are two websites provided above: the original
<http://bioinformatics.psb.ugent.be/supplementary_data/erbon/nov2003/> provided
as supplemental information for the 2004 _Bioinformatics_ publication
(<https://academic.oup.com/bioinformatics/article/20/17/2911/186725>), and the
github repository of the lead author Eric Bonnet
<https://github.com/erbon7/randfold>.

We version based on that given with the tarball, but we build from the github
repository. `diff -r` makes clear the differences between the tarball and the
github repository are cosmetic and not in the code.

LOG
---

    makeroom.sh -t randfold -s alignment -v 2.0.1 -w http://bioinformatics.psb.ugent.be/supplementary_data/erbon/nov2003/ -d "Permutation test for microRNA precursor sequences"
    ./makeroom_randfold_2.0.1.sh 
    source /sw/bioinfo/randfold/SOURCEME_randfold_2.0.1
    cd $SRCDIR

The original supplemental information tarball.

    wget http://bioinformatics.psb.ugent.be/supplementary_data/erbon/nov2003/downloads/randfold-2.0.1.tar.gz

The github repository.

    ml git/2.34.1 gcc/6.3.0

    git clone https://github.com/erbon7/randfold
    cd randfold/
    cd squid-1.9g/
    ./configure && make
    make check
    cd ..
    make
    cp -av randfold $PREFIX


Only $modroot added to PATH.

    cd $TOOLDIR/mf/2.0.1
    vi mf/2.0.1

Wrap up.

    ./randfold-2.0.1_post-install.sh
