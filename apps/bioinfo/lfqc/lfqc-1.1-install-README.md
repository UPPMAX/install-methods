# lfqc-1.1-install-README.md

lfqc/1.1
========

Specialised FastQ compression/decompression utilities.

    <https://github.com/mariusmni/lfqc>

    <http://www.ncbi.nlm.nih.gov/pubmed/26093148>

Log
---

    cd /sw/apps/bioinfo/
    mkdir lfqc
    fixup -g lfqc/
    cd lfqc/
    mkdir 1.1 mf
    cd 1.1/
    mkdir milou src
    cd src/

None of the advertised locations in the publication work:

    wget http://engr.uconn.edu/rajasek/lfqc-v1.1.zip  ### NOPE
    wget http://engr.uconn.edu/~rajasek/FastqPrograms.zip  ### NOPE

Instead a bit of googling found a github repository:

    git clone https://github.com/mariusmni/lfqc

    cd lfqc/
    cd lfqc/

Rebuild two compression tools.

    module load gcc/5.2.0

    cd lpaq8/
    rm lpaq8
    make
    ./lpaq8 
    ldd lpaq8

    cd ../zpaq702/
    rm zpaq
    make
    ./zpaq
    ldd zpaq

Now work the Ruby scripts.  Add #! lines.

    cd ../lfqc/
    vi lfqc.rb 
    chmod +x lfqc.rb 
    vi lfqcd.rb 
    chmod +x lfqcd.rb 

Test scripts.

    ./lfqc.rb

Errors for `require_relative`, try a newer Ruby.

    module load ruby/2.0.0_p353
    ./lfqc.rb

Works!

Seems as though the scripts are looking around for a lot fo things in their neighbourhood, so copy the whole git tree over to $modroot and remove the git traces.

    cd ../..
    mv lfqc ../milou/
    cd ../milou/lfqc
    rm -rf .git

Now set PATH to be `$modroot/lfqc/lfqc` and test after module is set.

Because of the -march=native compilation on the compression tools (which I
could soften but am choosing not to) it would be perhaps more work than it is
worth just now to provide for halvan, nestor and tintin.  So, just milou for
now.

Make sure mf file loads ruby/2.0.0_p353.

