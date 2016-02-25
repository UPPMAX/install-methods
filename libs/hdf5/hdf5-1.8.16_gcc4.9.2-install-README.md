   66  jiu
   67  cat douglas_Chim2.batch
   68  chmod +x douglas_Chim2.batch
   69  ll
   70  cat douglas_chimera.batch
   71  jiu
   72  htop
   73  cd transfer/slurm-job/
   74  ll
   75  cat slurm-7180896.out 
   76  groups
   77  intersect_user douglas persj
   78  cd /proj/b2012165
   79  ll
   80  module load bioinfo-tools Mothur/1.36.1
   81  /usr/bin/time -v mothur douglas_chimera.batch
   82  ll
   83  rm -f mothur.1456129788.logfile 
   84  ll
   85  mkdir inter-job
   86  cd inter-job/
   87  /usr/bin/time -v mothur douglas_chimera.batch >| tee log
   88  /usr/bin/time -v mothur douglas_chimera.batch 2>&1  | tee log
   89  /usr/bin/time -v mothur ../douglas_chimera.batch 2>&1  | tee log
   90  ln -s ../douglas_chimera.batch ../douglas_New.trim.good.unique.good.filter.unique.precluster.* .
   91  ll
   92  rm -f mothur.14561298*
   93  /usr/bin/time -v mothur ../douglas_chimera.batch >| tee log
   94  cat log
   95  ll
   96  cd ..
   97  rm -rf inter-job/
   98  ll
   99  /usr/bin/time -v mothur douglas_chimera.batch >| tee inter-log
  100  ll
  101  cat tee
  102  rm tee
  103  /usr/bin/time -v mothur douglas_chimera.batch 2>&1 | tee inter-log
  104  interactive -A staff -n 16 -t 4:00:00
  105  ssh m143
  106  ll
  107  cat inter-log 
  108  ll
  109  jobstats -p 7189665
  110  ll
  111  ll slurm-job/
  112  jobstats -p 7180896
  113  ll
  114  eog milou-staff-douglas-718*
  115  tail inter-log 
  116  tail inter-log 
  117  view inter-log
  118  cat mothur.1456130013.logfile
  119  jobstats -p 7180896
  120  ls -ltr
  121  mv milou-staff-douglas-7180896.png slurm-job/
  122  mkdir inter-job
  123  mv milou-staff-douglas-7189665.png douglas_New.trim.good.unique.good.filter.unique.precluster.temp* inter-job/
  124  ls
  125  mv *.accnos* *.chimeras* inter-job/
  126  ll
  127  mv inter-log inter-job/
  128  rm mothur.1456129984.logfile
  129  mv mothur.1456130013.logfile inter-job/
  130  ll
  131  cd inter-job/
  132  ll
  133  cd ../slurm-job/
  134  ll
  135  cat slurm-7180896.out 
  136  cd private
  137  ll
  138  cd nobackup
  139  ll
  140  cd Seq_project
  141  ll
  142  cd DIR_GenomeSTRIP/
  143  ll
  144  cd svtoolkit/
  145  ll
  146  cd DIR_important_rerun_after_UPPMAX_crash/
  147  ll
  148  cd ..
  149  cd DIR_Per/
  150  ll
  151  cd DIR_KSP/DIR_CNVs/
  152  ll
  153  less vcf_summary.txt 
  154  pushd .
  155  ll
  156  nano read_Genomestrip_res.py 
  157  ll /proj/b2012165/private/nobackup/Seq_project/DIR_GenomeSTRIP/svtoolkit/DIR_important_rerun_after_UPPMAX_crash/DIR_res_no_odd/deletions.discovery.vcf
  158  cat ~/bin/stripfilt 
  159  stripfilt inverse=1 /proj/b2012165/private/nobackup/Seq_project/DIR_GenomeSTRIP/svtoolkit/DIR_important_rerun_after_UPPMAX_crash/DIR_res_no_odd/deletions.discovery.vcf > header
  160  ~/bin/stripfilt inverse=1 /proj/b2012165/private/nobackup/Seq_project/DIR_GenomeSTRIP/svtoolkit/DIR_important_rerun_after_UPPMAX_crash/DIR_res_no_odd/deletions.discovery.vcf > header
  161  ll
  162  cat header 
  163  head vcf_summary.txt 
  164  less vcf_summary.txt 
  165  less vcf_summary.txt  
  166  cut -f8 vcf_summary.txt   | head
  167  cut -f8 vcf_summary.txt   | sed 's/GSSAMPLES=//' | head
  168  dirs
  169  cd /proj/b2012165/private/nobackup/Seq_project/DIR_GenomeSTRIP/svtoolkit/DIR_important_rerun_after_UPPMAX_crash/
  170  ll
  171  ll DIR_res_no_odd/P0P0001.discovery.vcf
  172  less DIR_res_no_odd/P0P0001.discovery.vcf
  173  ls
  174  less DIR_res_no_odd/P0001.discovery.vcf
  175  exit
  176  newgrp b2012165
  177  exit
  178  ll
  179  cd ..
  180  cd ../glob/
  181  ll
  182  mkdir omneya
  183  cd omneya/
  184  cp -av ../../transfer/* .
  185  cp -av $HOME/transfer/* .
  186  show_user royf
  187  show_user roy
  188  grep roy /sw/uppmax/etc/users
  189  show_user royfranc
  190  groups royfranc
  191  module spider h5
  192  module spider hdf
  193  cd /sw/apps
  194  ll
  195  mkdir h5utils
  196  cd h5utils/
  197  ll
  198  mkdir 1.12.1
  199  cd 1.12.1/
  200  mkdir src
  201  cd src/
  202  wget http://ab-initio.mit.edu/h5utils/h5utils-1.12.1.tar.gz
  203  tar xzf h5utils-1.12.1.tar.gz 
  204  ll
  205  cd h5utils-1.12.1/
  206  ll
  207  view README 
  208  module avail gcc
  209  module load gcc/4.9.2
  210  ./configure --prefix /sw/apps/h5utils/1.12.1/milou
  211  cd /sw/libs/hdf5/
  212  ll
  213  cd ../
  214  ls
  215  mkdir hdf4
  216  cd hdf4/
  217  ll
  218  mkdir 4.2.11
  219  cd 4.2.11/
  220  mkdir src 
  221  cd src
  222  wget http://www.hdfgroup.org/ftp/HDF/HDF_Current/src/hdf-4.2.11.tar
  223  tar xf hdf-4.2.11.tar 
  224  ll
  225  cd hdf-4.2.11/
  226  ll
  227  module load zlib
  228  module spider szip
  229  ll
  230  ./configure --prefix=/sw/libs/hdf4/4.2.11/milou
  231  module list
  232  module unload zlib
  233  ./configure --prefix=/sw/libs/hdf4/4.2.11/milou
  234  make >& make.out
  235  make check >& check.out
  236  cat check.out 
  237  make install
  238  make installcheck
  239  module list
  240  cd ../..
  241  cd ..
  242  cd mf
  243  mkdir mf
  244  cd mf
  245  cp /sw/mf/common/libraries/zlib/1.2.8 4.2.11
  246  vi 4.2.11 
  247  /hdf4/4.2.11
  248  ll
  249  cd milou/
  250  ll
  251  ll share/man/
  252  ll lib/
  253  ll include/
  254  cd bin
  255  ll
  256  view h4cc 
  257  ldd hdf24to8 
  258  ./hdf24to8 
  259  ./vmake
  260  ldd vmake
  261  cd /sw/mf/common/libraries/
  262  ll
  263  mkdir hdf4
  264  cd hdf4/
  265  cp /sw/libs/hdf4/mf/4.2.11 .
  266  cd ..
  267  fixup hdf4/
  268  ll
  269  cd /sw/mf/milou/libraries/
  270  ll
  271  mkdir hdf4
  272  cd hdf4/
  273  ln -s ../../../common/libraries/hdf4/4.2.11 .
  274  cd ..
  275  fixup hdf4/
  276  cd ..
  277  ll
  278  cd 4.2.11/
  279  ll
  280  ln -s ./milou nestor
  281  ln -s ./milou halvan
  282  cd src
  283  ll
  284  cd hdf-4.2.11/
  285  ll
  286  make clean
  287  cd ../..
  288  ll
  289  ln -s ./milou tintin
  290  ries/
  291  ll
  292  mkdir hdf4
  293  cd hdf4/
  294  ln -s ../../../common/libraries/hdf4/4.2.11 .
  295  ll
  296  cd ..
  297  fixup hdf4/
  298  ll
  299  rm tintin
  300  cd src
  301  ll
  302  cd /sw/libs/hdf4/4.2.11/src
  303  ll
  304  cd hdf-4.2.11/
  305  ll
  306  module load gcc/4.9.2
  307  ./configure --prefix=/sw/libs/hdf4/4.2.11/tintin
  308  ll
  309  mv make.out.milou
  310  mv make.out make.out.milou
  311  mv check.out check.out.milou
  312  ll
  313  cd ../..
  314  history > hdf4-4.2.11-install-README.md
  315  make >& make.out.tintin
  316  make check >& check.out.tintin
  317  make install
  318  make installcheck
  319  module avail hdf4
  320  tall-README.md 
  321  dirs
  322  cd ../../apps/h5utils/
  323  ll
  324  cd 1.12.1/
  325  ll
  326  cd src/
  327  ll
  328  cd h5utils-1.12.1/
  329  ll
  330  module list
  331  module load hdf4/4.2.11
  332  ./configure --prefix /sw/apps/h5utils/1.12.1/milou
  333  echo CPATH
  334  echo $CPATH
  335  echo $LIBRARY_PATH
  336  ll /sw/libs/hdf4/4.2.11/lib
  337  vi /sw/libs/hdf4/mf/4.2.11 
  338  module unload hdf4
  339  cp /sw/libs/hdf4/mf/4.2.11 /sw/mf/common/libraries/hdf4/4.2.11 
  340  ll /sw/mf/common/libraries/hdf4/4.2.11
  341  cd ../../..
  342  cd ..
  343  ll
  344  fixup -g hdfmodule load hdf4/4.2.11
  345  ./configure --prefix /sw/apps/h5utils/1.12.1/milou
  346  pushd .
  347  cd ../../..
  348  cd ../..
  349  cd libs
  350  ll
  351  mkdir libmatheval
  352  cd lib
  353  cd libmatheval/
  354  ll
  355  mkdir 1.1.11
  356  mkdir mf
  357  cd 1.1.11/
  358  mkdir milou src
  359  cd src
  360  wget http://ftp.gnu.org/gnu/libmatheval/libmatheval-1.1.11.tar.gz
  361  wget http://ftp.gnu.org/gnu/libmatheval/libmatheval-1.1.11.tar.gz
  362  module list
  363  module unload hdf4
  364  ./configure --prefix=/sw/libs/libmatheval/1.1.11/milou
  365  ll
  366  tar xzf libmatheval-1.1.11.tar.gz 
  367  ll
  368  cd libmatheval-1.1.11/
  369  ll
  370  ./configure --prefix=/sw/libs/libmatheval/1.1.11/milou
  371  cd ../../..
  372  cd ..
  373  rm -rf libmatheval/
  374  ll
  375  dirs
  376  popd
  377  ll
  378  cd ..
  379  mkdir prereqs
  380  cd prereqs
  381  wget http://ftp.gnu.org/gnu/libmatheval/libmatheval-1.1.11.tar.gz
  382  tar xzf libmatheval-1.1.11.tar.gz 
  383  cd libmatheval-1.1.11/
  384  ll
  385  cd ..
  386  wget ftp://ftp.gnu.org/gnu/guile/guile-2.0.11.tar.gz
  387  tar xzf guile-2.0.11.tar.gz 
  388  echo P-$PWD
  389  P=$PWD
  390  cd guile-2.0.11/
  391  ll
  392  module avail guile
  393  ./configure --prefix=$P
  394  module spider guile
  395  cd ..
  396  wget http://ftp.gnu.org/gnu/libunistring/libunistring-0.9.5.tar.gz
  397  ll
  398  tar xzf libunistring-0.9.5.tar.gz 
  399  ll
  400  mkdir src
  401  mv guile-2.0.11* lib* src/
  402  cd src/
  403  ll
  404  cd libunistring-0.9.5/
  405  ll
  406  ll
  407  echo $P
  408  ./configure --prefix=$P
  409  cd ../apps/h5utils/
  410  ll
  411  cd 1.12.1/
  412  ll
  413  cd prereqs/
  414  ll
  415  make && make install include/
  416  ll
  417  cd include/
  418  ll
  419  export CPATH=$PWD:$CPATH
  420  cd ../lib
  421  ll
  422  export LD_RUN_PATH=$PWD:$LD_RUN_PATH
  423  export LIBRARY_PATH=$PWD:$LIBRARY_PATH
  424  cd ..
  425  ll
  426  cd src
  427  ll
  428  cd libmatheval-1.1.11/
  429  ./configure --prefix=$P
  430  cd ../guile-2.0.11/
  431  ll
  432  ./configure --prefix=$P
  433  cd ../
  434  wget http://www.hboehm.info/gc/gc_source/gc-7.2f.tar.gz
  435  tar xzf gc-7.2f.tar.gz 
  436  cd gc-7.2/
  437  ll
  438  ./configure --prefix=$P
  439  make -j 4
  440  make install
  441  cd ../../
  442  ll
  443  cd src
  444  cd guile-2.0.11/
  445  ll
  446  ./configure --prefix=$P
  447  ig/
  448  ll
  449  o $PKG_CONFIG_PATH
  450  export PKG_CONFIG_PATH=/sw/apps/h5utils/1.12.1/prereqs/lib/pkgconfig
  451  ./configure --prefix=$P
  452  make -j 8
  453  make clean
  454  make
  455  make install
  456  make
  457  cd ../../../..
  458  cd ..
  459  ll
  460  ..
  461  cd ../../..
  462  ll
  463  cd ..
  464  rm -rf h5utils/
  465  ibs
  466  ll
  467  module list
  468  cd /sw/
  469  ls
  470  cd libs
  471  ls
  472  cd hdf4/
  473  ll
  474  cat hdf4-4.2.11-install-README.md 
  475  cd ../../apps/
  476  ll
  477  cd ../comp
  478  ll
  479  mkdir guile
  480  cd guile/
  481  ll
  482  mkdir 1.8.8
  483  cd 1.8.8/
  484  ll
  485  mkdir src
  486  cd src
  487  wget ftp://ftp.gnu.org/gnu/guile/guile-1.8.8.tar.gz
  488  tar xzf guile-1.8.8.tar.gz 
  489  cd ..
  490  mkdir milou
  491  cd milou/
  492  P=$PWD
  493  cd ../src/guile-1.8.8/
  494  ll
  495  view INSTALL 
  496  view README 
  497  cat README 
  498  ll
  499  module list
  500  module avail gcc
  501  module load gcc/5.3.0
  502  ll
  503  ./configure --prefix=$P
  504  make
  505  vi Makefile
  506  make
  507  vi libtool 
  508  make
  509  vi libtool 
  510  vi Makefile
  511  ll
  512  vi configure
  513  ./configure --prefix=$P
  514  make
  515  make install
  516  pushd .
  517  cd ../../milou/
  518  ll
  519  cd bin/
  520  ll
  521  ldd guile
  522  cd ../../../
  523  ls
  524  mkdir mf
  525  cd mf
  526  cp /sw/mf/common/libraries/hdf4/4.2.11 1.8.8
  527  vi 1.8.8 
  528  cd ..
  529  ll
  530  cd 1.8.8/
  531  ll
  532  cd ../..
  533  ll
  534  fixup -g guile
  535  cd guile/
  536  ll
  537  cd 1.8.8/
  538  ll
  539  cd milou/
  540  ll
  541  ll bin
  542  ll include/
  543  ll lib/
  544  vi ../../mf/1.8.8 
  545  ls
  546  ll
  547  ll share/
  548  ll share/aclocal/
  549  vi ../../mf/1.8.8 
  550  cat /sw/mf/common/libraries/zlib/1.2.8 
  551  vi ../../mf/1.8.8 
  552  ls share/info/
  553  vi ../../mf/1.8.8 
  554  ll
  555  ll share/
  556  vi ../../mf/1.8.8 
  557  cat ../../mf/1.8.8 
  558  ll include/
  559  ll share/emacs/
  560  ll share/emacs/site-lisp/
  561  cd ..
  562  ll
  563  ln -s ./milou nestor
  564  ln -s ./milou halvan
  565  module gcc
  566  module avail gcc
  567  module load gcc/5.3.0
  568  cd /sw/comp/guile/1.8.8
  569  ll
  570  cd src
  571  ll
  572  mv guile-1.8.8 guile-1.8.8-milou
  573  tar xzf guile-1.8.8.tar.gz 
  574  ll
  575  cd guile-1.8.8
  576  ll
  577  module list
  578  P=/sw/comp/guile/1.8.8/tintin
  579  ./configure --prefix=$P
  580  vi configure
  581  ./configure --prefix=$P
  582  make
  583  make install
  584  module list
  585  ll
  586  cd ..
  587  cd 1.8.8/tintin/
  588  ll
  589  cd ../../mf
  590  ll
  591  cat 1.8.8 
  592  cd /sw/mf/
  593  ll
  594  cd common/
  595  ll
  596  cd compilers/
  597  ll
  598  mkdir guile
  599  cd guile/
  600  cp /sw/comp/guile/mf/1.8.8 .
  601  ll
  602  cd ..
  603  fixup guile
  604  cat guile/1.8.8 
  605  ll
  606  cd /sw/mf/milou/compilers/
  607  mkdir guile
  608  cd guile/
  609  ln -s ../../../common/compilers/guile/1.8.8 .
  610  ll
  611  cd ..
  612  fixup guile
  613  cd /sw/mf/tintin/compilers/
  614  mkdir guile
  615  cd guile/
  616  ll
  617  ln -s ../../../common/compilers/guile/1.8.8 .
  618  ll
  619  ls -lL
  620  cd ..
  621  fixup guile
  622  module load guile
  623  guile
  624  cd ../../common/compilers/guile/
  625  vi /sw/comp/guile/mf/1.8.8 
  626  cp /sw/comp/guile/mf/1.8.8 .
  627  ll
  628  cat 1.8.8 
  629   guile
  630  guile
  631  ll
  632  sw/comp/guile/mf/1.8.8 .
  633  ll
  634  cat 1.8.8 
  635   guile
  636  guile
  637  ll
  638  ls -ltr
  639  dirs
  640  e unload guile
  641  swapd
  642  cd ../../..
  643  history > guile-1.8.8-install-README.md
  644  vi guile-1.8.8-install-README.md 
  645  cd 1.8.8/src/guile-1.8.8/
  646  ll
  647  vi configure
  648  cd ../../..
  649  ll
  650  vi guile-1.8.8-install-README.md 
  651  ll
  652  cd 1.8.8/src/
  653  ll
  654  cd guile-1.8.8
  655  ll
  656  cat COPYING.LESSER
  657  module load guile
  658  guile
  659  ll
  660  cd
  661  module list
  662  module unload gcc
  663  module unload guile
  664  module list
  665  module load guile
  666  ll
  667  module list
  668  guile
  669  ll
  670  echo $SNIC_TMP 
  671  module help kraken
  672  module load bioinfo-tools
  673  module help kraken
  674  module load kraken
  675  module spider kraken
  676  module load Kraken/0.10.5-beta
  677  ls -ld glob
  678  cd /sw/apps/bioinfo/bwa
  679  ll
  680  mkdir 0.7.13
  681  ll 0.7.12
  682  cd 0.7.13/
  683  ll
  684  mkdir src milou tintin
  685  cd src
  686  wget https://github.com/lh3/bwa/releases/download/v0.7.13/bwa-0.7.13.tar.bz2
  687  tar xjf bwa-0.7.13.tar.bz2 
  688  ll
  689  cd bwa-0.7.13/
  690  ll
  691  module load gcc/4.9.3
  692  2
  693  module load gcc/4.9.2
  694  make
  695  ls ../../../0.7.12/milou/
  696  ls ../../../0.7.12/milou/bin/
  697  ll
  698  make install
  699  cd bwakit/
  700  ll
  701  view README.md 
  702  module spider bwa
  703  cd ..
  704  ll
  705  pushd .
  706  cd ../../..
  707  ll
  708  cd 0.7.12/
  709  ll
  710  cd milou/
  711  ll
  712  ll share/
  713  ll share/man/
  714  ll share/man/man3/zlib.3 
  715  cd ..
  716  ll
  717  cd ..
  718  cd 0.7.13/src/
  719  ll
  720  cd bwa-0.7.13/
  721  ll
  722  vi Makefile 
  723  ll
  724  ll ../../../0.7.12/
  725  ll ../../../0.7.12/milou/bin/
  726  mkdir ../../../0.7.13/milou/bin/
  727  cp bwa *.pl ../../../0.7.13/milou/bin/
  728  ll
  729  ./bwa
  730  bwa pemerge
  731  ./bwa pemerge
  732  ll
  733  cd ..
  734  ll
  735  dirs
  736  cd ../../0.7.12
  737  ll
  738  cd milou/
  739  ll
  740  cd include/
  741  ll
  742  cd ..
  743  ll
  744  cd ..
  745  ll
  746  cd ..
  747  ll
  748  cd 0.7.13
  749  ll
  750  cd src
  751  ll
  752  cd bwa-0.7.13/
  753  ll
  754  ldd bwa
  755  make clean
  756  module list
  757  module load zlib
  758  make
  759  ldd bwa
  760  cp bwa *.pl ../../../0.7.13/milou/bin/
  761  module unload zlib gcc
  762  ldd ../../../0.7.13/milou/bin/bwa
  763  ./bwa
  764  cd ../../..
  765  history > bwa-0.7.13-install-README.md
  766  vi bwa-0.7.13-install-README.md 
  767  module list
  768  module unload gcc
  769  ll
  770  mdoule list
  771  module list
  772  module unload Kraken
  773  module list
  774  module unload bioinfo-tools guile
  775  cd 0.7.13/
  776  ll
  777  cd src
  778  ll
  779  cd bwa-0.7.13/
  780  ll
  781  make clean
  782  module load gcc/4.9.2 zlib/1.2.8
  783  make
  784  cp bwa *.pl ../../../0.7.13/milou/bin/
  785  ll
  786  ldd bwa
  787  module list
  788  module unload zlib gcc
  789  ll
  790  cd ../../..
  791  vi bwa-0.7.13-install-README.md 
  792  ll
  793  cd 0.7.12/
  794  ll
  795  cd ..
  796  cd 0.7.12
  797  ln -s ./milou halvan
  798  ln -s ./milou irma
  799  cd ..
  800  cd 0.7.13
  801  ln -s ./milou irma
  802  ln -s ./milou halvan
  803  ln -s ./milou nestor
  804  ll
  805  cd tintin/
  806  ll
  807  ule list
  808  module unload gcc
  809  cd /sw/apps/bioinfo/bwa/0.7.13/src
  810  cd bwa-0.7.13/
  811  make clean
  812  ll
  813  module load gcc/4.9.2 zlib/1.2.8
  814  ll
  815  make
  816   ../../../0.7.13/tintin/bin/
  817  ls ../../../0.7.13/
  818  ll
  819  mkdir bin
  820  ll
  821  cp bwa *.pl ../../../0.7.13/tintin/bin/
  822  ll
  823  cd bin
  824  ll
  825  ldd bwa
  826  exit
  827  module load bioinfo-tools bwa
  828  module list
  829  module avail bwa
  830  cd ../../..
  831  d bwa
  832  cd ..
  833  cd bwakit/
  834  ll
  835  mkdir 0.7.13
  836  cd 0.7.1
  837  ll 0.7.12/
  838  ll
  839  rm -rf 0.7.13
  840  ll
  841  cd ..
  842  ll
  843  ll bwa
  844  mkdir mf
  845  cd mf
  846  ll /sw/mf/common/bioinfo-tools/alignment/bwa
  847  lla /sw/mf/common/bioinfo-tools/alignment/bwa
  848  cat /sw/mf/common/bioinfo-tools/alignment/bwa/0.7.4
  849  dirs
  850  swapd
  851  cd ../..
  852  ll
  853  cd milou/
  854  ll
  855  mkdir man
  856  cp ../src/bwa-0.7.13/bwa.1 .
  857  ll
  858  mkdir man/man1
  859  mv bwa.1 man/man1/
  860  ci ../../bwa-0.7.13-install-README.md 
  861  vi ../../bwa-0.7.13-install-README.md 
  862  cd ../../mf
  863  ll
  864  cd ..
  865  cd mf
  866  ll
  867  mkdir mf
  868  cd mf
  869  ll
  870  lla /sw/mf/common/bioinfo-tools/alignment/bwa/0.7.4
  871  lla /sw/mf/common/bioinfo-tools/alignment/bwa/0.7.4
  872  module list
  873  ll
  874  cd ..
  875  rmdir mf
  876  cd /sw/mf/common/bioinfo-tools/alignment/
  877  cd bwa
  878  ll
  879  ln -s 0.7.4 0.7.13
  880  ll
  881  fixup *
  882  ll
  883  cd /sw/mf/milou/bioinfo-tools/alignment/bwa
  884  ll
  885  ln -s ../../../../common/bioinfo-tools/alignment/bwa/0.7.13 .
  886  ll
  887  fixup *
  888  ll
  889  cd /sw/mf/tintin/bioinfo-tools/alignment/bwa
  890  ll
  891  ln -s ../../../../common/bioinfo-tools/alignment/bwa/0.7.13 .
  892  ll
  893  fixup *
  894  ll
  895  ule avail bwa
  896  module load bioinfo-tools bwa
  897  module list
  898  bwa
  899  show_user elin
  900  show_user xxx
  901  grep -i elin /sw/uppmax/etc/users
  902  cd
  903  cd tmp
  904  ll
  905  finishedjobinfo -h
  906  finishedjobinfo -s 2016-02-20 elinv > elinv
  907  cat elinv 
  908  cat elinv | jobstats -p -
  909  ll
  910  eog milou-b2015232-elinv-7189256.png 
  911  dirs
  912  cd /sw/apps/
  913  mkdir h5utils
  914  cd ../libs
  915  ll
  916  cd hdf4
  917  ll
  918  cd 4.2.11/
  919  ll
  920  cd milou/
  921  ll
  922  ll bin
  923  module load hdf4
  924  h4cc -h
  925  which h4cc
  926  cd ../libs
  927  cd hdf4/
  928  ll
  929  cd mf/
  930  ll
  931  ll bin
  932  ls
  933  ll examples/
  934  ll include/
  935  ll lib/
  936  ll
  937  ll share/
  938  ll share/man/
  939  module list
  940  module unload hdf4
  941  module list
  942  p 4.2.11 /sw/mf/common/libraries/hdf4/4.2.11
  943  ll 4.2.11 /sw/mf/hfcc -v
  944  ibraries/hdf4/4.2.11
  945  h4cmv 4.2.11 4.2.11_gcc4.9.2 
  946  ll
  947  cd /sw/mf/common/libraries/hdf4/
  948  ll
  949  mv 4.2.11 4.2.11_gcc4.9.2
  950  mv 4.2.11_gcc4.9.2 4.2.11
  951  module unload hdf4
  952  module list
  953   4.2.11_gcc4.9.2
  954  ll
  955  cd /sw/mf/tintin/libraries/hdf4/
  956  ll
  957  4m 4.2.11 
  958  rm 4.2.11 
  959  ln -s ../../../common/libraries/hdf4/4.2.11_gcc4.9.2 .
  960  ll
  961  fixup *
  962  ll
  963  cd ../../../milou/libraries/hdf4/
  964  ll
  965  rm 4.2.11 
  966  ln -s ../../../common/libraries/hdf4/4.2.11_gcc4.9.2 .
  967  fixup *
  968  ll
  969  cd ../tin
  970  cd ../tintin/
  971  ll
  972  cd bin/
  973  ll
  974  cat h4cc 
  975  cd ../../
  976  ll
  977  cd ..
  978  ll
  979  vi mf/
  980  vi mf/4.2.11_gcc4.9.2 
  981  module list
  982  mv 4.2.11 4.2.11_gcc4.9.2
  983  ll
  984  mv hdf4-4.2.11-install-README.md hdf4-4.2.11_gcc4.9.2-install-README.md 
  985  vi hdf4-4.2.11_gcc4.9.2-install-README.md 
  986  cd ..
  987  ll
  988  cd hdf5
  989  ll
  990  finger tore
  991  show_user tore
  992  show_user douglas
  993  module spider hdf5
  994  ll /proj/b2015137
  995  df -kh
  996  cd /sw/libs
  997  ls
  998  cd hdf5
  999  ll
 1000  mkdir 1.8.16
 1001  cd 1.8.16/
 1002  ll
 1003  cd ..
 1004  module spider hdf
 1005  ll
 1006  mv 1.8.16 1.8.16_gcc4.9.2
 1007  cd 1.8.16_gcc4.9.2/
 1008  ll
 1009  mkdir src milou tintin
 1010  cd src
 1011  wget http://www.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.8.16.tar.bz2
 1012  tar xjf hdf5-1.8.16.tar.bz2 
 1013  ll
 1014  mv hdf5-1.8.16 hdf5-1.8.16-gcc4.9.2-milou
 1015  cd hdf5-1.8.16-gcc4.9.2-milou/
 1016  ll
 1017  module list
 1018  module load gcc/4.9.2
 1019  module spider zip
 1020  pushd .
 1021  ll
 1022  cd ..
 1023  ll
 1024  cd ..
 1025  ll
 1026  cd milou/
 1027  ll
 1028  cd bin/
 1029  ll
 1030  cd ../..
 1031  ll
 1032  cd ..
 1033  ll
 1034  mkdir mf
 1035  cd mf
 1036  cp ../../hdf4/mf/4.2.11_gcc4.9.2 1.8.16_gcc4.9.2
 1037  vi 1.8.16_gcc4.9.2 
 1038  ll
 1039  cd ../..
 1040  ll
 1041  fixup -g hdf5
 1042  cd hdf5
 1043  ll
 1044  cd mf
 1045  ll
 1046  vi 1.8.16_gcc4.9.2 
 1047  ls ../1.8.16_gcc4.9.2/milou/share/
 1048  vi 1.8.16_gcc4.9.2 
 1049  cat 1.8.16_gcc4.9.2 
 1050  module list
 1051  module load szip/2.1_gcc4.9.2
 1052  vi ../../hdf4/mf/4.2.11_gcc4.9.2 
 1053  ll ../../hdf4/4.2.11_gcc4.9.2/milou/share/man/man1/
 1054  ll
 1055  pushd .
 1056  cd ../../hdf4/mf/
 1057  ll
 1058  cp 4.2.11_gcc4.9.2 /sw/mf/common/libraries/hdf4/4.2.11_gcc4.9.2 
 1059  ll
 1060  cd ..
 1061  ll
 1062  cd ..
 1063  cd hdf5/
 1064  ll
 1065  history > hdf5-1.8.16_gcc4.9.2-install-README.md
