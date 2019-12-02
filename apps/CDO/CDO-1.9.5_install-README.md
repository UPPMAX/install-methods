CDO/1.9.5
=========


This was installed with EasyBuild.  The mf file is an 'alias' mf file that sets up and loads the EasyBuild module directly.


   70  history | tail -n 100 >> vsearch-2.14.1_install-README.md
   71  vi vsearch-2.14.1_install-README.md
   72  ll
   73  source SOURCEME_vsearch_2.14.1 
   74  cat vsearch-2.14.1_install-README.md
   75      cd $VERSION
   76      cd src
   77      [[ -f vsearch-${VERSION}-linux-x86_64.tar.gz ]] || wget https://github.com/torognes/vsearch/releases/download/v${VERSION}/vsearch-${VERSION}-linux-x86_64.tar.gz
   78      tar xvzf vsearch-${VERSION}-linux-x86_64.tar.gz
   79      rmdir $PREFIX
   80      mv vsearch-${VERSION}-linux-x86_64 $PREFIX
   81      cd $PREFIX
   82      mv man man1
   83      mkdir man
   84      mv man1 man
   85  ll
   86  ll man
   87  ll bin/
   88  file bin/vsearch 
   89  ldd bin/vsearch 
   90  ml
   91  cd bin
   92  ll
   93  ./vsearch 
   94  ll
   95  cd ../..
   96  ll
   97  cd ..
   98  ll
   99  fixup .
  100  ll
  101  cd mf
  102  ll ../2.14.1/rackham/doc/
  103  ll
  104  vi 2.14.1 
  105  ll
  106  cd ../2.14.1/
  107  ll
  108  cd rackham/
  109  ll
  110  cd doc/
  111  ll
  112  cd ../..
  113  ll
  114  cd ../mf/
  115  ll
  116  vi 2.14.1 
  117  ll
  118  mfshow vsearch
  119  ll
  120  vi *
  121  ll
  122  rsync -n -Pa --del * /sw/mf/common/bioinfo-tools/alignment/vsearch/
  123  rsync  -Pa --del * /sw/mf/common/bioinfo-tools/alignment/vsearch/
  124  ll
  125  mfshow vsearch
  126  all_mflink -f vsearch 2.14.1
  127  cd ..
  128  ll
  129  cat SOURCEME_vsearch_2.14.1 
  130  cd 2.3.2/
  131  ll
  132  mv src_milou src
  133  rm -f bianca halvan irma nestor rackham snowy tintin && mv milou rackham && for CL in irma bianca snowy milou ; do ( test -L $CL || ln -s rackham $CL ) ; done
  134  ll
  135  cd ..
  136  ll
  137  cd mf
  138  ll
  139  cd ..
  140  all_mflink -f vsearch 2.3.2
  141  cd ../usearch/
  142  ll
  143  cd 5.2.
  144  cd 5.2.236/
  145  ll
  146  rm -f bianca halvan irma nestor rackham snowy tintin && mv milou rackham && for CL in irma bianca snowy milou ; do ( test -L $CL || ln -s rackham $CL ) ; done
  147  ll
  148  cd rackham/
  149  ll
  150  ./uclust 
  151  cd ..
  152  ll
  153  cd rackham/
  154  ll
  155  mv uclust _uclust
  156  cp -av _uclust uclust
  157  ll
  158  rm _uclust 
  159  ll
  160  cd ..
  161  ll
  162  cd ..
  163  ll
  164  cd 5.2.32/
  165  ll
  166  rm -f bianca halvan irma nestor rackham snowy tintin && mv milou rackham && for CL in irma bianca snowy milou ; do ( test -L $CL || ln -s rackham $CL ) ; done
  167  ll
  168  cd rackham/
  169  ll
  170  cd ..
  171  cd ../6.1.544/
  172  ll
  173  rm -f bianca halvan irma nestor rackham snowy tintin && mv milou rackham && for CL in irma bianca snowy milou ; do ( test -L $CL || ln -s rackham $CL ) ; done
  174  ll
  175  cd rackham/
  176  ll
  177  ./usearch
  178  ll
  179  rm usearch usearch61 
  180  ln -s usearch6.1.544_i86linux32 usearch61
  181  ln -s usearch6.1.544_i86linux32 usearch
  182  ll
  183  cd ..
  184  ll
  185  cd ..
  186  ll
  187  cd 7.0.1090/
  188  ll
  189  rm -f bianca halvan irma nestor rackham snowy tintin && mv milou rackham && for CL in irma bianca snowy milou ; do ( test -L $CL || ln -s rackham $CL ) ; done
  190  cd milou/
  191  cd ../rackham/
  192  ll
  193  rm usearch
  194  ln -s usearch7.0.1090_i86linux32 usearch
  195  cd ..
  196  ll
  197  cd ..
  198  ll
  199  cd 8.1.1861/
  200  ll
  201  rm -f bianca halvan irma nestor rackham snowy tintin && mv milou rackham && for CL in irma bianca snowy milou ; do ( test -L $CL || ln -s rackham $CL ) ; done
  202  ll
  203  cd rackham/
  204  ll
  205  ll python_scripts/
  206  cd python_scripts/
  207  head -1 *.py
  208  ll
  209  cd ..
  210  ll
  211  mshow usearch/8.1.1861
  212  ll
  213  cd ..
  214  ll
  215  cd 9.2.64/
  216  ll
  217  rm -f bianca halvan irma nestor rackham snowy tintin && mv milou rackham && for CL in irma bianca snowy milou ; do ( test -L $CL || ln -s rackham $CL ) ; done
  218  cd milou/
  219  cd ../rackham/
  220  ll
  221  mkdir python_scripts
  222  cd python_scripts/
  223  wget https://drive5.com/python/python_scripts.tar.gz
  224  tar xzf python_scripts.tar.gz 
  225  ll
  226  head -1 *.py
  227  ll
  228  chmod +x *.py
  229  ll
  230  sed -i -e 's,#!/usr/bin/python.*$,#!/usr/bin/env python,' $(file * | grep 'Python script' | cut -f1 -d:)
  231  ll
  232  file * | grep 'Python script' 
  233  ll
  234  mv python_scripts.tar.gz ../..
  235  cd ../..
  236  ll
  237  mkdir src
  238  mv python_scripts.tar.gz src/
  239  ll
  240  cd ..
  241  ll
  242  history >> usearch-9.2.64-install-README.md 
  243  ll
  244  vi usearch-9.2.64-install-README.md 
  245  ll
  246  TOOL=usearch; VERSION=11.0.667 ; makeroom.sh -f -t $TOOL -v $VERSION -s misc -w http://www.drive5.com/usearch/download.html -l "Custom licence agreement" -d "Versatile open source tool for metagenomics"
  247  ll
  248  ./makeroom_usearch_11.0.667.sh 
  249  source SOURCEME_usearch_11.0.667 
  250  ll
  251  cd 11.0.667/
  252  ll
  253  cd rackham/
  254  ll
  255  mkdir python_scripts
  256  cd python_scripts/
  257  wget https://drive5.com/python/python_scripts.tar.gz
  258  tar xzf python_scripts.tar.gz 
  259  chmod +x *.py
  260  sed -i -e 's,#!/usr/bin/python.*$,#!/usr/bin/env python,' $(file * | grep 'Python script' | cut -f1 -d:)
  261  ll
  262  mv python_scripts.tar.gz ../../src/
  263  ll
  264  cd ..
  265  cd ../src/
  266  ll
  267  wget https://drive5.com/cgi-bin/upload3.py?license=2019102111221031879
  268  ll
  269  mv upload3.py\?license\=2019102111221031879 usearch11.0.667_i86linux32
  270  ll
  271  cp -av usearch11.0.667_i86linux32 $PREFIX/
  272  cd $PREFIX
  273  ll
  274  ln -s usearch11.0.667_i86linux32 usearch
  275  ln -s usearch11.0.667_i86linux32 usearch11
  276  ll
  277  chmod +x usearch11.0.667_i86linux32 
  278  ll
  279  ./usearch
  280  cd ..
  281  ll
  282  cd ..
  283  ll
  284  history | tail -n 100 >> usearch-11.0.667_install-README.md
  285  vi usearch-11.0.667_install-README.md 
  286  cat usearch-9.2.64-install-README.md
  287  history | tail -n 100 >> usearch-11.0.667_install-README.md
  288  vi usearch-11.0.667_install-README.md 
  289  ll
  290  ./usearch-11.0.667_post-install.sh 
  291  ll
  292  cd mf
  293  ll
  294  vi 9.2.64
  295  ll
  296  vi 7.0.1090 
  297  vi 8.1.1861 11.0.667 
  298  ll
  299  ll ../8.1.1861/
  300  ll ../8.1.1861/rackham/
  301  ll ../8.1.1861/rackham/python_scripts/
  302  ll ../7.0.1090/rackham/
  303  ll
  304  rm 9.2.64 11.0.667 
  305  ln -s 8.1.1861 9.2.64
  306  ln -s 9.2.64 11.0.667
  307  ll ..
  308  mv 7.0.1090 5.2.32
  309  ln -s 5.2.32 5.2.236
  310  ln -s 5.2.236 6.1.544
  311  ll
  312  ln -s 6.1.544 7.0.1090
  313  ll
  314  mfshow usearch
  315  rm /sw/mf/common/bioinfo-tools/misc/usearch/.usearch 
  316  ll
  317  rsync -n -Pa --del * /sw/mf/common/bioinfo-tools/misc/usearch/
  318  rsync  -Pa --del * /sw/mf/common/bioinfo-tools/misc/usearch/
  319  mfshow usearch
  320  all_mflink -f usearch 11.0.667
  321  cd ..
  322  fixup .
  323  ll
  324  cat SOURCEME_usearch_11.0.667 
  325  dirs
  326  exit
  327  which emacs
  328  ml gcc openmpi
  329  echo $CPATH
  330  ml
  331  mshow openmpi/4.0.2
  332  mshow intelmpi
  333  ml
  334  ml -openmpi -gcc
  335  ml
  336  cd /sw/EasyBuild/
  337  ll
  338  ll software/
  339  ll
  340  ll Software/
  341  ll software/
  342  ll software/EasyBuild/
  343  ll software/EasyBuild/4.0.1/
  344  ll
  345  ll modules/
  346  module use /sw/EasyBuild/modules/all
  347  module load EasyBuild/4.0.1
  348  eb --show-config
  349  pushd .
  350  cd
  351  cd .local/
  352  ll
  353  cd ..
  354  echo $EASYBUILD_PREFIX
  355  export EASYBUILD_PREFIX=/sw/EasyBuild
  356  eb --show-config
  357  mspid gam
  358  mspid garm
  359  cd /sw/bioinfo
  360  ll
  361  cd GARM
  362  ll
  363  cd mf
  364  ll
  365  vi *
  366  ll
  367  cd ../../MUMmer/
  368  ll
  369  cd mf
  370  ll
  371  vi 3.22
  372  ll
  373  vi 4.0.0beta2 
  374  ll
  375  cd ..
  376  ll 3.22
  377  cd 3.22
  378  rm -f bianca halvan irma nestor rackham snowy tintin && mv milou rackham && for CL in irma bianca snowy milou ; do ( test -L $CL || ln -s rackham $CL ) ; done
  379  ll
  380  cd rackham/
  381  ll
  382  ./nucmer -h
  383  ml
  384  ml bioinfo-tools MUMmer/3.22
  385  nucmer -h
  386  cat INSTALL 
  387  PREFIX=$PWD
  388  cd ..
  389  ll
  390  cd ..
  391  ll
  392  cat MUMmer-3.22-install-README.md
  393  cd 3.22
  394  ll
  395  mkdir src
  396  cd src
  397  wget https://downloads.sourceforge.net/project/mummer/mummer/3.22/MUMmer3.22.tar.gz
  398  tar xzf MUMmer3.22.tar.gz 
  399  ll
  400  cd MUMmer3.22/
  401  ll
  402  ml
  403  ml gcc/6.3.0
  404  make
  405  ml perl
  406  ml -perl
  407  ml perl/5.18.4
  408  ml
  409  which perl
  410  make
  411  make clean
  412  make
  413  view Makefile 
  414  ll
  415  cd src
  416  ll
  417  cd ..
  418  ll
  419  find . \( -name '*.c' -o -name '*.h' \) -print
  420  find . \( -name '*.c' -o -name '*.h' \) -exec grep -Hn SIXTYFOURBITS {} \;
  421  cat ./src/kurtz/libbasedir/types.h
  422  make clean
  423  ml
  424  ll
  425  make clean
  426  make CPPFLAGS="-O3 -DSIXTYFOURBITS"
  427  make CFLAGS="-O3 -DSIXTYFOURBITS" CPPFLAGS="-O3 -DSIXTYFOURBITS"
  428  make clean
  429  make CFLAGS="-O3 -DSIXTYFOURBITS" CPPFLAGS="-O3 -DSIXTYFOURBITS"
  430  ll
  431  make clean
  432  cd src/
  433  ll
  434  cd tigr/
  435  ll
  436  cat Makefile 
  437  cd ../..
  438  ll
  439  make clean
  440  make CFLAGS="-O3 -DSIXTYFOURBITS" CPPFLAGS="-O3 -DSIXTYFOURBITS" CXXFLAGS="-O3 -DSIXTYFOURBITS"
  441  make clean
  442  cd ..
  443  ll
  444  cd ..
  445  rmdir rackham
  446  ll rackham
  447  mv rackham _rackham
  448  echo $PREFIX
  449  cd src/
  450  ll
  451  mv MUMmer3.22 $PREFIX
  452  cd $PREFIX
  453  ll
  454  make clean
  455  make CFLAGS="-O3 -DSIXTYFOURBITS" CPPFLAGS="-O3 -DSIXTYFOURBITS" CXXFLAGS="-O3 -DSIXTYFOURBITS"
  456  cd ../..
  457  ll
  458  vi MUMmer-3.22-install-README.md
  459  history >> MUMmer-3.22-install-README.md
  460  vi MUMmer-3.22-install-README.md
  461  ll
  462  cd 3.22
  463  ll
  464  rm kalkyl
  465  ll
  466  cd src/
  467  ll
  468  cd ..
  469  cd rackham/
  470  ll
  471  ml
  472  nucmer -h
  473  mshow MUMmer/3.23
  474  cd ../..
  475  cd mf
  476  ll
  477  cat 3.22
  478  rsync -n -Pa 3.22 /sw/mf/common/bioinfo-tools/alignment/MUMmer/
  479  ll /sw/mf/common/bioinfo-tools/alignment/MUMmer/
  480  rm /sw/mf/common/bioinfo-tools/alignment/MUMmer/.MUMmer
  481  rsync  -Pa 3.22 /sw/mf/common/bioinfo-tools/alignment/MUMmer/
  482  ll /sw/mf/common/bioinfo-tools/alignment/MUMmer/
  483  pushd .
  484  cd /sw/mf/common/bioinfo-tools/alignment/MUMmer/
  485  ll
  486  ln -sf 3.22 3.23
  487  ll
  488  rm -f 3.9.4alpha && mv .MUMmer4 3.9.4alpha 
  489  ll
  490  popd
  491  ll
  492  cat 3.22
  493  cd ..
  494  ll
  495  cd 3.23/
  496  ll
  497  rm -rf milou
  498  ln -s rackham milou
  499  ll
  500  rm -rf src
  501  mv src_rackham src
  502  ll
  503  cd rackham/
  504  ll
  505  head -n 1 run-mummer1 
  506  head -n 1 gaps
  507  file *
  508  mspid arleq
  509  head -n 1 $(file * | grep 'Perl script')
  510  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  511  htop
  512  finger icinga
  513  htop
  514  git pull
  515  git status
  516  ml
  517  ll
  518  ml
  519  cd ..
  520  ll
  521  cd rackham/
  522  ll
  523  cd ..
  524  ll
  525  cd src/
  526  ll
  527  rm -rf MUMmer3.23
  528  tar xzf MUMmer3.23.tar.gz 
  529  ll
  530  cd MUMmer3.23/
  531  ml
  532  ml -MUMmer
  533  ml
  534  ll
  535  cat INSTALL 
  536  make check
  537  make CFLAGS="-O3 -DSIXTYFOURBITS" CPPFLAGS="-O3 -DSIXTYFOURBITS" CXXFLAGS="-O3 -DSIXTYFOURBITS"
  538  mshow MUMmer/3.2.3
  539  mshow MUMmer/3.23
  540  ll
  541  cd ..
  542  mv ../rackham ../_rackham && mv MUMmer3.23 ../rackham
  543  cd ..
  544  ll
  545  ll _rackham/
  546  ll rackham/
  547  ll
  548  rm -rf _rackham/
  549  cd rackham/
  550  ll
  551  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  552  cd ../mf
  553  ll
  554  cd ..
  555  ll
  556  cd ..
  557  ll
  558  cd mf
  559  ll
  560  cd ..
  561  ll
  562  cat MUMmer-3.23-install-README.md
  563  ll
  564  history >> MUMmer-3.23-install-README.md
  565  ./gather-READMEs.sh
  566  vi MUMmer-3.23-install-README.md 
  567  cat MUMmer-3.22-install-README.md >> MUMmer-3.23-install-README.md
  568  vi MUMmer-3.23-install-README.md 
  569  ll
  570  file MUMmer-3.23-install-README.md 
  571  cat MUMmer-3.23-install-README.md 
  572  cd 3.23/rackham/
  573  ll
  574  sed -i -e 's,^#!.*/perl.*$,#!/usr/bin/env perl,' $(file * | grep 'Perl script' | cut -f1 -d:)
  575  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  576  cd ../../3.22/rackham/
  577  ll
  578  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  579  sed -i -e 's,^#!.*/perl.*$,#!/usr/bin/env perl,' $(file * | grep 'Perl script' | cut -f1 -d:)
  580  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  581  cd ../..
  582  ll
  583  vi MUMmer-3.22-install-README.md 
  584  ll
  585  cat MUMmer-3.9.4alpha-install-README.md
  586  ml
  587  ll
  588  cd mf
  589  ll
  590  cd ..
  591  ll
  592  cd 3.9.4alpha
  593  ll
  594  rm -rf milou
  595  rm -rf src_milou/
  596  mv src_rackham src
  597  ln -s rackham milou
  598  ll
  599  cd rackham/
  600  ll
  601  cd bin/
  602  ll
  603  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  604  ldd combineMUMs 
  605  ml
  606  ml -gcc
  607  mshow gcc/6.3.0
  608  ll /sw/mf/rackham/compilers/gcc/6.3.0
  609  ll /sw/mf/common/compilers/gcc/6.3.0
  610  ll /sw/mf/common/compilers/gcc/gcc.tcl
  611  cat /sw/mf/common/compilers/gcc/gcc.tcl
  612  vi /sw/mf/common/compilers/gcc/gcc.tcl
  613  ll
  614  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  615  sed -i -e 's,^#!.*/perl.*$,#!/usr/bin/env perl,' $(file * | grep 'Perl script' | cut -f1 -d:)
  616  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  617  cd ../../..
  618  ll
  619  cd -
  620  ll
  621  cd ../lib/
  622  ll
  623  cd mummer/
  624  ll
  625  less Foundation.pm 
  626  ll
  627  cd ..
  628  ll
  629  cd ..
  630  ll
  631  cd ..
  632  ll
  633  cd 4.0.0beta2/
  634  ll
  635  cd rackham/
  636  ll
  637  cd bin/
  638  ll
  639  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  640  sed -i -e 's,^#!.*/perl.*$,#!/usr/bin/env perl,' $(file * | grep 'Perl script' | cut -f1 -d:)
  641  ll
  642  cd ..
  643  ll
  644  cd include/
  645  ll
  646  cd ../lib
  647  ll
  648  cd pkgconfig/
  649  ll
  650  cat mummer.pc 
  651  cd ..
  652  ll
  653  cd libexec/
  654  ll
  655  cd mummer/
  656  ll
  657  ldd *
  658  ml
  659  cd ..
  660  ll
  661  cd ..
  662  ll
  663  cd ../..
  664  cd 3.9.4alpha/
  665  ll
  666  cd rackham/
  667  ll
  668  cd lib/
  669  cd ../bin/
  670  ll
  671  ldd *
  672  ll
  673  cd ..
  674  ll
  675  cd ..
  676  ll
  677  cd src/
  678  ll
  679  rm -rf mummer-3.9.4alpha
  680  tar xzf mummer-3.9.4alpha.tar.gz 
  681  cat ../../MUMmer-3.9.4alpha-install-README.md 
  682  vi ../../MUMmer-3.9.4alpha-install-README.md 
  683  ll
  684   mummer-3.9.4alpha/
  685  cd ../..
  686  ll
  687  cat MUMmer-3.9.4alpha-install-README.md
  688      VERSION=3.9.4alpha
  689  cd $VERSION
  690     PREFIX=$PWD/$CLUSTER
  691  echo $PREFIX
  692  ll $PREFIX
  693  ml
  694      module load gcc/6.3.0
  695  ml -perl
  696  vi ../MUMmer-3.9.4alpha-install-README.md 
  697  ll
  698  ml
  699  cd src/
  700  ll
  701  cd mummer-3.9.4alpha/
  702  ll
  703  make clean
  704  ./configure --help
  705  ./configure --prefix=$PREFIX
  706  ./configure --with-int128 --prefix=$PREFIX
  707  make
  708  make install
  709  ml
  710  ml -gcc
  711  ll
  712  cd ../../
  713  ll
  714  cd rackham/
  715  ll
  716  cd bin/
  717  ll
  718  cd ../lib/
  719  ll
  720  ldd libumdmummer.so
  721  ml
  722  cd ../bin/
  723  ll
  724  ./nucmer 
  725  ldd nucmer 
  726  ml patchelf
  727  patchelf --print-rpath nucmer
  728  patchelf --set-rpath $(patchelf --print-rpath nucmer):/sw/comp/gcc/6.3.0_rackham/lib:/sw/comp/gcc/6.3.0_rackham/lib64 nucmer
  729  patchelf --print-rpath nucmer
  730  ./nucmer 
  731  ldd mummer
  732  cd ../lib
  733  ll
  734  ldd libumdmummer.so.0.0.0
  735  patchelf --print-rpath libumdmummer.so.0.0.0
  736  patchelf --set-rpath /sw/comp/gcc/6.3.0_rackham/lib:/sw/comp/gcc/6.3.0_rackham/lib64 libumdmummer.so.0.0.0 
  737  patchelf --print-rpath libumdmummer.so.0.0.0
  738  ldd libumdmummer.so.0.0.0
  739  cd ../bin/
  740  ldd mummer
  741  patchelf --print-rpath mummer
  742  patchelf --set-rpath $(patchelf --print-rpath nucmer):/sw/comp/gcc/6.3.0_rackham/lib:/sw/comp/gcc/6.3.0_rackham/lib64 mummer
  743  ldd mummer
  744  ll
  745  ldd annotate 
  746  ldd * | grep ' not found ' | cut -f1 -d: | sort -u
  747  ldd * 2>&1 | grep ' not found ' | cut -f1 -d: | sort -u
  748  patchelf --print-rpath mummer
  749  patchelf --set-rpath /sw/bioinfo/MUMmer/3.9.4alpha/rackham/lib:/sw/comp/gcc/6.3.0_rackham/lib:/sw/comp/gcc/6.3.0_rackham/lib64 mummer
  750  patchelf --print-rpath mummer
  751  for F in $(ldd * 2>&1 | grep ' not found ' | cut -f1 -d: | sort -u) ; do echo $F; patchelf --set-rpath $(patchelf --print-rpath $F):/sw/comp/gcc/6.3.0_rackham/lib:/sw/comp/gcc/6.3.0_rackham/lib64 $F ; done
  752  ml
  753  ll
  754  ldd *
  755  ./mummer
  756  ll
  757  cd ..
  758  ll
  759  cd ..
  760  ll
  761  history >> MUMmer-3.9.4alpha-install-README.md
  762  vi MUMmer-3.9.4alpha-install-README.md
  763  ll
  764  cat MUMmer-4.0.0beta2-install-README.md
  765  ll
  766  cd 4.0.0beta2/
  767  ll
  768  cd rackham/
  769  ll
  770  cd bin/
  771  ll
  772  ml
  773  ldd *
  774  ll
  775  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  776  vi ../../../MUMmer-4.0.0beta2-install-README.md 
  777  ll
  778  less dnadiff 
  779  cd ../..
  780  ll
  781  echo $PREFIX
  782  cd rackham/
  783  PREFIX=$PWD
  784  cd ../src/
  785  ll
  786  cd mummer-4.0.0beta2/
  787  ll
  788  make clean
  789  ml
  790  ml gcc/6.3.0
  791  ml
  792  ./configure --help
  793  ./configure --with-int128 --prefix=$PREFIX
  794  make
  795  make install
  796  cd ../
  797  cd ..
  798  ll
  799  cd rackham/
  800  ll
  801  cd bin/
  802  ll
  803  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  804  sed -i -e 's,^#!.*/perl.*$,#!/usr/bin/env perl,' $(file * | grep 'Perl script' | cut -f1 -d:)
  805  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  806  ml
  807  ml -gcc
  808  ll
  809  ldd *
  810  cd ../libexec/
  811  ll
  812  cd mummer/
  813  ll
  814  ldd *
  815  cd ../..
  816  cd ..
  817  ll
  818  vi MUMmer-4.0.0beta2-install-README.md
  819  head | tail
  820  history | tail -20
  821  vi MUMmer-4.0.0beta2-install-README.md
  822  ll
  823  cd mf
  824  ll
  825  vi 4.0.0beta2 
  826  ll
  827  vi 3.9.4alpha 
  828  ml
  829  ml -patchelf
  830  ll
  831  cd ..
  832  ml MUMmer/3.9.4alpha
  833  which mummer
  834  nummer
  835  nucmer
  836  mummer
  837  cd 3.9.4alpha/
  838  ll
  839  cd rackham/
  840  ll
  841  cd bin/
  842  ll
  843  ./mummer
  844  cd ..
  845  ll
  846  cd ..
  847  ll
  848  cd src/
  849  ll
  850  cd mummer-3.9.4alpha/
  851  ll
  852  ml
  853  make clean
  854  ml gcc/6.3.0
  855  cd ../../rackham/
  856  PREFIX=$PWD
  857  cd -
  858  echo $PREFIX
  859  ./configure --with-int128 --prefix=$PREFIX
  860  make -j3
  861  make install
  862  cd ../..
  863  ll
  864  cd rackham/
  865  ll
  866  cd lib/
  867  ll
  868  ldd libumdmummer.so.0.0.0 
  869  ml -gcc
  870  ml
  871  ldd libumdmummer.so.0.0.0 
  872  cd ../bin
  873  ll
  874  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  875  sed -i -e 's,^#!.*/perl.*$,#!/usr/bin/env perl,' $(file * | grep 'Perl script' | cut -f1 -d:)
  876  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  877  ldd annotate 
  878  cd ..
  879  ll
  880  cd ../src/
  881  ll
  882  rm -rf mummer-3.9.4alpha
  883  tar xzf mummer-3.9.4alpha.tar.gz 
  884  cd mummer-3.9.4alpha/
  885  ll
  886  ml
  887  ml -MUMmer
  888  ml gcc/6.3.0
  889  ll
  890  echo $PREFIX
  891  ./configure --with-int128 --prefix=$PREFIX
  892  make -j3
  893  make install
  894  cd $PREFIX
  895  ll
  896  cd lib/
  897  ll
  898  ml
  899  ml -gcc
  900  ldd libumdmummer.so.0.0.0
  901  cd mummer/
  902  ll
  903  cd ..
  904  ll
  905  cd ../bin/
  906  ll
  907  sed -i -e 's,^#!.*/perl.*$,#!/usr/bin/env perl,' $(file * | grep 'Perl script' | cut -f1 -d:)
  908  head -n 1 $(file * | grep 'Perl script' | cut -f1 -d:)
  909  ldd * 2>&1 | grep ' not found ' | cut -f1 -d: | sort -u
  910  ldd annotate 
  911  ml patchelf
  912  for F in $(ldd * 2>&1 | grep ' not found ' | cut -f1 -d: | sort -u) ; do echo $F; patchelf --set-rpath $(patchelf --print-rpath $F):/sw/comp/gcc/6.3.0_rackham/lib:/sw/comp/gcc/6.3.0_rackham/lib64 $F ; done
  913  ml -gcc -patchelf
  914  ml patchelf
  915  ll
  916  ldd annotate 
  917  ./annotate -h
  918  ./nucmer -h
  919  ./mummer -h
  920  ll
  921  patchelf --print-rpath annotate 
  922  patchelf --print-rpath postnuc
  923  ldd prepro
  924  cd ../..
  925  ll
  926  cd ..
  927  ll
  928  vi MUMmer-3.9.4alpha-install-README.md
  929  ll
  930  ml
  931  cd /sw/bioinfo/abyss/
  932  ll
  933  cat abyss-2.0.2-install-README.md 
  934  ml
  935  ll /sw/mf/*/parallel/openmpi/2.1.0
  936  ll -d /sw/mf/*/parallel/openmpi
  937  ll /sw/mf/*/parallel/openmpi/
  938  pushd .
  939  cd /sw/mf/bianca/parallel/openmpi
  940  ll
  941  cd .snapshot
  942  ll
  943  ll /sw/bioinfo/abyss/
  944  ll /sw/bioinfo/abyss/mf/
  945  ssh douglas-sens2017625@bianca
  946  dirs
  947  popd
  948  git status
  949  git add .
  950  git pull
  951  git commit -a -m 'more installs'
  952  git push
  953  cd /sw/EasyBuild
  954  module use /sw/EasyBuild/modules/all
  955  module load EasyBuild/4.0.1
  956  export EASYBUILD_PREFIX=/sw/EasyBuild
  957  eb --show-config
  958  export EASYBUILD_PREFIX=/sw/EasyBuild foss-2018b
  959  export EASYBUILD_PREFIX=/sw/EasyBuild foss-2018b.eb
  960  eb --module-depends-on --robot --module-syntax=Tcl foss-2018b.eb
  961  ll sources/
  962  ll sources/f/FFTW/fftw-3.3.8.tar.gz 
  963  rm sources/f/FFTW/fftw-3.3.8.tar.gz 
  964  eb --module-depends-on --robot --module-syntax=Tcl foss-2018b.eb
  965  eb --show-full-config
  966  mspid abyss
  967  mshow abyss/2.0.2-k128
  968  ll /sw/EasyBuild/ebfiles_repo
  969  ll /sw/EasyBuild/ebfiles_repo/FFTW/
  970  find . -name FFTW-3.3.8-gompi-2018b.eb
  971  ml
  972  eb --show-config
  973  eb --help
  974  ll
  975  eb --module-depends-on --robot --module-syntax=Tcl CDO
  976  eb --module-depends-on --robot --module-syntax=Tcl --software=CDO
  977  eb --module-depends-on --robot --module-syntax=Tcl --software-name=CDO
  978  eb  --dry-run gompi-2018b.eb
  979  find . -name gompi-2018b.eb
  980  find . -name gompi-2018b.eb -ls
  981  ll ./ebfiles_repo/gompi/gompi-2018b.eb
  982  cat ./ebfiles_repo/gompi/gompi-2018b.eb
  983  cat ./software/gompi/2018b/easybuild/gompi-2018b.eb
  984  cat ./software/gompi/2018b/easybuild/reprod/gompi-2018b.eb
  985  diff ./software/EasyBuild/4.0.1/easybuild/easyconfigs/g/gompi/gompi-2018b.eb ./software/gompi/2018b/easybuild/reprod/gompi-2018b.eb
  986  which cb
  987  eb --module-depends-on --robot --module-syntax=Tcl --search=CDO
  988  eb --dry-run intel-2018b
  989  eb --dry-run intel-2018b.eb
  990  eb --dry-run iomkl-2018b.eb
  991  eb --module-depends-on --robot --module-syntax=Tcl iomkl-2018b.eb
  992  eb --dry-run  foss-2019a.eb
  993  eb --module-depends-on --robot --module-syntax=Tcl foss-2019a.eb
  994  eb --module-depends-on --robot --module-syntax=Tcl FFTW-3.3.8-foss-2019a.eb
  995  eb -S FFTW-3.3.8
  996  eb --module-depends-on --robot --module-syntax=Tcl FFTW-3.3.8-gompi-2019a.eb
  997  eb --module-depends-on --robot --module-syntax=Tcl FFTW-3.3.8-gompi-2019b.eb
  998  eb --module-depends-on --force --robot --module-syntax=Lua FFTW-3.3.8-gompi-2019b.eb
  999  eb --module-depends-on --force --robot --module-syntax=Lua gompi-2019b.eb
 1000  eb --module-depends-on --force --robot --module-syntax=Lua FFTW-3.3.8-gompi-2019b.eb
 1001  htop  -u douglas
 1002  screen -ls
 1003  screen -D -RR 3446.easybuild-intel
 1004  eb FFTW-3.3.8-gompi-2019b.eb -D
 1005  export EASYBUILD_PREFIX=/sw/EasyBuild
 1006  module use /sw/EasyBuild/modules/all
 1007  module load EasyBuild/4.0.1
 1008  eb FFTW-3.3.8-gompi-2019b.eb -D
 1009  eb --module-depends-on --robot --module-syntax=Lua --search=CDO
 1010  eb intel-2018b.eb -D
 1011  eb iomkl-2018b.eb -D
 1012  eb --module-depends-on --robot --module-syntax=Lua CDO-1.9.5-intel-2018b.eb
 1013  view /sw/EasyBuild/software/CDO/1.9.5-intel-2018b/easybuild/easybuild-CDO-1.9.5-20191024.091522.log
 1014  head /sw/EasyBuild/software/CDO/1.9.5-intel-2018b/easybuild/easybuild-CDO-1.9.5-20191024.091522.log
 1015  cut -f4 -d' ' /sw/EasyBuild/software/CDO/1.9.5-intel-2018b/easybuild/easybuild-CDO-1.9.5-20191024.091522.log | cut -f1 d: | head
 1016  cut -f4 -d' ' /sw/EasyBuild/software/CDO/1.9.5-intel-2018b/easybuild/easybuild-CDO-1.9.5-20191024.091522.log | cut -f1 -d: | head
 1017  cut -f4 -d' ' /sw/EasyBuild/software/CDO/1.9.5-intel-2018b/easybuild/easybuild-CDO-1.9.5-20191024.091522.log | cut -f1 -d: | sort -u
 1018  cut -f4 -d' ' /sw/EasyBuild/software/CDO/1.9.5-intel-2018b/easybuild/easybuild-CDO-1.9.5-20191024.091522.log | cut -f1 -d: | grep -F '.py' | head
 1019  cut -f4 -d' ' /sw/EasyBuild/software/CDO/1.9.5-intel-2018b/easybuild/easybuild-CDO-1.9.5-20191024.091522.log | cut -f1 -d: | grep -F '.py' | sort -u
 1020  which eb
 1021  view /sw/EasyBuild/software/EasyBuild/4.0.1/bin/eb
 1022  which easybuild.main
 1023  ll /sw/EasyBuild/software/EasyBuild/4.0.1/bin
 1024  cd /sw/EasyBuild/
 1025  find . -name easybuild.main*'
 1026  find . -name 'easybuild.main*'
 1027  find . -type f -exec grep -HnF easybuild.main {} \;
 1028  view ./software/EasyBuild/4.0.1/easybuild/scripts/bootstrap_eb.py
 1029  cd ./software/EasyBuild/4.0.1/lib/python2.7/site-packages/test/framework
 1030  ll
 1031  less build_log.py
 1032  cd ..
 1033  ll
 1034  cd ..
 1035  ll
 1036  cd easybuild/
 1037  ll
 1038  cd base/
 1039  ll
 1040  cd ..
 1041  view main.py
 1042  ml
 1043  cd ../../..
 1044  dirs
 1045  cd ../..
 1046  cd ..
 1047  ll
 1048  cd ..
 1049  eb --module-depends-on --robot --module-syntax=Lua --search=CDO
 1050  easybuild -D CDO-1.9.5-intel-2018a.eb
 1051  eb -D CDO-1.9.5-intel-2018a.eb
 1052  eb -D CDO-1.9.5-intel-2018b.eb
 1053  ll
 1054  which eb
 1055  eb -S CMake
 1056  eb -S netcddf
 1057  eb -S netcdf
 1058  eb -D netCDF-Fortran-4.4.4-intel-2018b.eb
 1059  eb --module-depends-on --robot --module-syntax=Lua -D netCDF-Fortran-4.4.4-intel-2018b.eb
 1060  eb --module-depends-on --robot --module-syntax=Lua  netCDF-Fortran-4.4.4-intel-2018b.eb
 1061  ml
 1062  eb --module-depends-on --robot --module-syntax=Lua  netCDF-Fortran-4.4.4-intel-2018b.eb
 1063  ml EasyBuild/4.0.1
 1064  eb --module-depends-on --robot --module-syntax=Lua  netCDF-Fortran-4.4.4-intel-2018b.eb
 1065  module spider netcdf
 1066  eb --show-full-config
 1067  cd ../apps/CDO/
 1068  ll
 1069  history >> CDO-1.9.5_install-README.md
