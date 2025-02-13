freebayes/1.3.8
========================

<https://github.com/ekg/freebayes>

Used under license:
MIT


Structure creating script (makeroom_freebayes_1.3.8.sh) moved to /sw/bioinfo/freebayes/makeroom_1.3.8.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-t" "freebayes" "-v" "1.3.8" "-w" "https://github.com/ekg/freebayes" "-l" "MIT" "-d" "Bayesian haplotype-based genetic polymorphism discovery and genotyping."
    ./makeroom_freebayes_1.3.8.sh
freebayes/1.3.2
========================

<https://github.com/ekg/freebayes>

Used under license:
MIT

Structure creating script (makeroom_freebayes_1.3.2.sh) moved to /sw/bioinfo/freebayes/makeroom_1.3.2.sh

LOG
---

Version 1.3.2 is for python3, so use python/3.7.2 with it.  Since we want to
build, we need to grab the repository with `--recursive`, we can't use the
tarball.  The 1.3.2 tag is 54bf40915ae7e46798503471ac57f593efdb5493, which we 
can get with `git clone -b v${VERSION} --single-branch --depth 1 --recursive`.

When done building, make sure RPATH is set in the executables.  Also, since there
are subdirectories `python/` and `scripts/` that have utility things users might 
want, move the whole cloned directory as the cluster directory when the build is
done.  Also, define `FREEBAYES_ROOT` in the mf file.


The freebayes documentation suggests a parallel make, **don't do it**.


    TOOL=freebayes
    VERSION=1.3.2
    cd /sw/bioinfo/freebayes
    makeroom.sh -f -t freebayes -v 1.3.2 -c bioinfo -w https://github.com/ekg/freebayes -l MIT -d "haplotype-based variant detector" 
    ./makeroom_freebayes_1.3.2.sh 
    source SOURCEME_freebayes_1.3.2 

    cd $SRCDIR
    module load git/2.21.0
    module load cmake/3.17.3
    module load gcc/8.4.0
    module load python/2.7.15
    git clone -b v${VERSION} --single-branch --depth 1 --recursive https://github.com/ekg/freebayes.git
    cd freebayes
    make
    cd ..

    rmdir $PREFIX
    mv freebayes $PREFIX

Enable the use of the python scripts, using python2. We must delete the '#!'
line from these scripts prior to adding the virtualenv python, as `multiset.py`
includes a '-*- coding' line which must be second.  The other python files
(factorialln.py, logsumexp.py, phred.py) are imported into these scripts.

NOTE these are with python/2.7.15.

    cd $PREFIX
    virtualenv venv
    source venv/bin/activate
    pip install numpy==1.14.5 scipy==1.1.0
    pip install python-cjson==1.2.2

    cd $PREFIX/python

    sed -i '1d' allelebayes.py dirichlet.py hwe.py multiset.py
    sed -i '1i#!'"$(which python)" allelebayes.py dirichlet.py hwe.py multiset.py
    chmod +x allelebayes.py dirichlet.py hwe.py multiset.py

    cd $PREFIX/scripts

    sed -i '1d' coverage_to_regions.py fasta_generate_regions.py
    sed -i '1i#!'"$(which python)" coverage_to_regions.py fasta_generate_regions.py

    deactivate


Enable perl script.

    cd $PREFIX/scripts
    chmod +x sam_add_rg.pl

In the mf, load gnuparallel and vcflib for freebayes-parallel and htslib/1.12 for bgziptabix, and no python.
