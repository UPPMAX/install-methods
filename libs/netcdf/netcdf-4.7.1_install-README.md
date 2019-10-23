netcdf-fortran/4.5.2 
====================

This part, within an already-installed netcdf-c 4.7.1 environment.


    CVERSION=4.7.1
    cd /sw/libs/netcdf
    cd $CVERSION
    cd src
    wget https://github.com/Unidata/netcdf-fortran/archive/v4.5.2.tar.gz


  165  cd 1.7.0/
  166  ll
  167  cd ../../GEMINI/
  168  ll
  169  cdcd 0.20.
  170  cdcd 0.20.1/
  171  ll
  172  cd 0.20.1/
  173  ll
  174  cd ../0.20.0
  175  ll
  176  rm -f rackham bianca irma && mv milou rackham && for CL in milou irma bianca snowy ; do ( test -L $CL || ln -s rackham $CL ) ; done
  177  ll
  178  mfshow GEMINI
  179  cd ../0.19.0/
  180  ll
  181  rm -f rackham bianca irma && mv milou rackham && for CL in milou irma bianca snowy ; do ( test -L $CL || ln -s rackham $CL ) ; done
  182  cd ../0.18.3/
  183  ll
  184  rm -f rackham bianca irma && mv milou rackham && for CL in milou irma bianca snowy ; do ( test -L $CL || ln -s rackham $CL ) ; done
  185  ll
  186  cd ..
  187  ll
  188  cd ../delly
  189  ll
  190  ll 0.7.7/
  191  mfshow delly
  192  ll 0.7.6
  193  ll 0.7.7
  194  cd ../CEG
  195  cd ../cegma
  196  ll
  197  mfshow cegma
  198  ll 2.5/
  199  cd 2.5
  200  ll
  201  rm -f rackham bianca irma && mv milou rackham && for CL in milou irma bianca snowy ; do ( test -L $CL || ln -s rackham $CL ) ; done
  202  ll
  203  cd ../
  204  ll
  205  cd ../augustus/
  206  ll
  207  mfshow augustus
  208  ll 3.2.2/
  209  cd 3.2.3
  210  ll
  211  cd ../3.2.3_
  212  cd ../3.2.3/
  213  ll
  214  mfshow augustus
  215  cat /sw/mf/common/bioinfo-tools/annotation/augustus/3.2.3_Perl5.24.1
  216  ll
  217  cd ../../AAT
  218  ll
  219  ll r03052011/
  220  cd r03052011/
  221  rm -f rackham bianca irma && mv milou rackham && for CL in milou irma bianca snowy ; do ( test -L $CL || ln -s rackham $CL ) ; done
  222  ll
  223  cd rackham/
  224  ll
  225  cd bin/
  226  ll
  227  ./dds -h
  228  cd ..
  229  ll
  230  cd ..
  231  ll
  232  cd src/
  233  ll
  234  cd AATpackage-r03052011/
  235  ll
  236  cat LICENSE 
  237  exit
  238  R --no-init-file
  239  cd ..
  240  ll
  241  cat installed.R 
  242  which Rscript
  243  ./installed.R 
  244  ./installed.R c
  245  ./installed.R -c
  246  cd /sw/data/uppnex/CTAT_RESOURCE_LIB
  247  ll
  248  cat CTAT_RESOURCE_LIB-download-db.sh 
  249  mkdir 2019-08
  250  cd 2019-08/
  251  ll
  252  ml
  253  cd ..
  254  ll
  255  vi R_packages-3.6.1-install-README.md 
  256  cat R_packages-3.6.1-install-README.md 
  257    module load ImageMagick/6.9.9-35
  258      module load giflib/5.1.4
  259  mshow ImageMagick
  260  R --no-init-file
  261  ml gcc/6.2.0
  262  R --no-init-file
  263  ml gcc/8.3.0
  264  vi R_packages-3.6.1-install-README.md 
  265  cd 3.6.1/rackham/
  266  R --no-install-packages
  267  R --no-init-file
  268  vi ../../R_packages-3.6.1-install-README.md 
  269  cat ../../R_packages-3.6.1-install-README.md 
  270  echo $VERSION
  271     mkdir -p /sw/apps/R_packages/$VERSION/external_packages
  272      cd /sw/apps/R_packages/$VERSION/external_packages
  273      ASCAT_VERSION=2.5.2
  274      [[ -f ASCAT_${ASCAT_VERSION}.tar.gz ]] || wget --timestamping https://github.com/Crick-CancerGenomics/ascat/releases/download/v${ASCAT_VERSION}/ASCAT_${ASCAT_VERSION}.tar.gz
  275      R CMD INSTALL ASCAT_${ASCAT_VERSION}.tar.gz
  276     mkdir -p /sw/apps/R_packages/$VERSION/external_packages
  277      IGRAPH0_VERSION=0.5.7
  278      cd /sw/apps/R_packages/$VERSION/external_packages
  279      [[ -f igraph0_${IGRAPH0_VERSION}.tar.gz ]] || wget --timestamping https://cran.r-project.org/src/contrib/Archive/igraph0/igraph0_${IGRAPH0_VERSION}.tar.gz
  280      R CMD INSTALL igraph0_${IGRAPH0_VERSION}.tar.gz
  281     install.packages('/sw/bioinfo/calcDFT/1.0.1/src/dnase2tf', repos = NULL, type="source")
  282  R --no-init-file
  283      mkdir -p /sw/apps/R_packages/$VERSION/external_packages
  284      cd /sw/apps/R_packages/$VERSION/external_packages
  285      RRBGEN_VERSION=0.0.6
  286      [[ -f rrbgen_${RRBGEN_VERSION}.tar.gz ]] || wget --timestamping https://github.com/rwdavies/rrbgen/releases/download/${RRBGEN_VERSION}/rrbgen_${RRBGEN_VERSION}.tar.gz
  287      R CMD INSTALL rrbgen_${RRBGEN_VERSION}.tar.gz
  288      STITCH_VERSION=1.6.2
  289    mkdir -p /sw/apps/R_packages/$VERSION/external_packages
  290      cd /sw/apps/R_packages/$VERSION/external_packages
  291      [[ -f STITCH_${STITCH_VERSION}.tar.gz ]] || wget --timestamping https://github.com/rwdavies/STITCH/releases/download/${STITCH_VERSION}/STITCH_${STITCH_VERSION}.tar.gz
  292      R CMD INSTALL STITCH_${STITCH_VERSION}.tar.gz
  293  ll
  294  cd ..
  295  ll
  296  cd rackham/
  297  ll
  298  ls -ltr
  299  cat to-be-installed.txt 
  300  ll finch
  301  cd /sw/bioinfo/fasta
  302  ll
  303  cp fasta-36.3.8-install-README.md fasta-36.3.8h-install-README.md
  304  vi fasta-36.3.8h-install-README.md 
  305  cat fasta-36.3.8h-install-README.md 
  306     TOOL=/sw/bioinfo/fasta
  307      VERSION=36.3.8h
  308      mkdir -p $TOOL
  309      cd $TOOL
  310      mkdir -p $VERSION
  311      cd $VERSION
  312      mkdir $CLUSTER
  313      PREFIX=$PWD/$CLUSTER
  314      [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ( test -L $CL || ln -s rackham $CL ) ; done
  315      mkdir src
  316      cd src
  317      wget http://faculty.virginia.edu/wrpearson/fasta/fasta36/fasta-${VERSION}.tar.gz
  318      tar xvzf fasta-${VERSION}.tar.gz
  319      cd fasta-${VERSION}
  320  ll
  321  less README
  322  cd src/
  323  ll
  324  view ../README
  325  ll ../make/
  326  ll ~/.Xauthority 
  327  R --no-init-file
  328  ll ..
  329  ll ../../3.6.0/
  330  cd ..
  331  ./installed.R 
  332  ./installed.R -t > table.txt
  333  tail table.txt 
  334  ll ..
  335  ../create_html_table.pl -h
  336  ll
  337  ll ..
  338  ../create_html_table.pl table.txt > table.html
  339  tail table.html 
  340  ll
  341  ll ../3.6.0/
  342  cat ../3.6.0/counts.txt 
  343  ./installed.R -c > counts.txt
  344  cat ../../../../fasta-36.3.8h-install-README.md 
  345  make -f ../make/Makefile.linux64_sse2 all
  346  ml
  347  make -f ../make/Makefile.linux64_sse2 clean
  348  cd ../..
  349  ml purge
  350  ml uppmax
  351  ml
  352  ll
  353  rm -rf fasta-36.3.8h
  354  tar xzf fasta-36.3.8h.tar.gz 
  355  cd fasta-36.3.8h/
  356  cd src/
  357  make -f ../make/Makefile.linux64_sse2 clean
  358  make -f ../make/Makefile.linux64_sse2 all
  359  make -f ../make/Makefile.linux64_sse2 install
  360  echo $PREFIX
  361  view ../make/Makefile.linux64_sse2 
  362   tail ../make/Makefile.linux64_sse2 
  363  view ../make/Makefile36m.common 
  364  view ../make/Makefile.fcom 
  365  grep ^install ../make/*
  366  grep -A 5 ^install ../make/*
  367  grep XDIR ../make/*
  368  make -f ../make/Makefile.linux64_sse2 XDIR=$PREFIX install
  369  cd ../../..
  370  ll
  371  cd rackham/
  372  ll
  373  ldd fasta36 
  374  ./fasta36 -h
  375  cd ../src/
  376  ll
  377  cd fasta-36.3.8h/
  378  ll
  379  ll bin/
  380  cat README
  381  cd src/
  382  ../bin/fasta36 -q ../seq/mgstm1.aa ../seq/prot_test.lseg 
  383  ll
  384  cd ..
  385  ll
  386  ll ../../../36.3.8/
  387  ll ../../../36.3.8/milou/
  388  rm -rf ../../rackham
  389  ll
  390  cd ..
  391  mv fasta-36.3.8h $PREFIX
  392  ll
  393  cd ..
  394  ll
  395  cd rackham/
  396  ll
  397  cd ../..
  398  ll
  399  vi fasta-36.3.8h-install-README.md 
  400  cd 36.3.8h/
  401  ll
  402  cd rackham/
  403  ll
  404  cd scripts/
  405  ll
  406  head -1 *.py
  407  head -1 *.pl
  408  vi ../../../fasta-36.3.8h-install-README.md 
  409  ll
  410  cat ../../../fasta-36.3.8h-install-README.md 
  411    chmod +x *.pl *.py
  412      sed -i 's,^#!/usr/bin/python.*$,#!/usr/bin/env python/' *.py
  413  vi ../../../fasta-36.3.8h-install-README.md 
  414      sed -i 's,^#!/usr/bin/python.*$,#!/usr/bin/env python,' *.py
  415  head -1 *.py
  416    cd $PREFIX
  417      mkdir man
  418      cd man
  419      ln -s ../doc man1
  420  ll
  421  cd man1
  422  ll
  423  cat INSTALL 
  424  cd ../../
  425  ll
  426  cd ..
  427  ll
  428  cd ..
  429  ll
  430  fixup .
  431  cd 36.3.6d
  432  ll
  433  mfshow fasta
  434  rm nestor/
  435  rm nestor
  436  ll
  437  mv milou rackham
  438      [[ $CLUSTER == rackham ]] && for CL in milou irma bianca snowy ; do ( test -L $CL || ln -s rackham $CL ) ; done
  439  ll
  440  cd rackham/
  441  ll
  442  cd bin/
  443  ll
  444  ./fasta36 
  445  cd ..
  446  ll
  447  cd ..
  448  ll
  449  cd 36.3.6f/
  450  ll
  451  rm -rf tintin
  452  rm -f halvan nestor
  453  mv milou rackham
  454      [[ $CLUSTER == rackham ]] && for CL in milou irma bianca snowy ; do ( test -L $CL || ln -s rackham $CL ) ; done
  455  cd rackham/
  456  ll
  457  cd bin/
  458  ll
  459  ./fasta36 
  460  cd ..
  461  ll
  462  cd ..
  463  ll
  464  cd ..
  465  ll
  466  cd 36.3.8
  467  ll
  468  rm -rf tintin halvan nestor
  469  mv milou rackham
  470      [[ $CLUSTER == rackham ]] && for CL in milou irma bianca snowy ; do ( test -L $CL || ln -s rackham $CL ) ; done
  471  ll
  472  cd rackham/
  473  ll
  474  bin/fasta36 
  475  cd ..
  476  ll
  477  cd mf
  478  ll
  479  cat 36.3.6d 
  480  vi 36.3.6d 
  481  ll
  482  rm 36.3.8
  483  ln -s 36.3.6f 36.3.8
  484  ln -s 36.3.8 36.3.8h
  485  ll
  486  cd ..
  487  ll
  488  cd mf
  489  ll
  490  mfshow fasta
  491  rsync -n -Pa --del * /sw/mf/common/bioinfo-tools/alignment/fasta/
  492  rsync  -Pa --del * /sw/mf/common/bioinfo-tools/alignment/fasta/
  493  rm /sw/mf/common/bioinfo-tools/alignment/fasta/.fasta 
  494  mfshow fasta
  495  for V in 36.3.* ; do all_mflink -f fasta $V ; done
  496  cat counts.txt 
  497  cat ../3.6.0/counts.txt 
  498  cd ../mf/
  499  ml
  500  ll
  501  cp 3.6.0 3.6.1
  502  vi 3.6.1
  503  cat 3.6.1
  504  mfshow -a R_packages
  505  rsync -n -Pa * /sw/mf/common/applications/R_packages/
  506  rsync  -Pa * /sw/mf/common/applications/R_packages/
  507  all_mflink -f -a R_packages 3.6.1
  508  cat ../3.6.1/counts.txt 
  509  wget --timestamping https://data.broadinstitute.org/Trinity/CTAT_RESOURCE_LIB/__genome_libs_StarFv1.7/Mouse_gencode_M22_CTAT_lib_Aug222019.plug-n-play.tar.gz
  510  wget --timestamping https://data.broadinstitute.org/Trinity/CTAT_RESOURCE_LIB/__genome_libs_StarFv1.7/Mouse_gencode_M22_CTAT_lib_Aug222019.plug-n-play.tar.gz.md5
  511  md5sum -c There are a total of 17657 CRAN and BioConductor packages installed, out of 17992 packages available
  512  14579 CRAN packages are installed, out of 14913 available
  513  ll
  514  md5sum -c Mouse_gencode_M22_CTAT_lib_Aug222019.plug-n-play.tar.gz.md5
  515  mkdir src
  516  ll
  517  tar xzf Mouse_gencode_M22_CTAT_lib_Aug222019.plug-n-play.tar.gz 
  518  ll
  519  mv Mouse_gencode_M22_CTAT_lib_Aug222019.plug-n-play.tar.gz* src/
  520  ll
  521  ml
  522  cd ..
  523  cd apps
  524  ll
  525  cd ../bioinfo
  526  ls -ltr
  527  fixup fasta trinotate tmhmm star-fusion star 
  528  ll
  529  cd ../apps/
  530  ll
  531  mv bioinfo.tar.gz ..
  532  cd ..
  533  ll
  534  cd bioinfo/
  535  ll
  536  cd ../apps/
  537  tar tvf bioinfo.tar.gz | less
  538  rm bioinfo.tar.gz 
  539  ll
  540  ls
  541  mkdir GOTM
  542  cd GOTM/
  543  mkdir 5.3
  544  cd 5.3
  545  mkdir src
  546  mkdir rackham
  547      [[ $CLUSTER == rackham ]] && for CL in milou irma bianca snowy ; do ( test -L $CL || ln -s rackham $CL ) ; done
  548  ll
  549  rm milou
  550  cd src/
  551  cd ../rackham/
  552  PREFIX=$PWD
  553  cd ../src/
  554  ml git
  555  ml gmake
  556  ml cmake
  557  ml
  558  git clone --recursive https://github.com/gotm-model/code.git
  559  git submodule update --init --recursive
  560  ll
  561  cd code/
  562  git submodule update --init --recursive
  563  ll
  564  ml
  565  mspid netcdf
  566  ml netcdf/4.7.1
  567  ml
  568  cat check_netcdf.sh 
  569  ./check_netcdf.sh 
  570  mkdir build
  571  cd build
  572  cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX  -DENABLE_NETCDF=ON -DNETCDF_PATH=$NETCDF_ROOT -DCMAKE_BUILD_TYPE=Release
  573  cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX  -DCMAKE_BUILD_TYPE=Release
  574  cd ..
  575  rm -rf build
  576  mkdir build
  577  cd build
  578  cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX  -DCMAKE_BUILD_TYPE=Release -DGOTM_USE_FABM=ON -DGOTM_USE_BASE=ON
  579  cd ..
  580  rm -rf build
  581  mkdir build
  582  cd build
  583  cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX  -DCMAKE_BUILD_TYPE=Release -DGOTM_USE_FABM=ON
  584  make
  585  cd ..
  586  rm -rf build
  587  cd ../../..
  588  ll
  589  mv 5.3 5.3-intel18.3
  590  cd 5.3-intel18.3/
  591  ll
  592  cd rackham/
  593  PREFIX=$PWD
  594  cd ../src/
  595  ll
  596  cd code/
  597  ll
  598  mkdir build
  599  cd build
  600  cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX  -DCMAKE_BUILD_TYPE=Release -DGOTM_USE_FABM=ON
  601  cd ..
  602  rm -rf build
  603  mkdir build
  604  ml
  605  cd build
  606  ml -netcdf
  607  ml netcdf/4.7.1-intel18.3 hdf5/1.10.5-intel18.3 intel/18.3
  608  ml netcdf/4.7.1-intel18.3 hdf5/1.10.5-threadsafe-intel18.3 intel/18.3
  609  ml
  610  ll
  611  cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX  -DCMAKE_BUILD_TYPE=Release -DGOTM_USE_FABM=ON
  612  make
  613  cd ..
  614  rm -rf build
  615  cd ../../..
  616  mv 5.3-intel18.3 5.3-212-g6944e393
  617  cd 5.3-212-g6944e393/
  618  ll
  619  cd rackham/
  620  PREFIX=$PWD
  621  cd ../src/
  622  ll
  623  cd code/
  624  ml
  625  ml -hdf5 -netcdf -intel
  626  ml hdf5/1.10.5 netcdf/4.7.1 gcc/5.4.0
  627  mkdir build
  628  cd build
  629  cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX  -DCMAKE_BUILD_TYPE=Release -DGOTM_USE_FABM=ON
  630  make
  631  cd ..
  632  ll
  633  find . -name netcdf.mod
  634  rm -rf build
  635  ml -gcc
  636  ml
  637  mkdir build
  638  cd build
  639  cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX  -DCMAKE_BUILD_TYPE=Release -DGOTM_USE_FABM=OFF
  640  make
  641  ml gcc/5.4.0
  642  cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX  -DCMAKE_BUILD_TYPE=Release -DGOTM_USE_FABM=OFF
  643  cd ..
  644  rm -rf build
  645  mkdir build
  646  cd build
  647  cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX  -DCMAKE_BUILD_TYPE=Release -DGOTM_USE_FABM=OFF
  648  make
  649  cd ..
  650  ll
  651  tar xzf makefiles.tar.gz 
  652  ls
  653  ll
  654  make
  655  view Makefile 
  656  rm -rf build
  657  ml
  658  mkdir build
  659  cd build
  660  ../scripts/linux/gotm_configure.sh 
  661  ../scripts/linux/gotm_configure.sh --help
  662  ll ../scripts/linux/gotm_configure.sh
  663  view ../scripts/linux/gotm_configure.sh
  664  ll ..
  665  cd ../..
  666  ll
  667  cd code
  668  cd build/
  669  ll
  670  rm -rf gfortran/
  671  cat ../scripts/linux/gotm_configure.sh
  672  cp ../scripts/linux/gotm_configure.sh .
  673  vi gotm_configure.sh 
  674  ll
  675  GOTM_BASE=/sw/apps/GOTM/5.3-212-g6944e393/src/code install_prefix=$PREFIX ./gotm_configure.sh 
  676  ll
  677  cd gfortran/
  678  ll
  679  make
  680  cd ../..
  681  ll
  682  ml
  683  ml -hdf5
  684  ml
  685  rm -rf build
  686  mkdir build
  687  cd build
  688  cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX  -DCMAKE_BUILD_TYPE=Release -DGOTM_USE_FABM=OFF
  689  cd ..
  690  rm -rf build
  691  mkdir build
  692  cd build
  693  cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DGOTM_USE_FABM=OFF
  694  make
  695  cd ..
  696  find . -name netcdf.mod
  697  cat ./extern/fabm/netcdf/mingw-w64-4.9/x86_w64/include/netcdf.mod
  698  ll ./extern/fabm/netcdf/mingw-w64-4.9/x86_w64/include/netcdf.mod
  699  ll
  700  uname -a
  701  info
  702  ll
  703  cd build
  704  cd ..
  705  rm Makefile 
  706  cat CMakeLists.txt 
  707  ll
  708  cd ../../..
  709  ll
  710  cd ../../libs/netcdf/
  711  ll
  712  cd 4.7.1
  713  ll
  714  cd ..
  715  history > netcdf-4.7.1_install-README.md
  716  vi netcdf-4.7.1_install-README.md 
  717  ll
  718  rm netcdf-4.7.1_install-README.md 
  719  cd 4.7.1
  720  ll
  721  cd rackham/
  722  ll
  723  cd include/
  724  ll
  725  cd ..
  726  ll
  727  cd ..
  728  ll
  729  cd src/
  730  ll
  731  cd netcdf-c-4.7.1/
  732  ll
  733  cd build/
  734  ll
  735  view CMakeCache.txt 
  736  cd ../../
  737  cd ..
  738  ll
  739  cd ..
  740  mkdir netcdf-fortran
  741  cd netcdf-fortran/
  742  mkdir 4.5.1
  743  cd 4.5.1/
  744  mkdir rackham
  745      [[ $CLUSTER == rackham ]] && for CL in milou irma bianca snowy ; do ( test -L $CL || ln -s rackham $CL ) ; done
  746  ll
  747  rm milou/
  748  rm milou
  749  mkdir src
  750  cd src/
  751  wget https://github.com/Unidata/netcdf-fortran/archive/v4.5.1.tar.gz
  752  tar xzf v4.5.1.tar.gz 
  753  ll
  754  cd netcdf-fortran-4.5.1/
  755  ll
  756  mkdir build
  757  ml
  758  ml -netcdf
  759  ml -gcc
  760  ml gcc/5.4.0
  761  ml
  762  mkdir build
  763  cd build
  764  ll
  765  echo $PREFIX
  766  cd ../..
  767  cd ..
  768  cd rackham/
  769  PREFIX=$PWD
  770  cd ../src/netcdf-fortran-4.5.1/build/
  771  ml netcdf/4.7.1
  772  pushd .
  773  cd
  774  cd /sw/libs/netcdf/mf
  775  ll
  776  vi *
  777  mfshow -l netcdf
  778  rsync -Pa * /sw/mf/common/libraries/netcdf/
  779  ml
  780  ml -netcdf
  781  dirs
  782  popd
  783  ml netcdf/4.7.1
  784  ml
  785  ll
  786  cd ..
  787  rmdir build
  788  ll
  789  NFDIR=$PREFIX CPPFLAGS=-I$NCDIR/include LDFLAGS=-L$NCDIR/lib ./configure --prefix=$NFDIR
  790  make check
  791  NFDIR=$PREFIX  ./configure --prefix=$NFDIR
  792  make clean
  793  make distclean
  794  ll
  795  ./configure --prefix=$PREFIX
  796  make
  797  make install
  798  make check
  799  ./configure --help
  800  cd ..
  801  ll
  802  rm -rf netcdf-fortran-4.5.1/
  803  cd ../../..
  804  ll
  805  cd netcdf
  806  ll
  807  wget --timestamping https://data.broadinstitute.org/Trinity/CTAT_RESOURCE_LIB/__genome_libs_StarFv1.7/GRCh38_gencode_v31_CTAT_lib_Aug152019.plug-n-play.tar.gz
  808  ./CTAT_RESOURCE_LIB-download-db.sh 
  809  ll
  810  du.
  811  du -csh *
  812  ./CTAT_RESOURCE_LIB-download-db.sh 
  813  ll
  814  screen -ls
  815  screen -R gather
  816  cd ..
  817  fixup netcdf-fortran
  818  ll
  819  cd netcdf
  820  ll
  821  cd 4.7.1
  822  ll
  823  cd ..
  824  cd netcdf
  825  cd ../netcdf-fortran
  826  ll
  827  cd 4.5.1/
  828  ll
  829  cd ../..
  830  ll
  831  mv glpk_old ../apps/doug-dumping-ground/
  832  cd dlib/
  833  ll
  834  cat dlib-19-15-install-README.md 
  835  mfshow -l dlib
  836  ll
  837  cd ..
  838  cd netcdf-fortran/
  839  ll
  840  history > netcdf-fortran-4.5.1_install-README.md
  841  vi netcdf-fortran-4.5.1_install-README.md 
  842  ml
  843  echo $LD_LIBRARY_PATH
  844  echo $LD_RUN_PATH
  845  ll /sw/libs/netcdf/4.7.1/rackham/lib
  846  ll /sw/libs/netcdf/4.7.1/rackham/lib64
  847  nc-config --help
  848  nc-config --has-c++
  849  nc-config --has-fortran
  850  nc-config --has-hdf5
  851  nc-config --has-szlib
  852  cd ..
  853  ll
  854  cd netcdf
  855  ll
  856  cd 4.7.1
  857  ll
  858  cd rackham/
  859  ll
  860  cd ../../mf
  861  ll
  862  vi *
  863  cd ..
  864  find . -name netcdf.mod
  865  cd ..
  866  ll
  867  cd netcdf-fortran/
  868  ll
  869  rm -rf 4.5.1
  870  mv netcdf-fortran-4.5.1_install-README.md  netcdf-fortran-4.5.2_install-README.md 
  871  ml
  872  exit
  873  ml
  874  exit
  875  ml
  876  ll
  877  cd ../../code/
  878  ll
  879  cd -
  880  cd gffs_exonerate_matches_against_extracted_scaffolds/
  881  ll
  882  ln -s ../../../code/gff2fasta.pl 
  883  ll
  884  cd ..
  885  ll
  886  cd with_blastdbcmd_extracted_matching_scaffolds/
  887  ll
  888  cat Eip74EF-PA--to--M_extradentata_PNEQ01093675.1.gff
  889  cd ..
  890  cd gffs_exonerate_matches_against_extracted_scaffolds/
  891  cat Eip74EF-PA--to--M_extradentata_PNEQ01093675.1.gff
  892  ll
  893  cat Eip74EF-PA--to--M_extradentata_PNEQ01084081.1.gff
  894  pushd .
  895  cd ..
  896  ll
  897  cd exonerate_matches_against_extracted_scaffolds/
  898  ll
  899  ll *PNEQ01084081.1*
  900  gview Eip74EF-PA--to--M_extradentata_PNEQ01084081.1.res
  901  cd ..
  902  ll
  903  cd gffs_exonerate_matches_against_extracted_scaffolds/
  904  ll
  905  ll *PNEQ01084081.1*
  906  cat Eip74EF-PA--to--M_extradentata_PNEQ01084081.1.gff
  907  ll
  908  ll ..
  909  ll whole_genome_exonerate_matched_best_hits
  910  ll ../whole_genome_exonerate_matched_best_hits
  911  ll ../fastas_from_whole_genome_exonerate_matched_best_hits/
  912  ll ../with_blastdbcmd_extracted_matching_scaffolds/
  913  ll ../with_blastdbcmd_extracted_matching_scaffolds/*PNEQ01084081.1*
  914  ln -s ../with_blastdbcmd_extracted_matching_scaffolds/*PNEQ01084081.1* .
  915  ll
  916  ./gff2fasta.pl 
  917  gvim gff2fasta.pl 
  918  perl -c gff2fasta.pl 
  919  alias perldb='perl -d:ptkdb'
  920  ll
  921  perldb gff2fasta.pl M_extradentata_PNEQ01084081.1.fna Eip74EF-PA--to--M_extradentata_PNEQ01084081.1.gff test
  922  ll
  923  ./gff2fasta.pl M_extradentata_PNEQ01084081.1.fna Eip74EF-PA--to--M_extradentata_PNEQ01084081.1.gff test
  924  ll
  925  cat test.pep.fasta 
  926  cat test.cds.fasta
  927  ll
  928  type perldb
  929  perldb ./gff2fasta.pl M_extradentata_PNEQ01084081.1.fna Eip74EF-PA--to--M_extradentata_PNEQ01084081.1.gff test
  930  bg
  931  fastalength M_extradentata_PNEQ01084081.1.fna
  932  fastasubseq
  933  fastasubseq M_extradentata_PNEQ01084081.1.fna 25424 5350
  934  fastasubseq M_extradentata_PNEQ01084081.1.fna 5350 25424
  935  fastasubseq M_extradentata_PNEQ01084081.1.fna 5350:25424
  936  dc
  937  fastasubseq M_extradentata_PNEQ01084081.1.fna 5350 20075
  938  fastasubseq M_extradentata_PNEQ01084081.1.fna 5350 10
  939  fastasubseq M_extradentata_PNEQ01084081.1.fna 5349 10
  940  fastasubseq M_extradentata_PNEQ01084081.1.fna 5349 10 | tr 'ACTG' 'TGAC'
  941  fastasubseq M_extradentata_PNEQ01084081.1.fna 5349 10 | tr 'ACTG' 'TGAC' | rev
  942  dc
  943  fastasubseq M_extradentata_PNEQ01084081.1.fna 24962 463
  944  fastasubseq M_extradentata_PNEQ01084081.1.fna 24961 463
  945  man fastasubseq
  946  perldb ./gff2fasta.pl M_extradentata_PNEQ01084081.1.fna Eip74EF-PA--to--M_extradentata_PNEQ01084081.1.gff test
  947  bg
  948  vi gff2fasta.pl 
  949  gvim gff2fasta.pl 
  950  ll
  951  head -n 20 Eip74EF-PA--to--M_extradentata_PNEQ01084081.1.gff
  952  perl -c gff2fasta.pl 
  953  perldb ./gff2fasta.pl M_extradentata_PNEQ01084081.1.fna Eip74EF-PA--to--M_extradentata_PNEQ01084081.1.gff test
  954  ./gff2fasta.pl M_extradentata_PNEQ01084081.1.fna Eip74EF-PA--to--M_extradentata_PNEQ01084081.1.gff test
  955  ll
  956  cat test.pep.fasta
  957  cat test.cds.fasta
  958  perldb ./gff2fasta.pl M_extradentata_PNEQ01084081.1.fna Eip74EF-PA--to--M_extradentata_PNEQ01084081.1.gff test
  959  bg 
  960  less Eip74EF-PA--to--M_extradentata_PNEQ01084081.1.gff
  961  ll
  962  grep gene_orientation *.gff
  963  ./gff2fasta.pl M_extradentata_PNEQ01084081.1.fna Eip74EF-PA--to--M_extradentata_PNEQ01084081.1.gff test
  964  cat test.pep.fasta 
  965  ll
  966  diff gff2fasta.pl ~/github-sync/local/bioinfo/scripts/exonerate-protein2genome-gff-to-fasta.pl 
  967  vi gff2fasta.pl ~/github-sync/local/bioinfo/scripts/exonerate-protein2genome-gff-to-fasta.pl 
  968  diff gff2fasta.pl ~/github-sync/local/bioinfo/scripts/exonerate-protein2genome-gff-to-fasta.pl 
  969  vi gff2fasta.pl ~/github-sync/local/bioinfo/scripts/exonerate-protein2genome-gff-to-fasta.pl 
  970  diff gff2fasta.pl ~/github-sync/local/bioinfo/scripts/exonerate-protein2genome-gff-to-fasta.pl 
  971  vi gff2fasta.pl ~/github-sync/local/bioinfo/scripts/exonerate-protein2genome-gff-to-fasta.pl 
  972  ~/github-sync/local/bioinfo/scripts/exonerate-protein2genome-gff-to-fasta.pl M_extradentata_PNEQ01084081.1.fna Eip74EF-PA--to--M_extradentata_PNEQ01084081.1.gff test
  973  vi  ~/github-sync/local/bioinfo/scripts/exonerate-protein2genome-gff-to-fasta.pl 
  974  ~/github-sync/local/bioinfo/scripts/exonerate-protein2genome-gff-to-fasta.pl M_extradentata_PNEQ01084081.1.fna Eip74EF-PA--to--M_extradentata_PNEQ01084081.1.gff test
  975  cat test.pep.fasta 
  976  cat test.cds.fasta 
  977  pushd .
  978  cd
  979  cd github-sync/local/bioinfo/
  980  git status
  981  ml
  982  ml git
  983  ml
  984  git --version
  985  git commit -a -m 'fix a couple bugs in exonerate-protein2genome-gff-to-fasta.pl'
  986  git push
  987  source ~/.agent
  988  git push
  989  cat ~/.agent
  990  ps -fu douglas | grep agent
  991  git status
  992  git pull
  993  popd
  994  ll
  995  grep gene_orientation *.gff
  996  view Eip74EF-PA--to--M_extradentata_PNEQ01093675.1.gff
  997  ll ../exonerate_matches_against_extracted_scaffolds/*PNEQ01093675.1*
  998  view ../exonerate_matches_against_extracted_scaffolds/Eip74EF-PA--to--M_extradentata_PNEQ01093675.1.res
  999  vi netcdf-fortran-4.5.2_install-README.md
 1000  mfshow -a R_packages
 1001  cd /sw/apps/GOTM/
 1002  ll
 1003  cd 5.3-212-g6944e393/
 1004  ll
 1005  ml
 1006  mspid netcdf
 1007  pushd .
 1008  cd
 1009  cd /sw/data/uppnex/blast_scripts/
 1010  crontab -l
 1011  view install_blastdb.sh 
 1012  cat install_blastdb.sh 
 1013  cd /sw/libs/netcdf-fortran/
 1014  ll
 1015  cat netcdf-fortran-4.5.2_install-README.md 
 1016  vi netcdf-fortran-4.5.2_install-README.md 
 1017  ll
 1018  cd ..
 1019  cd netcdf
 1020  cd 4.7.1
 1021  ll
 1022  cd ..
 1023  ll
 1024  ml netcdf/4.7.1-intel18.3
 1025  ls
 1026  ll
 1027  cd 4.7.1
 1028  cd ../4.7.1-intel18.3/
 1029  ll
 1030  which if77
 1031  which if90
 1032  ml intel/18.3
 1033  which if90
 1034  which ifort --help
 1035  ifort --help
 1036  ll
 1037  cd src/
 1038  ll
 1039  ml
 1040  ll
 1041  cd netcdf-fortran-4.5.2/
 1042  ll
 1043  ./configure --prefix=$PREFIX
 1044  make
 1045  make check
 1046  ./configure --help
 1047  echo $LD_RUN_PATH
 1048  ll /sw/libs/netcdf/4.7.1-intel18.3/rackham/lib64
 1049  ml
 1050  ml -netcdf -intel
 1051  ml netcdf/4.7.1-intel18.3 intel/18.3
 1052  less /sw/libs/netcdf/4.7.1-intel18.3/rackham/lib64/libnetcdf.settings 
 1053  make check
 1054  ldd fortran/.libs/libnetcdff.so
 1055  echo $LD_LIBRARY_PATH
 1056  ll /sw/libs/netcdf/4.7.1-intel18.3/rackham/lib64
 1057  ml patchelf
 1058  patchelf --print-rpath fortran/.libs/libnetcdff.so
 1059  ll /sw/libs/netcdf/4.7.1-intel18.3/rackham/lib64
 1060  make clean
 1061  ml
 1062  cd ..
 1063  rm -rf netcdf-fortran-4.5.2
 1064  tar xzf netcdf-fortran-4.5.2.tar.gz 
 1065  cd netcdf-fortran-4.5.2/
 1066  ll
 1067  ll missing 
 1068  ml
 1069  mkdir build
 1070  cd build
 1071  ml cmake
 1072  cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX
 1073  ml
 1074  ls
 1075  view CMakeCache.txt 
 1076  grep NETCDF_C_ CMakeCache.txt 
 1077  echo $CPATH
 1078  rm -rfa *
 1079  rm -rf *
 1080  cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DNETCDF_C_INCLUDE_DIR=/sw/libs/netcdf/4.7.1-intel18.3/rackham/include -DNETCDF_C_LIBRARY=/sw/libs/netcdf/4.7.1-intel18.3/rackham/lib64/libnetcdf.so
 1081  ll
 1082  cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DNETCDF_C_INCLUDE_DIR=/sw/libs/netcdf/4.7.1-intel18.3/rackham/include -DNETCDF_C_LIBRARY=/sw/libs/netcdf/4.7.1-intel18.3/rackham/lib64/libnetcdf.so
 1083  strings /sw/libs/netcdf/4.7.1-intel18.3/rackham/lib64/libnetcdf.so | grep oc_open
 1084  strings /usr/lib64/libnetcdf.so | grep oc_open
 1085  rm -rf *
 1086  cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DNETCDF_INCLUDE_DIR=/sw/libs/netcdf/4.7.1-intel18.3/rackham/include -DNETCDF_C_INCLUDE_DIR=/sw/libs/netcdf/4.7.1-intel18.3/rackham/include -DNETCDF_C_LIBRARY=/sw/libs/netcdf/4.7.1-intel18.3/rackham/lib64/libnetcdf.so
 1087  make
 1088  ml
 1089  ml hdf5/1.10.5-intel18.3
 1090  ml hdf5/1.10.5-threadsafe-intel18.3
 1091  cd ..
 1092  rm -rf build
 1093  mkdir build
 1094  cd build
 1095  cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DNETCDF_INCLUDE_DIR=/sw/libs/netcdf/4.7.1-intel18.3/rackham/include -DNETCDF_C_INCLUDE_DIR=/sw/libs/netcdf/4.7.1-intel18.3/rackham/include -DNETCDF_C_LIBRARY=/sw/libs/netcdf/4.7.1-intel18.3/rackham/lib64/libnetcdf.so
 1096  make
 1097  make check
 1098  make install
 1099  ll *.cmake
 1100  view cmake_install.cmake
 1101  CMAKE_INSTALL_PREFIX=$PREFIX make install
 1102  cd ..
 1103  rm -rf build
 1104  mkdir build
 1105  cd build
 1106  cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_BUILD_TYPE=Release -DNETCDF_INCLUDE_DIR=/sw/libs/netcdf/4.7.1-intel18.3/rackham/include -DNETCDF_C_INCLUDE_DIR=/sw/libs/netcdf/4.7.1-intel18.3/rackham/include -DNETCDF_C_LIBRARY=/sw/libs/netcdf/4.7.1-intel18.3/rackham/lib64/libnetcdf.so
 1107  make
 1108  make install
 1109  view cmake_install.cmake 
 1110  make install
 1111  CMAKE_INSTALL_PREFIX=$PREFIX make install
 1112  echo $PREFIX
 1113  ml
 1114  cd ..
 1115  rm -rf build
 1116  PREFIX=/sw/libs/netcdf/4.7.1-intel18.3/rackham
 1117  mkdir build
 1118  cd build
 1119  cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_BUILD_TYPE=Release -DNETCDF_INCLUDE_DIR=/sw/libs/netcdf/4.7.1-intel18.3/rackham/include -DNETCDF_C_INCLUDE_DIR=/sw/libs/netcdf/4.7.1-intel18.3/rackham/include -DNETCDF_C_LIBRARY=/sw/libs/netcdf/4.7.1-intel18.3/rackham/lib64/libnetcdf.so
 1120  make
 1121  make install
 1122  cd ../..
 1123  cd ..
 1124  ll
 1125  cd ..
 1126  ll
 1127  cd mf
 1128  ll
 1129  cd ../4.7.1-intel18.3/
 1130  ll
 1131  cd rackham/
 1132  ll
 1133  cd include/
 1134  ll
 1135  cd ..
 1136  cd lib
 1137  ll
 1138  cd ../include/
 1139  ll
 1140  cd ../..
 1141  ll
 1142  cd ..
 1143  fixup .
 1144  ml
 1145  cd mf
 1146  ll
 1147  vi 4.7.1-intel18.3 
 1148  vi 4.7.1
 1149  ll
 1150  vi *
 1151  ll
 1152  diff *
 1153  vi *
 1154  ll
 1155  vi *
 1156  diff *
 1157  vi *
 1158  diff *
 1159  vi *
 1160  diff *
 1161  ll
 1162  cd ..
 1163  ll
 1164  history > netcdf-4.7.1_install-README.md
