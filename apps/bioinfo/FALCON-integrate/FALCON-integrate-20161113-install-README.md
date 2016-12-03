FALCON-integrate 20161112
=========================

Requires python/2.7.9.

Had to install git/2.10.2 because `git check-ignore` wasn't available during `make test`.


 1089  diff default-env.sh uppmax-env.sh >> ../../../FALCON-integrate-20161112-install-README.md

1,2c1,6
< FALCON_WORKSPACE=$(pwd)
< PYTHONUSERBASE=$(pwd)/fc_env
---
> TOOLBASE=/sw/apps/bioinfo/FALCON-integrate
> VERSION=20161112
> CLUSTER=milou
> INSTALLDIR=$TOOLBASE/$VERSION/$CLUSTER
> FALCON_WORKSPACE=${PWD}
> PYTHONUSERBASE=${INSTALLDIR}/fc_env

 1090  diff makefile.old makefile >> ../../../FALCON-integrate-20161112-install-README.md

16a17,18
> config-uppmax:
> 	bash ./FALCON-make/config-uppmax.sh

 1091  echo FALCON-make/config-uppmax.sh >> ../../../FALCON-integrate-20161112-install-README.md
 1092  cat FALCON-make/config-uppmax.sh >> ../../../FALCON-integrate-20161112-install-README.md

FALCON-make/config-uppmax.sh
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p ${FALCON_PREFIX}/bin

cat << EOF > ${THISDIR}/config.mk
FALCON_INSTALL_RULE=install
FALCON_PIP_EDIT=
FALCON_PIP_USER=--user
FALCON_PREFIX=${FALCON_PREFIX}
FALCON_WORKSPACE=${FALCON_WORKSPACE}
PATH=${PYTHONUSERBASE}/bin:${PATH}

#export FALCON_WORKSPACE
#export FALCON_PREFIX
#export FALCON_PIP_EDIT
#export FALCON_PIP_USER
#export FALCON_INSTALL_RULE
EOF

 1094  env | grep -P 'PYTH|FALC' >> ../../../FALCON-integrate-20161112-install-README.md

OLDPWD=/sw/apps/bioinfo/FALCON-integrate/20161112/milou/fc_env/bin
PYTHONUSERBASE=/sw/apps/bioinfo/FALCON-integrate/20161112/milou/fc_env
PATH=/sw/apps/bioinfo/FALCON-integrate/20161112/milou/fc_env/bin:/sw/apps/bioinfo/FALCON-integrate/20161112/milou/fc_env/bin:/sw/comp/git/2.10.2/milou/bin:/sw/comp/python/2.7.9_milou/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/sw/uppmax/bin
PWD=/sw/apps/bioinfo/FALCON-integrate/20161112/src_milou/FALCON-integrate
PYTHONPATH=/sw/apps/bioinfo/FALCON-integrate/20161112/milou/fc_env/lib/python2.7/site-packages:
FALCON_WORKSPACE=/sw/apps/bioinfo/FALCON-integrate/20161112/src_milou/FALCON-integrate
FALCON_PREFIX=/sw/apps/bioinfo/FALCON-integrate/20161112/milou/fc_env

 1113  vi $(file * | grep 'Python script text' | cut -f1 -d:)

