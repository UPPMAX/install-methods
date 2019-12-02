  169  head -n 1 run-mummer1 
  170  head -n 1 gaps
  171  file *
  172  mspid arleq
  173  head -n 1 $(file * | grep 'Perl script')
  174  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  175  htop
  176  finger icinga
  177  htop
  178  git pull
  179  git status
  180  ml
  181  ll
  182  ml
  183  cd ..
  184  ll
  185  cd rackham/
  186  ll
  187  cd ..
  188  ll
  189  cd src/
  190  ll
  191  rm -rf MUMmer3.23
  192  tar xzf MUMmer3.23.tar.gz 
  193  ll
  194  cd MUMmer3.23/
  195  ml
  196  ml -MUMmer
  197  ml
  198  ll
  199  cat INSTALL 
  200  make check
  201  make CFLAGS="-O3 -DSIXTYFOURBITS" CPPFLAGS="-O3 -DSIXTYFOURBITS" CXXFLAGS="-O3 -DSIXTYFOURBITS"
  202  mshow MUMmer/3.2.3
  203  mshow MUMmer/3.23
  204  ll
  205  cd ..
  206  mv ../rackham ../_rackham && mv MUMmer3.23 ../rackham
  207  cd ..
  208  ll
  209  ll _rackham/
  210  ll rackham/
  211  ll
  212  rm -rf _rackham/
  213  cd rackham/
  214  ll
  215  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  216  cd ../mf
  217  ll
  218  cd ..
  219  ll
  220  cd ..
  221  ll
  222  cd mf
  223  ll
  224  cd ..
  225  ll
  226  cat MUMmer-3.23-install-README.md
  227  ll
  228  history >> MUMmer-3.23-install-README.md
  229  ./gather-READMEs.sh
  230  vi MUMmer-3.23-install-README.md 
  231  cat MUMmer-3.22-install-README.md >> MUMmer-3.23-install-README.md
  232  vi MUMmer-3.23-install-README.md 
  233  ll
  234  file MUMmer-3.23-install-README.md 
  235  cat MUMmer-3.23-install-README.md 
  236  cd 3.23/rackham/
  237  ll
  238  sed -i -e 's,^#!.*/perl.*$,#!/usr/bin/env perl,' $(file * | grep 'Perl script' | cut -f1 -d:)
  239  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  240  cd ../../3.22/rackham/
  241  ll
  242  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  243  sed -i -e 's,^#!.*/perl.*$,#!/usr/bin/env perl,' $(file * | grep 'Perl script' | cut -f1 -d:)
  244  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  245  cd ../..
  246  ll
  247  vi MUMmer-3.22-install-README.md 
  248  ll
  249  cat MUMmer-3.9.4alpha-install-README.md
  250  ml
  251  ll
  252  cd mf
  253  ll
  254  cd ..
  255  ll
  256  cd 3.9.4alpha
  257  ll
  258  rm -rf milou
  259  rm -rf src_milou/
  260  mv src_rackham src
  261  ln -s rackham milou
  262  ll
  263  cd rackham/
  264  ll
  265  cd bin/
  266  ll
  267  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  268  ldd combineMUMs 
  269  ml
  270  ml -gcc
  271  mshow gcc/6.3.0
  272  ll /sw/mf/rackham/compilers/gcc/6.3.0
  273  ll /sw/mf/common/compilers/gcc/6.3.0
  274  ll /sw/mf/common/compilers/gcc/gcc.tcl
  275  cat /sw/mf/common/compilers/gcc/gcc.tcl
  276  vi /sw/mf/common/compilers/gcc/gcc.tcl
  277  ll
  278  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  279  sed -i -e 's,^#!.*/perl.*$,#!/usr/bin/env perl,' $(file * | grep 'Perl script' | cut -f1 -d:)
  280  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  281  cd ../../..
  282  ll
  283  cd -
  284  ll
  285  cd ../lib/
  286  ll
  287  cd mummer/
  288  ll
  289  less Foundation.pm 
  290  ll
  291  cd ..
  292  ll
  293  cd ..
  294  ll
  295  cd ..
  296  ll
  297  cd 4.0.0beta2/
  298  ll
  299  cd rackham/
  300  ll
  301  cd bin/
  302  ll
  303  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  304  sed -i -e 's,^#!.*/perl.*$,#!/usr/bin/env perl,' $(file * | grep 'Perl script' | cut -f1 -d:)
  305  ll
  306  cd ..
  307  ll
  308  cd include/
  309  ll
  310  cd ../lib
  311  ll
  312  cd pkgconfig/
  313  ll
  314  cat mummer.pc 
  315  cd ..
  316  ll
  317  cd libexec/
  318  ll
  319  cd mummer/
  320  ll
  321  ldd *
  322  ml
  323  cd ..
  324  ll
  325  cd ..
  326  ll
  327  cd ../..
  328  cd 3.9.4alpha/
  329  ll
  330  cd rackham/
  331  ll
  332  cd lib/
  333  cd ../bin/
  334  ll
  335  ldd *
  336  ll
  337  cd ..
  338  ll
  339  cd ..
  340  ll
  341  cd src/
  342  ll
  343  rm -rf mummer-3.9.4alpha
  344  tar xzf mummer-3.9.4alpha.tar.gz 
  345  cat ../../MUMmer-3.9.4alpha-install-README.md 
  346  vi ../../MUMmer-3.9.4alpha-install-README.md 
  347  ll
  348   mummer-3.9.4alpha/
  349  cd ../..
  350  ll
  351  cat MUMmer-3.9.4alpha-install-README.md
  352      VERSION=3.9.4alpha
  353  cd $VERSION
  354     PREFIX=$PWD/$CLUSTER
  355  echo $PREFIX
  356  ll $PREFIX
  357  ml
  358      module load gcc/6.3.0
  359  ml -perl
  360  vi ../MUMmer-3.9.4alpha-install-README.md 
  361  ll
  362  ml
  363  cd src/
  364  ll
  365  cd mummer-3.9.4alpha/
  366  ll
  367  make clean
  368  ./configure --help
  369  ./configure --prefix=$PREFIX
  370  ./configure --with-int128 --prefix=$PREFIX
  371  make
  372  make install
  373  ml
  374  ml -gcc
  375  ll
  376  cd ../../
  377  ll
  378  cd rackham/
  379  ll
  380  cd bin/
  381  ll
  382  cd ../lib/
  383  ll
  384  ldd libumdmummer.so
  385  ml
  386  cd ../bin/
  387  ll
  388  ./nucmer 
  389  ldd nucmer 
  390  ml patchelf
  391  patchelf --print-rpath nucmer
  392  patchelf --set-rpath $(patchelf --print-rpath nucmer):/sw/comp/gcc/6.3.0_rackham/lib:/sw/comp/gcc/6.3.0_rackham/lib64 nucmer
  393  patchelf --print-rpath nucmer
  394  ./nucmer 
  395  ldd mummer
  396  cd ../lib
  397  ll
  398  ldd libumdmummer.so.0.0.0
  399  patchelf --print-rpath libumdmummer.so.0.0.0
  400  patchelf --set-rpath /sw/comp/gcc/6.3.0_rackham/lib:/sw/comp/gcc/6.3.0_rackham/lib64 libumdmummer.so.0.0.0 
  401  patchelf --print-rpath libumdmummer.so.0.0.0
  402  ldd libumdmummer.so.0.0.0
  403  cd ../bin/
  404  ldd mummer
  405  patchelf --print-rpath mummer
  406  patchelf --set-rpath $(patchelf --print-rpath nucmer):/sw/comp/gcc/6.3.0_rackham/lib:/sw/comp/gcc/6.3.0_rackham/lib64 mummer
  407  ldd mummer
  408  ll
  409  ldd annotate 
  410  ldd * | grep ' not found ' | cut -f1 -d: | sort -u
  411  ldd * 2>&1 | grep ' not found ' | cut -f1 -d: | sort -u
  412  patchelf --print-rpath mummer
  413  patchelf --set-rpath /sw/bioinfo/MUMmer/3.9.4alpha/rackham/lib:/sw/comp/gcc/6.3.0_rackham/lib:/sw/comp/gcc/6.3.0_rackham/lib64 mummer
  414  patchelf --print-rpath mummer
  415  for F in $(ldd * 2>&1 | grep ' not found ' | cut -f1 -d: | sort -u) ; do echo $F; patchelf --set-rpath $(patchelf --print-rpath $F):/sw/comp/gcc/6.3.0_rackham/lib:/sw/comp/gcc/6.3.0_rackham/lib64 $F ; done
  416  ml
  417  ll
  418  ldd *
  419  ./mummer
  420  ll
  421  cd ..
  422  ll
  423  cd ..
  424  ll
  425  history >> MUMmer-3.9.4alpha-install-README.md
  426  vi MUMmer-3.9.4alpha-install-README.md
  427  ll
  428  cat MUMmer-4.0.0beta2-install-README.md
  429  ll
  430  cd 4.0.0beta2/
  431  ll
  432  cd rackham/
  433  ll
  434  cd bin/
  435  ll
  436  ml
  437  ldd *
  438  ll
  439  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  440  vi ../../../MUMmer-4.0.0beta2-install-README.md 
  441  ll
  442  less dnadiff 
  443  cd ../..
  444  ll
  445  echo $PREFIX
  446  cd rackham/
  447  PREFIX=$PWD
  448  cd ../src/
  449  ll
  450  cd mummer-4.0.0beta2/
  451  ll
  452  make clean
  453  ml
  454  ml gcc/6.3.0
  455  ml
  456  ./configure --help
  457  ./configure --with-int128 --prefix=$PREFIX
  458  make
  459  make install
  460  cd ../
  461  cd ..
  462  ll
  463  cd rackham/
  464  ll
  465  cd bin/
  466  ll
  467  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  468  sed -i -e 's,^#!.*/perl.*$,#!/usr/bin/env perl,' $(file * | grep 'Perl script' | cut -f1 -d:)
  469  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  470  ml
  471  ml -gcc
  472  ll
  473  ldd *
  474  cd ../libexec/
  475  ll
  476  cd mummer/
  477  ll
  478  ldd *
  479  cd ../..
  480  cd ..
  481  ll
  482  vi MUMmer-4.0.0beta2-install-README.md
  483  head | tail
  484  history | tail -20
  485  vi MUMmer-4.0.0beta2-install-README.md
  486  ll
  487  cd mf
  488  ll
  489  vi 4.0.0beta2 
  490  ll
  491  vi 3.9.4alpha 
  492  ml
  493  ml -patchelf
  494  ll
  495  cd ..
  496  ml MUMmer/3.9.4alpha
  497  which mummer
  498  nummer
  499  nucmer
  500  mummer
  501  cd 3.9.4alpha/
  502  ll
  503  cd rackham/
  504  ll
  505  cd bin/
  506  ll
  507  ./mummer
  508  cd ..
  509  ll
  510  cd ..
  511  ll
  512  cd src/
  513  ll
  514  cd mummer-3.9.4alpha/
  515  ll
  516  ml
  517  make clean
  518  ml gcc/6.3.0
  519  cd ../../rackham/
  520  PREFIX=$PWD
  521  cd -
  522  echo $PREFIX
  523  ./configure --with-int128 --prefix=$PREFIX
  524  make -j3
  525  make install
  526  cd ../..
  527  ll
  528  cd rackham/
  529  ll
  530  cd lib/
  531  ll
  532  ldd libumdmummer.so.0.0.0 
  533  ml -gcc
  534  ml
  535  ldd libumdmummer.so.0.0.0 
  536  cd ../bin
  537  ll
  538  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  539  sed -i -e 's,^#!.*/perl.*$,#!/usr/bin/env perl,' $(file * | grep 'Perl script' | cut -f1 -d:)
  540  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  541  ldd annotate 
  542  cd ..
  543  ll
  544  cd ../src/
  545  ll
  546  rm -rf mummer-3.9.4alpha
  547  tar xzf mummer-3.9.4alpha.tar.gz 
  548  cd mummer-3.9.4alpha/
  549  ll
  550  ml
  551  ml -MUMmer
  552  ml gcc/6.3.0
  553  ll
  554  echo $PREFIX
  555  ./configure --with-int128 --prefix=$PREFIX
  556  make -j3
  557  make install
  558  cd $PREFIX
  559  ll
  560  cd lib/
  561  ll
  562  ml
  563  ml -gcc
  564  ldd libumdmummer.so.0.0.0
  565  cd mummer/
  566  ll
  567  cd ..
  568  ll
  569  cd ../bin/
  570  ll
  571  sed -i -e 's,^#!.*/perl.*$,#!/usr/bin/env perl,' $(file * | grep 'Perl script' | cut -f1 -d:)
  572  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  573  ldd * 2>&1 | grep ' not found ' | cut -f1 -d: | sort -u
  574  ldd annotate 
  575  ml patchelf
  576  for F in $(ldd * 2>&1 | grep ' not found ' | cut -f1 -d: | sort -u) ; do echo $F; patchelf --set-rpath $(patchelf --print-rpath $F):/sw/comp/gcc/6.3.0_rackham/lib:/sw/comp/gcc/6.3.0_rackham/lib64 $F ; done
  577  ml -gcc -patchelf
  578  ml patchelf
  579  ll
  580  ldd annotate 
  581  ./annotate -h
  582  ./nucmer -h
  583  ./mummer -h
  584  ll
  585  patchelf --print-rpath annotate 
  586  patchelf --print-rpath postnuc
  587  ldd prepro
  588  cd ../..
  589  ll
  590  cd ..
  591  ll
  592  vi MUMmer-3.9.4alpha-install-README.md
  593  ll
  594  ml
  595  cd /sw/bioinfo/abyss/
  596  ll
  597  cat abyss-2.0.2-install-README.md 
  598  ml
  599  ll /sw/mf/*/parallel/openmpi/2.1.0
  600  ll -d /sw/mf/*/parallel/openmpi
  601  ll /sw/mf/*/parallel/openmpi/
  602  pushd .
  603  cd /sw/mf/bianca/parallel/openmpi
  604  ll
  605  cd .snapshot
  606  ll
  607  ll /sw/bioinfo/abyss/
  608  ll /sw/bioinfo/abyss/mf/
  609  ssh douglas-sens2017625@bianca
  610  dirs
  611  popd
  612  git status
  613  git add .
  614  git pull
  615  git commit -a -m 'more installs'
  616  git push
  617  cd /sw/EasyBuild
  618  module use /sw/EasyBuild/modules/all
  619  module load EasyBuild/4.0.1
  620  export EASYBUILD_PREFIX=/sw/EasyBuild
  621  eb --show-config
  622  export EASYBUILD_PREFIX=/sw/EasyBuild foss-2018b
  623  export EASYBUILD_PREFIX=/sw/EasyBuild foss-2018b.eb
  624  eb --module-depends-on --robot --module-syntax=Tcl foss-2018b.eb
  625  ll sources/
  626  ll sources/f/FFTW/fftw-3.3.8.tar.gz 
  627  rm sources/f/FFTW/fftw-3.3.8.tar.gz 
  628  eb --module-depends-on --robot --module-syntax=Tcl foss-2018b.eb
  629  eb --show-full-config
  630  mspid abyss
  631  mshow abyss/2.0.2-k128
  632  ll /sw/EasyBuild/ebfiles_repo
  633  ll /sw/EasyBuild/ebfiles_repo/FFTW/
  634  find . -name FFTW-3.3.8-gompi-2018b.eb
  635  ml
  636  eb --show-config
  637  eb --help
  638  ll
  639  eb --module-depends-on --robot --module-syntax=Tcl CDO
  640  eb --module-depends-on --robot --module-syntax=Tcl --software=CDO
  641  eb --module-depends-on --robot --module-syntax=Tcl --software-name=CDO
  642  eb  --dry-run gompi-2018b.eb
  643  find . -name gompi-2018b.eb
  644  find . -name gompi-2018b.eb -ls
  645  ll ./ebfiles_repo/gompi/gompi-2018b.eb
  646  cat ./ebfiles_repo/gompi/gompi-2018b.eb
  647  cat ./software/gompi/2018b/easybuild/gompi-2018b.eb
  648  cat ./software/gompi/2018b/easybuild/reprod/gompi-2018b.eb
  649  diff ./software/EasyBuild/4.0.1/easybuild/easyconfigs/g/gompi/gompi-2018b.eb ./software/gompi/2018b/easybuild/reprod/gompi-2018b.eb
  650  which cb
  651  eb --module-depends-on --robot --module-syntax=Tcl --search=CDO
  652  eb --dry-run intel-2018b
  653  eb --dry-run intel-2018b.eb
  654  eb --dry-run iomkl-2018b.eb
  655  eb --module-depends-on --robot --module-syntax=Tcl iomkl-2018b.eb
  656  eb --dry-run  foss-2019a.eb
  657  eb --module-depends-on --robot --module-syntax=Tcl foss-2019a.eb
  658  eb --module-depends-on --robot --module-syntax=Tcl FFTW-3.3.8-foss-2019a.eb
  659  eb -S FFTW-3.3.8
  660  eb --module-depends-on --robot --module-syntax=Tcl FFTW-3.3.8-gompi-2019a.eb
  661  eb --module-depends-on --robot --module-syntax=Tcl FFTW-3.3.8-gompi-2019b.eb
  662  eb --module-depends-on --force --robot --module-syntax=Lua FFTW-3.3.8-gompi-2019b.eb
  663  eb --module-depends-on --force --robot --module-syntax=Lua gompi-2019b.eb
  664  eb --module-depends-on --force --robot --module-syntax=Lua FFTW-3.3.8-gompi-2019b.eb
  665  htop  -u douglas
  666  screen -ls
  667  screen -R 3446.easybuild-intel
  668  screen -D -RR 3446.easybuild-intel
  669  eb FFTW-3.3.8-gompi-2019b.eb -D
  670  export EASYBUILD_PREFIX=/sw/EasyBuild
  671  module use /sw/EasyBuild/modules/all
  672  module load EasyBuild/4.0.1
  673  eb FFTW-3.3.8-gompi-2019b.eb -D
  674  eb --module-depends-on --robot --module-syntax=Lua --search=CDO
  675  eb intel-2018b.eb -D
  676  eb iomkl-2018b.eb -D
  677  module show bioinfo-tools
  678  cat /sw/mf/rackham/environment/bioinfo-tools
  679  export EASYBUILD_PREFIX=/sw/EasyBuild
  680  module use /sw/EasyBuild/modules/all
  681  module load EasyBuild/4.0.1
  682  ml
  683  ml BWA-0.7.17-intel-2018b
  684  module spider BWA
  685  ml BWA/0.7.17-intel-2018b
  686  ml
  687  which bwa
  688  ldd /sw/EasyBuild/software/BWA/0.7.17-intel-2018b/bin/bwa
  689  ml -zlib -binutils -iccifort
  690  ml
  691  ml -GCCcore -icc -ifort -impi -iimpi -imkl -intel
  692  ml
  693  ldd /sw/EasyBuild/software/BWA/0.7.17-intel-2018b/bin/bwa
  694  /sw/EasyBuild/software/BWA/0.7.17-intel-2018b/bin/bwa
  695  mshow zlib/1.2.11-GCCcore-7.3.0
  696  eb -D zlib-1.2.11-GCCcore-7.3.0
  697  echo $EASYBUILD_PREFIX 
  698  ml -BWA
  699  eb --dry-run zlib-1.2.11-GCCcore-7.3.0
  700  eb -D zlib-1.2.11-GCCcore-7.3.0
  701  eb -D zlib-1.2.11-GCCcore-7.3.0.eb
  702  ml zlib/1.2.11-GCCcore-7.3.0
  703  ml
  704  which gcc
  705  which g++
  706  which gfortran
  707  echo $MODULEPATH
  708  ll /sw/EasyBuild/modules/all
  709  ll /sw/EasyBuild/modules/all/BWA/0.7.17-intel-2018b.lua 
  710  cat /sw/EasyBuild/modules/all/BWA/0.7.17-intel-2018b.lua 
  711  cd /sw/EasyBuild/
  712  find . -name BWA-0.7.17-intel-2018b.eb
  713  cat ./software/EasyBuild/4.0.1/easybuild/easyconfigs/b/BWA/BWA-0.7.17-intel-2018b.eb
  714  eb -S zlib
  715  eb -D BWA-0.7.17-intel-2018b.eb
  716  eb -D zlib-1.2.11-GCCcore-7.3.0.eb
  717  cat /sw/EasyBuild/modules/all/GCCCore/7.3.0
  718  cat /sw/EasyBuild/modules/all/GCCcore/7.3.0 
  719  ml
  720  ml -GCCcore -zlib
  721  ml BWA/0.7.17-intel-2018b
  722  ml
  723  ml -BWA
  724  ml
  725  cat /sw/EasyBuild/modules/all/BWA/0.7.17-intel-2018b.lua 
  726  view /sw/EasyBuild/modules/all/OpenFOAM/4.1-foss-2016b 
  727  cd /sw/EasyBuild/modules/all/OpenFOAM/
  728  ll
  729  ml
  730  ml OpenFOAM/4.1-foss-2016b
  731  ml
  732  ml -OpenFOAM
  733  ml
  734  ml purge
  735  ll
  736  cp 4.1-foss-2016b 4
  737  vi 4
  738  ml OpenFOAM/4
  739  ml
  740  ml -OpenFOAM
  741  ml
  742  mshow python/3.7.2
  743  eb --module-depends-on --robot --module-syntax=Lua CDO-1.9.5-intel-2018b.eb
  744  view /sw/EasyBuild/software/CDO/1.9.5-intel-2018b/easybuild/easybuild-CDO-1.9.5-20191024.091522.log
  745  head /sw/EasyBuild/software/CDO/1.9.5-intel-2018b/easybuild/easybuild-CDO-1.9.5-20191024.091522.log
  746  cut -f4 -d' ' /sw/EasyBuild/software/CDO/1.9.5-intel-2018b/easybuild/easybuild-CDO-1.9.5-20191024.091522.log | cut -f1 d: | head
  747  cut -f4 -d' ' /sw/EasyBuild/software/CDO/1.9.5-intel-2018b/easybuild/easybuild-CDO-1.9.5-20191024.091522.log | cut -f1 -d: | head
  748  cut -f4 -d' ' /sw/EasyBuild/software/CDO/1.9.5-intel-2018b/easybuild/easybuild-CDO-1.9.5-20191024.091522.log | cut -f1 -d: | sort -u
  749  cut -f4 -d' ' /sw/EasyBuild/software/CDO/1.9.5-intel-2018b/easybuild/easybuild-CDO-1.9.5-20191024.091522.log | cut -f1 -d: | grep -F '.py' | head
  750  cut -f4 -d' ' /sw/EasyBuild/software/CDO/1.9.5-intel-2018b/easybuild/easybuild-CDO-1.9.5-20191024.091522.log | cut -f1 -d: | grep -F '.py' | sort -u
  751  cd ../..
  752  ll
  753  cd ..
  754  ll
  755  find . -name easyconfig.cfg
  756  which eb
  757  which eb
  758  view /sw/EasyBuild/software/EasyBuild/4.0.1/bin/eb
  759  which easybuild.main
  760  ll /sw/EasyBuild/software/EasyBuild/4.0.1/bin
  761  cd /sw/EasyBuild/
  762  find . -name easybuild.main
  763  ml
  764  ml purge
  765  find . -name 'easybuild.main*'
  766  echo $MODULEPATH
  767  ml EasyBuild/4.0.1
  768  find . -type f -exec grep -HnF easybuild.main {} \;
  769  view ./software/EasyBuild/4.0.1/easybuild/scripts/bootstrap_eb.py
  770  cd ./software/EasyBuild/4.0.1/lib/python2.7/site-packages/test/framework
  771  ll
  772  less build_log.py
  773  cd ..
  774  ll
  775  cd ..
  776  ll
  777  cd easybuild/
  778  ll
  779  cd base/
  780  ll
  781  cd ..
  782  view main.py
  783  view $(which eb)
  784  ll
  785  ml
  786  cd ../../..
  787  dirs
  788  cd ../..
  789  cd ..
  790  ll
  791  cd ..
  792  eb --module-depends-on --robot --module-syntax=Lua --search=CDO
  793  easybuild -D CDO-1.9.5-intel-2018a.eb
  794  eb -D CDO-1.9.5-intel-2018a.eb
  795  module spider CDO
  796  eb -D CDO-1.9.5-intel-2018b.eb
  797  cd ..
  798  cd mf/common/
  799  cd applications/
  800  ll
  801  ls
  802  cd CDO/
  803  ll
  804  cp ../OpenFOAM/4.1 1.9.5
  805  vi 1.9.5 
  806  cp 1.9.7.1-intel18.3 1.9.5
  807  cat ../OpenFOAM/4.1 >> 1.9.5
  808  vi 1.9.5 
  809  ml
  810  ll
  811  mfshow -a CDO
  812  all_mflink -f CDO 1.9.5
  813  all_mflink -f -a CDO 1.9.5
  814  ml
  815  ml CDO/1.9.5
  816  ml
  817  cdo --help
  818  ml
  819  module help CDO/1.9.5
  820  which cdo
  821  cdo --help
  822  module spider intel
  823  ll
  824  ml
  825  ml -CDO
  826  ml
  827  screen -ls
  828  screen -R bracken
  829  screen -D -RR bracken
  830  cd /sw/EasyBuild/
  831  ll
  832  export EASYBUILD_PREFIX=$PWD
  833  module use $EASYBUILD_PREFIX/modules/all
  834  mshow intel/18.3
  835  export INTEL_LICENSE_FILE=/sw/comp/intel/licenses
  836  eb --module-depends-on --robot intel-2018b.eb
  837  module load EasyBuild
  838  ml
  839  eb --module-depends-on --robot intel-2018b.eb
  840  view /sw/EasyBuild/software/intel/2018b/easybuild/easybuild-intel-2018b-20191018.175922.log
  841  ll
  842  pushd .
  843  cd modules/
  844  ll
  845  cd compiler/
  846  ll
  847  cd ../tool
  848  cd ../toolchain/
  849  ll
  850  cd intel/
  851  ll
  852  ml vim
  853  view 2018b.lua 
  854  view 2018b.lua ll
  855  ll
  856  cd ..
  857  ll
  858  cd ..
  859  ll
  860  cd compiler/
  861  ll
  862  cd icc/
  863  ll
  864  cat icc/2018.3.222-GCC-7.3.0-2.30
  865  cat 2018.3.222-GCC-7.3.0-2.30.lua 
  866  echo $INTEL_LICENSE_FILE 
  867  eb --module-depends-on BRAKER-2.1.2-intel-2019a.eb -D
  868  eb --module-depends-on BWA-0.7.17-intel-2018b.eb -D
  869  eb --module-depends-on --robot BWA-0.7.17-intel-2018b.eb
  870  ll
  871  unset INTEL_LICENSE_FILE 
  872  eb --module-depends-on --robot BWA-0.7.17-intel-2018b.eb
  873  view /sw/EasyBuild/software/BWA/0.7.17-intel-2018b/easybuild/easybuild-BWA-0.7.17-20191021.092418.log
  874  ll
  875  module spider BWA
  876  module load BWA/0.7.17-intel-2018b
  877  which bwa
  878  bwa --version
  879  bwa
  880  ll
  881  cat ../ifort/2018.3.222-GCC-7.3.0-2.30.lua 
  882  cd ..
  883  ll
  884  cd ..
  885  cd toolchain/
  886  ll
  887  cd iccifort/
  888  ll
  889  cat 2018.3.222-GCC-7.3.0-2.30.lua 
  890  cat ../intel/2018b.lua 
  891  type fixup
  892  cat /home/douglas/bin/fixup
  893  cat 2018.3.222-GCC-7.3.0-2.30.lua 
  894  cat ../../compiler/icc/2018.3.222-GCC-7.3.0-2.30.lua 
  895  ml
  896  ml -BWA
  897  ml
  898  which bwa
  899  ml BWA/0.7.17-intel-2018b
  900  ml
  901  which bwa
  902  ldd rackham5: /sw/data/uppnex/Kraken2 $ ml
  903  No modules loaded
  904  rackham5: /sw/data/uppnex/Kraken2 $ ldd /sw/EasyBuild/software/BWA/0.7.17-intel-2018b/bin/bwa
  905          linux-vdso.so.1 =>  (0x00007ffd2edfd000)
  906          libm.so.6 => /lib64/libm.so.6 (0x00002b0492c1b000)
  907          libz.so.1 => /lib64/libz.so.1 (0x00002b0492f1d000)
  908          libpthread.so.0 => /lib64/libpthread.so.0 (0x00002b0493133000)
  909          librt.so.1 => /lib64/librt.so.1 (0x00002b049334f000)
  910          libc.so.6 => /lib64/libc.so.6 (0x00002b0493557000)
  911          /lib64/ld-linux-x86-64.so.2 (0x00002b04929f7000)
  912  rackham5: /sw/data/uppnex/Kraken2 $ /sw/EasyBuild/software/BWA/0.7.17-intel-2018b/bin/bwa
  913  Program: bwa (alignment via Burrows-Wheeler transformation)
  914  Version: 0.7.17-r1188
  915  Contact: Heng Li <lh3@sanger.ac.uk>
  916  ll
  917  ldd /sw/EasyBuild/software/BWA/0.7.17-intel-2018b/bin/bwa
  918  pushd .
  919  cd
  920  ml
  921  ldd /sw/EasyBuild/software/BWA/0.7.17-intel-2018b/bin/bwa
  922  ll /sw/EasyBuild/software/
  923  mspid R
  924  mspid foss
  925  mspid prokka
  926  ml
  927  ml -BWA
  928  ml
  929  ml -vim
  930  ml
  931  eb --module-depends-on --robot --module-syntax=Tcl prokka-1.13-intel-2018a-BioPerl-1.7.2.eb -D
  932  eb --module-depends-on --robot --module-syntax=Tcl prokka-1.13.4-foss-2018b.7.2.eb -D
  933  eb --module-depends-on --robot --module-syntax=Tcl prokka-1.13.4-foss-2018b.eb -D
  934  eb --module-depends-on --robot --module-syntax=Tcl prokka-1.13.4-foss-2018b.eb
  935  eb --module-depends-on --robot --module-syntax=Tcl gompi-2018b.eb
  936  eb --module-depends-on --robot --module-syntax=Tcl FFTW-3.3.8-gompi-2018b.eb
  937  ml
  938  view /sw/EasyBuild/software/EasyBuild/4.0.1/easybuild/easyconfigs/f/FFTW/FFTW-3.3.8-gompi-2018b.eb
  939  :q
  940  eb --module-depends-on --robot --module-syntax=Tcl foss-2018b.eb
  941  eb --module-depends-on --robot --module-syntax=Tcl FFTW-3.3.8-gompi-2018b.eb
  942  view /scratch/eb-x8LvjB/easybuild-FFTW-3.3.8-20191021.131733.YzfXO.log
  943  locale
  944  LC_CTYPE=UTF-8
  945  locale
  946  export LC_CTYPE=UTF-8
  947  locale
  948  view /scratch/eb-x8LvjB/easybuild-FFTW-3.3.8-20191021.131733.YzfXO.log
  949  view /sw/EasyBuild/software/EasyBuild/4.0.1/easybuild/easyconfigs/g/gompi/gompi-2018b.eb 
  950  echo $MODULEPATH
  951  export MODULEPATH=/sw/EasyBuild/modules/all
  952  ml
  953  eb --module-depends-on --robot --module-syntax=Tcl gompi-2018b.eb
  954  eb --module-depends-on --robot --module-syntax=Tcl FFTW-3.3.8-gompi-2018b.eb
  955  ll /sw/EasyBuild/software/EasyBuild/4.0.1/easybuild/easyconfigs/g/gompic/gompic-2018b.eb 
  956  cat /sw/EasyBuild/software/EasyBuild/4.0.1/easybuild/easyconfigs/g/gompic/gompic-2018b.eb 
  957  cat /sw/EasyBuild/software/EasyBuild/4.0.1/easybuild/easyconfigs/f/foss/foss-2018b.eb 
  958  ll /sw/EasyBuild/software/EasyBuild/4.0.1/easybuild/easyconfigs/g/gompi/gompi-2018b.eb 
  959  cat /sw/EasyBuild/software/EasyBuild/4.0.1/easybuild/easyconfigs/g/gompi/gompi-2018b.eb 
  960  echo $EASYBUILD_PREFIX
  961  eb --module-depends-on --robot --module-syntax=Tcl FFTW-3.3.8-gompi-2018b.eb
  962  ml
  963  ml EasyBuil
  964  module load EasyBuild/3.8.1
  965  which eb
  966  eb --module-depends-on --robot --module-syntax=Tcl FFTW-3.3.8-gompi-2018b.eb
  967  eb FFTW-3.3.8-gompi-2018b.eb --robot --module-syntax=Tcl --installpath-software=/sw/EasyBuild/software/
  968  fixup /sw/EasyBuild/software/
  969  ll /sw/EasyBuild/software/EasyBuild/3.8.1/lib/python2.7/site-packages/easybuild_easyconfigs-3.8.1-py2.7.egg/easybuild/easyconfigs/g/GCC/GCC-4.1.2.eb
  970  fixup /sw/EasyBuild/software/
  971  module load EasyBuild/4.0.1
  972  fixup /sw/EasyBuild/software/
  973  fixup /sw/EasyBuild/software/ 2>/dev/null
  974  bg
  975  umask
  976  ll
  977  cd /sw/EasyBuild/
  978  ll
  979  cd software/
  980  cd ../Software/
  981  ll
  982  cd ..
  983  cd software/
  984  ll
  985  cd FFTW/
  986  ll
  987  pushd .
  988  cd
  989  cd uppmax
  990  ll
  991  finishedjobinfo --help
  992  finishedjobinfo -M snowy snic2019-8-221 | jobstats -p - -M snowy
  993  ll
  994  eog snowy-snic201*
  995  mspid usearch
  996  ml
  997  which eb
  998  eb --help
  999  exit
 1000  screen -R easybuild-intel
 1001  cd /sw/apps/GOTM
 1002  ll
 1003  cd 5.3-212-g6944e393/
 1004  ll
 1005  cd src/
 1006  ll
 1007  cd code/
 1008  ll
 1009  cd ..
 1010  cd rackham/
 1011  ll
 1012  cd ..
 1013  ll
 1014  ml git
 1015  ml intel/2018b
 1016  module use /sw/EasyBuild/modules/all
 1017  ml intel/2018b
 1018  ml
 1019  mspid CDO
 1020  ml
 1021  ml HDF5/1.10.2-intel-2018b
 1022  ml
 1023  ml netCDF/4.6.1-intel-2018b
 1024  ml
 1025  ll
 1026  cd 5.3-212-g6944e393/
 1027  ll
 1028  cd src/
 1029  ll
 1030  cd code/
 1031  ll
 1032  git submodule update --init --recursive
 1033  ml
 1034  ll
 1035  cd build
 1036  ll
 1037  cd ..
 1038  ll
 1039  git status
 1040  cat check_netcdf.sh 
 1041  ./check_netcdf.sh 
 1042  mspid cmake
 1043  mspid CMake
 1044  ml
 1045  ml CMake/3.12.1-GCCcore-7.3.0
 1046  ml
 1047  which cmake
 1048  ll
 1049  rm -rf build
 1050  cd ..
 1051  ll
 1052  rm -rf code
 1053  git clone --recursive https://github.com/gotm-model/code.git
 1054  cd code
 1055  git log | head
 1056  git status
 1057  cd ..
 1058  ll
 1059  wget https://github.com/gotm-model/code/archive/v5.2.1.tar.gz
 1060  ll
 1061  tar xzf v5.2.1.tar.gz 
 1062  ll
 1063  cd code-5.2.1/
 1064  ll
 1065  mkdir cd ..
 1066  ll
 1067  cd ..
 1068  ll
 1069  rm -rf *5.2*
 1070  ll
 1071  cd code/
 1072  ll
 1073  ./check_netcdf.sh 
 1074  mkdir build
 1075  cd build
 1076  pushd .
 1077  cd ..
 1078  cd rackham/
 1079  PREFIX=$PWD
 1080  cd /sw/apps/GOTM/5.3-212-g6944e393/src/code/build
 1081  ll
 1082  dirs
 1083  popd
 1084  echo $PREFIX
 1085  cmake .. -DGOTM_USE_BASE=on -DCMAKE_INSTALL_PREFIX=$PREFIX
 1086  cmake .. -DGOTM_USE_FABM=on -DCMAKE_INSTALL_PREFIX=$PREFIX
 1087  echo $CC
 1088  which icc
 1089  which ifort
 1090  CC=icc FC=ifort cmake .. -DGOTM_USE_FABM=on -DCMAKE_INSTALL_PREFIX=$PREFIX
 1091  cd ..
 1092  rm -rf build
 1093  mkdir build
 1094  cd build
 1095  mshow intel/18.3
 1096  CC=icc FC=ifort CXX=icpc F77=ifort F90=ifort cmake .. -DGOTM_USE_FABM=on -DCMAKE_INSTALL_PREFIX=$PREFIX
 1097  make
 1098  echo $INCLUDE
 1099  ml
 1100  netCDF-Fortran/4.4.4-intel-2018b
 1101  module load netCDF-Fortran/4.4.4-intel-2018b
 1102  ml
 1103  cd ..
 1104  rm -rf build
 1105  mkdir build
 1106  cd build
 1107  cd ..
 1108  ./check_netcdf.sh 
 1109  ml
 1110  cd build
 1111  CC=icc FC=ifort CXX=icpc F77=ifort F90=ifort cmake .. -DGOTM_USE_FABM=on -DCMAKE_INSTALL_PREFIX=$PREFIX
 1112  make
 1113  make install
 1114  cd ../../../rackham/
 1115  ll
 1116  cd bin/
 1117  ll
 1118  ./gotm --help
 1119  ./gotm --version
 1120  cd ../../..
 1121  mv 5.3-212-g6944e393 5.3-221-gac7ec88d
 1122  cd 5.3-221-gac7ec88d/
 1123  cd rackham/
 1124  PREFIX=$PWD
 1125  cd ../src/
 1126  ll
 1127  cd code/
 1128  ll
 1129  rm -rf build
 1130  ml
 1131  mkdir build
 1132  cd build
 1133  CC=icc FC=ifort CXX=icpc F77=ifort F90=ifort cmake .. -DGOTM_USE_FABM=on -DCMAKE_INSTALL_PREFIX=$PREFIX
 1134  make -j10
 1135  make install
 1136  cd ../../..
 1137  ll
 1138  cd rackham/
 1139  ll
 1140  cd bin/
 1141  ll
 1142  ./gotm
 1143  cd ../..
 1144  ll
 1145  cd 
 1146  cd /sw/apps/GOTM/5.3-221-gac7ec88d/rackham/bin
 1147  ll
 1148  ldd gotm
 1149  cd ../..
 1150  ll
 1151  cd ..
 1152  ll
 1153  mkdir mf
 1154  cd mf
 1155  pushd .
 1156  cd ../
 1157  cd ../CDO/mf
 1158  cd ..
 1159  ll
 1160  vi CDO-1.9.5_install-README.md
 1161  cd ../GOTM/
 1162  ll
 1163  cd mf
 1164  ll
 1165  cp ../../CDO/mf/1.9.5 5.3-221-gac7ec88d
 1166  vi 5.3-221-gac7ec88d 
 1167  cd ..
 1168  history >> GOTM-5.3-221-gac7ec88d_install-README.md
