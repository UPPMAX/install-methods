   34  cd halvan/
   35  ll
   36  jobstats -h
   37  jobstats -p 6853923 6855964 6856234 6874738 6880788 6930764 6942776 7010203 7011341 | tee jobs
   38  find /sw/share/slurm/milou/uppmax_jobstats -name 6853923
   39  find /sw/share/slurm/milou/uppmax_jobstats -name 6855964
   40  find /sw/share/slurm/milou/uppmax_jobstats -name 6856234
   41  find /sw/share/slurm/milou/uppmax_jobstats -name 6874738
   42  find /sw/share/slurm/milou/uppmax_jobstats -name 6880788
   43  find /sw/share/slurm/milou/uppmax_jobstats -name 6930764
   44  ll
   45  eog *.png
   46  exit
   47  ls -ld .
   48  ls -ld glob
   49  ls -lLd glob
   50  ls -l
   51  mkdir transfer
   52  ls -ld transfer
   53  chmod 777 transfer
   54  ls -ld transfer
   55  cd /sw/apps/tinyutils/
   56  ll
   57  mkdir 1.1
   58  cd 1.1/
   59  cd /sw/apps/tinyutils/1.1
   60  ll
   61  cd ..
   62  view tinyutils-20150331-install-README.md 
   63  cp tinyutils-20150331-install-README.md tinyutils-1.1-install-README.md 
   64  ll
   65  ll ../20150826/
   66  mkdir src
   67  mkdir milou
   68  ln -s ./milou tintin
   69  ln -s ./milou halvan
   70  ln -s ./milou nestor
   71  cd src
   72  wget https://github.com/douglasgscofield/tinyutils/archive/1.1.tar.gz
   73  tar xzf 1.1.tar.gz 
   74  ll
   75  rmdir ../milou
   76  mv tinyutils-1.1 ../milou
   77  cd ../milou/
   78  ll
   79  cd ..
   80  ll
   81  cd ..
   82  fixup -g tinyutils
   83  vi tinyutils-1.1-install-README.md 
   84  cd tinyutils/
   85  ll
   86  history >> tinyutils-1.1-install-README.md 
   87  cd mf/
   88  ll
   89  cp 20150826 1.1
   90  vi 1.1 
   91  ll
   92  cd /sw/mf/common/applications/tinyutils/
   93  ll
   94  cp /sw/apps/tinyutils/mf/1.1 .
   95  ll
   96  cd ..
   97  fixup tinyutils/
   98  ll
   99  ll tinyutils/
  100  ls -la ../bioinfo-tools/misc/samtools/
  101  cp ../bioinfo-tools/misc/samtools/.version .
  102  mv .version tinyutils/
  103  cd tinyutils/
  104  vi .version 
  105  cat 1.1
  106  vi 1.1 
  107  cp /sw/apps/tinyutils/mf/1.1 .
  108  cat 1.1
  109  cd ../1.1/milou/
  110  ll
  111  cd ..
  112  ll
  113  module load tinyutils
  114  module list tinyutils
  115  cd /sw/mf/tintin/applications/tinyutils/
  116  ll
  117  ln -s ../../../common/applications/tinyutils/1.1 .
  118  ll
  119  fixup 1.1
  120  ll
  121  cd /sw/mf/milou/applications/tinyutils/
  122  ll
  123  ln -s ../../../common/applications/tinyutils/1.1 .
  124  fixup 1.1
  125  ll
  126  module load tinyutils
  127  showcol
  128  exit
  129  cd transfer/
  130  ll
  131  view *
  132  mkdir no
  133  mv slurm-3463* no/
  134  mv  slurm-34644.out no/
  135  less slurm-34660.out
  136  cat slurm-34660.out
  137  tail slurm-34660.out
  138  tail -n 20 slurm-34660.out
  139  ll
  140  view slurm-6* 7*
  141  pushd .
  142  cd ../tmp
  143  ll
  144  ls -ltr
  145  cd tmp
  146  ll
  147  cd ..
  148  find . -name '*.png'
  149  hi tee
  150  history | grep tee
  151  history | grep -C 10 ' 907 ' 
  152  cd halvan
  153  ll
  154  mv ../transfer/* .
  155  ll
  156  cat slurm-6853923.out
  157  mv slurm-6853923.out no/
  158  ll
  159  mv slurm-6855964.out no/
  160  tail slurm-6856234.out
  161  mv slurm-6856234.out no/
  162  cat slurm-6874738.out
  163  clear
  164  cat slurm-6874738.out
  165  module spider trinity
  166  module spider sga
  167  module load tinyutils
  168  module list
  169  module unload tinyutils
  170  cd /sw/apps/bioinfo/
  171  ll
  172  mkdir SGA
  173  cd SGA
  174  mkdir mf 0.10.14
  175  cd 0.10.14/
  176  mkdir milou src
  177  cd src/
  178  wget https://github.com/jts/sga/archive/v0.10.14.tar.gz
  179  tar xzf v0.10.14.tar.gz 
  180  ll
  181  cd sga-0.10.14/
  182  ll
  183  cd src/
  184  ll
  185  module spider spars
  186  cd ..
  187  mkdir prereqs
  188  cd prereqs/
  189  wget https://github.com/sparsehash/sparsehash/archive/sparsehash-2.0.3.tar.gz
  190  tar xzf sparsehash-2.0.3.tar.gz 
  191  ll
  192  cd sparsehash-sparsehash-2.0.3/
  193  ll
  194  module load gcc/4.9.2
  195  cd ..
  196  ll
  197  cd ../..
  198  ll
  199  cd milou/
  200  P=$PWD
  201  cd ../src/prereqs/sparsehash-sparsehash-2.0.3/
  202  ll
  203  ./configure  --prefix=$P
  204  module load zlib jemalloc
  205  ./configure  --prefix=$P
  206  make && make install
  207  dirs
  208  pushd .
  209  cd ../../../milou/
  210  ll
  211  cd ../src/sga-0.10.14/
  212  ll
  213  cd src/
  214  ll
  215  module spider bamtools
  216  module load bioinfo-tools bamtools/2.3.0
  217  cd ../../../milou/
  218  ll
  219  pushd .
  220  cd
  221  cd github-sync/local/uppmax/install-methods/
  222  ll
  223  cd apps/bioinfo/
  224  ll
  225  grep PYTHONUSERBASE */*.md
  226  dirs
  227  swapd
  228  ll
  229  swapd
  230  cd ../src/sga-0.10.14/
  231  ll
  232  module list
  233  cd src
  234  module load python/2.7.6
  235  echo $P
  236  PYTHONUSERBASE=$P pip install --user pysam
  237  PYTHONUSERBASE=$P pip install --user ruffus
  238  PYTHONUSERBASE=$P pip install --user sqlite3
  239  cd ../../
  240  cd ..
  241  ll
  242  cd milou/
  243  ll
  244  cd /sw/apps/bioinfo/SGA/0.10.14/src/sga-0.10.14/src
  245  module load python/2.7.9
  246  mdoule list
  247  module list
  248  PYTHONUSERBASE=$P pip install --user pysam
  249  PYTHONUSERBASE=$P pip install --user --force pysam
  250  PYTHONUSERBASE=$P pip install --user -f pysam
  251  PYTHONUSERBASE=$P pip install --user ruffus
  252  pip --help
  253  ls
  254  ./autogen.sh 
  255  ..
  256  ll
  257  ./configure  --prefix=$P
  258  ./configure  --prefix=$P  --with-sparsehash=$P
  259  make
  260  make distclean
  261  ll
  262  ll
  263  env | grep JE
  264  ./configure  --prefix=$P  --with-sparsehash=$P --with-jemalloc=$JEMALLOC_LIBRARY
  265  ll
  266  view config.log 
  267  pushd .
  268  view /sw/mf/common/bioinfo-tools/misc/bamtools/2.3.0 
  269  view /sw/mf/common/libraries/zlib/1.2.8 
  270  vi /sw/mf/common/bioinfo-tools/misc/bamtools/2.3.0 
  271  ./configure  --prefix=$P  --with-sparsehash=$P --with-jemalloc=$JEMALLOC_LIBRARY --with-bamtools=$BAMTOOLS
  272  module unload bamtools
  273  module load bamtools
  274  view config.log 
  275  make
  276  make install
  277  cd ../../../
  278  ll
  279  cd milou/
  280  ll
  281  cd bin/
  282  ll
  283  ldd sga
  284  cd ../lib/
  285  ll
  286  cd pkgconfig/
  287  ll
  288  cd ..
  289  cd python2.7/
  290  ll
  291  cd site-packages/
  292  ll
  293  cd /sw/apps/bioinfo/SGA/mf
  294  ll
  295  cp /sw/mf/common/bioinfo-tools/misc/deepTools/2.0.1 0.10.14
  296  module list
  297  cd ..
  298  ll
  299  cd ..
  300  ll
  301  cd ..
  302  ll
  303  cd bin/
  304  ll
  305  cd ../share
  306  ll
  307  lll
  308  ll doc
  309  vi 0.10.14 
  310  cd ../0.10.14/milou/bin/
  311  ll
  312  ldd sga
  313  cd ../../../mf/
  314  ll
  315  vi 0.10.14 
  316  echo $LD_RUN_PATH
  317  echo $LIBRARY_PATH
  318  ll
  319  cd ..
  320  ll
  321  cd bin/
  322  ll
  323  view *.py
  324  cd ../..
  325  ll
  326  cd src/
  327  ll
  328  cd ..
  329  ln -s ./milou halvan
  330  ln -s ./milou nestor
  331  ll
  332  cd src/
  333  ll
  334  cd sga-0.10.14/
  335  ll
  336  cd src/
  337  ll
  338  ll bin
  339  cd bin/
  340  ll
  341  view Makefile
  342  make
  343  make install
  344  grep '^import' *.py
  345  view sga-joinedpe 
  346  view Makefile
  347  ll
  348  view *.pl
  349  head -n 1 *
  350  view sga-call-variants.pl 
  351  ll
  352  vi 0.10.14 
  353  view sga-beetl-index.pl 
  354  cd ../../../
  355  ll
  356  cd ..
  357  ll
  358  cd milou/
  359  ll
  360  cd bin/
  361  ll
  362  cat 0.10.14 
  363  pushd .
  364  cd /sw/mf/common/bioinfo-tools/assembly/
  365  mkdir SGA
  366  cd SGA/
  367  cp /sw/apps/bioinfo/SGA/mf/0.10.14 .
  368  ll
  369  cd ..
  370  fixup SGA
  371  cd /sw/mf/milou/bioinfo-tools/assembly/
  372  mkdir SGA
  373  cd SGA
  374  ln -s ../../../../common/bioinfo-tools/assembly/SGA/0.10.14 
  375  ll
  376  cd ..
  377  fixup SGA
  378  ll
  379  ./sga-bam2de.pl 
  380  module list
  381  module unload bamtools jemalloc gcc zlib
  382  module load abyss
  383  ./sga-bam2de.pl 
  384  ./sga-mergeDriver.pl 
  385  ./sga-mergeDriver.pl -h
  386  module list
  387  module unload abyss
  388  module spider abyss
  389  cd /sw/mf/common/bioinfo-tools/assembly/abyss/
  390  ll
  391  ls -la
  392  vi .version 
  393  module list
  394  module load abyss
  395  module list
  396  module unload abyss
  397  module list
  398  module unload python
  399  dirs
  400  popd
  401  cd ../../..
  402  ll
  403  cd ..
  404  ll
  405  cd 0.10.14/
  406  ll
  407  ln -s ./milou tintin
  408  ll
  409  cd ../../../tintin/bioinfo-tools/assembly/
  410  ll
  411  mkdir SGA
  412  cd SGA
  413  ln -s ../../../../common/bioinfo-tools/assembly/SGA/0.10.14 
  414  ll
  415  cd ..
  416  fixup SGA
  417  ll
  418  ll SGA/
  419  cd ../../../common/bioinfo-tools/assembly/
  420  ll
  421  cd SGA/
  422  ll
  423  cd ../mf/
  424  ll
  425  vi 0.10.14 
  426  ll
  427  cp 0.10.14 /sw/mf/common/bioinfo-tools/assembly/SGA/0.10.14 
  428  module spider SGA
  429  module list
  430  module load SGA
  431  sga
  432  ldd `which sga`
  433  module load bioinfo-tools SGA
  434  sga
  435  module spider trans
  436  module spider soap
  437  cd ..
  438  ls -ld soap*
  439  ls
  440  cd SOAPdenovo/
  441  ll
  442  cd 1.05/
  443  ll
  444  cd kalkyl/
  445  ll
  446  cd bin/
  447  ll
  448  cd ..
  449  ll
  450  cd ..
  451  ll
  452  cd 2.04-r240/
  453  ll
  454  cd kalkyl/
  455  ll
  456  cd bin/
  457  ll
  458  cd ../../..
  459  cd ..
  460  mkdir SOAPdenovo-Trans
  461  cd SOAPdenovo-Trans/
  462  mkdir 1.03 mf
  463  cd 1.03/
  464  mkdir milou src
  465  cd src/
  466  wget https://sourceforge.net/projects/soapdenovotrans/files/latest/download?source=files
  467  ll
  468  mv download\?source\=files SOAPdenovo-Trans-bin-v1.03.tar.gz
  469  pushd .
  470  cd
  471  cd /sw/apps/bioinfo/SGA/
  472  ll
  473  history > SGA-0.10.14-install-README.md
  474  module spider jemal
  475  module spider bamt
  476  pushd .
  477  cd /sw/apps/bioinfo/SGA/0.10.14/
  478  ll
  479  cd src/
  480  ll
  481  module list
  482  module load bioinfo-tools SGA
  483  echo $PYTHONPATH
  484  vi SGA-0.10.14-install-README.md 
  485  ll
  486  cd ..
  487  cd SOAPdenovo-Trans/
  488  ll
  489  cd 1.03/
  490  ll
  491  cd src/
  492  ll
  493  tar xzf SOAPdenovo-Trans-bin-v1.03.tar.gz 
  494  ll
  495  ldd SOAPdenovo-Trans-127mer 
  496  ./SOAPdenovo-Trans-127mer 
  497  cp -p SOAPdenovo-Trans-* ../milou/
  498  cd ../milou/
  499  ll
  500  rmdir SOAPdenovo-Trans-bin-v1.03.tar.gz 
  501  rm SOAPdenovo-Trans-bin-v1.03.tar.gz 
  502  ll
  503  cd ..
  504  ll
  505  ln -s ./milou halvan
  506  ln -s ./milou tintin
  507  ln -s ./milou nestor
  508  ll
  509  cd ..
  510  ll
  511  cd mf
  512  ll
  513  cp /sw/mf/common/bioinfo-tools/assembly/soapdenovo/1.05 1.03
  514  vi 1.03 
  515  cd /sw/apps/bioinfo/SOAPdenovo-Trans/mf
  516  ll
  517  cd /sw/apps/bioinfo/SGA/0.10.14/src
  518  ll
  519  cd ..
  520  ll
  521  vi SGA-0.10.14-install-README.md 
  522  ll
  523  cd mf/
  524  ll
  525  cd ../..
  526  fixup -g SGA
  527  cd ../..
  528  fixup -g SOAPdenovo-Trans/
  529  ls -ld SOA*
  530  id sw
  531  id pallol
  532  id ola
  533  id olas
  534  show_user olas
  535  cd SOAPdenovo-Trans/
  536  ll
  537  cd 1.03/
  538  ll
  539  cd milou/
  540  ll
  541  cd ../../mf/
  542  ll
  543  cat 1.03 
  544  cd /sw/mf/common/bioinfo-tools/
  545  ls
  546  cd assembly/
  547  ll
  548  mkdir soapdenovo-trans
  549  cd soapdenovo-trans/
  550  cp /sw/apps/bioinfo/SOAPdenovo-Trans/mf/1.03 .
  551  ll
  552  cd ..
  553  fixup soapdenovo-trans/
  554  ll
  555  cd /sw/mf/milou/bioinfo-tools/assembly/
  556  mkdir soapdenovo-trans
  557  cd soapdenovo
  558  cd ../soapdenovo-trans/
  559  ln -s ../../../../common/bioinfo-tools/assembly/soapdenovo-trans/1.03 .
  560  cd ..
  561  fixup soapdenovo-trans
  562  cd /sw/mf/tintin/bioinfo-tools/assembly/
  563  mkdir soapdenovo-trans
  564  cd soapdenovo-trans/
  565  ln -s ../../../../common/bioinfo-tools/assembly/soapdenovo-trans/1.03 .
  566  ll
  567  ls -lL
  568  cd ..
  569  fixup soapdenovo-trans
  570  ll
  571  module load bioinfo-tools soapdenovo-trans
  572  echo $PATH
  573  ll /sw/apps/bioinfo/SOAPdenovo/1.03/tintin
  574  ll /sw/apps/bioinfo/SOAPdenovo/1.03/
  575  module unload soapdenovo-trans
  576  module load bioinfo-tools soapdenovo-trans
  577  echo $PATH
  578  module unload soapdenovo-trans
  579  s/assembly/
  580  ll
  581  cd soapdenovo-trans/
  582  ll
  583  cp /sw/apps/bioinfo/SOAPdenovo-Trans/mf/1.03 .
  584  cat 1.03 
  585  d bioinfo-tools soapdenovo-trans
  586  echo $PATH
  587  SOAPdenovo-Trans-127mer 
  588  exit
  589  cd ..
  590  ll
  591  mkdir 1.04
  592  cd 1.0
  593  cd 1.04
  594  mkdir milou src
  595  cd src/
  596  wget https://sourceforge.net/projects/soapdenovotrans/files/SOAPdenovo-Trans/src/v1.04/SOAPdenovo-Trans-src-v1.04.zip/download
  597  ll
  598  mv download SOAPdenovo-Trans-src-v1.04.zip
  599  unzip SOAPdenovo-Trans-src-v1.04.zip 
  600  cd SOAPdenovo-Trans-src-v1.04/
  601  ll
  602  view MANUAL 
  603  cat make.sh 
  604  module load gcc/4.9.2 zlib
  605  bash make.sh 
  606  cd /sw/apps/bioinfo/SOAPdenovo-Trans/1.04/src/SOAPdenovo-Trans-src-v1.04
  607  ll
  608  ldd SOAPdenovo-Trans-127mer 
  609  cd ../../..
  610  cd 1.04/
  611  ll
  612  ls ../1.03/
  613  ls ../1.03/milou/
  614  cd milou/
  615  cp ../src/SOAPdenovo-Trans-src-v1.04/SOAPdenovo-Trans-* .
  616  ll
  617  cd ../..
  618  fixup -g 1.04
  619  ll
  620  cd mf
  621  ll
  622  ln -s 1.03 1.04
  623  ll
  624  cd ../..
  625  cd /sw/mf/common/bioinfo-tools/assembly/soapdenovo-trans/
  626  ll
  627  ln -s 1.03 1.04
  628  ll
  629  fixup 1.04
  630  ll
  631  cd /sw/mf/milou/bioinfo-tools/assembly/soapdenovo-trans/
  632  ll
  633  ln -s ../../../../common/bioinfo-tools/assembly/soapdenovo-trans/1.04 .
  634  ll
  635  fixup 1.04
  636  ll
  637  cd /sw/mf/tintin/bioinfo-tools/assembly/soapdenovo-trans/
  638  ll
  639  ln -s ../../../../common/bioinfo-tools/assembly/soapdenovo-trans/1.04 .
  640  fixup 1.04
  641  ll
  642  dirs
  643  cd /sw/apps/bioinfo/SOAPdenovo-Trans/1.04/
  644  ll
  645  ln -s ./milou halvan
  646  ln -s ./milou nestor
  647  ln -s ./milou tintin
  648  ll
  649  cd src/
  650  ll
  651  ll ../milou/
  652  cd SOAPdenovo-Trans-src-v1.04/
  653  ll
  654  view LICENSE 
  655  cd /sw/apps/bioinfo/SOAPdenovo-Trans/mf
  656  cd ../..
  657  ll
  658  mkdir EvidentialGene
  659  cd EvidentialGene/
  660  ll
  661  wget /sw/apps/bioinfo/SOAPdenovo-Trans/mf
  662  wget ftp://arthropods.eugenes.org/evigene.tar
  663  tar xf evigene.tar 
  664  tar xvf evigene.tar 
  665  cd evigene/
  666  ll
  667  cat Configure.info 
  668  ll lib
  669  cd scripts/
  670  ll
  671  vi evgrna2genbanktsa.pl
  672  ll rnaseq/
  673  ll
  674  cd ..
  675  ll
  676  cat Evaluate.info 
  677  cat EviGene-results-summary.txt 
  678  ll
  679  ll config/
  680  ll docs/
  681  cat evigene-cites.txt
  682  cat docs/evigene-cites.txt
  683  ll
  684  scripts/rnaseq/trformat.pl
  685  PPATH=$PATH
  686  PATH=$PWD/scripts/rnaseq:$PATH
  687  trformat.pl
  688  cd
  689  trformat.pl
  690  cd -
  691  ll
  692  ll lib/Bio/Tools/
  693  find . -name '*.pl' -exec grep -Hn CodonTable {} \;
  694  find . -name '*.pl' -exec grep -Hn use {} \;
  695  find . -name '*.pl' -exec grep -Hn 'use Bio' {} \;
  696  vi ./scripts/cdsgff2genbank.pl
  697  module spider hit
  698  ll /sw/apps/bioinfo/cd-hit/
  699  ll /sw/apps/bioinfo/cd-hit/4.6.4/
  700  ll /sw/apps/bioinfo/cd-hit/4.6.4/milou/
  701  man sed
  702  module spider mix
  703  cd /sw/apps/bioinfo/
  704  ls
  705  mkdir ADMIXTURE
  706  cd ADMIXTURE/
  707  mkdir 1.3.0
  708  cd 1.3.0
  709  mkdir milou
  710  ln -s ./milou tintin
  711  ln -s ./milou halvan
  712  ln -s ./milou nestor
  713  mkdir src
  714  cd src
  715  wget https://www.genetics.ucla.edu/software/admixture/binaries/admixture_linux-1.3.0.tar.gz
  716  tar xzf admixture_linux-1.3.0.tar.gz 
  717  ll
  718  cd admixture_linux-1.3.0/
  719  ll
  720  cd ..
  721  rmdir ../milou
  722  mv admixture_linux-1.3.0 ../milou
  723  cd ../milou/
  724  ll
  725  ldd admixture
  726  ./admixture
  727  ll
  728  cd ../..
  729  mkdir mf
  730  cd mf
  731  ll
  732  cp ../../IMPUTE2/mf/2.3.2 1.3.0
  733  mkdir 1.3.0 
  734  vi 1.3.0 
  735  ll
  736  pushd .
  737  cd /sw/mf/common/bioinfo-tools/misc/
  738  mkdir ADMIXTURE
  739  cd ADMIXTURE/
  740  cp /sw/apps/bioinfo/ADMIXTURE/mf/1.3.0 .
  741  ll
  742  cd ..
  743  fixup ADMIXTURE/
  744  cd /sw/mf/milou/bioinfo-tools/misc/
  745  mkdir ADMIXTURE
  746  cd ADMIXTURE/
  747  ln -s ../../../../common/bioinfo-tools/misc/ADMIXTURE/1.3.0 .
  748  cd ..
  749  fixup ADMIXTURE
  750  cd ../../../tintin/bioinfo-tools/misc/
  751  mkdir ADMIXTURE
  752  cd ADMIXTURE/
  753  ln -s ../../../../common/bioinfo-tools/misc/ADMIXTURE/1.3.0 .
  754  cd ..
  755  fixup ADMIXTURE
  756  popd
  757  cd ../..
  758  fixup -g ADMIXTURE/
  759  ll
  760  module load bioinfo-tools ADMIXTURE
  761  admixture
  762  module help ADMIXTURE
  763  evince $ADMIXTURE/admixture-manual.pdf
  764  exit
  765  cd /sw/apps/bioinfo
  766  ls
  767  git status
  768  mkdir ARB
  769  cd ARB
  770  mkdir 6.0.3
  771  ldd /bin/su
  772  cd 6.0.3
  773  ll
  774  mkdir milou src
  775  cd src
  776  cd src
  777  wget http://download.arb-home.de/release/latest/arb-6.0.3.centos6-amd64.tgz
  778  tar xzf arb-6.0.3.centos6-amd64.tgz 
  779  ll
  780  rm -rf arb_* bin demo.arb lib PERL_SCRIPTS SH
  781  wget http://download.arb-home.de/release/latest/arb_README.txt
  782  ll
  783  wget http://download.arb-home.de/release/latest/arb_install.sh
  784  git add .
  785  git status
  786  git commit -a -m 'more installs'
  787  git push
  788  cd /sw/apps/bioinfo/ARB/6.0.3/
  789  ll
  790  cd milou/
  791  ll
  792  bash arb_install.sh 
  793  cd .
  794  cd ..
  795  rmdir milou
  796  cd /sw/
  797  ls
  798  cd share
  799  ls
  800  cd uppmax
  801  ll
  802  cd ..
  803  cd uppmax/
  804  ll
  805  ll
  806  cd apps/bioinfo/
  807  ll
  808  ls -ltr
  809  cd Kraken/
  810  ll
  811  cd ../data
  812  ll
  813  cd uppnex/
  814  ll
  815  mkdir ARB
  816  cd ARB
  817  ll
  818  mkdir pt_server
  819  cd pt_server/
  820  cd ..
  821  ll
  822  cd ..
  823  ll
  824  fixup -g ARB
  825  ll
  826  ll tmp
  827  ll Kraken/
  828  du -csh Kraken/*
  829  cd Kraken/
  830  ll
  831  cd ..
  832  ll
  833  cd milou/
  834  ll
  835  view Kraken-0.10.5-beta-install-README.md 
  836  pushd .
  837  cd /sw/apps/bioinfo/ARB/6.0.3/milou
  838  cd ../..
  839  mkdir mf
  840  cd mf
  841  ll
  842  rm -rf 20151201 20160101
  843  ll
  844  du.
  845  cd ..
  846  ll
  847  cd ARB/
  848  ll
  849  cd pt_server/
  850  ll
  851  cp ../../Kraken/mf/0.10.5-beta 6.0.3
  852  cd bin
  853  ll
  854  grep DATA *
  855  ll
  856  head -n 1 *
  857  cd /sw/mf/common/bioinfo-tools/
  858  ls
  859  ll
  860  ll pipelines/
  861  cd pipelines/
  862  mkdir ARB
  863  cd ARB
  864  vi 6.0.3 
  865  cp /sw/apps/bioinfo/ARB/mf/6.0.3 .
  866  ll
  867  cd ..
  868  fixup ARB
  869  cd /sw/mf/milou/bioinfo-tools/pipelines/
  870  mkdir ARB
  871  cd ARB
  872  ln -s ../../../../common/bioinfo-tools/pipelines/ARB/6.0.3 .
  873  ll
  874  cd ..
  875  fixup ARB
  876  cd ../../../common/bioinfo-tools/pipelines/ARB/
  877  ll
  878  cp /sw/apps/bioinfo/ARB/mf/6.0.3 .
  879  ll
  880  cat 6.0.3 
  881  cd tmp
  882  ls
  883  mkdir ARB
  884  cd ARB
  885  ll
  886  module spider arb
  887  module load bioinfo-tools ARB/6.0.3
  888  cp /sw/apps/bioinfo/ARB/6.0.3/milou/demo.arb 
  889  cp /sw/apps/bioinfo/ARB/6.0.3/milou/demo.arb .
  890  ll
  891  arb
  892  cd tmp/ARB
  893  ll
  894  arb 
  895  cd /sw/apps/bioinfo/ARB/
  896  ls
  897  cd 6.0.3/milou/
  898  ll
  899  pushd .
  900  cd /sw/data
  901  ls
  902  cd uppnex/
  903  ls
  904  cd ARB
  905  ll
  906  cd pt_server/
  907  ll
  908  module spider genome
  909  cd /sw/apps/bioinfo/
  910  ls
  911  cd GenomeTools/
  912  ll
  913  cd 1.3.5_kalkyl/
  914  ll
  915  rm 1.3.5_milou 
  916  cat HOWTOINSTALL 
  917  cd ..
  918  ll
  919  mkdir 1.5.8
  920  mkdir mf
  921  cp /sw/mf/common/bioinfo-tools/misc/genometools/1.3.5 1.5.8
  922  ll
  923  mv 1.5.8/1.3.5 mf/1.5.8
  924  cd mf
  925  ll
  926  module list
  927  module load genometools
  928  module unload genometools
  929  vi 1.5.8 
  930  cp /sw/apps/bioinfo/ADMIXTURE/mf/1.3.0 .
  931  ll
  932  cat 1.3.0 
  933  rm 1.3.0 
  934  cp /sw/apps/bioinfo/GERP++/mf/20110522 .
  935  cat 20110522 
  936  rm 20110522 
  937  cp /sw/apps/bioinfo/SOAPdenovo-Trans/mf/1.04 .
  938  cat 1.04 
  939  rm 1.04
  940  cp /sw/apps/bioinfo/CNV-seq/mf/20140812 .
  941  cat 20140812 
  942  module spider perl
  943  module spider bioperl
  944  vi 1.5.8 
  945  ll
  946  rm 20140812 
  947  cd ..
  948  ll
  949  cd 1.5.8/
  950  cd ../mf
  951  ll
  952  vi 1.5.8 
  953  cp /sw/mf/common/bioinfo-tools/misc/genometools/1.3.5 1.3.5
  954  ll
  955  cd ..
  956  ll
  957  cd 1.5.8/
  958  ll
  959  mkdir milou src
  960  ln -s ./milou nestor
  961  ln -s ./milou tintin
  962  ln -s ./milou halvan
  963  ll
  964  cd src
  965  wget http://genometools.org/pub/genometools-1.5.8.tar.gz
  966  cd /sw/apps/bioinfo/GenomeTools/1.5.8
  967  cd ..
  968  ll
  969  tar xzf genometools-1.5.8.tar.gz 
  970  cd 1.3.5_kalkyl/
  971  ll
  972  cat HOWTOINSTALL 
  973  ll
  974  cd genometools-1.5.8/
  975  ll
  976  vi Makefile 
  977  dirs
  978  popd
  979  cd /sw/apps/bioinfo/GenomeTools/1.5.8/src/genometools-1.5.8
  980  ll
  981  pushd .
  982  cd ../../milou
  983  ll
  984  P=$PWD
  985  swapd
  986  module load gcc/4.9.2
  987  make prefix=$P
  988  make clean
  989  make -v prefix=$P
  990  make SHELL="$SHELL -x" prefix=$P
  991  make clean
  992  ll
  993  make V=1 prefix=$P
  994  make VERBOSE=1 prefix=$P
  995  make clean
  996  make -n prefix=$P
  997  cd ..
  998  module list
  999  echo $P
 1000  cd ../../milou
 1001  P=$PWD
 1002  cd -
 1003  module list
 1004  vi Makefile 
 1005  module list
 1006  make prefix=$P
 1007  make prefix=$P install
 1008  cd ../..
 1009  ll
 1010  cd ..
 1011  history > GenomeTools-1.5.8-install-README.md
 1012  cd mf
 1013  ll
 1014  cd ../..
 1015  fixup -g GenomeTools
 1016  ll
 1017  cd GenomeTools/mf
 1018  ll
 1019  module avail genometools
 1020  module load bioinfo-tools
 1021  module avail genometools
 1022  ll
 1023  vi 1.5.8 
 1024  ls
 1025  module spider gt
 1026  module spider genome
 1027  module load GenomeTools/1.5.8
 1028  gt -help
 1029  cd ..
 1030  ll
 1031  vi GenomeTools-1.5.8-install-README.md 
 1032  history > /sw/apps/bioinfo/ARB/ ARB-6.0.3-install-README.md
 1033  history > /sw/apps/bioinfo/ARB/ARB-6.0.3-install-README.md
