# tinyutils-default-install-README.md

TITLE
=====

    tinyutils 1.1

DESCRIPTION
-----------

    Collection of small awk utilities for operating on columns of numbers.

WEBSITE
-------

    https://github.com/douglasgscofield/tinyutils

MODULE REQUIREMENTS
-------------------

    Add /sw/apps/tinyutils/1.1/tinyutils to the user PATH.

LOG
---

    TOOL=/sw/apps/tinyutils
    VERSION=1.1
    VERSIONDIR=$TOOL/$VERSION
    mkdir -p $VERSIONDIR
    cd $VERSIONDIR
    git clone https://github.com/douglasgscofield/tinyutils

To update the local repository:

    TOOL=/sw/apps/tinyutils
    VERSION=default
    VERSIONDIR=$TOOL/$VERSION/tinyutils
    cd $VERSIONDIR
    git pull

If you are me and want to update the remote repository

    TOOL=/sw/apps/tinyutils
    VERSION=default
    VERSIONDIR=$TOOL/$VERSION/tinyutils
    cd $VERSIONDIR
    vi .git/config

Change the https to git.  For commits:

    git push

and enter the password.
   26  cp ../SNPTEST/SNPTEST-2.5.2-install-README.md IMPUTE2-2.3.2-install-README.md
   27  history >> IMPUTE2-2.3.2-install-README.md 
   28  dirs
   29  swapd
   30  cd /sw/mf/milou/bioinfo-tools/misc/
   31  mkdir IMPUTE2 && cd IMPUTE2 && ln -s ../../../../common/bioinfo+tools/misc/IMPUTE2/2.3.2 . && cd .. && fixup IMPUTE2
   32  ll
   33  ll IMPUTE2/
   34  cd IMPUTE2/
   35  ll
   36  ln -sf ../../../../common/bioinfo-tools/misc/IMPUTE2/2.3.2 .
   37  ll
   38  cd ..
   39  fixup IMPUTE2
   40  cd /sw/mf/tintin/bioinfo-tools/misc/
   41  mkdir IMPUTE2 && cd IMPUTE2 && ln -s ../../../../common/bioinfo-tools/misc/IMPUTE2/2.3.2 . && cd .. && fixup IMPUTE2
   42  ll IMPUTE2/
   43  IMPUTE2
   44  impute2
   45  module load qctool
   46  qctool
   47  qctool -help
   48  dirs
   49  e2 -help
   50  swapd
   51  ll
   52  vi IMPUTE2-2.3.2-install-README.md 
   53  cd ..
   54  fixup -g IMPUTE2
   55  mkdir GTOOL
   56  cd src/
   57  cd 0.7.5
   58  mkdir src
   59  cd GTOOL/
   60  mkdir 0.7.5 mf
   61  wget http://www.well.ox.ac.uk/~cfreeman/software/gwas/gtool_v0.7.5_x86_64.tgz
   62  ll
   63  wget http://www.well.ox.ac.uk/~cfreeman/software/gwas/gtool_v0.7.5_x86_64.tgz
   64  ll
   65  tar xzf gtool_v0.7.5_x86_64.tgz 
   66  ll
   67  mkdir ../milou
   68  mv LICENCE gtool example ../milou/
   69  cd ../
   70  ll
   71  ln -s ./milou tintin
   72  ln -s ./milou halvan
   73  ln -s ./milou nestor
   74  ll
   75  cd ..
   76  cd mf
   77  cp ../../IMPUTE2/mf/2.3.2 0.7.5
   78  vi 0.7.5 
   79  cd ../0.7.5/milou/
   80  ll
   81  ./gtool 
   82  ldd gtool 
   83  cd ../../
   84  cp ../IMPUTE2/IMPUTE2-2.3.2-install-README.md GTOOL-0.7.5-install-README.md
   85  history >> GTOOL-0.7.5-install-README.md 
   86  dirs
   87  swapd
   88  mkdir GTOOL
   89  rmdir GTOOL
   90  mkdir GTOOL && cd GTOOL && ln -s ../../../../common/bioinfo-tools/misc/GTOOL/0.7.5 . && cd .. && fixup GTOOL
   91  ll GTOOL/
   92  cd ../../../milou/bioinfo-tools/misc/
   93  mkdir GTOOL && cd GTOOL && ln -s ../../../../common/bioinfo-tools/misc/GTOOL/0.7.5 . && cd .. && fixup GTOOL
   94  ll GTOOL/
   95  cd /sw/mf/common/bioinfo-tools/misc/
   96  mkdir GTOOL && cd GTOOL 
   97  dirs
   98  cp /sw/apps/bioinfo/GTOOL/mf/0.7.5 .
   99  ll
  100  ll /sw/mf/milou/bioinfo-tools/misc/GTOOL/
  101  ll
  102  cd ..
  103  fixup GTOOL/
  104  ll
  105  module load GTOOL
  106  gtool -help
  107  gtool
  108  module list
  109  module list
  110  module load bioinfo-tools qctool IMPUTE2 SNPTEST
  111  module load GTOOL
  112  qctool -help
  113  impute2
  114  snptest -help
  115  module list
  116  dirs
  117  swapd
  118  cd ..
  119  mkdir inthinnerator
  120  cd inthinnerator/
  121  cd inthinnerator/
  122  ll
  123  mkdir 2.0-dev
  124  mkdir mf
  125  cd 2.0-dev/
  126  mkdir src
  127  cd src/
  128  wget http://www.well.ox.ac.uk/~gav/inthinnerator/resources/inthinnerator_v2.0-dev-scientific-linux-x86_64.tgz
  129  wget http://www.well.ox.ac.uk/~gav/inthinnerator/resources/inthinnerator_v2.0-dev-linux-x86_64.tgz
  130  ll
  131  ll
  132  hg clone --rev qctool-release https://gavinband@bitbucket.org/gavinband/qctool
  133  module load gcc/4.9.2 zlib
  134  module spider boost
  135  module load boost/1.59.0_gcc4.9.2
  136  ll
  137  cd qctool/
  138  ll
  139  ./waf-1.5.18 configure
  140  env | grep BOOST
  141  ./waf-1.5.18 --help
  142  ll /sw/apps/build/boost/1.59.0_gcc4.9.2/milou
  143  ll /sw/apps/build/boost/1.59.0_gcc4.9.2/milou/include/
  144  cd /sw/apps/bioinfo/inthinnerator/2.0-dev/
  145  ll
  146  mkdir milou
  147  ll /sw/apps/build/boost/1.59.0_gcc4.9.2/milou/lib/
  148  ./waf-1.5.18 configure --prefix=/sw/apps/bioinfo/inthinnerator/2.0-dev/milou --boost-includes=$BOOST_ROOT/include/boost --boost-libs=$BOOST_ROOT/lib
  149  ./waf-1.5.18 configure --prefix=/sw/apps/bioinfo/inthinnerator/2.0-dev/milou --boost-includes=$BOOST_ROOT/include --boost-libs=$BOOST_ROOT/lib
  150  ./waf-1.5.18 configure --prefix=/sw/apps/bioinfo/inthinnerator/2.0-dev/milou --boost-includes=$BOOST_ROOT/include --boost-libs=$BOOST_ROOT
  151  module unload boost gcc zlib
  152  module list
  153  modulue unload SNPTEST IMPUTE2 qctool bioinfo-tools
  154  module unload SNPTEST IMPUTE2 qctool bioinfo-tools
  155  ./waf-1.5.18 configure --prefix=/sw/apps/bioinfo/inthinnerator/2.0-dev/milou 
  156  ls /usr/lib64/boost/
  157  ls /usr/lib64/*boost*
  158  ./waf-1.5.18 configure --prefix=/sw/apps/bioinfo/inthinnerator/2.0-dev/milou --boost-libs=/usr/lib64
  159  module spider blas
  160  module load openblas/0.2.14a
  161  ./waf-1.5.18 configure --prefix=/sw/apps/bioinfo/inthinnerator/2.0-dev/milou --boost-libs=/usr/lib64
  162  module load gcc/4.9.2 boost/1.59.0_gcc4.9.2 zlib/1.2.8
  163  vi waf-1.5.18 
  164  module load python/2.7.6
  165  ./waf-1.5.18 configure --prefix=/sw/apps/bioinfo/inthinnerator/2.0-dev/milou --boost-libs=/usr/lib64
  166  ./waf-1.5.18 configure --prefix=/sw/apps/bioinfo/inthinnerator/2.0-dev/milou --boost-libs=/usr/lib64
  167  ./waf-1.5.18 configure --prefix=/sw/apps/bioinfo/inthinnerator/2.0-dev/milou --boost-includes=$BOOST_ROOT/include --boost-libs=$BOOST_ROOT
  168  ./waf-1.5.18 configure --prefix=/sw/apps/bioinfo/inthinnerator/2.0-dev/milou --boost-includes=$BOOST_ROOT/include --boost-libs=$BOOST_ROOT/lib
  169  ll $BOOST_ROOT/lib
  170  vi waf-1.5.18 
  171  ll
  172  view README.txt 
  173  ./waf-1.5.18 configure -v -j1 --prefix=/sw/apps/bioinfo/inthinnerator/2.0-dev/milou --boost-includes=$BOOST_ROOT/include --boost-libs=$BOOST_ROOT/lib
  174  ./waf-1.5.18 configure -v  --prefix=/sw/apps/bioinfo/inthinnerator/2.0-dev/milou --boost-includes=$BOOST_ROOT/include --boost-libs=$BOOST_ROOT/lib
  175  which g++
  176  echo $LIBRARY_PATH
  177  ./waf-1.5.18 configure -v -j4 --prefix=/sw/apps/bioinfo/inthinnerator/2.0-dev/milou --boost-includes=$BOOST_ROOT/include --boost-libs=$BOOST_ROOT/lib
  178  ./waf-1.5.18 -h
  179  ./waf-1.5.18 configure -vv  --prefix=/sw/apps/bioinfo/inthinnerator/2.0-dev/milou --boost-includes=$BOOST_ROOT/include --boost-libs=$BOOST_ROOT/lib
  180  ./waf-1.5.18 configure -vvv  --prefix=/sw/apps/bioinfo/inthinnerator/2.0-dev/milou --boost-includes=$BOOST_ROOT/include --boost-libs=$BOOST_ROOT/lib
  181  ll $BOOST_ROOT/lib
  182  ls -a
  183  cd .waf-1.5.18-402a8e0721eb718ff717906f130db0f4/
  184  ll
  185  cd wafadmin/
  186  ll
  187  cd ../..
  188  ll
  189  cd build
  190  ll
  191  ls -la
  192  cd .conf_check_0/
  193  ll
  194  ls -la
  195  cat test.cpp 
  196  cd testbuild/
  197  ll
  198  cd default/
  199  ll
  200  ./testprog 
  201  ldd test
  202  ldd testprog 
  203  cd ../../..
  204  cd ../..
  205  ll
  206  cd qctool/
  207  ll
  208  ./waf-1.5.18 -h
  209  ./waf-1.5.18 configure -vvv --static --prefix=/sw/apps/bioinfo/inthinnerator/2.0-dev/milou --boost-includes=$BOOST_ROOT/include --boost-libs=$BOOST_ROOT/lib
  210  ./waf-1.5.18 configure --static --prefix=/sw/apps/bioinfo/inthinnerator/2.0-dev/milou --boost-includes=$BOOST_ROOT/include --boost-libs=$BOOST_ROOT/lib
  211  htop
  212  exit
  213  ssh h1
  214  htop
  215  groups
  216  intersect_user douglas agouin
  217  cd /proj/b2015064
  218  ll
  219  cd private/
  220  ll
  221  view COMMANDS.sh 
  222  man rsync
  223  view COMMANDS.sh 
  224  exit
  225  newgrp b2015064
  226  cd  /sw/comp/perl_modules/5.18.4/milou/lib/perl5/x86_64-linux-thread-multi
  227  ll
  228  ll audo
  229  ll auto
  230  ls -ld auto
  231  cd auto
  232  ll
  233  cd ..
  234  ll
  235  cat ~/bin/fixup
  236  ll
  237  cd auto
  238  ll
  239  fixup -g Types
  240  ll
  241  cd ../..
  242  fixup -g x86_64-linux-thread-multi
  243  cd x86_64-linux-thread-multi/
  244  ll
  245  cat ~/bin/fixup
  246  cd ..
  247  vi ~/bin/fixup
  248  fixup -g x86_64-linux-thread-multi
  249  cd x86_64-linux-thread-multi/
  250  ll
  251  cd ..
  252  vi ~/bin/fixup
  253  fixup -g x86_64-linux-thread-multi
  254  vi ~/bin/fixup
  255  cd ../../../..
  256  cd ..
  257  fixup -g perl_modules
  258  cd -
  259  cd 5.18.4/milou/
  260  ll
  261  cd lib/
  262  ll
  263  cd perl5/
  264  ll
  265  cd x86_64-linux-thread-multi/
  266  ll
  267  cat ~/bin/fixup
  268  cd ../..
  269  cd ..
  270  ll
  271  cd ..
  272  ll
  273  cd perl
  274  ll
  275  fixup -g 5.18.4
  276  man scontrol
  277  cat /etc/motd
  278  scontrol show -M halvan jobid=34660
  279  exit
  280  exit
  281  screen -ls
  282  uptime
  283  w
  284  cd /proj/b2010042/nobackup/linkage-map/diploid-evaluation
  285  ll
  286  rm -f core.508* J JJ s f
  287  ll
  288  rm -f *.rerun
  289  ll  /proj/b2010042/linkage-map/probe-scaffolds-reference/
  290  ll *sh
  291  vi call_diploid_variants_viafull.sh 
  292  ls
  293  cd viafull-SNP-calls/
  294  ls
  295  less viafull-UME_081103_P15_WH10.log.gz
  296  less viafull-UME_081103_P15_WH10.log.gz
  297  cd ..
  298  vi call_diploid_variants_viafull.sh 
  299  ll
  300  cat slurm-7038758.out
  301  cd reference/
  302  grep MA_52914 probes_RG_0802-diploid_scaffolds.bed 
  303  grep MA_52914 probes_RG_0802-diploid_scaffolds.fa
  304  grep MA_52914 probes_RG_0802-diploid_scaffolds.fa.fai
  305  grep -A 10 MA_52914 probes_RG_0802-diploid_scaffolds.fa
  306  projplot -A b2010042
  307  exit
  308  which unrar
  309  which rar
  310  bashswap
  311  l
  312  which unrar
  313  which rar
  314  cd tools/
  315  ll
  316  cd ../bin
  317  cd tools/
  318  wget http://www.rarlab.com/rar/rarlinux-x64-5.3.b4.tar.gz
  319  tar xvzf rarlinux-x64-5.3.b4.tar.gz
  320  cd rar
  321  ./unrar 
  322  cp unrar ../..
  323  ll
  324  exit
  325  exit
  326  finger berrit
  327  intersect_user berritki douglas
  328  show_proj snic2015-6-172
  329  groups alexs
  330  module load bioinfo-tools
  331  module load deeptools
  332  module load deepTools
  333  module list
  334  cd /sw/apps/bioinfo/
  335  ls
  336  cd deepTools/
  337  ll
  338  view deepTools-2.0.1-install-README.md 
  339  module list
  340  ll
  341  view deepTools-1.5.11-install-README.md 
  342  cd /sw/apps/bioinfo/deepTools
  343  ll
  344  cd mf
  345  ll
  346  diff 1.5.11 2.0.1 
  347  vi ../../vep/mf/82 
  348  ll
  349  vi *
  350  ll
  351  ll /sw/mf/common/bioinfo-tools/misc/deepTools/
  352  cp * /sw/mf/common/bioinfo-tools/misc/deepTools/
  353  ll /sw/mf/common/bioinfo-tools/misc/deepTools/
  354  ll
  355  w
  356  htop
  357  bashswap
  358  exit
  359  exit
  360  ll /sw/apps/bioinfo/
  361  cd CNV-seq
  362  cd /sw/apps/bioinfo/
  363  cd CNV-seq
  364  ll
  365  cd 20140812/
  366  ll
  367  cd src/
  368  ll
  369  cd cnv-seq/
  370  ll
  371  module load bioinfo-tools
  372  module load trimmomatic
  373  module help trimmomatic
  374  module unload trimmomatic
  375  module load trimmomatic/0.32
  376  ll
  377  ll cnv
  378  cd /sw/apps/bioinfo/
  379  ll
  380  pushd .
  381  cd 
  382  cd /sw/apps/bioinfo/CNV-seq
  383  cd 20140812/
  384  ll
  385  cd src/
  386  ll
  387  cd /sw/apps/bioinfo/CNV-seq/20140812/src
  388  cd /sw/apps/bioinfo/CNV-seq/20140812/src
  389  ll
  390  pushd .
  391  cd /sw/apps/bioinfo/RepeatModeler/
  392  ll
  393  cd ..
  394  cd RepeatExplorer/
  395  ll
  396  cd ..
  397  ll
  398  mkdir milou
  399  ll
  400  cd milou/
  401  ll
  402  mkdir R_packages
  403  cd R_packages/
  404  export R_LIBS_USER=$PWD
  405  echo $R_LIBS_USER 
  406  cd ../../src
  407  ll
  408  cd cnv-seq/
  409  ll
  410  module load R/3.2.3
  411  which R
  412  R CMD INSTALL -l $R_LIBS_USER/ cnv/
  413  R CMD INSTALL -l $R_LIBS_USER/ ggplot2
  414  cd ..
  415  wget https://github.com/hadley/ggplot2/archive/v1.0.1.tar.gz
  416  rm v1.0.1.tar.gz 
  417  wget https://cran.r-project.org/src/contrib/Archive/ggplot2/ggplot2_1.0.1.tar.gz
  418  R CMD INSTALL -l $R_LIBS_USER/ ggplot2_1.0.1.tar.gz 
  419  ll
  420  tar xzf ggplot2_1.0.1.tar.gz 
  421  cd ggplot2/
  422  export R_LIBS_USER=/sw/apps/bioinfo/CNV-seq/20140812/milou/R_packages
  423  module load R/3.2.3
  424  cd /sw/apps/bioinfo/CNV-seq/20140812/src/ggplot2
  425  ll
  426  cat DESCRIPTION 
  427  cd ..
  428  wget https://cran.r-project.org/src/contrib/Rcpp_0.12.3.tar.gz
  429  R CMD INSTALL -l $R_LIBS_USER/ Rcpp_0.12.3.tar.gz 
  430  ls
  431  wget https://cran.r-project.org/src/contrib/gtable_0.1.2.tar.gz
  432  R CMD INSTALL -l $R_LIBS_USER/ gtable_0.1.2.tar.gz 
  433  wget https://cran.r-project.org/src/contrib/plyr_1.8.3.tar.gz
  434  R CMD INSTALL -l $R_LIBS_USER/ plyr_1.8.3.tar.gz 
  435  wget https://cran.r-project.org/src/contrib/digest_0.6.9.tar.gz
  436  R CMD INSTALL -l $R_LIBS_USER/ digest_0.6.9.tar.gz 
  437  wget https://cran.r-project.org/src/contrib/scales_0.3.0.tar.gz
  438  R CMD INSTALL -l $R_LIBS_USER/ scales_0.3.0.tar.gz 
  439  wget https://cran.r-project.org/src/contrib/RColorBrewer_1.1-2.tar.gz
  440  R CMD INSTALL -l $R_LIBS_USER/ RColorBrewer_1.1-2.tar.gz 
  441  wget https://cran.r-project.org/src/contrib/dichromat_2.0-0.tar.gz
  442  R CMD INSTALL -l $R_LIBS_USER/ dichromat_2.0-0.tar.gz 
  443  wget https://cran.r-project.org/src/contrib/colorspace_1.2-6.tar.gz
  444  R CMD INSTALL -l $R_LIBS_USER/ colorspace_1.2-6.tar.gz 
  445  wget https://cran.r-project.org/src/contrib/munsell_0.4.2.tar.gz
  446  R CMD INSTALL -l $R_LIBS_USER/ munsell_0.4.2.tar.gz 
  447  wget https://cran.r-project.org/src/contrib/labeling_0.3.tar.gz
  448  R CMD INSTALL -l $R_LIBS_USER/ labeling_0.3.tar.gz 
  449  R CMD INSTALL -l $R_LIBS_USER/ scales_0.3.0.tar.gz 
  450  wget https://cran.r-project.org/src/contrib/stringi_1.0-1.tar.gz
  451  R CMD INSTALL -l $R_LIBS_USER/ stringi_1.0-1.tar.gz 
  452  cd ..
  453  ll
  454  wget https://cran.r-project.org/src/contrib/magrittr_1.5.tar.gz
  455  R CMD INSTALL -l $R_LIBS_USER/ magrittr_1.5.tar.gz 
  456  wget https://cran.r-project.org/src/contrib/stringr_1.0.0.tar.gz
  457  R CMD INSTALL -l $R_LIBS_USER/ stringr_1.0.0.tar.gz 
  458  R CMD INSTALL -l $R_LIBS_USER/ ggplot2_1.0.1.tar.gz 
  459  wget https://cran.r-project.org/src/contrib/reshape2_1.4.1.tar.gz
  460  R CMD INSTALL -l $R_LIBS_USER/ reshape2_1.4.1.tar.gz 
  461  wget https://cran.r-project.org/src/contrib/proto_0.3-10.tar.gz
  462  R CMD INSTALL -l $R_LIBS_USER/ proto_0.3-10.tar.gz 
  463  R CMD INSTALL -l $R_LIBS_USER/ ggplot2_1.0.1.tar.gz 
  464  cd cnv-seq/
  465  ll
  466  R CMD INSTALL -l $R_LIBS_USER/ cnv/
  467  ll
  468  cd ../milou/
  469  ll
  470  vi best-hit.BLAT.pl 
  471  vi *.pl
  472  cp -p *.pl ../../milou
  473  cd ../src
  474  ll
  475  mkdir tmp
  476  cd tmp
  477  tar xzf ../cnv-seq.tar.gz 
  478  ll
  479  cd cnv-seq/
  480  ll
  481  head -n 1 *.pl
  482  cd ../../..
  483  view RepeatExplorer-170ebc5db0d7-0.9.7.6-install-README.md 
  484  cp RepeatExplorer-170ebc5db0d7-0.9.7.6-install-README.md /sw/apps/bioinfo/CNV-seq/CNV-seq-20140812-install-README.md
  485  history >> CNV-seq-20140812-install-README.md 
  486  pushd .
  487  popd
  488  swapd
  489  cd ../..
  490  module list
  491  history | grep wget
  492  history | grep cnv-seq
  493  htop
  494  history | grep gtable
  495  history | grep gtable
  496  module list
  497  ll
  498  vi CNV-seq-20140812-install-README.md 
  499  mkdir mf
  500  cd mf
  501  cd mf
  502  cat ../../deepTools/mf/2.0.1 
  503  htop
  504  echo $R_LIBS_USER
  505  cp ../../IMPUTE2/mf/2.3.2 20140812 && vi 20140812
  506  vi 20140812
  507  cd ../20140812
  508  ll
  509  mv manual.pdf milou/
  510  ln -s ./milou halvan
  511  ln -s ./milou nestor
  512  ln -s ./milou tintin
  513  cd /sw/mf/common/bioinfo/misc
  514  cd /sw/mf/common/bioinfo-tools/misc/
  515  mkdir CNV-seq
  516  cd CNV-seq
  517  cp /sw/apps/bioinfo/CNV-seq/mf/20140812 .
  518  cd ..
  519  fixup CNV-seq
  520  cd ../..
  521  fixup -g CNV-seq
  522  cd /sw/mf/milou/bioinfo-tools/misc
  523  mkdir CNV-seq && cd CNV-seq && ln -s ../../../../common/bioinfo-tools/misc/CNV-seq/20140812 . && cd .. && fixup CNV-seq
  524  ll CNV-seq
  525  cd /sw/mf/tintin/bioinfo-tools/misc
  526  mkdir CNV-seq && cd CNV-seq && ln -s ../../../../common/bioinfo-tools/misc/CNV-seq/20140812 . && cd .. && fixup CNV-seq
  527  mkdir tmp
  528  cd tmp
  529  ll
  530  cd tmp
  531  ll
  532  cd ..
  533  mkdir CNV
  534  cd CNV
  535  wget http://tiger.dbs.nus.edu.sg/cnv-seq/data/sample1.tar.gz
  536  tar xzf sample1.tar.gz 
  537  module load bioinfo-tools CNV-seq
  538  module list
  539  best-hit.BLAT.pl ref.psl > ref.hits
  540  best-hit.BLAT.pl test.psl > test.hits
  541   cnv-seq.pl --test test.hits --ref ref.hits --genome chrom1 --log2 0.6 --p 0.001 --bigger-window 1.5 --annotate --minimum-windows 4
  542  ll
  543  R
  544  ll
  545  cd ..
  546  cd CNV-seq
  547  vi *.md
  548  cd 
  549  module spider CNV
  550  module spider repeatmasker
  551  jobstats -M halvan -p 34660
  552  htop
  553  jiu 
  554  jiu 
  555  jiu omneya
  556  cd /scratch
  557  ls
  558  ll
  559  df -kh
  560  df -kh .
  561  ll | grep omne
  562  cd 34660
  563  ll
  564  jiu omneya
  565  scsv 34660
  566  scsvv 34660
  567  cat /pica/v13/b2015084_nobackup/omneya_Nov15/151009_M00485_0230_000000000-AHWAP/Chim.batch
  568  cat /pica/v13/b2015084_nobackup/omneya_Nov15/151009_M00485_0230_000000000-AHWAP/chimera.batch
  569  ll /pica/v13/b2015084_nobackup/omneya_Nov15/151009_M00485_0230_000000000-AHWAP/
  570  ll /pica/v13/b2015084_nobackup/omneya_Nov15/151009_M00485_0230_000000000-AHWAP
  571  ll /pica/v13/b2015084_nobackup/omneya_Nov15/
  572  cd ..
  573  ls
  574  ls -ltr
  575  ls -ltr
  576  cat yum_save_tx-2016-01-13-09-50PDKAa9.yumtx 
  577  cd /tmp
  578  ls
  579  ll
  580  cd slurmd/
  581  ll
  582  cd job3466
  583  cd job34660/
  584  ll h1_34660.4294967294
  585  module list
  586  exit
  587  module spider repeat
  588  intersect_user berritki douglas
  589  cd /proj/snic2015-6-172
  590  ll
  591  cd private/
  592  newgroup snic2015-6-172
  593  cd /sw/share/slurm/halvan/uppmax_jobstats/h1/
  594  ll
  595  jobstats -h
  596  jobstats -M halvan -p 34660
  597  jobstats -X $PWD 34660
  598  plot_jobstats 
  599  plot_jobstats 
  600  view `which process_jobstats`
  601  view `which plot_jobstats`
  602  plot_jobstats -c halvan 34660 
  603  cd
  604  plot_jobstats -c halvan /sw/share/slurm/halvan/uppmax_jobstats/h1/34660 
  605  eog halvan---34660.png 
  606  cd
  607  eog halvan---34660.png 
  608  cd /proj/snic2015-6-172/private/postQC-data/
  609  ll
  610  ls -la
  611  cd ..
  612  ll
  613  cd scripts/
  614  ls -la
  615  R
  616  exit
  617  newgrp snic2015-6-172
  618  exit
  619  cd private
  620  ll
  621  cd postQC-data/
  622  ll
  623  cd ..
  624  ls -la
  625  cd scripts/
  626  ll
  627  cat trim_22Ha.txt
  628  eog trial_trim_lengths.png
  629  cd ..
  630  ll
  631  cd Sample_22Hb
  632  ll
  633  pushd .
  634  cd ../postQC-data
  635  ll
  636  view SC270_22Ha_CGATGT_L004_R1_001.complete.cutReport
  637  swapd
  638  ll
  639  zless SC271_22Hb_ACAGTG_L004_R1_001.fastq.gz
  640  cd ..
  641  ll
  642  cd nobackup
  643  ll
  644  cd ..
  645  ll
  646  cd ..
  647  ll
  648  cd nobackup/
  649  ll
  650  cd private/
  651  ll
  652  cd ..
  653  ll
  654  cd ../private
  655  ll
  656  dirs
  657  cd Sample_22Ha
  658  ll
  659  zhead SC270_22Ha_CGATGT_L004_R1_001.fastq.gz
  660  zcat SC270_22Ha_CGATGT_L004_R1_001.fastq.gz | grep -c '^@HISEQ'
  661  zcat ../Sample_22Hb/SC271_22Hb_ACAGTG_L004_R1_001.fastq.gz  | grep -c '^@HISEQ'
  662  zcat ../Sample_44La/SC272_44La_GATCAG_L004_R1_001.fastq.gz  | grep -c '^@HISEQ'
  663  zcat ../Sample_44Lb/SC273_44Lb_CTTGTA_L004_R1_001.fastq.gz  | grep -c '^@HISEQ'
  664  exit
  665  newgrp snic2015-6-172
  666  exit
  667  rsync halvan---34660.png douglasscofield@fb166.ebc.uu.se:.
  668  w
  669  exit
  670  ssh h1
  671  exit
  672  ssh -Y omneya@h1.uppmax.uu.se
  673  exit
  674  show_proj fffff
  675  view /sw/uppmax/etc/projects
  676  cd /sw/apps/bioinfo/RepeatMasker/
  677  ll
  678  view Install.4.0.1 
  679  cd 4.0.6/
  680  ll
  681  cd milou/
  682  ll
  683  pushd .
  684  cd
  685  cd /sw/mf/common/bioinfo-tools/misc/RepeatMasker/
  686  ll
  687  cat 4.0.6 
  688  dirs
  689  swapd
  690  cat README 
  691  ll
  692  ll Libraries/
  693  cd Libraries/
  694  ll
  695  file Repeat*lib
  696  cd ..
  697  cd util/
  698  ll
  699  cd ..
  700  ll
  701  cd ..
  702  ll
  703  ln -s ./milou halvan
  704  ln -s ./milou tintin
  705  cd /sw/mf/tintin/bioinfo-tools/
  706  ll
  707  cd misc
  708  ll
  709  mkdir RepeatMasker
  710  ll
  711  cd RepeatMasker/
  712  ln -s ../../../../common/bioinfo-tools/misc/RepeatMasker/4.0.6 .
  713  ll
  714  cd ..
  715  fixup RepeatMasker
  716  exit
  717  exit
  718  cd github-sync/local/uppmax/
  719  git status
  720  cd install-methods/
  721  ll
  722  ./gather-READMEs.sh 
  723  cd /sw/apps/bioinfo
  724  mkdir GERP++
  725  cd GERP++/
  726  ll
  727  mkdir 20110522
  728  cd 20110522/
  729  mkdir src milou
  730  cd src
  731  wget http://mendel.stanford.edu/SidowLab/downloads/gerp/gerp++.tar.gz
  732  tar xzf gerp++.tar.gz 
  733  ll
  734  cd /sw/apps/bioinfo/GERP++/20110522/src
  735  vi README.txt 
  736  view Makefile 
  737  module load gcc/4.9.3
  738  module load gcc/4.9.2
  739  make
  740  vi etree.cc 
  741  make
  742  vi etree.cc 
  743  make
  744  vi gerpcol.cc 
  745  make
  746  vi gerpcol.cc 
  747  make
  748  ll
  749  make clean
  750  ll
  751  rm -f *.h *.cc *.txt
  752  ll
  753  rm Makefile 
  754  tar xzf gerp++.tar.gz 
  755  ll
  756  vi Constants.h 
  757  vi Makefile 
  758  module unload gcc
  759  module list
  760  make clean
  761  ll
  762  make
  763  vi etree.cc 
  764  vi etree.h 
  765  vi etree.cc 
  766  make
  767  vi Makefile 
  768  gcc --help
  769  gcc --help -v
  770  make
  771  vi gerpcol.cc 
  772  make
  773  vi Makefile 
  774  make
  775  vi gerpcol.cc 
  776  grep sort *
  777  view gerpcol.cc gerpelem.cc 
  778  vi Mseq.h 
  779  vi gerpcol.cc gerpelem.cc 
  780  make
  781  vi gerpcol.cc gerpelem.cc 
  782  make
  783  make clean
  784  ll
  785  make
  786  cd ..
  787  mv src/gerp++.tar.gz .
  788  ll
  789  mkdir orig-src
  790  mv gerp++.tar.gz orig-src/
  791  cd orig-src/
  792  tar xzf gerp++.tar.gz 
  793  ll
  794  mv gerp++.tar.gz ..
  795  ll
  796  cd ..
  797  cd src
  798  ll
  799  make clean
  800  make
  801  ll
  802  cp -pv gerpcol gerpelem ../milou/
  803  make clean
  804  ll
  805  cd ..
  806  diff orig-src src
  807  ll
  808  cd data
  809  diff orig-src src > ../GERP++-20110422-install-README.md
  810  ll
  811  cd milou/
  812  ll
  813  mkdir data
  814  cd data
  815  ll
  816  cd /sw/apps/bioinfo/GERP++/20110522/milou/data
  817  ll
  818  wget http://mendel.stanford.edu/SidowLab/downloads/gerp/hg19.GERP_elements.tar.gz
  819  ll
  820  wget http://mendel.stanford.edu/SidowLab/downloads/gerp/Readme.txt
  821  wget http://mendel.stanford.edu/SidowLab/downloads/gerp/mm9.GERP_elements.tar.gz
  822  wget http://mendel.stanford.edu/SidowLab/downloads/gerp/hg18.GERP_elements.tar.gz
  823  wget http://mendel.stanford.edu/SidowLab/downloads/gerp/hg19.GERP_scores.tar.gz
  824  ll
  825  rm hg19.GERP_scores.tar.gz
  826  ll
  827  cat RE
  828  cat Readme.txt 
  829  cd ../../..
  830  screen -S data
  831  cd ../../..
  832  ll
  833  history >> GERP++-20110422-install-README.md 
  834  vi GERP++-20110422-install-README.md 
  835  screen -R data
  836  :q
  837  ll
  838  cd 20110522/
  839  ll
  840  cd milou/
  841  ll
  842  cd data/
  843  ll
  844  vi GERP++-20110422-install-README.md 
  845  screen -R data
  846  cd data/
  847  ll
  848  view Readme.txt 
  849  dos2unix Readme.txt 
  850  tar xzf hg18.GERP_elements.tar.gz 
  851  ll
  852  rm -f chr*.elements.txt
  853  ll
  854  mkdir hg18 hg19 mm9
  855  cd hg18
  856  tar xvzf ../hg18.GERP_elements.tar.gz 
  857  tar xvzf ../hg18.GERP_scores.tar.gz 
  858  cd ../mm9/
  859  ll
  860  tar xvzf ../mm9.GERP_elements.tar.gz 
  861  ll
  862  cd ../..
  863  ll
  864  cd ../../..
  865  fixup -g GERP++
  866  ll
  867  cd GERP++/
  868  ll
  869  mkdir mf
  870  cd mf
  871  cp ../../IMPUTE2/mf/2.3.2 20110522
  872  vi 20110522 
  873  cp -p 20110522 /sw/mf/common/bioinfo-tools/misc/GERP++
  874  module load bioinfo-tools GERP++
  875  echo $GERP_DATA
  876  ll $GERP_DATA/hf18
  877  ll $GERP_DATA/hg18
  878  ll $GERP_DATA/hg19
  879  cd $GERP_DATA
  880  cd ..
  881  ll
  882  gerpcol -h
  883  gerpelem -h
  884  exit
  885  cd ..
  886  ll
  887  cd 20110522/
  888  ll
  889  cd src/
  890  ll
  891  less COPYRIGHT.txt 
  892  file COPYRIGHT.txt
  893  mv COPYRIGHT.txt COPYRIGHT.txt.gz
  894  gunzip COPYRIGHT.txt.gz 
  895  ll
  896  less COPYRIGHT.txt 
  897  ll
  898  less COPYRIGHT.txt 
  899  cd ../../mf
  900  ll
  901  vi 20110522 
  902  cp -p 20110522 /sw/mf/common/bioinfo-tools/misc/GERP++
  903  module load bioinfo-tools GERP++
  904  less $GERP_DATA/Readme.txt
  905  exit
  906  screen -ls
  907  for S in http://mendel.stanford.edu/SidowLab/downloads/gerp/hg19.GERP_scores.tar.gz http://mendel.stanford.edu/SidowLab/downloads/gerp/hg18.GERP_scores.tar.gz http://mendel.stanford.edu/SidowLab/downloads/gerp/mm9.GERP_scores.tar.gz ; do wget "$S" ; done
  908  cd hg19
  909  tar xvzf ../hg19.GERP_elements.tar.gz 
  910  tar xvzf ../hg19.GERP_scores.tar.gz 
  911  cd ..
  912  cd mm9/
  913  ll
  914  ls ..
  915  tar xvzf ../mm9.GERP_scores.tar.gz 
  916  ll
  917  cd ..
  918  ll
  919  ll hg18
  920  ll hg19
  921  ll
  922  cd ../..
  923  ll
  924  ln -s ./milou nestor
  925  ln -s ./milou halvan
  926  ln -s ./milou tintin
  927  cd /sw/mf/common/bioinfo-tools/misc/
  928  mkdir GERP++
  929  cd GERP++/
  930  cd ..
  931  ll
  932  fixup GERP++/
  933  ll
  934  rm test.impute2_*
  935  ll
  936  ls -ltr
  937  cd /sw/mf/milou/bioinfo-tools/misc/
  938  mkdir GERP++ && cd GERP++ && ln -s ../../../../common/bioinfo-tools/misc/GERP++/20110522 . && cd .. && fixup GERP++
  939  ll
  940  ll GERP++/
  941  cd GERP++/
  942  ls -lL
  943  cd /sw/mf/tintin/bioinfo-tools/misc
  944  mkdir GERP++ && cd GERP++ && ln -s ../../../../common/bioinfo-tools/misc/GERP++/20110522 . && cd .. && fixup GERP++
  945  cd ../../../common/bioinfo-tools/misc/
  946  ll
  947  cd GERP++/
  948  ll
  949  module load bioinfo-tools GERP++
  950  cd /proj/b2010042/nobackup
  951  ls
  952  cd linkage-map/
  953  ll
  954  cd diploid-evaluation/
  955  ll
  956  ll *sh
  957  cat combine-p9-gvcfs.sh 
  958  cat combine-gvcfs.sh
  959  :q
  960  exit
  961  cd
  962  cd tmp
  963  ll
  964  ls -ltr
  965  cd tmp
  966  ll
  967  cd ..
  968  ll
  969  plot_jobstats -c halvan /sw/share/slurm/halvan/uppmax_jobstats/h1/34660 
  970  ls -ltr
  971  eog halvan---34660.png 
  972  cd .snapshot
  973  ll
  974  cd 2016-02-10_1105+0100.Hourly
  975  ll
  976  eog halvan---34660.png 
  977  cd
  978  mkdir halvan
  979  mv halvan---34660.png halvan
  980  cd halvan/
  981  ll
  982  jobstats -h
  983  jobstats -p 6853923 6855964 6856234 6874738 6880788 6930764 6942776 7010203 7011341 | tee jobs
  984  find /sw/share/slurm/milou/uppmax_jobstats -name 6853923
  985  find /sw/share/slurm/milou/uppmax_jobstats -name 6855964
  986  find /sw/share/slurm/milou/uppmax_jobstats -name 6856234
  987  find /sw/share/slurm/milou/uppmax_jobstats -name 6874738
  988  find /sw/share/slurm/milou/uppmax_jobstats -name 6880788
  989  find /sw/share/slurm/milou/uppmax_jobstats -name 6930764
  990  ll
  991  eog *.png
  992  exit
  993  ls -ld .
  994  ls -ld glob
  995  ls -lLd glob
  996  ls -l
  997  mkdir transfer
  998  ls -ld transfer
  999  chmod 777 transfer
 1000  ls -ld transfer
 1001  cd /sw/apps/tinyutils/
 1002  ll
 1003  mkdir 1.1
 1004  cd 1.1/
 1005  ll ../20150826/
 1006  mkdir src
 1007  mkdir milou
 1008  ln -s ./milou tintin
 1009  ln -s ./milou halvan
 1010  ln -s ./milou nestor
 1011  cd src
 1012  wget https://github.com/douglasgscofield/tinyutils/archive/1.1.tar.gz
 1013  tar xzf 1.1.tar.gz 
 1014  ll
 1015  rmdir ../milou
 1016  mv tinyutils-1.1 ../milou
 1017  cd ../milou/
 1018  ll
 1019  cd ..
 1020  ll
 1021  cd ..
 1022  fixup -g tinyutils
 1023  cd tinyutils/
 1024  ll
 1025  history >> tinyutils-1.1-install-README.md 
