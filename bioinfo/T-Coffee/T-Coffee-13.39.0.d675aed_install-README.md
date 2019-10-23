T-Coffee/13.39.0.d675aed
========================

<http://www.tcoffee.org/Projects/tcoffee/index.html#DOWNLOAD>

Used under license:
GPL v3

Structure creating script (makeroom_T-Coffee_13.39.0.d675aed.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/T-Coffee/makeroom_13.39.0.d675aed.sh

LOG
---

    TOOL=T-Coffee
    VERSION=13.39.0.d675aed
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_T-Coffee_13.39.0.d675aed.sh
    cd /sw/bioinfo/$TOOL/$VERSION/src
    wget http://
    tar xvf 
    make

  156  ll
  157  cd 0.17.17/rackham/
  158  ll
  159  cd ..
  160  rm ~/.local
  161  rm -rf ~/.local
  162  cd ..
  163  echo $PREFIX
  164      module load python/3.6.0
  165      PYTHONUSERBASE=$PREFIX pip3 install --user velocyto
  166      PYTHONUSERBASE=$PREFIX pip3 install --user sphinx
  167  ll
  168  cd 0.17.17/
  169  ll
  170  cd rackham/
  171  ll
  172  cd lib/
  173  ll
  174  cd ../bin/
  175  ll
  176      PYTHONUSERBASE=$PREFIX pip3 uninstall --user sphinx
  177  ll
  178  ll __pycache__/
  179  rm -rf __pycache__ chardetect pybabel rst* sphinx-*
  180  ll
  181  cd ..
  182  ll
  183  cd lib/
  184  ll
  185  cd ..
  186  ml
  187  ml -python
  188  ml bioinfo-tools velocyto/0.17.17
  189  ml
  190  velocity --help
  191  velocyto --help
  192  echo $PYTHONPATH
  193  cd /sw/bioinfo/velocyto
  194  ml -velocyto
  195  ll
  196  cd mf
  197  ll
  198  vi 0.17.17 
  199  rsync -Pa 0.17.17 /sw/mf/common/bioinfo-tools/misc/velocyto/
  200  ml
  201  cd
  202  ml bioinfo-tools velocyto/0.17.17
  203  velocyto --help
  204  cd /sw/comp/python
  205  ll
  206  cat python-3.6.0_CLUSTER-install-README.md
  207  ll
  208  ml
  209  ml -velocyto
  210  cd /sw/bioinfo/velocyto
  211  ml
  212  vi velocyto-0.17.17_install-README.md 
  213  ll
  214  ml
  215  cd mf
  216  ll
  217  vi 0.17.17 
  218  ml
  219  cat velocyto-0.17.17_install-README.md
  220  cd ..
  221  cat velocyto-0.17.17_install-README.md
  222   source SOURCEME_${TOOL}_${VERSION}
  223      module load python/3.6.8
  224      PYTHONUSERBASE=$PREFIX pip install --user velocyto
  225  ll 0.17.17/rackham/
  226  rm -rf 0.17.17/rackham/*
  227  ll 0.17.17/rackham/
  228  rm -rf ~/.local ~/.cache
  229  ml
  230  echo $PREFIX
  231  ll
  232  source SOURCEME_velocyto_0.17.17 
  233  cat velocyto-0.17.17_install-README.md 
  234     source SOURCEME_${TOOL}_${VERSION}
  235      module load python/3.6.8
  236  echo $PREFIX
  237  htop
  238    PYTHONUSERBASE=$PREFIX pip install --user velocyto
  239  ll
  240  cd mf
  241  ll
  242  cat 0.17.17 
  243  rsync -Pa 0.17.17 /sw/mf/common/bioinfo-tools/misc/velocyto/
  244  ll
  245  ml
  246  ml -python
  247  cd ../0.17.17/
  248  ll
  249  cd rackham/
  250  ll
  251  cd bin/
  252  ll
  253  cd ../../..
  254  ml velocyto/0.17.17
  255  velocyto --version
  256  echo $LC_ALL
  257  export LC_ALL=C.UTF-8
  258  export LANG=C.UTF-8
  259  export LC_ALL=C.utf8
  260  locale -a
  261  export LC_ALL=en_GB.utf8
  262  export LANG=en_GB.utf8
  263  velocyto --version
  264  velocyto --help
  265  ll
  266  cd mf
  267  ll
  268  vi 0.17.17 
  269  ll
  270  rsync -Pa 0.17.17 /sw/mf/common/bioinfo-tools/misc/velocyto/
  271  ml
  272  ml -velocyto
  273  ml velocyto/0.17.17
  274  velocyto --help
  275  ml
  276  exit
  277  ml bioinfo-tools velocyto
  278  velocyto --help
  279  echo $PATH
  280  mfshow velocyto
  281  groups
  282  ssh douglas-sens2017625@bianca
  283  cd /sw/bioinfo/velocyto
  284  ll
  285  cd 0.17.17
  286  ll
  287  cd /sw/apps/ALPS/
  288  ll
  289  cd 2.3.0/src/
  290  ll
  291  rm -rf alps-2.3.0-src-with-boost
  292  cd /sw/libs
  293  ll
  294  cd boost
  295  ll
  296  cd 1.70.0_gcc9.1.0
  297  ll
  298  cd src/
  299  ll
  300  cd ../../
  301  cd 1.70.0_gcc9.1.0_mpi3.1.3
  302  ll
  303  cd src/
  304  ll
  305  cd ..
  306  cd 1.70.0_intel18.3
  307  ll
  308  cd src/
  309  ll
  310  cd ..
  311  cd 1.70.0_intel18.3_intelmpi18.3
  312  ll
  313  cd src/
  314  ll
  315  cd ..
  316  ll -d */src
  317  ll -d */src/
  318  ll  */src
  319  cd 1.66.0-gcc8.3.0/src
  320  ll
  321  cd ..
  322  ll
  323  mspid boost
  324  cd 1.66.0-gcc8.3.0
  325  ll
  326  ll rackham/lib/
  327  ll src/
  328  cd src/
  329  ll
  330  rm -rf boost_1_66_0
  331  ll
  332  cd
  333  cd /sw/bioinfo/bcftools/
  334  mshow bcftools
  335  cd mf
  336  ll
  337  mfshow bcftools
  338  ll
  339  mv 1.3.1 1.2
  340  ln -s 1.2 1.3.1
  341  ll
  342  rm /sw/mf/common/bioinfo-tools/misc/bcftools/.bcftools 
  343  rsync -n -Pa --del *  /sw/mf/common/bioinfo-tools/misc/bcftools/
  344  rsync  -Pa --del *  /sw/mf/common/bioinfo-tools/misc/bcftools/
  345  mfshow bcftools
  346  rsync --del -Pa *  /sw/mf/common/bioinfo-tools/misc/bcftools/
  347  rsync --del  *  /sw/mf/common/bioinfo-tools/misc/bcftools/
  348  ll
  349  rsync --del -a *  /sw/mf/common/bioinfo-tools/misc/bcftools/
  350  mfshow bcftools
  351  rm /sw/mf/common/bioinfo-tools/misc/bcftools/1.1 1.3
  352  rm /sw/mf/common/bioinfo-tools/misc/bcftools/1.3
  353  mfshow bcftools
  354  cd ..
  355  ll
  356  cd mf
  357  ll
  358  vi 1.2 1.8
  359  rsync --del -Pa *  /sw/mf/common/bioinfo-tools/misc/bcftools/
  360  ll
  361  cd ..
  362  ll
  363  ll 1.2/
  364  ll 1.8/rackham/libexec/bcftools/
  365  ll 1.*/rackham/libexec/bcftools/
  366  cd mf
  367  ll
  368  rm 1.3.1 && cp -av 1.2 1.3.1
  369  ll
  370  vi 1.3.1
  371  ml bcftools
  372  ll
  373  rsync --del -Pa *  /sw/mf/common/bioinfo-tools/misc/bcftools/
  374  mfshow bcftools
  375  mshow bcftools
  376  cd ..
  377  ll
  378  cat bcftools-1.8-install-README.md
  379  ll
  380  cat bcftools-1.6-install-README.md
  381  ml
  382  ml bioinfo-tools
  383  ml bcftools/1.8
  384  bcftools plugin -l
  385  ll
  386  mfshow bcftools
  387  TOOL=bcftools; VERSION=1.9;  makeroom.sh -f -t $TOOL -v $VERSION -s misc -w http://www.htslib.org/doc/bcftools.html -l "MIT/Expat or GPL v3" -d "Tools for working with variant files"
  388  ll
  389  ./makeroom_bcftools_1.9.sh 
  390  ll
  391  source SOURCEME_bcftools_1.9 
  392  cat bcftools-1.8-install-README.md >> bcftools-1.9_install-README.md
  393  vi bcftools-1.9_install-README.md 
  394  history >> bcftools-1.9_install-README.md
  395  vi bcftools-1.9_install-README.md 
  396  ll
  397  vi bcftools-1.9_install-README.md 
  398  ll
  399  cat bcftools-1.9_install-README.md
  400  echo $PREFIX
  401  mspid htslib
  402  mspid samtools
  403      cd $VERSION/src
  404      [[ -f bcftools-${VERSION}.tar.bz2 ]] || wget https://github.com/samtools/bcftools/releases/download/${VERSION}/bcftools-${VERSION}.tar.bz2
  405      tar xjf bcftools-${VERSION}.tar.bz2
  406      cd bcftools-${VERSION}
  407      module load zlib/1.2.11
  408      ./configure --prefix=$PREFIX
  409      make -j 4
  410      make test
  411      make install
  412  make install
  413  cd ..
  414  ll
  415  cd ..
  416  ll
  417  cd ..
  418  ll
  419  cd mf
  420  ll
  421  rm 1.9
  422  ln -s 1.8 1.9
  423  vi 1.2 1.3.1 1.8
  424  ll
  425  rsync --del -Pa *  /sw/mf/common/bioinfo-tools/misc/bcftools/
  426  ll
  427  all_mflink -f bcftools 1.9
  428  mshow bcftools/1.9
  429  cd ../../htslib
  430  ll
  431  TOOL=htslib
  432  VERSION=1.9
  433  makeroom.sh -f -t $TOOL -v $VERSION -s misc -w https://github.com/samtools/htslib -l "MIT/Expat and modified 3-clause BSD" -d "Tools for working with SAM/BAM/variant files"
  434  ./makeroom_htslib_1.9.sh 
  435  ll
  436  cp htslib-1.6-install-README.md >> htslib-1.9_install-README.md
  437  cat htslib-1.6-install-README.md >> htslib-1.9_install-README.md
  438  history | tail -n 100 >> htslib-1.9_install-README.md
  439  vi htslib-1.9_install-README.md
  440  ll
  441  source SOURCEME_htslib_1.9 
  442  fixup ../bcftools
  443  ll
  444  cat htslib-1.9_install-README.md
  445    cd $VERSION/src
  446      [[ -f htslib-${VERSION}.tar.bz2 ]] || wget https://github.com/samtools/htslib/releases/download/${VERSION}/htslib-${VERSION}.tar.bz2
  447      tar xjf htslib-${VERSION}.tar.bz2
  448      cd htslib-${VERSION}
  449      module load zlib/1.2.11
  450      ./configure --prefix=$PREFIX
  451      make -j 4
  452      make test
  453      make install
  454  cd ../..
  455  ll
  456  cd ../mf
  457  ll
  458  cat 1.9
  459  ml
  460  cd ..
  461  ll
  462  cd 1.9
  463  ll
  464  cd ../1.8/
  465  ll
  466  cd rackham/
  467  ll
  468  cd bin/
  469  ll
  470  ldd htsfile 
  471  ./htsfile --help
  472  cd ../..
  473  cd ..
  474  ll
  475  ldd 1*/rackham/bin/htsfile
  476  ml -zlib
  477  ldd 1*/rackham/bin/htsfile
  478  ll
  479  cd mf
  480  cd ..
  481  fixup . 2>/dev/null
  482  ll
  483  cd mf
  484  ll
  485  vi *
  486  ll
  487  diff 1.3.2 1.9
  488  diff 1.2.1 1.9
  489  cp 1.8 1.9
  490  vi 1.9
  491  ll
  492  rm 1.9
  493  ln -1 1.8 1.9
  494  ln -s 1.8 1.9
  495  ll
  496  mfshow htslib
  497  rsync -n --del -Pa *  /sw/mf/common/bioinfo-tools/misc/htslib/
  498  rsync  --del -Pa *  /sw/mf/common/bioinfo-tools/misc/htslib/
  499  ll
  500  all_mflink -f htslib 1.9
  501  mfshow bcftools
  502  all_mflink -f bcftools 1.2
  503  mfshow htslib
  504  mfshow samtools
  505  mfshow bcftools
  506  cat /sw/bioinfo/bcftools/bcftools-1.9_install-README.md 
  507  ll /sw/bioinfo/bcftools/1.9/rackham/libexec/bcftools
  508  ml
  509  ml -bcftools
  510  ml bcftools/19
  511  ml bcftools/1.9
  512  bcftools plugins -l
  513  bcftools plugin -lv
  514  bcftools +split -h
  515  cd ../../bcftools/
  516  ll
  517  cd 1.9/
  518  ll
  519  cd rackham/libexec/bcftools/
  520  ll
  521  cd /sw/bioinfo/bcftools/
  522  ll
  523  echo $TOOLS
  524  echo $TOOL
  525  TOOL=bcftools
  526  VERSION=1.9-develop
  527  makeroom.sh -f -t $TOOL -v $VERSION -s misc -w http://www.htslib.org/doc/bcftools.html -l "MIT/Expat or GPL v3" -d "Tools for working with variant files (DEVELOPMENT VERSION)"
  528  ll
  529  ./makeroom_bcftools_1.9-develop.sh 
  530  ll
  531  source SOURCEME_bcftools_1.9-develop
  532  ll
  533  cp bcftools-1.9_install-README.md bcftools-1.9-develop_install-README.md
  534  vi bcftools-1.9-develop_install-README.md
  535  ll
  536  cd 1.9-develop/
  537  ll
  538  cd s
  539  cd src/
  540  ll
  541  ml git
  542  git clone --branch=develop git://github.com/samtools/htslib.git htslib
  543  git clone --branch=develop https://github.com/samtools/bcftools.git
  544  ll
  545  cd bcftools/
  546  ll
  547  ml gsl/2.3
  548  ml zlib/1.2.11
  549  mspid autotools
  550  autoheader
  551  ml m4
  552  ml automake
  553  ml autoconf
  554  autoreconf
  555  ml
  556  autoconf
  557  autoheader
  558  autoconf
  559  ./configure --help
  560  cd ..
  561  ll
  562  cd htslib/
  563  ll
  564  HTSLIB=$PWD
  565  cd ../bcftools/
  566  ll
  567  cd ../htslib/
  568  ll
  569  autoheader
  570  autoconf
  571  echo $PREFIX
  572  ./configure --help
  573  ml libcurl
  574  ml
  575  ./configure --enable-libcurl --enable-plugins --enable-s3 --enable-gcs --prefix=$PREFIX
  576  make
  577  make test
  578  make install
  579  ls ../../rackham/
  580  ls ../../rackham/bin/
  581  HTSLIB_ROOT=/sw/bioinfo/bcftools/1.9-develop/rackham
  582  cd ../bcftools/
  583  ll
  584  ./configure --help
  585  ./configure --prefix=$PREFIX --with-htslib=$HTSLIB_ROOT --enable-perl-filters
  586  ml
  587  mk -m4 -automake -autoconf -bcftools
  588  ml -m4 -automake -autoconf -bcftools
  589  ml
  590  ml -git
  591  ml
  592  ./configure --prefix=$PREFIX --with-htslib=$HTSLIB_ROOT --enable-perl-filters
  593  make
  594  make test
  595  ll ../../rackham/lib/
  596  export LD_LIBRARY_PATH=/sw/bioinfo/bcftools/1.9-develop/rackham/lib
  597  make test
  598  export PATH=/sw/bioinfo/bcftools/1.9-develop/rackham/bin:$PATH
  599  make test
  600  ll /sw/bioinfo/bcftools/1.9-develop/src/bcftools/test/fill-tags-AN0.out*
  601  cat /sw/bioinfo/bcftools/1.9-develop/src/bcftools/test/fill-tags-AN0.out.new
  602  cat /sw/bioinfo/bcftools/1.9-develop/src/bcftools/test/fill-tags-AN0.out
  603  make install
  604  cd ../..
  605  ll
  606  cd rackham/
  607  ll
  608  cd bin/
  609  ll
  610  cd ../lib
  611  ll
  612  cd ..
  613  ll
  614  cd ..
  615  ll
  616  cd ..
  617  ll
  618  cd mf
  619  ll
  620  vi 1.9-develop 
  621  ml
  622  ml -libcurl -gsl -zlib
  623  ll
  624  ml
  625  cd ../1.9-develop/
  626  ll
  627  cd rackham/
  628  ll
  629  cd bin/
  630  ll
  631  ldd bcftools 
  632  ldd htsfile
  633  ldd bgzip
  634  ll
  635  ldd tabix
  636  cd ..
  637  ll
  638  cd libexec/
  639  ll
  640  cd bcftools/
  641  ll
  642  ldd split-vep.so 
  643  ldd *
  644  cd ..
  645  ll
  646  cd htslib/
  647  ll
  648  ldd *
  649  cd ../../bin/
  650  ll
  651  htsfile plugin -l
  652  htsfile
  653  bcftools
  654  ll
  655  cd ../..
  656  cd -
  657  ll
  658  cd ..
  659  ll
  660  cd libexec/
  661  ll
  662  cd ..
  663  ll
  664  cd bin/
  665  ll
  666  strings htsfile | grep libexec
  667  htsfile --help
  668  cd ..
  669  cd -
  670  ll
  671  ldd bcftools 
  672  echo $LD_LIBRARY_PATH
  673  unset LD_LIBRARY_PATH
  674  ldd bcftools 
  675  cd ..
  676  ll
  677  cd ..
  678  ll
  679  cd ..
  680  ll
  681  cd mf
  682  ll
  683  vi 1.9-develop 
  684  ll ../1.9-develop/rackham/libexec/
  685  vi 1.9-develop 
  686  ll
  687  mfshow bcftools
  688  rsync -n -Pa * /sw/mf/common/bioinfo-tools/misc/bcftools/
  689  rsync  -Pa * /sw/mf/common/bioinfo-tools/misc/bcftools/
  690  mfshow bcftools
  691  all_mflink -f bcftools 1.9-develop
  692  ml
  693  ml bcftools/1.9-develop
  694  module help bcftools/1.9-develop
  695  bcftools plugin -l
  696  cd ..
  697  ll
  698  history >> bcftools-1.9-develop_install-README.md
  699  vi bcftools-1.9-develop_install-README.md
  700  mspid m4
  701  mspid auto
  702  mspid autoconf
  703  mspid automake
  704  vi bcftools-1.9-develop_install-README.md
  705  mspid libcurl
  706  vi bcftools-1.9-develop_install-README.md
  707  cd 1.9-develop/
  708  cd src/
  709  ll
  710  cd bdf
  711  cd bcftools/
  712  ll
  713  ./configure --help
  714  ./configure --prefix=$PREFIX --with-htslib=$HTSLIB_ROOT --enable-perl-filters --enable-gsl
  715  ml
  716  echo $HTSLIB_ROOT
  717  make
  718  make clean
  719  ./configure --prefix=$PREFIX --with-htslib=$HTSLIB_ROOT --enable-perl-filters --enable-gsl
  720  make
  721  make clean
  722  make distclean
  723  ll
  724  ./configure --prefix=$PREFIX --with-htslib=$HTSLIB_ROOT --enable-perl-filters --enable-gsl
  725  make -j4
  726  make distclean
  727  ./configure --help
  728  whereis cblas
  729  echo $LD_LIBRARY_PATH
  730  ml
  731  ml gsl/2.3
  732  ml zlib/1.2.11
  733  cat ../../../bcftools-1.9-develop_install-README.md 
  734     module load libcurl/7.45.0
  735  echo $PREFIX
  736  ll
  737  echo $LD_LIBRARY_PATH
  738  ll /sw/libs/gsl/2.3/rackham/lib
  739  ml
  740  ml gcc/6.3.0
  741  cd ../htslib
  742  make distclean; ./configure --enable-libcurl --enable-plugins --enable-s3 --enable-gcs --prefix=$PREFIX
  743  make -j4
  744  make test
  745  make install
  746  cd ../bcftools/
  747  make distclean; ./configure --prefix=$PREFIX --with-htslib=$HTSLIB_ROOT --enable-perl-filters --enable-gsl
  748  make distclean
  749  echo $HTSLIB_ROOT
  750  make distclean; ./configure --prefix=$PREFIX --with-htslib=$PREFIX --enable-perl-filters --enable-gsl
  751  ./configure --help
  752  make distclean; ./configure --prefix=$PREFIX --with-htslib=$PREFIX --enable-perl-filters --enable-gsl
  753  make -j4
  754  ll Makefile 
  755  grep poly Makefile 
  756  view Makefile 
  757  grep USE_GSL *
  758  ll
  759  make distclean; USE_GSL=true ./configure --prefix=$PREFIX --with-htslib=$PREFIX --enable-perl-filters --enable-gsl
  760  USE_GSL=true make
  761  view Makefile 
  762  grep USE_GSL *
  763  grep poly Makefile 
  764  view Makefile 
  765  ll /sw/libs/gsl/2.3/rackham/lib
  766  make clean
  767  make distclean
  768  ll
  769  make USE_GPL=1
  770  make clean
  771  make distclean
  772  ./configure --prefix=$PREFIX --with-htslib=$PREFIX --enable-perl-filters --enable-gsl
  773  make USE_GPL=1
  774  view Makefile 
  775  make USE_GPL=1
  776  view Makefile 
  777  make USE_GPL=1
  778  make test
  779  make install
  780  ll
  781  cd ../..
  782  cd ..
  783  ll
  784  history >> bcftools-1.9-develop_install-README.md
  785  vi bcftools-1.9-develop_install-README.md
  786  vi 1.9-develop/src/bcftools/Makefile 
  787  vi bcftools-1.9-develop_install-README.md
  788  ll
  789  ml
  790  vi bcftools-1.9-develop_install-README.md
  791  ll
  792  fixup .
  793  ll
  794  ml
  795  vi bcftools-1.9-develop_install-README.md
  796  ll
  797  cd 1.9-develop/
  798  ll
  799  cd rackham/
  800  ll
  801  ml
  802  ml -gcc -libcurl -zlib -gsl -bcftools
  803  ml
  804  ll
  805  cd bin/
  806  ll
  807  ldd bcftools
  808  mshow gsl/2.3
  809  cd ../../../
  810  ll
  811  cd mf
  812  ll
  813  fi 1.9-develop 
  814  vi 1.9-develop 
  815  rsync  -Pa * /sw/mf/common/bioinfo-tools/misc/bcftools/
  816  ml
  817  ml bcftools/1.9-develop
  818  ml
  819  cd ..
  820  bcftools
  821  bcftools plugin -l
  822  cd 1.9-develop/
  823  ll
  824  cd ../mf
  825  ll
  826  vi 1.9-develop 
  827  rsync  -Pa * /sw/mf/common/bioinfo-tools/misc/bcftools/
  828  ml
  829  module help bcftools/1.9-develop
  830  cd /sw/EasyBuild/
  831  ll
  832  cat bootstrap_eb.py 
  833  ll
  834  ll modules
  835  ll modules/compiler/
  836  ll modules/toolchain/
  837  ll modules/toolchain/foss/
  838  ll modules/bio
  839  ll modules/bio/
  840  ll modules/bio/SvABA/
  841  ll
  842  cd build/
  843  ll
  844  cd ..
  845  cd software/
  846  ll
  847  cd ..
  848  ll
  849  cd Software/
  850  ll
  851  cd ..
  852  ll
  853  EASYBUILD_PREFIX=$PWD
  854  export EASYBUILD_PREFIX
  855  module load EasyBuild
  856  module use $EASYBUILD_PREFIX/modules/all
  857  module load EasyBuild
  858  eb --version
  859  mspid svaba
  860  module load SvABA/1.1.2-GCCcore-7.3.0
  861  ml
  862  mfshow SvABA
  863  mfshow -a SvABA
  864  module spider gcc
  865  module load GCCcore
  866  module show GCCcore
  867  cd /sw/EasyBuild/
  868  export EASYBUILD_PREFIX=$PWD
  869  module use $EASYBUILD_PREFIX/modules/all
  870  eb --show-full-config
  871  module load EasyBuild
  872  eb --show-full-config
  873  which lmod
  874  which ml
  875  ml --version
  876  exit
  877  which eb
  878  eb --module-depends-on BWA-0.7.17-foss-2018b.eb -D
  879  eb --module-depends-on BWA-0.7.17-intel-2018b.eb -D
  880  eb --module-depends-on intel-2018b.eb -D
  881  eb --module-depends-on intel-2018b.eb
  882  eb --help
  883  eb --show-full-config
  884  htop -u douglas
  885  eb --module-depends-on --robot intel-2018b.eb
  886  eb --module-depends-on intel-2018b.eb -D
  887  module show bioinfo-tools
  888  screen -ls
  889  htop
  890  htop -u douglas
  891  dirs
  892  cd /sw/data/uppnex/Kraken2/t
  893  ll
  894  cd db/
  895  ll
  896  cd library/
  897  ll
  898  cd archaea/
  899  ll
  900  cat manifest.txt 
  901  cd ..
  902  ll
  903  cd bacteria/
  904  ll
  905  cat manifest.txt 
  906  cd ../..
  907  cd ..
  908  ll
  909  hiu
  910  jiu
  911  htop -u douglas
  912  screen -S easybuild-intel
  913  screen -R easybuild-intel
  914  ll /sw/comp/intel/licenses
  915  cat USE_SERVER.lic
  916  cd USE_SERVER.lic
  917  ll
  918  cd /sw/comp/intel/licenses
  919  ll
  920  cat USE_SERVER.lic 
  921  ll USE_SERVER_GCX2-65KPVK5Z.lic
  922  cat USE_SERVER_GCX2-65KPVK5Z.lic
  923  mshow intel/18.3
  924  ml
  925  screen -ls
  926  cd ..
  927  ls -ltr
  928  tail slurm-10406457.out
  929  ll
  930  screen -ls
  931  htop
  932  exit
  933  mshow SortMeRNA
  934  mshow SortMeRNA/2.1b
  935  cd /sw/bioinfo/SortMeRNA/2.1b/rackham/bin
  936  ll
  937  cd ..
  938  ll
  939  cd scripts/
  940  ll
  941  cd ..
  942  ll
  943  cd ..
  944  ll
  945  cd ..
  946  ll
  947  cd mf
  948  ll
  949  vi 2.0
  950  cd ../2.0
  951  ll
  952  ll rackham/
  953  cd ..
  954  cd mf
  955  mfshow SortMeRNA
  956  rsync -n -Pa * /sw/mf/common/bioinfo-tools/alignment/SortMeRNA/
  957  rsync  -Pa * /sw/mf/common/bioinfo-tools/alignment/SortMeRNA/
  958  ll
  959  cat 2.
  960  cat 2.0 
  961  mfshow SortMeRNA
  962  mspid SortMeRNA
  963  cd ../3.0.3/
  964  ll
  965  cd rackham/
  966  ll
  967  cd sortmerna/
  968  ll
  969  cd rRNA_databases/
  970  ll
  971  cd ..
  972  cd -
  973  cat README.txt 
  974  ll
  975  cd scripts/
  976  ll
  977  cat generate_databases.sh 
  978  cd ../..
  979  ll
  980  cd index/
  981  ll
  982  cd ../../../
  983  cd ..
  984  ll
  985  cat SortMeRNA-3.0.3-install-README.md
  986  cd 3.0.3/
  987  ll
  988  cd rackham/
  989  ll
  990  find . -name '*indexlog'
  991  cd sortmerna/index/
  992  ll
  993  cat silva-bac-23s-id98.indexlog
  994  mshow SortMeRNA/2.1b
  995  cd /sw/data
  996  ll
  997  cd Kraken
  998  ll
  999  cd ../Kraken2/
 1000  ll
 1001  ml bioinfo-tools
 1002  ml T-Coffee
 1003  ml
 1004  ml T-Coffee
 1005  ml
 1006  cd /sw/bioinfo/T-Coffee/
 1007  ll
 1008  cd mf
 1009  ll
 1010  vi 11.00.8cbe486 
 1011  pushd .
 1012  cd
 1013  cd github-sync/local/install-methods/
 1014  ll
 1015  cd bioinfo/
 1016  cd /sw/mf/common/bioinfo-tools/
 1017  ll
 1018  grep -Hn -C 1 'confict perl' */*/*
 1019  ll alignment/clustalo/1.2
 1020  grep -Hn -C 1 'confict ' */*/*
 1021  cd misc/samtools
 1022  ll
 1023  mfshow samtools
 1024  ll
 1025  rm cd
 1026  cd ../..
 1027  ll
 1028  find . -type f -exec grep -Hn conflict {} \;
 1029  find . -type f -exec grep -Hn conflict {} \;
 1030  find . -type f -exec grep -Hn -C 1 conflict perl' {} \;
 1031  find . -type f -exec grep -Hn -C 1 'conflict perl' {} \;
 1032  dirs
 1033  swapd
 1034  ll
 1035  vi 11.00.8cbe486 
 1036  mfshow T-Coffee
 1037  rsync  -Pa * /sw/mf/common/bioinfo-tools/alignment/T-Coffee/
 1038  ml
 1039  ml T-Coffee
 1040  ml
 1041  vi 11.00.8cbe486 
 1042  cd ..
 1043  ll
 1044  cd 11.00.8cbe486/
 1045  ll
 1046  cd src/
 1047  ll
 1048  rm -f bianca halvan irma nestor rackham snowy tintin && mv milou rackham && for CL in irma bianca snowy milou ; do ( test -L $CL && ln -s rackham $CL ) ; done
 1049  ll
 1050  cd ..
 1051  ll
 1052  rm -f bianca halvan irma nestor rackham snowy tintin && mv milou rackham && for CL in irma bianca snowy milou ; do ( test -L $CL && ln -s rackham $CL ) ; done
 1053  ll
 1054  for CL in irma bianca snowy milou ; do ( test -L $CL || ln -s rackham $CL ) ; done
 1055  ll
 1056  cd ..
 1057  ll
 1058  wget http://www.tcoffee.org/Packages/Stable/Latest/T-COFFEE_distribution_Version_13.39.0.d675aed.tar.gz
 1059  TOOL=T-Coffee; VERSION=13.39.0.d675aed ; makeroom.sh -f -t $TOOL -v $VERSION -s misc -w http://www.tcoffee.org/Projects/tcoffee/index.html#DOWNLOAD -l "GPL v3" -d "Multiple sequence alignment"
 1060  ll
 1061  ./makeroom_T-Coffee_13.39.0.d675aed.sh 
 1062  ll
 1063  source SOURCEME_T-Coffee_13.39.0.d675aed 
 1064  ll
 1065  cd 13.39.0.d675aed/
 1066  ll
 1067  cd src/
 1068  ll
 1069  wget http://www.tcoffee.org/Packages/Stable/Latest/T-COFFEE_distribution_Version_13.39.0.d675aed.tar.gz
 1070  tar xzf T-COFFEE_distribution_Version_13.39.0.d675aed.tar.gz 
 1071  ll
 1072  cd T-COFFEE_distribution_Version_13.39.0.d675aed/
 1073  ll
 1074  cat README 
 1075  head license.txt 
 1076  ll
 1077  cd t_coffee_source/
 1078  ll
 1079  cat makefile 
 1080  ml
 1081  ml -T-Coffee
 1082  ml
 1083  mspid gcc
 1084  ml gcc/9.2.0
 1085  make
 1086  make clean
 1087  ml
 1088  ll
 1089  head TMalign.f 
 1090  less TMalign.f 
 1091  head -n 20 TMalign.f 
 1092  head -n 30 TMalign.f 
 1093  head -n 40 TMalign.f 
 1094  ll
 1095  ml gcc/6.3.0
 1096  mspid gcc
 1097  ml gcc/6.4.0
 1098  make
 1099  ml
 1100  make clean
 1101  ll /sw/bioinfo/T-Coffee/11.00.8cbe486/rackham/
 1102  ll
 1103  cat makefile 
 1104  cd ..
 1105  ll
 1106  cd .
 1107  ll
 1108  cd ..
 1109  ll
 1110  rm -rf T-COFFEE_distribution_Version_13.39.0.d675aed
 1111  wget http://www.tcoffee.org/Packages/Stable/Latest/T-COFFEE_installer_Version_${VERSION}_linux_x64.tar.gz
 1112  ll
 1113  tar xzf T-COFFEE_installer_Version_13.39.0.d675aed_linux_x64.tar.gz 
 1114  ll
 1115  cd T-COFFEE_installer_Version_13.39.0.d675aed_linux_x64/
 1116  ll
 1117  cd ..
 1118  ll
 1119  rmdir rackham
 1120  cd src/
 1121  ll
 1122  mv T-COFFEE_installer_Version_13.39.0.d675aed_linux_x64 $PREFIX
 1123  cd ..
 1124  ll
 1125  cd ..
 1126  ml
 1127  ml -gcc
 1128  ll
 1129  cd 13.39.0.d675aed/rackham/
 1130  ll
 1131  cd bin/
 1132  ll
 1133  ldd t_coffee 
 1134  cd linux/
 1135  ll
 1136  ldd t_coffee 
 1137  ./t_coffee 
 1138  cd ../..
 1139  ll
 1140  ml
 1141  ml MAFFT
 1142  cd -
 1143  ll
 1144  ./t_coffee 
 1145  echo $PATH
 1146  ml
 1147  ml -MAFFT
 1148  ml
 1149  cd ..
 1150  ll
 1151  cd ../..
 1152  ll
 1153  cd ..
 1154  ll
 1155  history >> T-Coffee-13.39.0.d675aed_install-README.md
