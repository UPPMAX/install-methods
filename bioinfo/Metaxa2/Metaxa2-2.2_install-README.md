Metaxa2/2.2
========================

<https://microbiology.se/software/metaxa2/>

Used under license:
GPL v3

Structure creating script (makeroom_Metaxa2_2.2.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/Metaxa2/makeroom_2.2.sh

   59  cd ..
   60  ll
   61  cd ..
   62  ll
   63  cd 4.0.0beta2/
   64  ll
   65  cd rackham/
   66  ll
   67  cd bin/
   68  ll
   69  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
   70  sed -i -e 's,^#!.*/perl.*$,#!/usr/bin/env perl,' $(file * | grep 'Perl script' | cut -f1 -d:)
   71  ll
   72  cd ..
   73  ll
   74  cd include/
   75  ll
   76  cd ../lib
   77  ll
   78  cd pkgconfig/
   79  ll
   80  cat mummer.pc 
   81  cd ..
   82  ll
   83  cd libexec/
   84  ll
   85  cd mummer/
   86  ll
   87  ldd *
   88  ml
   89  cd ..
   90  ll
   91  cd ..
   92  ll
   93  cd ../..
   94  cd 3.9.4alpha/
   95  ll
   96  cd rackham/
   97  ll
   98  cd lib/
   99  cd ../bin/
  100  ll
  101  ldd *
  102  ll
  103  cd ..
  104  ll
  105  cd ..
  106  ll
  107  cd src/
  108  ll
  109  rm -rf mummer-3.9.4alpha
  110  tar xzf mummer-3.9.4alpha.tar.gz 
  111  cat ../../MUMmer-3.9.4alpha-install-README.md 
  112  vi ../../MUMmer-3.9.4alpha-install-README.md 
  113  ll
  114   mummer-3.9.4alpha/
  115  cd ../..
  116  ll
  117  cat MUMmer-3.9.4alpha-install-README.md
  118      VERSION=3.9.4alpha
  119  cd $VERSION
  120     PREFIX=$PWD/$CLUSTER
  121  echo $PREFIX
  122  ll $PREFIX
  123  ml
  124      module load gcc/6.3.0
  125  ml -perl
  126  vi ../MUMmer-3.9.4alpha-install-README.md 
  127  ll
  128  ml
  129  cd src/
  130  ll
  131  cd mummer-3.9.4alpha/
  132  ll
  133  make clean
  134  ./configure --help
  135  ./configure --prefix=$PREFIX
  136  ./configure --with-int128 --prefix=$PREFIX
  137  make
  138  make install
  139  ml
  140  ml -gcc
  141  ll
  142  cd ../../
  143  ll
  144  cd rackham/
  145  ll
  146  cd bin/
  147  ll
  148  cd ../lib/
  149  ll
  150  ldd libumdmummer.so
  151  ml
  152  cd ../bin/
  153  ll
  154  ./nucmer 
  155  ldd nucmer 
  156  ml patchelf
  157  patchelf --print-rpath nucmer
  158  patchelf --set-rpath $(patchelf --print-rpath nucmer):/sw/comp/gcc/6.3.0_rackham/lib:/sw/comp/gcc/6.3.0_rackham/lib64 nucmer
  159  patchelf --print-rpath nucmer
  160  ./nucmer 
  161  ldd mummer
  162  cd ../lib
  163  ll
  164  ldd libumdmummer.so.0.0.0
  165  patchelf --print-rpath libumdmummer.so.0.0.0
  166  patchelf --set-rpath /sw/comp/gcc/6.3.0_rackham/lib:/sw/comp/gcc/6.3.0_rackham/lib64 libumdmummer.so.0.0.0 
  167  patchelf --print-rpath libumdmummer.so.0.0.0
  168  ldd libumdmummer.so.0.0.0
  169  cd ../bin/
  170  ldd mummer
  171  patchelf --print-rpath mummer
  172  patchelf --set-rpath $(patchelf --print-rpath nucmer):/sw/comp/gcc/6.3.0_rackham/lib:/sw/comp/gcc/6.3.0_rackham/lib64 mummer
  173  ldd mummer
  174  ll
  175  ldd annotate 
  176  ldd * | grep ' not found ' | cut -f1 -d: | sort -u
  177  ldd * 2>&1 | grep ' not found ' | cut -f1 -d: | sort -u
  178  patchelf --print-rpath mummer
  179  patchelf --set-rpath /sw/bioinfo/MUMmer/3.9.4alpha/rackham/lib:/sw/comp/gcc/6.3.0_rackham/lib:/sw/comp/gcc/6.3.0_rackham/lib64 mummer
  180  patchelf --print-rpath mummer
  181  for F in $(ldd * 2>&1 | grep ' not found ' | cut -f1 -d: | sort -u) ; do echo $F; patchelf --set-rpath $(patchelf --print-rpath $F):/sw/comp/gcc/6.3.0_rackham/lib:/sw/comp/gcc/6.3.0_rackham/lib64 $F ; done
  182  ml
  183  ll
  184  ldd *
  185  ./mummer
  186  ll
  187  cd ..
  188  ll
  189  cd ..
  190  ll
  191  history >> MUMmer-3.9.4alpha-install-README.md
  192  vi MUMmer-3.9.4alpha-install-README.md
  193  ll
  194  cat MUMmer-4.0.0beta2-install-README.md
  195  ll
  196  cd 4.0.0beta2/
  197  ll
  198  cd rackham/
  199  ll
  200  cd bin/
  201  ll
  202  ml
  203  ldd *
  204  ll
  205  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  206  vi ../../../MUMmer-4.0.0beta2-install-README.md 
  207  ll
  208  less dnadiff 
  209  cd ../..
  210  ll
  211  echo $PREFIX
  212  cd rackham/
  213  PREFIX=$PWD
  214  cd ../src/
  215  ll
  216  cd mummer-4.0.0beta2/
  217  ll
  218  make clean
  219  ml
  220  ml gcc/6.3.0
  221  ml
  222  ./configure --help
  223  ./configure --with-int128 --prefix=$PREFIX
  224  make
  225  make install
  226  cd ../
  227  cd ..
  228  ll
  229  cd rackham/
  230  ll
  231  cd bin/
  232  ll
  233  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  234  sed -i -e 's,^#!.*/perl.*$,#!/usr/bin/env perl,' $(file * | grep 'Perl script' | cut -f1 -d:)
  235  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  236  ml
  237  ml -gcc
  238  ll
  239  ldd *
  240  cd ../libexec/
  241  ll
  242  cd mummer/
  243  ll
  244  ldd *
  245  cd ../..
  246  cd ..
  247  ll
  248  vi MUMmer-4.0.0beta2-install-README.md
  249  head | tail
  250  history | tail -20
  251  vi MUMmer-4.0.0beta2-install-README.md
  252  ll
  253  cd mf
  254  ll
  255  vi 4.0.0beta2 
  256  ll
  257  vi 3.9.4alpha 
  258  ml
  259  ml -patchelf
  260  ll
  261  cd ..
  262  ml MUMmer/3.9.4alpha
  263  which mummer
  264  nummer
  265  nucmer
  266  mummer
  267  cd 3.9.4alpha/
  268  ll
  269  cd rackham/
  270  ll
  271  cd bin/
  272  ll
  273  ./mummer
  274  cd ..
  275  ll
  276  cd ..
  277  ll
  278  cd src/
  279  ll
  280  cd mummer-3.9.4alpha/
  281  ll
  282  ml
  283  make clean
  284  ml gcc/6.3.0
  285  cd ../../rackham/
  286  PREFIX=$PWD
  287  cd -
  288  echo $PREFIX
  289  ./configure --with-int128 --prefix=$PREFIX
  290  make -j3
  291  make install
  292  cd ../..
  293  ll
  294  cd rackham/
  295  ll
  296  cd lib/
  297  ll
  298  ldd libumdmummer.so.0.0.0 
  299  ml -gcc
  300  ml
  301  ldd libumdmummer.so.0.0.0 
  302  cd ../bin
  303  ll
  304  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  305  sed -i -e 's,^#!.*/perl.*$,#!/usr/bin/env perl,' $(file * | grep 'Perl script' | cut -f1 -d:)
  306  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  307  ldd annotate 
  308  cd ..
  309  ll
  310  cd ../src/
  311  ll
  312  rm -rf mummer-3.9.4alpha
  313  tar xzf mummer-3.9.4alpha.tar.gz 
  314  cd mummer-3.9.4alpha/
  315  ll
  316  ml
  317  ml -MUMmer
  318  ml gcc/6.3.0
  319  ll
  320  echo $PREFIX
  321  ./configure --with-int128 --prefix=$PREFIX
  322  make -j3
  323  make install
  324  cd $PREFIX
  325  ll
  326  cd lib/
  327  ll
  328  ml
  329  ml -gcc
  330  ldd libumdmummer.so.0.0.0
  331  cd mummer/
  332  ll
  333  cd ..
  334  ll
  335  cd ../bin/
  336  ll
  337  sed -i -e 's,^#!.*/perl.*$,#!/usr/bin/env perl,' $(file * | grep 'Perl script' | cut -f1 -d:)
  338  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  339  ldd * 2>&1 | grep ' not found ' | cut -f1 -d: | sort -u
  340  ldd annotate 
  341  ml patchelf
  342  for F in $(ldd * 2>&1 | grep ' not found ' | cut -f1 -d: | sort -u) ; do echo $F; patchelf --set-rpath $(patchelf --print-rpath $F):/sw/comp/gcc/6.3.0_rackham/lib:/sw/comp/gcc/6.3.0_rackham/lib64 $F ; done
  343  ml -gcc -patchelf
  344  ml patchelf
  345  ll
  346  ldd annotate 
  347  ./annotate -h
  348  ./nucmer -h
  349  ./mummer -h
  350  ll
  351  patchelf --print-rpath annotate 
  352  patchelf --print-rpath postnuc
  353  ldd prepro
  354  cd ../..
  355  ll
  356  cd ..
  357  ll
  358  vi MUMmer-3.9.4alpha-install-README.md
  359  ll
  360  ml
  361  cd /sw/bioinfo/abyss/
  362  ll
  363  cat abyss-2.0.2-install-README.md 
  364  ml
  365  ll /sw/mf/*/parallel/openmpi/2.1.0
  366  ll -d /sw/mf/*/parallel/openmpi
  367  ll /sw/mf/*/parallel/openmpi/
  368  pushd .
  369  cd /sw/mf/bianca/parallel/openmpi
  370  ll
  371  cd .snapshot
  372  ll
  373  ll /sw/bioinfo/abyss/
  374  ll /sw/bioinfo/abyss/mf/
  375  ssh douglas-sens2017625@bianca
  376  dirs
  377  popd
  378  git status
  379  git add .
  380  git pull
  381  git commit -a -m 'more installs'
  382  git push
  383  cd /sw/EasyBuild
  384  module use /sw/EasyBuild/modules/all
  385  module load EasyBuild/4.0.1
  386  export EASYBUILD_PREFIX=/sw/EasyBuild
  387  eb --show-config
  388  export EASYBUILD_PREFIX=/sw/EasyBuild foss-2018b
  389  export EASYBUILD_PREFIX=/sw/EasyBuild foss-2018b.eb
  390  eb --module-depends-on --robot --module-syntax=Tcl foss-2018b.eb
  391  ll sources/
  392  ll sources/f/FFTW/fftw-3.3.8.tar.gz 
  393  rm sources/f/FFTW/fftw-3.3.8.tar.gz 
  394  eb --module-depends-on --robot --module-syntax=Tcl foss-2018b.eb
  395  eb --show-full-config
  396  mspid abyss
  397  mshow abyss/2.0.2-k128
  398  ll /sw/EasyBuild/ebfiles_repo
  399  ll /sw/EasyBuild/ebfiles_repo/FFTW/
  400  find . -name FFTW-3.3.8-gompi-2018b.eb
  401  ml
  402  eb --show-config
  403  eb --help
  404  ll
  405  eb --module-depends-on --robot --module-syntax=Tcl CDO
  406  eb --module-depends-on --robot --module-syntax=Tcl --software=CDO
  407  eb --module-depends-on --robot --module-syntax=Tcl --software-name=CDO
  408  eb  --dry-run gompi-2018b.eb
  409  find . -name gompi-2018b.eb
  410  find . -name gompi-2018b.eb -ls
  411  ll ./ebfiles_repo/gompi/gompi-2018b.eb
  412  cat ./ebfiles_repo/gompi/gompi-2018b.eb
  413  cat ./software/gompi/2018b/easybuild/gompi-2018b.eb
  414  cat ./software/gompi/2018b/easybuild/reprod/gompi-2018b.eb
  415  diff ./software/EasyBuild/4.0.1/easybuild/easyconfigs/g/gompi/gompi-2018b.eb ./software/gompi/2018b/easybuild/reprod/gompi-2018b.eb
  416  which cb
  417  eb --module-depends-on --robot --module-syntax=Tcl --search=CDO
  418  eb --dry-run intel-2018b
  419  eb --dry-run intel-2018b.eb
  420  eb --dry-run iomkl-2018b.eb
  421  eb --module-depends-on --robot --module-syntax=Tcl iomkl-2018b.eb
  422  eb --dry-run  foss-2019a.eb
  423  eb --module-depends-on --robot --module-syntax=Tcl foss-2019a.eb
  424  eb --module-depends-on --robot --module-syntax=Tcl FFTW-3.3.8-foss-2019a.eb
  425  eb -S FFTW-3.3.8
  426  eb --module-depends-on --robot --module-syntax=Tcl FFTW-3.3.8-gompi-2019a.eb
  427  eb --module-depends-on --robot --module-syntax=Tcl FFTW-3.3.8-gompi-2019b.eb
  428  eb --module-depends-on --force --robot --module-syntax=Lua FFTW-3.3.8-gompi-2019b.eb
  429  eb --module-depends-on --force --robot --module-syntax=Lua gompi-2019b.eb
  430  eb --module-depends-on --force --robot --module-syntax=Lua FFTW-3.3.8-gompi-2019b.eb
  431  htop  -u douglas
  432  screen -ls
  433  screen -R 3446.easybuild-intel
  434  screen -D -RR 3446.easybuild-intel
  435  eb FFTW-3.3.8-gompi-2019b.eb -D
  436  export EASYBUILD_PREFIX=/sw/EasyBuild
  437  module use /sw/EasyBuild/modules/all
  438  module load EasyBuild/4.0.1
  439  eb FFTW-3.3.8-gompi-2019b.eb -D
  440  eb --module-depends-on --robot --module-syntax=Lua --search=CDO
  441  eb intel-2018b.eb -D
  442  eb iomkl-2018b.eb -D
  443  module show bioinfo-tools
  444  cat /sw/mf/rackham/environment/bioinfo-tools
  445  export EASYBUILD_PREFIX=/sw/EasyBuild
  446  module use /sw/EasyBuild/modules/all
  447  module load EasyBuild/4.0.1
  448  ml
  449  ml BWA-0.7.17-intel-2018b
  450  module spider BWA
  451  ml BWA/0.7.17-intel-2018b
  452  ml
  453  which bwa
  454  ldd /sw/EasyBuild/software/BWA/0.7.17-intel-2018b/bin/bwa
  455  ml -zlib -binutils -iccifort
  456  ml
  457  ml -GCCcore -icc -ifort -impi -iimpi -imkl -intel
  458  ml
  459  ldd /sw/EasyBuild/software/BWA/0.7.17-intel-2018b/bin/bwa
  460  /sw/EasyBuild/software/BWA/0.7.17-intel-2018b/bin/bwa
  461  mshow zlib/1.2.11-GCCcore-7.3.0
  462  eb -D zlib-1.2.11-GCCcore-7.3.0
  463  echo $EASYBUILD_PREFIX 
  464  ml -BWA
  465  eb --dry-run zlib-1.2.11-GCCcore-7.3.0
  466  eb -D zlib-1.2.11-GCCcore-7.3.0
  467  eb -D zlib-1.2.11-GCCcore-7.3.0.eb
  468  ml zlib/1.2.11-GCCcore-7.3.0
  469  ml
  470  which gcc
  471  which g++
  472  which gfortran
  473  echo $MODULEPATH
  474  ll /sw/EasyBuild/modules/all
  475  ll /sw/EasyBuild/modules/all/BWA/0.7.17-intel-2018b.lua 
  476  cat /sw/EasyBuild/modules/all/BWA/0.7.17-intel-2018b.lua 
  477  cd /sw/EasyBuild/
  478  find . -name BWA-0.7.17-intel-2018b.eb
  479  cat ./software/EasyBuild/4.0.1/easybuild/easyconfigs/b/BWA/BWA-0.7.17-intel-2018b.eb
  480  eb -S zlib
  481  eb -D BWA-0.7.17-intel-2018b.eb
  482  eb -D zlib-1.2.11-GCCcore-7.3.0.eb
  483  cat /sw/EasyBuild/modules/all/GCCCore/7.3.0
  484  cat /sw/EasyBuild/modules/all/GCCcore/7.3.0 
  485  ml
  486  ml -GCCcore -zlib
  487  ml BWA/0.7.17-intel-2018b
  488  ml
  489  ml -BWA
  490  ml
  491  cat /sw/EasyBuild/modules/all/BWA/0.7.17-intel-2018b.lua 
  492  view /sw/EasyBuild/modules/all/OpenFOAM/4.1-foss-2016b 
  493  cd /sw/EasyBuild/modules/all/OpenFOAM/
  494  ll
  495  ml
  496  ml OpenFOAM/4.1-foss-2016b
  497  ml
  498  ml -OpenFOAM
  499  ml
  500  ml purge
  501  ll
  502  cp 4.1-foss-2016b 4
  503  vi 4
  504  ml OpenFOAM/4
  505  ml
  506  ml -OpenFOAM
  507  ml
  508  mshow python/3.7.2
  509  eb --module-depends-on --robot --module-syntax=Lua CDO-1.9.5-intel-2018b.eb
  510  view /sw/EasyBuild/software/CDO/1.9.5-intel-2018b/easybuild/easybuild-CDO-1.9.5-20191024.091522.log
  511  head /sw/EasyBuild/software/CDO/1.9.5-intel-2018b/easybuild/easybuild-CDO-1.9.5-20191024.091522.log
  512  cut -f4 -d' ' /sw/EasyBuild/software/CDO/1.9.5-intel-2018b/easybuild/easybuild-CDO-1.9.5-20191024.091522.log | cut -f1 d: | head
  513  cut -f4 -d' ' /sw/EasyBuild/software/CDO/1.9.5-intel-2018b/easybuild/easybuild-CDO-1.9.5-20191024.091522.log | cut -f1 -d: | head
  514  cut -f4 -d' ' /sw/EasyBuild/software/CDO/1.9.5-intel-2018b/easybuild/easybuild-CDO-1.9.5-20191024.091522.log | cut -f1 -d: | sort -u
  515  cut -f4 -d' ' /sw/EasyBuild/software/CDO/1.9.5-intel-2018b/easybuild/easybuild-CDO-1.9.5-20191024.091522.log | cut -f1 -d: | grep -F '.py' | head
  516  cut -f4 -d' ' /sw/EasyBuild/software/CDO/1.9.5-intel-2018b/easybuild/easybuild-CDO-1.9.5-20191024.091522.log | cut -f1 -d: | grep -F '.py' | sort -u
  517  cd ../..
  518  ll
  519  cd ..
  520  ll
  521  find . -name easyconfig.cfg
  522  which eb
  523  which eb
  524  view /sw/EasyBuild/software/EasyBuild/4.0.1/bin/eb
  525  which easybuild.main
  526  ll /sw/EasyBuild/software/EasyBuild/4.0.1/bin
  527  cd /sw/EasyBuild/
  528  find . -name easybuild.main
  529  ml
  530  ml purge
  531  find . -name 'easybuild.main*'
  532  echo $MODULEPATH
  533  ml EasyBuild/4.0.1
  534  find . -type f -exec grep -HnF easybuild.main {} \;
  535  view ./software/EasyBuild/4.0.1/easybuild/scripts/bootstrap_eb.py
  536  cd ./software/EasyBuild/4.0.1/lib/python2.7/site-packages/test/framework
  537  ll
  538  less build_log.py
  539  cd ..
  540  ll
  541  cd ..
  542  ll
  543  cd easybuild/
  544  ll
  545  cd base/
  546  ll
  547  cd ..
  548  view main.py
  549  view $(which eb)
  550  ll
  551  ml
  552  cd ../../..
  553  dirs
  554  cd ../..
  555  cd ..
  556  ll
  557  cd ..
  558  eb --module-depends-on --robot --module-syntax=Lua --search=CDO
  559  easybuild -D CDO-1.9.5-intel-2018a.eb
  560  eb -D CDO-1.9.5-intel-2018a.eb
  561  module spider CDO
  562  eb -D CDO-1.9.5-intel-2018b.eb
  563  cd ..
  564  cd mf/common/
  565  cd applications/
  566  ll
  567  ls
  568  cd CDO/
  569  ll
  570  cp ../OpenFOAM/4.1 1.9.5
  571  vi 1.9.5 
  572  cp 1.9.7.1-intel18.3 1.9.5
  573  cat ../OpenFOAM/4.1 >> 1.9.5
  574  vi 1.9.5 
  575  ml
  576  ll
  577  mfshow -a CDO
  578  all_mflink -f CDO 1.9.5
  579  all_mflink -f -a CDO 1.9.5
  580  ml
  581  ml CDO/1.9.5
  582  ml
  583  cdo --help
  584  ml
  585  module help CDO/1.9.5
  586  which cdo
  587  cdo --help
  588  module spider intel
  589  ll
  590  ml
  591  ml -CDO
  592  ml
  593  screen -ls
  594  screen -R bracken
  595  screen -D -RR bracken
  596  cd /sw/EasyBuild/
  597  ll
  598  export EASYBUILD_PREFIX=$PWD
  599  module use $EASYBUILD_PREFIX/modules/all
  600  mshow intel/18.3
  601  export INTEL_LICENSE_FILE=/sw/comp/intel/licenses
  602  eb --module-depends-on --robot intel-2018b.eb
  603  module load EasyBuild
  604  ml
  605  eb --module-depends-on --robot intel-2018b.eb
  606  view /sw/EasyBuild/software/intel/2018b/easybuild/easybuild-intel-2018b-20191018.175922.log
  607  ll
  608  pushd .
  609  cd modules/
  610  ll
  611  cd compiler/
  612  ll
  613  cd ../tool
  614  cd ../toolchain/
  615  ll
  616  cd intel/
  617  ll
  618  ml vim
  619  view 2018b.lua 
  620  view 2018b.lua ll
  621  ll
  622  cd ..
  623  ll
  624  cd ..
  625  ll
  626  cd compiler/
  627  ll
  628  cd icc/
  629  ll
  630  cat icc/2018.3.222-GCC-7.3.0-2.30
  631  cat 2018.3.222-GCC-7.3.0-2.30.lua 
  632  echo $INTEL_LICENSE_FILE 
  633  eb --module-depends-on BRAKER-2.1.2-intel-2019a.eb -D
  634  eb --module-depends-on BWA-0.7.17-intel-2018b.eb -D
  635  eb --module-depends-on --robot BWA-0.7.17-intel-2018b.eb
  636  ll
  637  unset INTEL_LICENSE_FILE 
  638  eb --module-depends-on --robot BWA-0.7.17-intel-2018b.eb
  639  view /sw/EasyBuild/software/BWA/0.7.17-intel-2018b/easybuild/easybuild-BWA-0.7.17-20191021.092418.log
  640  ll
  641  module spider BWA
  642  module load BWA/0.7.17-intel-2018b
  643  which bwa
  644  bwa --version
  645  bwa
  646  ll
  647  cat ../ifort/2018.3.222-GCC-7.3.0-2.30.lua 
  648  cd ..
  649  ll
  650  cd ..
  651  cd toolchain/
  652  ll
  653  cd iccifort/
  654  ll
  655  cat 2018.3.222-GCC-7.3.0-2.30.lua 
  656  cat ../intel/2018b.lua 
  657  type fixup
  658  cat /home/douglas/bin/fixup
  659  cat 2018.3.222-GCC-7.3.0-2.30.lua 
  660  cat ../../compiler/icc/2018.3.222-GCC-7.3.0-2.30.lua 
  661  ml
  662  ml -BWA
  663  ml
  664  which bwa
  665  ml BWA/0.7.17-intel-2018b
  666  ml
  667  which bwa
  668  ldd rackham5: /sw/data/uppnex/Kraken2 $ ml
  669  No modules loaded
  670  rackham5: /sw/data/uppnex/Kraken2 $ ldd /sw/EasyBuild/software/BWA/0.7.17-intel-2018b/bin/bwa
  671          linux-vdso.so.1 =>  (0x00007ffd2edfd000)
  672          libm.so.6 => /lib64/libm.so.6 (0x00002b0492c1b000)
  673          libz.so.1 => /lib64/libz.so.1 (0x00002b0492f1d000)
  674          libpthread.so.0 => /lib64/libpthread.so.0 (0x00002b0493133000)
  675          librt.so.1 => /lib64/librt.so.1 (0x00002b049334f000)
  676          libc.so.6 => /lib64/libc.so.6 (0x00002b0493557000)
  677          /lib64/ld-linux-x86-64.so.2 (0x00002b04929f7000)
  678  rackham5: /sw/data/uppnex/Kraken2 $ /sw/EasyBuild/software/BWA/0.7.17-intel-2018b/bin/bwa
  679  Program: bwa (alignment via Burrows-Wheeler transformation)
  680  Version: 0.7.17-r1188
  681  Contact: Heng Li <lh3@sanger.ac.uk>
  682  ll
  683  ldd /sw/EasyBuild/software/BWA/0.7.17-intel-2018b/bin/bwa
  684  pushd .
  685  cd
  686  ml
  687  ldd /sw/EasyBuild/software/BWA/0.7.17-intel-2018b/bin/bwa
  688  ll /sw/EasyBuild/software/
  689  mspid R
  690  mspid foss
  691  mspid prokka
  692  ml
  693  ml -BWA
  694  ml
  695  ml -vim
  696  ml
  697  eb --module-depends-on --robot --module-syntax=Tcl prokka-1.13-intel-2018a-BioPerl-1.7.2.eb -D
  698  eb --module-depends-on --robot --module-syntax=Tcl prokka-1.13.4-foss-2018b.7.2.eb -D
  699  eb --module-depends-on --robot --module-syntax=Tcl prokka-1.13.4-foss-2018b.eb -D
  700  eb --module-depends-on --robot --module-syntax=Tcl prokka-1.13.4-foss-2018b.eb
  701  eb --module-depends-on --robot --module-syntax=Tcl gompi-2018b.eb
  702  eb --module-depends-on --robot --module-syntax=Tcl FFTW-3.3.8-gompi-2018b.eb
  703  ml
  704  view /sw/EasyBuild/software/EasyBuild/4.0.1/easybuild/easyconfigs/f/FFTW/FFTW-3.3.8-gompi-2018b.eb
  705  :q
  706  eb --module-depends-on --robot --module-syntax=Tcl foss-2018b.eb
  707  eb --module-depends-on --robot --module-syntax=Tcl FFTW-3.3.8-gompi-2018b.eb
  708  view /scratch/eb-x8LvjB/easybuild-FFTW-3.3.8-20191021.131733.YzfXO.log
  709  locale
  710  LC_CTYPE=UTF-8
  711  locale
  712  export LC_CTYPE=UTF-8
  713  locale
  714  view /scratch/eb-x8LvjB/easybuild-FFTW-3.3.8-20191021.131733.YzfXO.log
  715  view /sw/EasyBuild/software/EasyBuild/4.0.1/easybuild/easyconfigs/g/gompi/gompi-2018b.eb 
  716  echo $MODULEPATH
  717  export MODULEPATH=/sw/EasyBuild/modules/all
  718  ml
  719  eb --module-depends-on --robot --module-syntax=Tcl gompi-2018b.eb
  720  eb --module-depends-on --robot --module-syntax=Tcl FFTW-3.3.8-gompi-2018b.eb
  721  ll /sw/EasyBuild/software/EasyBuild/4.0.1/easybuild/easyconfigs/g/gompic/gompic-2018b.eb 
  722  cat /sw/EasyBuild/software/EasyBuild/4.0.1/easybuild/easyconfigs/g/gompic/gompic-2018b.eb 
  723  cat /sw/EasyBuild/software/EasyBuild/4.0.1/easybuild/easyconfigs/f/foss/foss-2018b.eb 
  724  ll /sw/EasyBuild/software/EasyBuild/4.0.1/easybuild/easyconfigs/g/gompi/gompi-2018b.eb 
  725  cat /sw/EasyBuild/software/EasyBuild/4.0.1/easybuild/easyconfigs/g/gompi/gompi-2018b.eb 
  726  echo $EASYBUILD_PREFIX
  727  eb --module-depends-on --robot --module-syntax=Tcl FFTW-3.3.8-gompi-2018b.eb
  728  ml
  729  ml EasyBuil
  730  module load EasyBuild/3.8.1
  731  which eb
  732  eb --module-depends-on --robot --module-syntax=Tcl FFTW-3.3.8-gompi-2018b.eb
  733  eb FFTW-3.3.8-gompi-2018b.eb --robot --module-syntax=Tcl --installpath-software=/sw/EasyBuild/software/
  734  fixup /sw/EasyBuild/software/
  735  ll /sw/EasyBuild/software/EasyBuild/3.8.1/lib/python2.7/site-packages/easybuild_easyconfigs-3.8.1-py2.7.egg/easybuild/easyconfigs/g/GCC/GCC-4.1.2.eb
  736  fixup /sw/EasyBuild/software/
  737  module load EasyBuild/4.0.1
  738  fixup /sw/EasyBuild/software/
  739  fixup /sw/EasyBuild/software/ 2>/dev/null
  740  bg
  741  umask
  742  ll
  743  cd /sw/EasyBuild/
  744  ll
  745  cd software/
  746  cd ../Software/
  747  ll
  748  cd ..
  749  cd software/
  750  ll
  751  cd FFTW/
  752  ll
  753  pushd .
  754  cd
  755  cd uppmax
  756  ll
  757  finishedjobinfo --help
  758  finishedjobinfo -M snowy snic2019-8-221 | jobstats -p - -M snowy
  759  ll
  760  eog snowy-snic201*
  761  mspid usearch
  762  ml
  763  which eb
  764  eb --help
  765  exit
  766  screen -R easybuild-intel
  767  which eb
  768  eb -S CMake
  769  eb -S netcddf
  770  eb -S netcdf
  771  eb -D netCDF-Fortran-4.4.4-intel-2018b.eb
  772  eb --module-depends-on --robot --module-syntax=Lua -D netCDF-Fortran-4.4.4-intel-2018b.eb
  773  eb --module-depends-on --robot --module-syntax=Lua  netCDF-Fortran-4.4.4-intel-2018b.eb
  774  ml
  775  eb --module-depends-on --robot --module-syntax=Lua  netCDF-Fortran-4.4.4-intel-2018b.eb
  776  ml EasyBuild/4.0.1
  777  eb --module-depends-on --robot --module-syntax=Lua  netCDF-Fortran-4.4.4-intel-2018b.eb
  778  module spider netcdf
  779  eb --show-full-config
  780  cd ../apps/CDO/
  781  ll
  782  history >> CDO-1.9.5_install-README.md
  783  cd mf
  784  ll
  785  cp -av /sw/mf/common/applications/CDO/1.9.5 .
  786  ll
  787  cat 1.9.5
  788  export EASYBUILD_PREFIX=/sw/EasyBuild
  789  module use $EASYBUILD_PREFIX/modules/all
  790  ml EasyBuild/4.0.1
  791  eb -S Magics
  792  eb -S LINKS
  793  eb -S maker
  794  eb -S blast
  795  which eb
  796  eb -S go
  797  mspid go
  798  eb -S meta
  799  eb --module-depends-on --force --robot --module-syntax=Lua Metaxa2-2.2-gompi-2019a.eb
  800  eb  Metaxa2-2.2-gompi-2019a.eb -D
  801  screen -ls
  802  screen -S GOTM
  803  cd /sw/apps/GOTM
  804  ll
  805  cd 5.3-212-g6944e393/
  806  ll
  807  cd src/
  808  ll
  809  cd code/
  810  ll
  811  cd ..
  812  cd rackham/
  813  ll
  814  cd ..
  815  ll
  816  ml git
  817  ml intel/2018b
  818  module use /sw/EasyBuild/modules/all
  819  ml intel/2018b
  820  ml
  821  mspid CDO
  822  ml
  823  ml HDF5/1.10.2-intel-2018b
  824  ml
  825  ml netCDF/4.6.1-intel-2018b
  826  ml
  827  ll
  828  cd 5.3-212-g6944e393/
  829  ll
  830  cd src/
  831  ll
  832  cd code/
  833  ll
  834  git submodule update --init --recursive
  835  ml
  836  ll
  837  cd build
  838  ll
  839  cd ..
  840  ll
  841  git status
  842  cat check_netcdf.sh 
  843  ./check_netcdf.sh 
  844  mspid cmake
  845  mspid CMake
  846  ml
  847  ml CMake/3.12.1-GCCcore-7.3.0
  848  ml
  849  which cmake
  850  ll
  851  rm -rf build
  852  cd ..
  853  ll
  854  rm -rf code
  855  git clone --recursive https://github.com/gotm-model/code.git
  856  cd code
  857  git log | head
  858  git status
  859  cd ..
  860  ll
  861  wget https://github.com/gotm-model/code/archive/v5.2.1.tar.gz
  862  ll
  863  tar xzf v5.2.1.tar.gz 
  864  ll
  865  cd code-5.2.1/
  866  ll
  867  mkdir cd ..
  868  ll
  869  cd ..
  870  ll
  871  rm -rf *5.2*
  872  ll
  873  cd code/
  874  ll
  875  ./check_netcdf.sh 
  876  mkdir build
  877  cd build
  878  pushd .
  879  cd ..
  880  cd rackham/
  881  PREFIX=$PWD
  882  cd /sw/apps/GOTM/5.3-212-g6944e393/src/code/build
  883  ll
  884  dirs
  885  popd
  886  echo $PREFIX
  887  cmake .. -DGOTM_USE_BASE=on -DCMAKE_INSTALL_PREFIX=$PREFIX
  888  cmake .. -DGOTM_USE_FABM=on -DCMAKE_INSTALL_PREFIX=$PREFIX
  889  echo $CC
  890  which icc
  891  which ifort
  892  CC=icc FC=ifort cmake .. -DGOTM_USE_FABM=on -DCMAKE_INSTALL_PREFIX=$PREFIX
  893  cd ..
  894  rm -rf build
  895  mkdir build
  896  cd build
  897  mshow intel/18.3
  898  CC=icc FC=ifort CXX=icpc F77=ifort F90=ifort cmake .. -DGOTM_USE_FABM=on -DCMAKE_INSTALL_PREFIX=$PREFIX
  899  make
  900  echo $INCLUDE
  901  ml
  902  netCDF-Fortran/4.4.4-intel-2018b
  903  module load netCDF-Fortran/4.4.4-intel-2018b
  904  ml
  905  cd ..
  906  rm -rf build
  907  mkdir build
  908  cd build
  909  cd ..
  910  ./check_netcdf.sh 
  911  ml
  912  cd build
  913  CC=icc FC=ifort CXX=icpc F77=ifort F90=ifort cmake .. -DGOTM_USE_FABM=on -DCMAKE_INSTALL_PREFIX=$PREFIX
  914  make
  915  make install
  916  cd ../../../rackham/
  917  ll
  918  cd bin/
  919  ll
  920  ./gotm --help
  921  ./gotm --version
  922  cd ../../..
  923  mv 5.3-212-g6944e393 5.3-221-gac7ec88d
  924  cd 5.3-221-gac7ec88d/
  925  cd rackham/
  926  PREFIX=$PWD
  927  cd ../src/
  928  ll
  929  cd code/
  930  ll
  931  rm -rf build
  932  ml
  933  mkdir build
  934  cd build
  935  CC=icc FC=ifort CXX=icpc F77=ifort F90=ifort cmake .. -DGOTM_USE_FABM=on -DCMAKE_INSTALL_PREFIX=$PREFIX
  936  make -j10
  937  make install
  938  cd ../../..
  939  ll
  940  cd rackham/
  941  ll
  942  cd bin/
  943  ll
  944  ./gotm
  945  cd ../..
  946  ll
  947  cd 
  948  cd /sw/apps/GOTM/5.3-221-gac7ec88d/rackham/bin
  949  ll
  950  ldd gotm
  951  cd ../..
  952  ll
  953  cd ..
  954  ll
  955  mkdir mf
  956  cd mf
  957  pushd .
  958  cd ../
  959  cd ../CDO/mf
  960  cd ..
  961  ll
  962  vi CDO-1.9.5_install-README.md
  963  cd ../GOTM/
  964  ll
  965  cd mf
  966  ll
  967  cp ../../CDO/mf/1.9.5 5.3-221-gac7ec88d
  968  vi 5.3-221-gac7ec88d 
  969  cd ..
  970  history >> GOTM-5.3-221-gac7ec88d_install-README.md
  971  grep 'ml' GOTM-5.3-221-gac7ec88d_install-README.md
  972  grep -P '(ml|module load)' GOTM-5.3-221-gac7ec88d_install-README.md
  973  cd mf
  974  ll
  975  vi 5.3-221-gac7ec88d 
  976  ll
  977  mkdir /sw/mf/common/applications/GOTM
  978  cp -av 5.3-221-gac7ec88d /sw/mf/common/applications/GOTM/
  979  all_mflink -f -a GOTM 5.3-221-gac7ec88d
  980  ml
  981  ll
  982  vi 5.3-221-gac7ec88d 
  983  ll ../5.3-221-gac7ec88d/
  984  ll ../5.3-221-gac7ec88d/rackham/
  985  ll ../5.3-221-gac7ec88d/rackham/include/
  986  ll ../5.3-221-gac7ec88d/rackham/include/lib
  987  ll ../5.3-221-gac7ec88d/rackham/lib/
  988  ll
  989  vi 5.3-221-gac7ec88d 
  990  cp -av 5.3-221-gac7ec88d /sw/mf/common/applications/GOTM/
  991  mfshow -a CDO
  992  cd ..
  993  cd CDO
  994  ll
  995  cat CDO-1.9.7.1-intel18.3_install-README.md
  996  which eb
  997  mfshow -a GOTM
  998  ml
  999  exit
 1000  screen -D -RR GOTM
 1001  ml
 1002  echo $EASYBUILD_PREFIX 
 1003  echo $MODULEPATH
 1004  module use $EASYBUILD_PREFIX/modules/all
 1005  ml EasyBuild/4.0.1
 1006  which eb
 1007  eb --dry-run Metaxa2-2.2-gompi-2019a.eb
 1008  eb --module-depends-on --force --robot --module-syntax=Lua Metaxa2-2.2-gompi-2019a.eb -D
 1009  eb --module-depends-on --force --robot --module-syntax=Lua Metaxa2-2.2-gompi-2019a.eb 
 1010  ml
 1011  ml Metaxa2/2.2-gompi-2019a
 1012  echo $PATH
 1013  ll /sw/EasyBuild/software/Metaxa2/2.2-gompi-2019a/README.txt 
 1014  cat /sw/EasyBuild/software/Metaxa2/2.2-gompi-2019a/README.txt 
 1015  metaxa2 --help
 1016  ml
 1017  echo $PATH
 1018  ll /sw/EasyBuild/software/Metaxa2/2.2-gompi-2019a
 1019  ldd /sw/EasyBuild/software/Metaxa2/2.2-gompi-2019a/metaxa2_c 
 1020  less /sw/EasyBuild/software/Metaxa2/2.2-gompi-2019a/metaxa2_c 
 1021  which perl
 1022  view /sw/EasyBuild/software/Metaxa2/2.2-gompi-2019a/metaxa2_c 
 1023  mspid usearch
 1024  view /sw/EasyBuild/software/Metaxa2/2.2-gompi-2019a/metaxa2_dbb
 1025  which makeblastdb
 1026  ll /sw/parallel/openmpi/rackham-centos7/3.1.4gcc9.2.0/lib/
 1027  ml
 1028  mspid MAFFT
 1029  mshow MAFFT/7.429-GCC-8.2.0-2.31.1-with-extensions
 1030  ll /sw/EasyBuild/software/MAFFT/7.429-GCC-8.2.0-2.31.1-with-extensions/bin/mafft
 1031  file /sw/EasyBuild/software/MAFFT/7.429-GCC-8.2.0-2.31.1-with-extensions/libexec/mafft/
 1032  ll /sw/EasyBuild/software/MAFFT/7.429-GCC-8.2.0-2.31.1-with-extensions/libexec/mafft/mafft-profile 
 1033  ldd /sw/EasyBuild/software/MAFFT/7.429-GCC-8.2.0-2.31.1-with-extensions/libexec/mafft/mafft-profile 
 1034  ldd /sw/EasyBuild/software/MAFFT/7.429-GCC-8.2.0-2.31.1-with-extensions/libexec/mafft/*
 1035  head /sw/EasyBuild/software/MAFFT/7.429-GCC-8.2.0-2.31.1-with-extensions/libexec/mafft/seekquencer_premafft.pl --help
 1036  /sw/EasyBuild/software/MAFFT/7.429-GCC-8.2.0-2.31.1-with-extensions/libexec/mafft/seekquencer_premafft.pl --help
 1037  which eb
 1038  eb -S rosetta
 1039  ml
 1040  mshow Metaxa2/2.2-gompi-2019a
 1041  cd /sw/bioinfo/Metaxa2/
 1042  ll
 1043  ll 2.2
 1044  ll
 1045  rm -rf 2.2
 1046  ll
 1047  ll /sw/apps/CDO/1.9.5_provided_by_EasyBuild_CDO/1.9.5-intel-2018b
 1048  mspid cdo
 1049  touch /sw/apps/CDO/1.9.5_provided_by_EasyBuild_CDO-1.9.5-intel-2018b
 1050  ll /sw/apps/CDO
 1051  mv /sw/apps/CDO/1.9.5_provided_by_EasyBuild_CDO-1.9.5-intel-2018b /sw/apps/CDO/1.9.5_module_alias_for_EasyBuild_CDO-1.9.5-intel-2018b
 1052  ll /sw/apps/CDO
 1053  ll
 1054  touch 2.2_module_alias_for_EasyBuild_Metaxa2-2.2-gompi-2019a
 1055  cd mf
 1056  ll
 1057  cd ..
 1058  history >> Metaxa2-2.2_install-README.md