Some of the python scripts don't have #!, so for example `make test` didn't work because fc_run.py didn't have one.  Add `#!/sw/comp/python/2.7.9_milou/bin/python` to the top of those that lack #!.

  116  cd sortmerna-$VERSION
  117  ./configure --prefix=$PP
  118  make && make install
  119  cd ..
  120  ll
  121  cd sortmerna-2.1-linux-64/
  122  ll
  123  cd ../..
  124  ll
  125  cd milou/
  126  ll
  127  cd bin/
  128  ll
  129  cd ../include/
  130  ll
  131  cd ../../src/
  132  ll
  133  cd sortmerna-2.1
  134  ll
  135  find . -name gumbel_params.hpp
  136  ll ../../milou/include/
  137  ll
  138  cd ..
  139  ll
  140  ll sortmerna-2.1
  141  cd sortmerna-2.1
  142  ll
  143  vi Makefile
  144  make install
  145  vi install-includeHEADERS
  146  vi Makefile
  147  make install
  148  cd ../../milou/
  149  ll
  150  cd sortmerna/
  151  ll
  152  cd index/
  153  ll
  154  cd ..
  155  vi Mak
  156  ll
  157  ls -lR
  158  cd ..
  159  ll
  160  cd src/
  161  ll
  162  cd sortmerna-2.1
  163  ll
  164  man -f ./indexdb_rna.1 
  165  less ./indexdb_rna.1 
  166  vi Makefile
  167  make install-man
  168  make install-ps
  169  make install-info
  170  make -v install-man
  171  make -n install-man
  172  make installcheck
  173  cd ../../milou/
  174  ll
  175  mkdir -p share/man/man1
  176  cd ../src/sortmerna-2.1
  177  ll *.1
  178  cp -av *.1 ../../milou/share/man/man1/
  179  ll
  180  cd ..
  181  cd -
  182  make doc
  183  cat config.log 
  184  ll
  185  cp SortMeRNA-User-Manual-2.1.pdf ../../milou/
  186  ll
  187  cd ..
  188  ll
  189  cd milou/
  190  ll
  191  cd ..
  192  history > SortMeRNA-2.1-install-README.md
  193  vi SortMeRNA-2.1-install-README.md
  194  ll
  195  vi SortMeRNA-2.1-install-README.md 
  196  vi 2.1/src/sortmerna-2.1/Makefile
  197  vi SortMeRNA-2.1-install-README.md 
  198  fb166
  199  screen -ls
  200  screen -R 50367.31O
  201  clear
  202  screen -ls
  203  screen -R 50367.31O
  204  exit
  205  module list
  206  module load bioinfo-tools
  207  module spider snp
  208  module load snpEff/4.2
  209  env | grep SNP
  210  ll /sw/apps/bioinfo/snpEff/4.2/milou
  211  cat /sw/apps/bioinfo/snpEff/4.2/milou/snpEff.config
  212  env | grep SNP
  213  env | grep CLASS
  214  java -jar SnpSift.jar 
  215  module help SnpEff
  216  module help snpEff/4.2
  217  module list
  218  module unload snpEff
  219  ll *.sh
  220  ls -ltr
  221  cat s.sh
  222  samtools mpileup
  223  module load samtools/1.3
  224  samtools mpileup
  225  ll *pl
  226  fb166
  227  exit
  228  cd /sw/apps/bioinfo/SortMeRNA
  229  ll
  230  cp SortMeRNA-2.1-install-README.md SortMeRNA-2.1b-install-README.md 
  231  vi SortMeRNA-2.1b-install-README.md 
  232  cat SortMeRNA-2.1b-install-README.md
  233      cd bioinfo/
  234      cd /sw/apps
  235      mkdir -p SortMeRNA
  236      cd SortMeRNA/
  237      VERSION=2.1b
  238      mkdir $VERSION
  239      cd $VERSION
  240      mkdir $CLUSTER
  241      cd $CLUSTER
  242      P=$PWD
  243      cd ..
  244      mkdir src_$CLUSTER
  245      cd src_$CLUSTER
  246      wget https://github.com/biocore/sortmerna/archive/$VERSION.tar.gz
  247      module load gcc/5.4.0
  248      tar xzf $VERSION.tar.gz
  249      cd sortmerna-$VERSION
  250  ll
  251  echo $P
  252     ./configure --prefix=$P
  253      make && make install
  254      mkdir -p $P/share/man/man1
  255      cp -av sortmerna.1 indexdb_rna.1 $P/share/man/man1/
  256      cp SortMeRNA-User-Manual-$VERSION.pdf $P
  257  ll *pdf
  258      cp SortMeRNA-User-Manual-${VERSION%b}.pdf $P
  259  vi ../../../SortMeRNA-2.1b-install-README.md 
  260  ll
  261  cd ..
  262  ll
  263  cd milou/
  264  ll
  265  ll share/man/man1/
  266  ll bin
  267  ll sortmerna/
  268  cd ../../mf
  269  cd ..
  270  ll
  271  mkdir mf
  272  cd mf
  273  pushd .
  274  cd
  275  cd github-sync/local/uppmax/install-methods/
  276  ll
  277  cd apps/bioinfo/
  278  ll
  279  grep MANPATH */*.md
  280  cd ../li
  281  cd ..
  282  cd libs/
  283  ll
  284  cd ../apps/
  285  ll
  286  cd ..
  287  ll
  288  ll comp/
  289  cd libs/bzip2/
  290  ll
  291  cat *
  292  dirs
  293  swapd
  294  cp /sw/mf/common/libraries/bzip2/1.0.6 2.1b
  295  vi 2.1b 
  296  ll
  297  cd /sw/mf/common/bioinfo-tools/alignment/
  298  ll
  299  mkdir SortMeRNA
  300  cd SortMeRNA/
  301  ll
  302  cp /sw/apps/bioinfo/SortMeRNA/mf/2.1b .
  303  ll
  304  cd /sw/mf/milou/bioinfo-tools/alignment/
  305  mkdir SortMeRNA
  306  cd SortMeRNA/
  307  ln -s ../../../../common/bioinfo-tools/alignment/SortMeRNA/2.1b 
  308  ll
  309  cd /sw/apps/bioinfo/SortMeRNA/
  310  ll
  311  rm -rf 2.1 SortMeRNA-2.1-install-README.md 
  312  ll
  313  cat SortMeRNA-2.1b-install-README.md 
  314     cd /sw/apps
  315      cd bioinfo/
  316      mkdir -p SortMeRNA
  317      cd SortMeRNA/
  318      VERSION=2.1b
  319      mkdir $VERSION
  320      cd $VERSION
  321      mkdir $CLUSTER
  322      cd $CLUSTER
  323      P=$PWD
  324      cd ..
  325      mkdir src_$CLUSTER
  326      cd src_$CLUSTER
  327    wget https://github.com/biocore/sortmerna/archive/$VERSION.tar.gz
  328      module load gcc/5.4.0
  329      tar xzf $VERSION.tar.gz
  330      cd sortmerna-$VERSION
  331      ./configure --prefix=$P
  332      make && make install
  333      mkdir -p $P/share/man/man1
  334      cp -av sortmerna.1 indexdb_rna.1 $P/share/man/man1/
  335      cp SortMeRNA-User-Manual-${VERSION%b}.pdf $P
  336  cd ../..
  337  ll
  338  cd /sw/mf/tintin/bioinfo-tools/alignment/
  339  mkdir SortMeRNA
  340  cd SortMeRNA/
  341  ln -s ../../../../common/bioinfo-tools/alignment/SortMeRNA/2.1b 
  342  ll
  343  cat 2.1b 
  344  dirs
  345  swapd
  346  cd /sw/apps/bioinfo/SortMeRNA
  347  ll
  348  vi SortMeRNA-2.1b-install-README.md 
  349  ll
  350  cd 2.1b/
  351  ll
  352  ln -s ./milou irma
  353  ln -s ./milou bianca
  354  ll
  355  cd /sw/mf/irma/bioinfo-tools/alignment/
  356  ll
  357  mkdir SortMeRNA
  358  cd SortMeRNA/
  359  ln -s ../../../../common/bioinfo-tools/alignment/SortMeRNA/2.1b 
  360  ll
  361  cd /sw/mf/bianca/bioinfo-tools/alignment/
  362  ll
  363  mkdir SortMeRNA
  364  cd SortMeRNA/
  365  ln -s ../../../../common/bioinfo-tools/alignment/SortMeRNA/2.1b 
  366  ll
  367  dirs
  368  cd /sw/apps/bioinfo/SortMeRNA
  369  ll
  370  cd 2.1b/
  371  ll
  372  cd src_milou/
  373  ll
  374  cd sortmerna-2.1b/
  375  ll
  376  less LICENSE.txt 
  377  module list
  378  module unload gcc
  379  cd
  380  module load SortMeRNA
  381  module load bioinfo-tools
  382  module load SortMeRNA
  383  oad gcc
  384  module load bioinfo-tools SortMeRNA
  385  module list
  386  sortmerna -h
  387  module load SortMeRNA/2.1b
  388  sortmerna
  389  sortmerna -h
  390  ldd `which sortmerna`
  391  module list
  392  module unload SortMeRNA
  393  dirs
  394  popd
  395  cd /sw/apps/bioinfo/
  396  ll
  397  mkdir Krona
  398  cd Krona/
  399  mkdir 2.7
  400  cd 2.7
  401  mkdir milou src_milou
  402  cd src_milou/
  403  wget https://github.com/marbl/Krona/releases/download/v2.7/KronaTools-2.7.tar
  404  tar xf KronaTools-2.7.tar 
  405  ll
  406  cd KronaTools-2.7/
  407  ll
  408  cat README.txt 
  409  ll scripts/
  410  find . -name 'kt*'
  411  ll
  412  cat install.pl 
  413  ll taxonomy/
  414  ll
  415  view updateTaxonomy.sh 
  416  cat README.txt 
  417  cd ../..
  418  cd milou/
  419  ll
  420  P=$PWD
  421  PT=$P/taxonomy
  422  cd ../src_milou/
  423  ll
  424  cd KronaTools-2.7/
  425  ll
  426  ll
  427  head -n 1 install.pl 
  428  ./install.pl --prefix $P --taxonomy $PT
  429  mkdir -p $PT
  430  ./install.pl --prefix $P --taxonomy $PT
  431  ll
  432  ll ../../milou/
  433  ll ../../milou/bin/
  434  vi ./updateTaxonomy.sh
  435  ll
  436  ./updateTaxonomy.sh 
  437  cd /sw/apps/bioinfo/Krona/
  438  ll
  439  mkdir mf
  440  cd mf
  441  cd ..
  442  cd 2.7/
  443  ll
  444  cd milou/
  445  ll
  446  cd taxonomy/
  447  ll
  448  cd ..
  449  cd bin/
  450  ll
  451  ./ktClassifyBLAST 
  452  view ./ktClassifyBLAST 
  453  ll
  454  dirs
  455  pushd .
  456  cd ../../src_milou/
  457  ll
  458  cd KronaTools-2.7/
  459  ll
  460  cd lib/
  461  ll
  462  view KronaTools.pm 
  463  ll
  464  cd ..
  465  cat deployResources.sh 
  466  ll
  467  ll taxonomy/
  468  ll taxonomy/accession2taxid/
  469  ll taxonomy/
  470  cd ..
  471  ll
  472  ln -s ./milou tintin
  473  ll
  474  ln -s ./milou irma
  475  ln -s ./milou bianca
  476  ll
  477  cd ..
  478  ll
  479  cd mf
  480  ll
  481  cp ../../Kraken/mf/0.10.5-beta 2.7
  482  ./updateAccessions.sh 
  483  ll
  484  cd ../../..
  485  ll
  486  mv 2.7/milou/taxonomy .
  487  ll
  488  cd 2.7/src_milou/KronaTools-2.7/
  489  ll
  490  ln -s /sw/apps/bioinfo/Krona/taxonomy .
  491  ln -sf /sw/apps/bioinfo/Krona/taxonomy .
  492  ll
  493  vi install.pl 
  494  ll
  495  ll ../../milou/
  496  ll ../../milou/bin/
  497  ll
  498  vi 2.7 
  499  ll
  500  cd ..
  501  ll
  502  ll taxonomy/
  503  cd ..
  504  ll
  505  fixup -g Krona
  506  cd Krona
  507  ll
  508  ll taxonomy/
  509  cd ..
  510  cd mf
  511  ll
  512  cd Kr
  513  cd Krona/
  514  ll
  515  cd mf/
  516  ll
  517  pushd .
  518  cd /sw/mf/bioinfo/misc
  519  cd /sw/mf/common/bioinfo-tools/misc
  520  ll
  521  mkdir Krona
  522  cd Krona/
  523  ll
  524  dirs
  525  cp /sw/apps/bioinfo/Krona/mf/2.7 .
  526  ll
  527  cd /sw/mf/milou/
  528  cd bioinfo-tools/misc/
  529  mkdir Krona
  530  cd Krona
  531  ln -s ../../../../common/bioinfo-tools/misc/Krona/2.7 .
  532  ll
  533  cd /sw/mf/tintin/bioinfo-tools/misc/
  534  mkdir Krona
  535  cd Krona
  536  ln -s ../../../../common/bioinfo-tools/misc/Krona/2.7 .
  537  ll
  538  cd /sw/mf/irma/bioinfo-tools/misc/
  539  ll
  540  cd -
  541  ll
  542  cd ../..
  543  cd misc
  544  ll
  545  module avail Krona
  546  module help Krona
  547  dirs
  548  swapd
  549  ll
  550  vi 2.7 
  551  module list
  552  module load Krona/2.7
  553  vi 2.7 
  554  module load Krona/2.7
  555  cp 2.7 /sw/mf/tintin/bioinfo-tools/misc/Krona/2.7 
  556  ll /sw/mf/tintin/bioinfo-tools/misc/Krona/2.7
  557  module load Krona/2.7
  558  module help Krona
  559  vi 2.7 
  560  module unload Krona
  561  module load Krona/2.7
  562  module help Krona
  563  module help Krona/2.7
  564  cp 2.7 /sw/mf/tintin/bioinfo-tools/misc/Krona/2.7 
  565  module help Krona/2.7
  566  echo $KRONA_TAXONoMy
  567  echo $KRONA_TAXONOMY
  568  cd ../../..
  569  XONOMY
  570  vi 2.7 
  571  cp 2.7 /sw/mf/tintin/bioinfo-tools/misc/Krona/2.7 
  572  module unload Krona/2.7
  573  module load Krona/2.7
  574  ls $KRONA_TAXONOMY
  575  echo $KRONA_UPDATE 
  576  ll /sw/apps/bioinfo/Krona/2.7/src_milou/KronaTools-2.7
  577  module list
  578  module load ktClassifyBLAST 
  579  ll
  580  cd 2.7/src_milou/
  581  ll
  582  cd KronaTools-2.7/
  583  ll
  584  less LICENSE.txt 
  585  cd ../../..
  586  ll
  587  history > Krona-2.7-install-README.md
  588  module
  589  module display Krona/2.7
  590  vi Krona-2.7-install-README.md 
  591  module spider krona
  592  module load bioinfo-tools SortMeRNA
  593  module help SortMeRNA
  594  cd /sw/apps/bioinfo/SortMeRNA/
  595  ll
  596  cd mf
  597  ll
  598  vi 2.1b 
  599  cp 2.1b /sw/mf/common/bioinfo-tools/alignment/SortMeRNA/
  600  module help SortMeRNA
  601  cd ../2.1b/milou/
  602  ll
  603  cd share/man/man1/
  604  ll
  605  exit
  606  cd /sw/comp/python
  607  ll
  608  ll 2.7.9_milou
  609  cat HOWTO-INSTALL 
  610  dirs
  611  cd /sw/apps/bioinfo/
  612  ls
  613  mkdir FALCON-integrate
  614  cd FALCON-integrate/
  615  ls
  616  ll
  617  cd github-sync/local/uppmax/install-methods/
  618  cd apps/bioinfo/
  619  ls
  620  grep USERBASE */*.md
  621  mkdir 20161112
  622  cd 20161112/
  623  ll
  624  mkdir milou src_milou
  625  cd src_milou/
  626  git clone git://github.com/PacificBiosciences/FALCON-integrate.git
  627  ls
  628  cd FALCON-integrate/
  629  git checkout master
  630  module load python/2.7.9
  631  git --version
  632  make init
  633  pushd .
  634  cd ../../milou/
  635  ll
  636  P=$PWD
  637  cd -
  638  module list
  639  cat transabyss/transabyss-1.5.3-install-README.md
  640  lou/
  641  ll
  642  mkdir python_packages
  643  cd python_packages/
  644  PUB=$PWD
  645  cd ..
  646  ll
  647  cd ..
  648  cd src_milou/
  649  cd FALCON-integrate/
  650  ll
  651  mkdir -p ${FALCON_PREFIX}/bin
  652  cat env.sh
  653  cat default-env.sh 
  654  cp default-env.sh uppmax.env.sh
  655  mv uppmax.env.sh uppmax-env.sh 
  656  vi uppmax-env.sh 
  657  source uppmax-env.sh 
  658  vi uppmax-env.sh 
  659  source uppmax-env.sh 
  660  ll
  661  vi makefile 
  662  cat makefile 
  663  view FALCON-make/config-standard.sh 
  664  cat FALCON-make/config-edit-user.sh 
  665  cat FALCON-make/config-standard.sh 
  666  cp FALCON-make/config-edit-user.sh FALCON-make/config-uppmax.sh
  667  vi FALCON-make/config-uppmax.sh
  668  diff FALCON-make/config-standard.sh FALCON-make/config-uppmax.sh
  669  echo $PYTHONUSERBASE 
  670  vi makefile 
  671  make config-uppmax
  672  env | grep FALCON
  673  make -j all
  674  cd ..
  675  ll
  676  cd FALCON-integrate/
  677  ll
  678  ll DEXTRACTOR/
  679  vi uppmax-env.sh 
  680  source uppmax-env.sh 
  681  make config-uppmax
  682  make -j all
  683  make test
  684  cd ../..
  685  cd milou/
  686  ll
  687  ll fc_env/
  688  ll fc_env/bin/
  689  ll
  690  ll bin/
  691  rm -rf bin
  692  mkdir bin
  693  cd ../src_milou/
  694  ll
  695  cd FALCON-integrate/
  696  ll
  697  make -j all
  698  make install
  699  ll
  700  cd ../../milou/
  701  ll python_packages/
  702  rmdir python_packages/
  703  rmdir bin
  704  cd fc_env/
  705  ll
  706  cd bin/
  707  ll
  708  cat falcon-task 
  709  cat fc_run.py
  710  ll
  711  cd ..
  712  ll
  713  cd lib/
  714  ll
  715  cd python2.7/
  716  ll
  717  cd site-packages/
  718  ll
  719  echo $PYTHONPATH
  720  export PYTHONPATH=$PWD
  721  cd ../../..
  722  ll
  723  cd bin
  724  ll
  725  cd ../../../src_milou/FALCON-integrate/
  726  ll
  727  htop -u douglas
  728  make test
  729  cat /sw/apps/bioinfo/FALCON-integrate/20161112/milou/fc_env/bin/fc_run.py
  730  vi /sw/apps/bioinfo/FALCON-integrate/20161112/milou/fc_env/bin/fc_run.py
  731  vi /sw/apps/bioinfo/FALCON-integrate/20161112/milou/fc_env/bin/fc_run
  732  module load git
  733  module list
  734  make test
  735  cat /sw/apps/bioinfo/FALCON-integrate/20161112/milou/fc_env/bin/fc_run.py
  736  which git-sym
  737  ll /sw/apps/bioinfo/FALCON-integrate/20161112/milou/fc_env/bin/git-sym
  738  cat /sw/apps/bioinfo/FALCON-integrate/20161112/milou/fc_env/bin/git-sym
  739  pushd .
  740  cd /sw/apps/git
  741  ll
  742  cd 2.5.0/
  743  ll
  744  module list git
  745  module avail git
  746  module spider git
  747  cd ../..
  748  cd ..
  749  ll comp
  750  cd comp/git
  751  ll
  752  cat git-2.5.0-install-README.md 
  753  ll
  754  cp git-2.5.0-install-README.md git-2.10.2-install-README.md 
  755  vi git-2.10.2-install-README.md 
  756  ll
  757  cat git-2.10.2-install-README.md 
  758      TOOL=/sw/comp/git
  759      VERSION=2.10.2
  760      VERSIONDIR=$TOOL/$VERSION
  761      mkdir -p $VERSIONDIR
  762      cd $VERSIONDIR
  763      mkdir -p src
  764      CLUSTER=milou
  765      mkdir -p $CLUSTER
  766      CLUSTERDIR=$VERSIONDIR/$CLUSTER
  767      cd src
  768      wget https://github.com/git/git/archive/v${VERSION}.tar.gz
  769      tar xzf v${VERSION}.tar.gz
  770      cd git-${VERSION}/
  771      make configure
  772      ./configure --prefix=/sw/comp/git/$VERSION/$CLUSTER
  773      make all
  774  cat ../../../git-2.10.2-install-README.md 
  775  make install
  776  cd ..
  777  ll
  778  cd ..
  779  ll
  780  cd ..
  781  ll
  782  vi git-2.10.2-install-README.md 
  783  cd mf
  784  ll
  785  cp 2.5.0 2.10.2
  786  vi 2.10.2 
  787  rm 2.10.2 
  788  ln -s 2.5.0 2.10.2
  789  ll
  790  cd ..
  791  ll
  792  cd 2.10.2/
  793  ll
  794  ln -s ./milou irma
  795  ln -s ./milou bianca
  796  exit
  797  ssh milou-b
  798  pushd .
  799  cd
  800  cd /sw/comp/git/
  801  ll
  802  cd 2.10.2/
  803  ll
  804  cd /sw/apps
  805  ll
  806  ll git
  807  cat /sw/mf/common/compilers/git/2.5.0 
  808  rm -rf git
  809  ll
  810  cd ../comp
  811  ll
  812  cd gith
  813  cd git
  814  ll
  815  cat git-2.10.2-install-README.md 
  816  vi git-2.10.2-install-README.md 
  817  cd 2.10.2/
  818  ll
  819  mv src src_milou
  820  cd milou/
  821  ll
  822  cd bin
  823  ll
  824  ldd *
  825  ll
  826  cd ..
  827  ll
  828  ll lib64/
  829  ll lib64/perl5/
  830  ll lib64/perl5/auto/
  831  cd ..
  832  ll
  833  cd mf
  834  ll
  835  cat 2.5.0 
  836  cd ..
  837  ll
  838  cat git-2.10.2-install-README.md 
  839     TOOL=/sw/comp/git
  840      VERSION=2.10.2
  841      VERSIONDIR=$TOOL/$VERSION
  842      mkdir -p $VERSIONDIR
  843      cd $VERSIONDIR
  844      CLUSTER=${CLUSTER:?CLUSTER must be set}
  845      mkdir -p src_$CLUSTER
  846      mkdir -p $CLUSTER
  847      CLUSTERDIR=$VERSIONDIR/$CLUSTER
  848      cd src_$CLUSTER
  849      wget https://github.com/git/git/archive/v${VERSION}.tar.gz
  850      tar xzf v${VERSION}.tar.gz
  851      cd git-${VERSION}/
  852      make configure
  853      ./configure --prefix=/sw/comp/git/$VERSION/$CLUSTER
  854      make all
  855  make install
  856  cd ../..
  857  ll
  858  cd tintin/
  859  ll
  860  cd /sw/mf/common/compilers/git/
  861  ll
  862  ln -s 2.5.0 2.10.2
  863  ll
  864  cd /sw/mf/milou/compilers/git
  865  ll
  866  ln -s ../../../common/compilers/git/2.10.2 .
  867  cd /sw/mf/tintin/compilers/git/
  868  ll
  869  ln -s ../../../common/compilers/git/2.10.2 .
  870  ll
  871  cd /sw/mf/irma/compilers/git
  872  cd /sw/mf/irma/compilers/
  873  ll
  874  mkdir git
  875  cd git
  876  ll
  877  ln -s ../../../common/compilers/git/* .
  878  ll
  879  cd /sw/mf/bianca/compilers/
  880  ll
  881  cd git
  882  mkdir git
  883  ll
  884  cd git/
  885  ll
  886  ln -s ../../../common/compilers/git/* .
  887  ..
  888  ll
  889  cd /sw/apps/bioinfo/FALCON-integrate/20161112/src_milou/FALCON-integrate
  890  module avail git
  891  module load git
  892  module list
  893  module unload git
  894  cd /sw/mf/common/compilers/git
  895  ll
  896  cp /sw/mf/common/bioinfo-tools/misc/samtools/.version .
  897  vi .version 
  898  cd /sw/mf/bianca/compilers/git/
  899  ln -s ../../../common/compilers/git/.version .
  900  cd /sw/mf/irma/compilers/git/
  901  ln -s ../../../common/compilers/git/.version .
  902  ll
  903  ls -la
  904  cd /sw/mf/milou/compilers/git/
  905  ln -s ../../../common/compilers/git/.version .
  906  cd /sw/mf/tintin/compilers/git/
  907  ln -s ../../../common/compilers/git/.version .
  908  ll
  909  ls -la
  910  module avail git
  911  ll
  912  source uppmax-env.sh 
  913  module list
  914  module load python/2.7.9
  915  cat uppmax-env.sh 
  916  cd /sw/apps/bioinfo/FALCON-integrate/
  917  ll
  918  mkdir mf
  919  cd mf
  920  cp ../../FALCON/mf/0.4.1 20161112
  921  cd ../..
  922  ll
  923  cd milou/
  924  ll
  925  cd fc_env/
  926  ll
  927  ll share/lib
  928  ll lib
  929  ll lib/python2.7/
  930  ll lib/python2.7/site-packages/
  931  dirs
  932  pushd .
  933  cd -
  934  cd /sw/apps/bioinfo/FALCON-integrate/20161112/src_milou/FALCON-integrate
  935  ll
  936  module list
  937  make test
  938  which git
  939  module list
  940  module load git
  941  module list
  942  make test
  943  git check-ignore
  944  cd ../../
  945  ll
  946  rm -rf milou
  947  cd src_milou/
  948  ll
  949  mv FALCON-integrate/uppmax-env.sh FALCON-integrate/makefile FALCON-integrate/FALCON-make/config-uppmax.sh .
  950  ll
  951  rm -rf FALCON-integrate/
  952  ssh-add -l
  953  ssh-agent -s
  954  ssh-add -l
  955  ssh-add ~/.ssh/github_rsa.pub 
  956  SSH_AGENT_PID=42914; export SSH_AGENT_PID;
  957  SSH_AUTH_SOCK=/tmp/ssh-G3ftbkSs62sj/agent.42913; export SSH_AUTH_SOCK;
  958  echo Agent pid 42914;
  959  ssh-add -l
  960  ssh-add ~/.ssh/github_rsa.pub
  961  ssh-add ~/.ssh/github_rsa
  962  pushd .
  963  cd
  964  cd .ssh
  965  ll
  966  ssh-add -l
  967  ll
  968  ls -la
  969  cat authorized_keys 
  970  ll
  971  chgrp douglas github_rsa.pub 
  972  chgrp douglas github_rsa.pub 
  973  vi 20161112 
  974   rsa -b 4096 -C "your_email@example.co
  975  ll
  976  mkdir tmp
  977  cd tmp
  978  ssh-keygen -t rsa -b 4096 -C "douglasgscofield@github.com"
  979  ll
  980  cd ..
  981  rm -rf tmp
  982  ssh-keygen -t rsa -b 4096 -C "douglasgscofield@github.com"
  983  ll
  984  ssh-add -l
  985  ssh-add github_rsa
  986  ssh-add
  987  ssh-l
  988  ssh-add -l
  989  ll
  990  cat authorized_keys 
  991  vi authorized_keys 
  992  cat github_rsa.pub >> authorized_keys 
  993  vi authorized_keys 
  994  pbcopy < github_rsa.pub 
  995  cat github_rsa.pub 
  996  ssh -T git@github.com
  997  exit
  998  cd /sw/apps/bioinfo/FALCON-integrate/
  999  ll
 1000  cd 20161112/
 1001  ll
 1002  cd src_milou/
 1003  ll
 1004  module load python/2.7.9
 1005  git clone git://github.com/PacificBiosciences/FALCON-integrate.git
 1006  cd FALCON-integrate
 1007  git checkout master 
 1008  make init
 1009  ll
 1010  cd ..
 1011  ll
 1012  rm -rf FALCON-integrate/
 1013  module list
 1014  module load git/2.10.2
 1015  git clone git@github.com:PacificBiosciences/FALCON-integrate.git
 1016  git clone https://github.com/PacificBiosciences/FALCON-integrate.git
 1017  cd FALCON-integrate/
 1018  ll
 1019  module list
 1020  which git
 1021  git checkout master
 1022  make init
 1023  ll
 1024  cat default-env.sh 
 1025  cat FALCON-make/config-standard.sh 
 1026  cat ../config-uppmax.sh 
 1027  cat ../uppmax-env.sh 
 1028  source ../uppmax-env.sh 
 1029  cat makefile 
 1030  cp ../uppmax-env.sh .
 1031  cp ../config-uppmax.sh FALCON-make/
 1032  mv makefile makefile.old
 1033  cp ../makefile .
 1034  make config-uppmax
 1035  make -j all
 1036  make install
 1037  make test
 1038  ll
 1039  cd ../../
 1040  find . -name fc_run.py
 1041  diff ./milou/fc_env/bin/fc_run.py ./src_milou/FALCON-integrate/FALCON/src/py_scripts/fc_run.py
 1042  cat ./milou/fc_env/bin/fc_run.py
 1043  find . -name fc_run.cfg
 1044  cd milou/fc_env/
 1045  ll
 1046  cd bin/
 1047  ll
 1048  head fc_*
 1049  head -n 1 fc_*
 1050  cd ../lib/python2.7/site-packages/
 1051  ll
 1052  export PYTHONPATH=$PWD:$PYTHONPATH
 1053  echo $PATH
 1054  cd ..
 1055  ll
 1056  cd bin/
 1057  ll
 1058  cat fc_run
 1059  cat fc_run.py
 1060  dirs
 1061  pushd .
 1062  cd /sw/apps/bioinfo/FALCON-integrate/20161112/src_milou/FALCON-integrate
 1063  ll
 1064  make test
 1065  vi makefile
 1066  cd FALCON-make/
 1067  ll
 1068  vi makefile 
 1069  cd ..
 1070  ll
 1071  cd FALCON-examples/
 1072  ll
 1073  vi makefile 
 1074  dirs
 1075  cd ../..
 1076  ll
 1077  cd FALCON-integrate/
 1078  ll
 1079  dirs
 1080  swapd
 1081  ll
 1082  vi fc_run.py 
 1083  head -n 1 fc_*
 1084  swapd
 1085  ll
 1086  vi FALCON-examples/makefile 
 1087  make test
 1088  ll
 1089  diff default-env.sh uppmax-env.sh >> ../../../FALCON-integrate-20161112-install-README.md
 1090  diff makefile.old makefile >> ../../../FALCON-integrate-20161112-install-README.md
 1091  echo FALCON-make/config-uppmax.sh >> ../../../FALCON-integrate-20161112-install-README.md
 1092  cat FALCON-make/config-uppmax.sh >> ../../../FALCON-integrate-20161112-install-README.md
 1093  env | grep -P 'PYTH|FALC'
 1094  env | grep -P 'PYTH|FALC' >> ../../../FALCON-integrate-20161112-install-README.md
 1095  cd ../..
 1096  ll
 1097  cd milou/
 1098  ll
 1099  cd fc_env/
 1100  ll
 1101  ll bin/
 1102  cd bin
 1103  ll
 1104  file easy_install
 1105  file * | grep python
 1106  cat fc_run
 1107  cat fc_run1
 1108  cat fc_run.py 
 1109  file fc_run.py 
 1110  file * | grep 'Python script text' | cut -f1 -d;)
 1111  vi $(file * | grep 'Python script text' | cut -f1 -d:)
 1112  vi fc_actg_coordinate.py
 1113  vi $(file * | grep 'Python script text' | cut -f1 -d:)
 1114  cd ../../../..
 1115  history >> FALCON-integrate-20161112-install-README.md 
    5  module list
    6  cat transabyss/transabyss-1.5.3-install-README.md
    7  lou/
    8  ll
    9  mkdir python_packages
   10  cd python_packages/
   11  PUB=$PWD
   12  cd ..
   13  ll
   14  cd ..
   15  cd src_milou/
   16  cd FALCON-integrate/
   17  ll
   18  mkdir -p ${FALCON_PREFIX}/bin
   19  cat env.sh
   20  cat default-env.sh 
   21  cp default-env.sh uppmax.env.sh
   22  mv uppmax.env.sh uppmax-env.sh 
   23  vi uppmax-env.sh 
   24  source uppmax-env.sh 
   25  vi uppmax-env.sh 
   26  source uppmax-env.sh 
   27  ll
   28  vi makefile 
   29  cat makefile 
   30  view FALCON-make/config-standard.sh 
   31  cat FALCON-make/config-edit-user.sh 
   32  cat FALCON-make/config-standard.sh 
   33  cp FALCON-make/config-edit-user.sh FALCON-make/config-uppmax.sh
   34  vi FALCON-make/config-uppmax.sh
   35  diff FALCON-make/config-standard.sh FALCON-make/config-uppmax.sh
   36  echo $PYTHONUSERBASE 
   37  vi makefile 
   38  make config-uppmax
   39  env | grep FALCON
   40  make -j all
   41  cd ..
   42  ll
   43  cd FALCON-integrate/
   44  ll
   45  ll DEXTRACTOR/
   46  vi uppmax-env.sh 
   47  source uppmax-env.sh 
   48  make config-uppmax
   49  make -j all
   50  make test
   51  cd ../..
   52  cd milou/
   53  ll
   54  ll fc_env/
   55  ll fc_env/bin/
   56  ll
   57  ll bin/
   58  rm -rf bin
   59  mkdir bin
   60  cd ../src_milou/
   61  ll
   62  cd FALCON-integrate/
   63  ll
   64  make -j all
   65  make install
   66  ll
   67  cd ../../milou/
   68  ll python_packages/
   69  rmdir python_packages/
   70  rmdir bin
   71  cd fc_env/
   72  ll
   73  cd bin/
   74  ll
   75  cat falcon-task 
   76  cat fc_run.py
   77  ll
   78  cd ..
   79  ll
   80  cd lib/
   81  ll
   82  cd python2.7/
   83  ll
   84  cd site-packages/
   85  ll
   86  echo $PYTHONPATH
   87  export PYTHONPATH=$PWD
   88  cd ../../..
   89  ll
   90  cd bin
   91  ll
   92  cd ../../../src_milou/FALCON-integrate/
   93  ll
   94  htop -u douglas
   95  make test
   96  cat /sw/apps/bioinfo/FALCON-integrate/20161112/milou/fc_env/bin/fc_run.py
   97  vi /sw/apps/bioinfo/FALCON-integrate/20161112/milou/fc_env/bin/fc_run.py
   98  vi /sw/apps/bioinfo/FALCON-integrate/20161112/milou/fc_env/bin/fc_run
   99  module load git
  100  module list
  101  make test
  102  cat /sw/apps/bioinfo/FALCON-integrate/20161112/milou/fc_env/bin/fc_run.py
  103  which git-sym
  104  ll /sw/apps/bioinfo/FALCON-integrate/20161112/milou/fc_env/bin/git-sym
  105  cat /sw/apps/bioinfo/FALCON-integrate/20161112/milou/fc_env/bin/git-sym
  106  pushd .
  107  cd /sw/apps/git
  108  ll
  109  cd 2.5.0/
  110  ll
  111  module list git
  112  module avail git
  113  module spider git
  114  cd ../..
  115  cd ..
  116  ll comp
  117  cd comp/git
  118  ll
  119  cat git-2.5.0-install-README.md 
  120  ll
  121  cp git-2.5.0-install-README.md git-2.10.2-install-README.md 
  122  vi git-2.10.2-install-README.md 
  123  ll
  124  cat git-2.10.2-install-README.md 
  125      TOOL=/sw/comp/git
  126      VERSION=2.10.2
  127      VERSIONDIR=$TOOL/$VERSION
  128      mkdir -p $VERSIONDIR
  129      cd $VERSIONDIR
  130      mkdir -p src
  131      CLUSTER=milou
  132      mkdir -p $CLUSTER
  133      CLUSTERDIR=$VERSIONDIR/$CLUSTER
  134      cd src
  135      wget https://github.com/git/git/archive/v${VERSION}.tar.gz
  136      tar xzf v${VERSION}.tar.gz
  137      cd git-${VERSION}/
  138      make configure
  139      ./configure --prefix=/sw/comp/git/$VERSION/$CLUSTER
  140      make all
  141  cat ../../../git-2.10.2-install-README.md 
  142  make install
  143  cd ..
  144  ll
  145  cd ..
  146  ll
  147  cd ..
  148  ll
  149  vi git-2.10.2-install-README.md 
  150  cd mf
  151  ll
  152  cp 2.5.0 2.10.2
  153  vi 2.10.2 
  154  rm 2.10.2 
  155  ln -s 2.5.0 2.10.2
  156  ll
  157  cd ..
  158  ll
  159  cd 2.10.2/
  160  ll
  161  ln -s ./milou irma
  162  ln -s ./milou bianca
  163  exit
  164  ssh milou-b
  165  pushd .
  166  cd
  167  cd /sw/comp/git/
  168  ll
  169  cd 2.10.2/
  170  ll
  171  cd /sw/apps
  172  ll
  173  ll git
  174  cat /sw/mf/common/compilers/git/2.5.0 
  175  rm -rf git
  176  ll
  177  cd ../comp
  178  ll
  179  cd gith
  180  cd git
  181  ll
  182  cat git-2.10.2-install-README.md 
  183  vi git-2.10.2-install-README.md 
  184  cd 2.10.2/
  185  ll
  186  mv src src_milou
  187  cd milou/
  188  ll
  189  cd bin
  190  ll
  191  ldd *
  192  ll
  193  cd ..
  194  ll
  195  ll lib64/
  196  ll lib64/perl5/
  197  ll lib64/perl5/auto/
  198  cd ..
  199  ll
  200  cd mf
  201  ll
  202  cat 2.5.0 
  203  cd ..
  204  ll
  205  cat git-2.10.2-install-README.md 
  206     TOOL=/sw/comp/git
  207      VERSION=2.10.2
  208      VERSIONDIR=$TOOL/$VERSION
  209      mkdir -p $VERSIONDIR
  210      cd $VERSIONDIR
  211      CLUSTER=${CLUSTER:?CLUSTER must be set}
  212      mkdir -p src_$CLUSTER
  213      mkdir -p $CLUSTER
  214      CLUSTERDIR=$VERSIONDIR/$CLUSTER
  215      cd src_$CLUSTER
  216      wget https://github.com/git/git/archive/v${VERSION}.tar.gz
  217      tar xzf v${VERSION}.tar.gz
  218      cd git-${VERSION}/
  219      make configure
  220      ./configure --prefix=/sw/comp/git/$VERSION/$CLUSTER
  221      make all
  222  make install
  223  cd ../..
  224  ll
  225  cd tintin/
  226  ll
  227  cd /sw/mf/common/compilers/git/
  228  ll
  229  ln -s 2.5.0 2.10.2
  230  ll
  231  cd /sw/mf/milou/compilers/git
  232  ll
  233  ln -s ../../../common/compilers/git/2.10.2 .
  234  cd /sw/mf/tintin/compilers/git/
  235  ll
  236  ln -s ../../../common/compilers/git/2.10.2 .
  237  ll
  238  cd /sw/mf/irma/compilers/git
  239  cd /sw/mf/irma/compilers/
  240  ll
  241  mkdir git
  242  cd git
  243  ll
  244  ln -s ../../../common/compilers/git/* .
  245  ll
  246  cd /sw/mf/bianca/compilers/
  247  ll
  248  cd git
  249  mkdir git
  250  ll
  251  cd git/
  252  ll
  253  ln -s ../../../common/compilers/git/* .
  254  ..
  255  ll
  256  cd /sw/apps/bioinfo/FALCON-integrate/20161112/src_milou/FALCON-integrate
  257  module avail git
  258  module load git
  259  module list
  260  module unload git
  261  cd /sw/mf/common/compilers/git
  262  ll
  263  cp /sw/mf/common/bioinfo-tools/misc/samtools/.version .
  264  vi .version 
  265  cd /sw/mf/bianca/compilers/git/
  266  ln -s ../../../common/compilers/git/.version .
  267  cd /sw/mf/irma/compilers/git/
  268  ln -s ../../../common/compilers/git/.version .
  269  ll
  270  ls -la
  271  cd /sw/mf/milou/compilers/git/
  272  ln -s ../../../common/compilers/git/.version .
  273  cd /sw/mf/tintin/compilers/git/
  274  ln -s ../../../common/compilers/git/.version .
  275  ll
  276  ls -la
  277  module avail git
  278  ll
  279  source uppmax-env.sh 
  280  module list
  281  module load python/2.7.9
  282  cat uppmax-env.sh 
  283  cd /sw/apps/bioinfo/FALCON-integrate/
  284  ll
  285  mkdir mf
  286  cd mf
  287  cp ../../FALCON/mf/0.4.1 20161112
  288  cd ../..
  289  ll
  290  cd milou/
  291  ll
  292  cd fc_env/
  293  ll
  294  ll share/lib
  295  ll lib
  296  ll lib/python2.7/
  297  ll lib/python2.7/site-packages/
  298  dirs
  299  pushd .
  300  cd -
  301  cd /sw/apps/bioinfo/FALCON-integrate/20161112/src_milou/FALCON-integrate
  302  ll
  303  module list
  304  make test
  305  which git
  306  module list
  307  module load git
  308  module list
  309  make test
  310  git check-ignore
  311  cd ../../
  312  ll
  313  rm -rf milou
  314  cd src_milou/
  315  ll
  316  mv FALCON-integrate/uppmax-env.sh FALCON-integrate/makefile FALCON-integrate/FALCON-make/config-uppmax.sh .
  317  ll
  318  rm -rf FALCON-integrate/
  319  ssh-add -l
  320  ssh-agent -s
  321  ssh-add -l
  322  ssh-add ~/.ssh/github_rsa.pub 
  323  SSH_AGENT_PID=42914; export SSH_AGENT_PID;
  324  SSH_AUTH_SOCK=/tmp/ssh-G3ftbkSs62sj/agent.42913; export SSH_AUTH_SOCK;
  325  echo Agent pid 42914;
  326  ssh-add -l
  327  ssh-add ~/.ssh/github_rsa.pub
  328  ssh-add ~/.ssh/github_rsa
  329  pushd .
  330  cd
  331  cd .ssh
  332  ll
  333  ssh-add -l
  334  ll
  335  ls -la
  336  cat authorized_keys 
  337  ll
  338  chgrp douglas github_rsa.pub 
  339  chgrp douglas github_rsa.pub 
  340  vi 20161112 
  341   rsa -b 4096 -C "your_email@example.co
  342  ll
  343  mkdir tmp
  344  cd tmp
  345  ssh-keygen -t rsa -b 4096 -C "douglasgscofield@github.com"
  346  ll
  347  cd ..
  348  rm -rf tmp
  349  ssh-keygen -t rsa -b 4096 -C "douglasgscofield@github.com"
  350  ll
  351  ssh-add -l
  352  ssh-add github_rsa
  353  ssh-add
  354  ssh-l
  355  ssh-add -l
  356  ll
  357  cat authorized_keys 
  358  vi authorized_keys 
  359  cat github_rsa.pub >> authorized_keys 
  360  vi authorized_keys 
  361  pbcopy < github_rsa.pub 
  362  cat github_rsa.pub 
  363  ssh -T git@github.com
  364  exit
  365  cd /sw/apps/bioinfo/FALCON-integrate/
  366  ll
  367  cd 20161112/
  368  ll
  369  cd src_milou/
  370  ll
  371  module load python/2.7.9
  372  module load python/2.7.9
  373  git clone git://github.com/PacificBiosciences/FALCON-integrate.git
  374  cd FALCON-integrate
  375  git checkout master 
  376  make init
  377  ll
  378  cd ..
  379  ll
  380  rm -rf FALCON-integrate/
  381  module list
  382  module load git/2.10.2
  383  git clone git@github.com:PacificBiosciences/FALCON-integrate.git
  384  git clone https://github.com/PacificBiosciences/FALCON-integrate.git
  385  cd FALCON-integrate/
  386  ll
  387  module list
  388  which git
  389  git checkout master
  390  make init
  391  ll
  392  cat default-env.sh 
  393  cat FALCON-make/config-standard.sh 
  394  cat ../config-uppmax.sh 
  395  cat ../uppmax-env.sh 
  396  source ../uppmax-env.sh 
  397  cat makefile 
  398  cp ../uppmax-env.sh .
  399  cp ../config-uppmax.sh FALCON-make/
  400  mv makefile makefile.old
  401  cp ../makefile .
  402  make config-uppmax
  403  make -j all
  404  make install
  405  make test
  406  ll
  407  cd ../../
  408  find . -name fc_run.py
  409  diff ./milou/fc_env/bin/fc_run.py ./src_milou/FALCON-integrate/FALCON/src/py_scripts/fc_run.py
  410  cat ./milou/fc_env/bin/fc_run.py
  411  find . -name fc_run.cfg
  412  cd milou/fc_env/
  413  ll
  414  cd bin/
  415  ll
  416  head fc_*
  417  head -n 1 fc_*
  418  cd ../lib/python2.7/site-packages/
  419  ll
  420  export PYTHONPATH=$PWD:$PYTHONPATH
  421  echo $PATH
  422  cd ..
  423  ll
  424  cd bin/
  425  ll
  426  cat fc_run
  427  cat fc_run.py
  428  dirs
  429  pushd .
  430  cd /sw/apps/bioinfo/FALCON-integrate/20161112/src_milou/FALCON-integrate
  431  ll
  432  make test
  433  vi makefile
  434  cd FALCON-make/
  435  ll
  436  vi makefile 
  437  cd ..
  438  ll
  439  cd FALCON-examples/
  440  ll
  441  vi makefile 
  442  dirs
  443  cd ../..
  444  ll
  445  cd FALCON-integrate/
  446  ll
  447  dirs
  448  swapd
  449  ll
  450  vi fc_run.py 
  451  head -n 1 fc_*
  452  swapd
  453  ll
  454  vi FALCON-examples/makefile 
  455  make test
  456  ll
  457  diff default-env.sh uppmax-env.sh >> ../../../FALCON-integrate-20161112-install-README.md
  458  diff makefile.old makefile >> ../../../FALCON-integrate-20161112-install-README.md
  459  echo FALCON-make/config-uppmax.sh >> ../../../FALCON-integrate-20161112-install-README.md
  460  cat FALCON-make/config-uppmax.sh >> ../../../FALCON-integrate-20161112-install-README.md
  461  htop
  462  env | grep -P 'PYTH|FALC'
  463  env | grep -P 'PYTH|FALC' >> ../../../FALCON-integrate-20161112-install-README.md
  464  cd ../..
  465  ll
  466  cd milou/
  467  ll
  468  cd fc_env/
  469  ll
  470  ll bin/
  471  cd bin
  472  ll
  473  file easy_install
  474  file * | grep python
  475  cat fc_run
  476  cat fc_run1
  477  cat fc_run.py 
  478  file fc_run.py 
  479  file * | grep 'Python script text'
  480  vi $(file * | grep 'Python script text' | cut -f1 -d:)
  481  vi fc_actg_coordinate.py
  482  vi $(file * | grep 'Python script text' | cut -f1 -d:)
  483  cd ../../../..
  484  history >> FALCON-integrate-20161112-install-README.md 
  485  vi FALCON-integrate-20161112-install-README.md 
  486  cd mf
  487  ll
  488  cd /sw/apps/bioinfo/FALCON-integrate
  489  ll
  490  cat ../Krona/mf/2.7 
  491  cd mf
  492  ll
  493  vi 20161112 
  494  vi 20161112 
  495  ll
  496  cd /sw/mf/common/bioinfo-tools/assembly/
  497  ll
  498  mkdir FALCON-integrate
  499  cd FALCON-integrate/
  500  ll
  501  cp /sw/apps/bioinfo/FALCON-integrate/mf/20161112 .
  502  ll
  503  cd /sw/mf/milou/bioinfo-tools/assembly/
  504  mkdir FALCON-integrate
  505  cd FALCON-integrate/
  506  ln -s ../../../../common/bioinfo-tools/assembly/FALCON-integrate/20161112 
  507  ll
  508  cat 20161112 
  509  module spider falcon
  510  cd ..
  511  ll
  512  cd 20161112/
  513  ll
  514  cd milou/
  515  ll
  516  cd fc_env/
  517  ll
  518  cd bin/
  519  ll
  520  ldd LAdump 
  521  ldd *
  522  cd
  523  cd
  524  cd /sw/apps/
  525  ll
  526  cd git/
  527  ll
  528  cd ..
  529  rm -rf git
  530  cd ../comp/
  531  ll
  532  ll git/
  533  cd git/
  534  vi git-2.10.2-install-README.md 
  535  cd /sw/mf/common/
  536  ll
  537  cd bioinfo-tools/
  538  ll
  539  cd assembly/
  540  ll
  541  cd FALCON-integrate/
  542  ll
  543  module spider FALCON
  544  module spider FALCON-integrate
  545  module load FALCON-integrate/20161112
  546  module load bioinfo-tools FALCON-integrate/20161112
  547  fc_consensus
  548  kill %+
  549  jobs
  550  jobs
  551  modlue list
  552  module list
  553  module unload FALCON-integrate
  554  cd /sw/mf/common/bioinfo-tools/assembly/FALCON-integrate
  555  ll
  556  cd ..
  557  cd /sw/apps/bioinfo/
  558  ll
  559  mkdir FALCON-unzip
  560  cd FALCON-unzip/
  561  ll
  562  mkdir 20161112
  563  cd 20161112/
  564  ll
  565  mkdir milou src_milou
  566  cd src_milou/
  567  git clone https://github.com/PacificBiosciences/FALCON_unzip.git
  568  ll
  569  cd FALCON_unzip/
  570  ll
  571  cat README.md 
  572  ll FALCON/
  573  cd ..
  574  rm -rf FALCON_unzip/
  575  git clone --recursive https://github.com/PacificBiosciences/FALCON_unzip.git
  576  ll
  577  rm -rf FALCON_unzip/
  578  git clone https://github.com/PacificBiosciences/FALCON_unzip.git
  579  ll
  580  cd FALCON_unzip/
  581  ll
  582  cd .git
  583  ll
  584  ls -la
  585  vi config 
  586  cd ..
  587  ll .git/refs/
  588  git checkout master
  589  cd ..
  590  rm -rf FALCON_unzip/
  591  git clone git://github.com/PacificBiosciences/FALCON_unzip.git
  592  git clone git://github.com/PacificBiosciences/FALCON_unzip.git
  593  ll
  594  rm -rf FALCON_unzip/
  595  git clone --recursive git://github.com/PacificBiosciences/FALCON_unzip.git
  596  ll
  597  rm -rf FALCON_unzip/
  598  ll
  599  git status
  600  which git
  601  module list
  602  module load python/2.7.9 git/2.10.2
  603  which git
  604  git clone --recursive git://github.com/PacificBiosciences/FALCON_unzip.git
  605  ll
  606  rm -rf FALCON_unzip/
  607  git clone --recursive https://github.com/PacificBiosciences/FALCON_unzip.git
  608  ll FALCON_unzip/
  609  rm -rf FALCON_unzip/
  610  man ssh-agent
  611  ssh-add -h
  612  ssh-agent -s
  613  SSH_AUTH_SOCK=/tmp/ssh-ekQ0VYvntuRg/agent.37544; export SSH_AUTH_SOCK;
  614  SSH_AGENT_PID=37545; export SSH_AGENT_PID;
  615  echo Agent pid 37545;
  616  ssh-add -l
  617  git clone --recursive https://github.com/PacificBiosciences/FALCON_unzip.git
  618  ll
  619  rm -rf *
  620  ssh-add ~/.ssh/github_rsa
  621  git clone --recursive https://github.com/PacificBiosciences/FALCON_unzip.git
  622  ls -l FALCON_unzip/
  623  ls -la FALCON_unzip/
  624  cd FALCON_unzip/
  625  cat .gitmodules 
  626  vi .gitmodules 
  627  git submodule init
  628  git submodule update
  629  git pull
  630  ll
  631  cd FALCON/
  632  ll
  633  git submodule init
  634  git submodule update
  635  cd DALIGNER/
  636  ll
  637  ls -la
  638  cat .git
  639  cd ..
  640  cd .git/modules/
  641  ll
  642  cd FALCON/
  643  ll
  644  cd modules/
  645  ll
  646  cd DA
  647  cd DALIGNER/
  648  ll
  649  cat config 
  650  vi config 
  651  cd ..
  652  cd FALCON/
  653  ll
  654  git submodule update
  655  cd /sw/apps/bioinfo/diamond/
  656  ll
  657  ls -lR
  658  ls
  659  cd 0.7.12
  660  ll
  661  cd src-
  662  cd src-milou/
  663  ll
  664  cat Makefile 
  665  cd ..
  666  ll
  667  ll 0.7.12
  668  VERSION=0.8.26
  669  CLUSTER=${CLUSTER:?CLUSTER must be set}
  670  mkdir $VERSION
  671  cd $VERSION
  672  mkdir $CLUSTER src_$CLUSTER
  673  cd src_$CLUSTER
  674  wget https://github.com/bbuchfink/diamond/archive/v${VERSION}.tar.gz
  675  module spicer gcc
  676  module spider gcc
  677  module load gcc/6.2.0
  678  ll
  679  tar xzf v${VERSION}.tar.gz
  680  ll
  681  cd diamond-$VERSION
  682  ll
  683  cat README.rst 
  684  cat build_simple.sh 
  685  ll
  686  ll src/
  687  cat CMakeLists.txt 
  688  ./build_simple.sh 
  689  ll
  690  ldd diamond
  691  module list
  692  module unload gcc
  693  ldd diamond
  694  ./diamond 
  695  cp diamond diamond_manual.pdf ../../$CLUSTER
  696  cd ../../$CLUSTER
  697  ll
  698  ls ../../0.7.12/
  699  cd ..
  700  history > diamond-0.8.26-install-README.md
  701  module avail gcc
  702      cd /sw/apps/bioinfo/diamond/
  703      VERSION=0.8.26
  704      CLUSTER=${CLUSTER:?CLUSTER must be set}
  705      mkdir $VERSION
  706      cd $VERSION
  707      mkdir $CLUSTER src_$CLUSTER
  708      cd src_$CLUSTER
  709      wget https://github.com/bbuchfink/diamond/archive/v${VERSION}.tar.gz
  710      module load gcc/6.2.0
  711      tar xzf v${VERSION}.tar.gz
  712      cd diamond-$VERSION
  713  vi diamond-0.8.26-install-README.md 
  714  ll
  715  cd mv
  716  cd mf
  717  ll
  718      ./build_simple.sh
  719  ll
  720  ln -s 0.7.9 0.8.26
  721  ll
  722  ls ..
  723  cd ..
  724  ll
  725  cat diamond-0.8.26-install-README.md 
  726  cp diamond diamond_manual.pdf ../../$CLUSTER
  727  cd ../..
  728  ll
  729  ln -s ./milou irma
  730  ln -s ./milou bianca
  731  crontab -l
  732  vi /sw/data/uppnex/diamond_databases/diamond-update-dbs.sh
  733  module spider kraken
  734  vi diamond-0.8.26-install-README.md 
  735  cat mf/0.8.26 
  736  cd /sw/mf/common/bioinfo-tools/alignment/diamond/
  737  ll
  738  ln -s .diamond 0.8.26
  739  ll
  740  cd /sw/mf/milou/bioinfo-tools/alignment/diamond/
  741  ll
  742  ln -s ../../../../common/bioinfo-tools/alignment/diamond/0.8.26 
  743  cd /sw/mf/tintin/bioinfo-tools/alignment/diamond/
  744  ln -s ../../../../common/bioinfo-tools/alignment/diamond/0.8.26 
  745  ll
  746  module list
  747  module load bioinfo-toold diamond
  748  module load bioinfo-tools diamond
  749  module help diamond/0.7.12
  750  module unload diamond
  751  module avail diamond
  752  rm .version 
  753  rm ../../../../milou/bioinfo-tools/alignment/diamond/.version 
  754  module load bioinfo-tools diamond
  755  module help diamond/0.8.26
  756  ll
  757  vi 0.8.26 
  758  dirs
  759  pushd .
  760  cd /sw/apps/bioinfo/diamond/mf
  761  ll
  762  vi 0.8.26 
  763  ll
  764  module sdiamond help
  765  pushd .
  766  cd /sw/data/uppnex/
  767  cd diamond_databases/
  768  ll
  769  less diamond-20160502.txt.gz 
  770  rm diamond-20160502.txt.gz 
  771  ll
  772  cat diamond-update-dbs.sh 
  773  module avail git
  774  exit
  775  t
  776  exit
  777  ll
  778  cd ..
  779  dirs
  780  cd /sw/apps/bioinfo/FALCON-integrate/
  781  ll
  782  cd 20161112/
  783  ll
  784  cd src_milou/
  785  ll
  786  cd FALCON-integrate/
  787  ll
  788  cd FALCON-examples/
  789  ll
  790  ll run
  791  cd run/synth0/
  792  ll
  793  ll mypwatcher/
  794  cd /sw/apps/bioinfo/HISAT2/
  795  ll
  796  cp HISAT2-2.0.1-beta-install-README.md HISAT2-2.0.5-install-README.md 
  797  vi HISAT2-2.0.5-install-README.md 
  798  cat HISAT2-2.0.5-install-README.md 
  799      TOOLDIR=/sw/apps/bioinfo/HISAT2
  800      VERSION=2.0.5
  801      CLUSTER=${CLUSTER?:CLUSTER must be set}
  802      CLUSTERDIR=$TOOLDIR/$VERSION/$CLUSTER
  803      mkdir -p $TOOLDIR
  804      cd $TOOLDIR
  805      mkdir $VERSION
  806      mkdir -p mf
  807      cd $VERSION
  808      mkdir $CLUSTER src_$CLUSTER
  809      cd src_$CLUSTER
  810      wget ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/downloads/hisat2-${VERSION}-source.zip
  811      unzip hisat2-${VERSION}-source.zip
  812  cd hisat2-${VERSION}/
  813  cd /sw/apps/bioinfo/HISAT2/
  814  ll
  815  cd 2.0.1-beta/
  816  ll
  817  cd ..
  818  cd 2.0.5/
  819  ll
  820  cat ../HISAT2-2.0.5-install-README.md 
  821      TOOLDIR=/sw/apps/bioinfo/HISAT2
  822      VERSION=2.0.5
  823      CLUSTER=${CLUSTER?:CLUSTER must be set}
  824      CLUSTERDIR=$TOOLDIR/$VERSION/$CLUSTER
  825      mkdir -p $TOOLDIR
  826      cd $TOOLDIR
  827      mkdir $VERSION
  828      mkdir -p mf
  829      cd $VERSION
  830      mkdir $CLUSTER src_$CLUSTER
  831      cd src_$CLUSTER
  832      wget ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/downloads/hisat2-${VERSION}-source.zip
  833      unzip hisat2-${VERSION}-source.zip
  834      cd hisat2-${VERSION}/
  835     module load gcc/6.2.0
  836      make
  837      make
  838  make install
  839  cat ../../../HISAT2-2.0.5-install-README.md 
  840  ls -ltr
  841      cp -v hisat2 hisat2-align-? hisat2-build hisat2-build-? hisat2-inspect hisat2-inspect-? $CLUSTERDIR/
  842      cp -rv *.py scripts $CLUSTERDIR/
  843  cat ../../../HISAT2-2.0.5-install-README.md 
  844     cp -v hisat2 hisat2-align-? hisat2-build hisat2-build-? hisat2-inspect hisat2-inspect-? $CLUSTERDIR/
  845      cp -rv *.py scripts $CLUSTERDIR/
  846  cd ../../milou/
  847  ll
  848  ldd hisat2-align-1
  849  ldd hisat2-align-l
  850  module list
  851  module unload gcc
  852  module list
  853  ldd hisat2-align-l
  854  head -n 1 *.py
  855  cd ../../mf
  856  ll
  857  cat 2.0.1-beta 
  858  ll
  859  ln -s 2.0.1-beta 2.0.5
  860  ll
  861  cd ..
  862  ll
  863  ll 2.0.1-beta/
  864  cd /sw/mf/common/bioinfo-tools/alignment/
  865  ll
  866  cd HISAT2/
  867  ll
  868  mv 2.0.1-beta .HISAT2-2.0.1-beta && ln -s .HISAT2-2.0.1-beta 2.0.1-beta
  869  ll
  870  ln -s .HISAT2-2.0.1-beta 2.0.5
  871  ll
  872  cd /sw/mf/tintin/bioinfo-tools/alignment/HISAT2/
  873  ll
  874  ln -s ../../../../common/bioinfo-tools/alignment/HISAT2/2.0.5 .
  875  ll
  876  cd /sw/mf/milou/bioinfo-tools/alignment/HISAT2/
  877  ll
  878  ln -s ../../../../common/bioinfo-tools/alignment/HISAT2/2.0.5 .
  879  ll
  880  ll
  881  module spider hisat
  882  module list
  883  module load bioinfo-tools HISAT2/2.0.5
  884  module list
  885  hisat2 -h
  886  cd github-sync/local/uppmax/install-methods/apps/bioinfo/
  887  ll
  888  grep 'R CMD INSTALL' */*.md
  889  grep 'R CMD INSTALL' */*.md
  890  bashswap
  891  env | grep USER
  892  module list
  893  module load R/3.3.1 R_packages/3.3.1
  894  bashswap
  895  exit
  896  bash -l
  897  cd /sw/apps/R_packages/
  898  ll
  899  chmod -R u+w,g+w 3.3.1 &
  900  vi R_packages-3.3.1-install-README.md
  901  ll
  902  module list
  903  module load R/3.3.1
  904  module load R_packages/3.3.1
  905  module list
  906  echo $R_LIBS_USER 
  907  wget https://github.com/Crick-CancerGenomics/ascat/releases/download/v2.4.3/ASCAT_2.4.3.tar.gz
  908  R CMD INSTALL ASCAT_2.4.3.tar.gz 
  909  R
  910  dirs
  911  ll
  912  ll 3.3.1
  913  mkdir 3.3.1/external_packages
  914  mv ASCAT_2.4.3.tar.gz 3.3.1/external_packages/
  915  vi R_packages-3.3.1-install-README.md 
  916  ssh milou-b
  917  R
  918  fb166
  919  exit
  920  screen -ls
  921  screen -R 50367.31O
  922  screen -ls
  923  ps -fu douglas
  924  ps -fu douglas | grep cat
  925  screen -ls
  926  screen -S FI
  927  module load bioinfo-tools FALCON-integrate/20161113
  928  cd /scratch/douglas
  929  ll
  930  cd synth0/
  931  ll
  932  which fc_run
  933  ll /sw/apps/bioinfo/FALCON-integrate/20161113/milou/fc_env/bin
  934  ll /sw/apps/bioinfo/FALCON-integrate/20161113/milou/fc_env/bin
  935  module unload FALCON-integrate/20161113
  936  module load bioinfo-tools FALCON-integrate/20161113
  937  which fc_run
  938  module list
  939  cat logging.json
  940  fc_run fc_run.cfg logging.json 
  941  ll
  942  cat fc_run.cfg 
  943  date
  944  ll
  945  view all.log 
  946  ll 0-rawreads/
  947  rm -rf ?-*
  948  ll scripts/
  949  ll mypwatcher/
  950  ll sge_log/
  951  rm -rf sge_log/
  952  rm -rf mypwatcher/
  953  ll
  954  rm -rf scripts/
  955  fc_run fc_run.cfg logging.json 
  956  ll
  957  ll data
  958  cd data
  959  ls -la
  960  cd ..
  961  ll
  962  ls -la
  963  cd data/
  964  ll
  965  ln -sf /sw/apps/bioinfo/FALCON-integrate/20161113/milou/FALCON-integrate/FALCON-examples/.git-sym/synth5k.2016-11-02 synth5k
  966  ll
  967  cd ..
  968  ll
  969  make clean
  970  fc_run fc_run.cfg logging.json 
  971  ll
  972  chmod -R o+rwX *
  973  ll
  974  make clean
  975  ls -ld .
  976  chmod  o+rwX .
  977  ls -ld .
  978  cd ..
  979  ll
  980  chmod  o+rwX .
  981  cd synth0/
  982  ll
  983  ll data/
  984  cd ..
  985  ll
  986  du.
  987  cp -av synth0 ~/glob/
  988  pushd .
  989  cd
  990  cd glob/
  991  ls -la
  992  cd synth0/
  993  ll
  994  screen -D -RR 33329.FI
  995  /sw/apps/bioinfo/FALCON-integrate/mf
  996  cd /sw/apps/bioinfo/FALCON-integrate/mf
  997  ll
  998  rm 20161112 
  999  ll
 1000  cd ..
 1001  ll
 1002  history
 1003  ll
 1004  history >> FALCON-integrate-20161112-install-README.md 
