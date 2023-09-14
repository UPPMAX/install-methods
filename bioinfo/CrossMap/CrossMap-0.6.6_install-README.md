CrossMap/0.6.6
==============

<https://crossmap.sourceforge.net/>

Used under license:
GPL v2+


Structure creating script (makeroom_CrossMap_0.6.6.sh) moved to /sw/bioinfo/CrossMap/makeroom_0.6.6.sh

There was an earlier CrossMap/0.1.2 (really, apparently, 0.1.8) isntalled from milou, nestor and halvan. I've renamed that but not made it available for newer modules. It is from 2015.

I've installed with virtualenv, and it appears that only the `CrossMap.py`
main script needs to be lifted to `$PREFIX/bin`. There are many executables
installed as part of perhaps pyBigWig, but I am trusting that those can be
found by the `CrossMap.py` script if it needs them, or perhaps it is only
interacting with that package through its API in which case the virtualenv will
be fine.

I will also download several USCS and Ensembl chain files locally.


LOG
---

    makeroom.sh -f -t "CrossMap" -v "0.6.6" -s "alignment" -w "https://crossmap.sourceforge.net/" -d "A program for genome coordinates conversion between different assemblies (such as hg18 (NCBI36) <=> hg19 (GRCh37)). It supports commonly used file formats including BAM, CRAM, SAM, Wiggle, BigWig, BED, GFF, GTF, MAF VCF, and gVCF." -l "GPL v2+"
    ./makeroom_CrossMap_0.6.6.sh 
    source /sw/bioinfo/CrossMap/SOURCEME_CrossMap_0.6.6 && cd $PREFIX
    module load python/3.10.8
    virtualenv venv 
    source venv/bin/activate
    pip3 install CrossMap==0.6.6
    mkdir bin
    cd venv/bin/
    ll

Many scripts, including `CrossMap.py` and many other bioinformatics scripts. Check the installation record for CrossMap 0.6.6.

    cat ../lib/python3.10/site-packages/CrossMap-0.6.6.dist-info/RECORD 

Most things are installed within the `cmmodule` package, good, that will work
fine with the virtuanenv. Only `CrossMap.py` is installed within `venv/bin/`,
so elevate that.

    cd $PREFIX/bin
    ln -s $PREFIX/venv/bin/CrossMap.py .

In the mf file, just add `$modroot/bin` to PATH.

Once I download some chain files, I need to let the user know about those.


Chain files
-----------

These are found in the new `chain_files/latest` aka the `chain_files/20230825`
module. Download instructions and documentation are all there.

This means that `chain_files/latest` needs to be loaded as a prerequisite for
this module.

