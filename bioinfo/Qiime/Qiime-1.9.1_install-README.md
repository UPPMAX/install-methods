Qiime 1.9.1
===========

Local pip method trashes central Python

    pip install --install-option="--prefix=/sw/apps/bioinfo/Qiime/...

Tried pyenv but seemed awkward to use in a script

Switched to brute-force method: entire Python dist just for this module


    tar xzf Python-2.7.10.tgz
    cd Python-2.7.10
    export TARGET=/sw/apps/bioinfo/Qiime/1.9.1/milou/python
    mkdir $TARGET
    ./configure --prefix=$TARGET --enable-shared LDFLAGS="-Wl,-rpath=$TARGET/lib"
    make
    make install
    cd ..

    export PYTHONHOME=/sw/apps/bioinfo/Qiime/1.9.1/milou/python
    export PATH=$PYTHONHOME/bin:$PATH
    export LD_LIBRARY_PATH=$PYTHONHOME/lib:/sw/libs/wxWidgets/lib
    export MANPATH=$PYTHONHOME/share/man:$MANPATH
    python --version

    wget https://pypi.python.org/packages/source/s/setuptools/setuptools-18.4.tar.gz
    tar xzf setuptools-18.4.tar.gz
    cd setuptools-18.4
    python setup.py install
    cd ..

    easy_install pip
    pip install numpy
    pip install qiime

    # Should see the following:
    # Successfully installed IPython-4.0.0 biom-format-2.1.5 burrito-0.9.1
    # burrito-fillings-0.1.1 click-5.1 cogent-1.5.3 decorator-4.0.4
    # emperor-0.9.51 funcsigs-0.4 future-0.15.2 gdata-2.0.18
    # ipython-genutils-0.1.0 matplotlib-1.4.3 mock-1.3.0 natsort-3.5.6
    # nose-1.3.7 pandas-0.17.0 path.py-8.1.2 pbr-1.8.1 pexpect-4.0.1
    # pickleshare-0.5 ptyprocess-0.5 pynast-1.2.2 pyparsing-2.0.3
    # pyqi-0.3.2 python-dateutil-2.4.2 pytz-2015.7 qcli-0.1.1 qiime-1.9.1
    # qiime-default-reference-0.1.3 scikit-bio-0.2.3 scipy-0.16.1
    # simplegeneric-0.8.1 six-1.10.0 traitlets-4.0.0

    print_qiime_config.py -t

    ####
    # This passes so move on to options
    ####

    jre1.6.0_05 
     - use standard java (could drop to java/sun_jdk1.6.0_18)

    rdp_classifier-2.2
     - copied from Qiime/1.8.0

    blast-2.2.22
     - module load blast/2.2.22

    cdbtools (src_cdbtools)
     - ftp://occams.dfci.harvard.edu/pub/bio/tgi/software/cdbfasta/cdbfasta.tar.gz
     - unpack in target dir, edit Makefile to -DENABLE_COMPRESSION=1, make 

    ChimeraSlayer (microbiomeutil_2010-04-29)
     - http://sourceforge.net/projects/microbiomeutil/files/__OLD_VERSIONS/microbiomeutil_2010-04-29.tar.gz
     - unpack into target dir, make (noisy compile for doing practically nothing)

    cd-hit 3.1.1 (old version)
     - http://www.bioinformatics.org/download/cd-hit/cd-hit-2007-0131.tar.gz
     - unpack in target dir, make

    mothur 1.25.0
     - module load Mothur/1.30.1

    HDF5
     - module load fysast hdf5
     - pip install h5py
     - this also installed Cython-0.23.4

    raxml 7.3.0
     - module load raxml/7.4.7

    infernal 1.0.2
     - wget ftp://selab.janelia.org/pub/software/infernal/infernal-1.0.2.tar.gz
     - ./configure --prefix=/sw/apps/bioinfo/Qiime/1.9.1/milou/infernal
     - make && make install

    muscle 3.8.31
     - module load muscle/3.8.31

    rtax 0.984
     - http://static.davidsoergel.com/rtax-0.984.tgz
     - unpack in target dir

    usearch v5.2.236
     - module load usearch/5.2.236

    # clearcut v1.0.9
    # sumaclust v1.0.00 (src_sumaclust) (license: CeCILL FREE SOFTWARE LICENSE AGREEMENT)
    # swarm 1.2.19 (src_swarm) (license: GPL)
    # sortmerna 2.0 (src_sortmerna) (license: LGPL)
    # Processing sff files:

    # sfffile and sffinfo (optional, QIIME 1.2.0 and later contain built-in tools for processing 
    # sff files although they are about 10x slower than the tools from Roche) (license: proprietary - must be obtained from Roche/454)
    # Denoising 454 data:

    # GNU Science Library (required by AmpliconNoise) (src_gsl)
    # AmpliconNoise 1.27 (src_ampliconnoise) See AmpliconNoise install notes.
    # ghc 6.8 (required by the QIIME denoiser) (src_ghc)
    # Network visualization:

    # cytoscape v2.7.0 (src_cytoscape) (license: LGPL)
    # Advanced statistics, including those performed in supervised_learning.py, detrend.py and compare_categories.py:

    # SourceTracker 0.9.5 (src) (license: GPL)
    # For joining paired end reads, with join_paired_ends.py and multiple_join_paired_ends.py:

    # ea-utils 1.1.2-537 (web) (license: MIT)
    # SeqPrep v1.1 (src) (license: MIT)
    # For improved performance with large BIOM files, or if you’re working with BIOM format 2.x files (see here for more details):


    ################################################################################

    ###############
    #
    # Garbage from old install
    #
    ###############

    # pip install --install-option="--prefix=/sw/apps/bioinfo/Qiime/1.8.0/SQLAlchemy" SQLAlchemy

    # mkdir biom-1.3.1
    # pip install --install-option="--prefix=/sw/apps/bioinfo/Qiime/1.8.0/biom-1.3.1" biom-format

    # export PYTHONPATH=/sw/apps/bioinfo/Qiime/1.8.0/SQLAlchemy-0.9.2/lib/python2.7/site-packages:/sw/apps/bioinfo/Qiime/1.8.0/PyCogent-1.5.3:/sw/apps/bioinfo/Qiime/1.8.0/biom-1.3.1/lib/python2.7/site-packages

    # wget http://downloads.sourceforge.net/project/pycogent/PyCogent/1.5.3/PyCogent-1.5.3.tgz
    # tar xzf PyCogent-1.5.3.tgz
    # cd PyCogent-1.5.3/
    # python setup.py build
    # python setup.py build_ext -if

    # tar xzf qiime-1.8.0.tar.gz
    # mv qiime-1.8.0 src; cd src
    # export QIIME_HOME=/sw/apps/bioinfo/Qiime/1.8.0/milou
    # python setup.py install --install-scripts=$QIIME_HOME/bin --install-purelib=$QIIME_HOME/lib --install-data=$QIIME_HOME/lib

    # ##################
    # # Try to add ChimeraSlayer
    # ##################

    # wget http://sourceforge.net/projects/microbiomeutil/files/__OLD_VERSIONS/microbiomeutil_2010-04-29.tar.gz

    # # Get cdbtools-20101011 from failed qiime-deploy
    # #     already compiled but probably just "make"
    # export PATH=/sw/apps/bioinfo/Qiime/1.8.0/cdbtools-20101011:$PATH

    # # Need megablast (from old blast)
    # module load blast/2.2.25

    # cd microbiomeutil_2010-04-29
    # make && make testChimeraSlayer


    # ##################
    # # add more stuff
    # ##################
    # mkdir qcli-0.1.0
    # pip install --install-option="--prefix=/sw/apps/bioinfo/Qiime/1.8.0/qcli-0.1.0" qcli

    # mkdir matplotlib-1.3.1
    # pip install --install-option="--prefix=/sw/apps/bioinfo/Qiime/1.8.0/matplotlib-1.3.1" matplotlib

