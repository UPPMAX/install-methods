smoove/0.2.5
========================

<https://github.com/brentp/smoove>

Used under license:
Apache 2.0

Structure creating script (makeroom_smoove_0.2.5.sh) made with makeroom.sh (Author: Jonas SÃ¶derberg) and moved to /sw/bioinfo/smoove/makeroom_0.2.5.sh

LOG
---

    TOOL=smoove
    VERSION=0.2.5
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    /home/douglas/bin/makeroom.sh -t "smoove" -v "0.2.5" -s "annotation" -w "https://github.com/brentp/smoove" -l "Apache 2.0" -d "simplifies and speeds calling and genotyping SVs for short reads"
    ./makeroom_smoove_0.2.5.sh
    cd /sw/bioinfo/$TOOL/$VERSION/src
    wget http://
    tar xvf 
    make

   30  ll
   31  cd libexec/
   32  cd .snapshot
   33  ll
   34  cd ..
   35  mv libexec libexec_
   36  ls -la
   37  cd libexec_
   38  cd .snapshot
   39  ll
   40  ls -l daily.2020-04-07_0010/
   41  cd ..
   42  mv libexec_ libexec
   43  Â
   44  ll
   45  cd ..
   46  ll
   47  cd ..
   48  mfshow MEMEsuite
   49  cd ..
   50  mspid emboss
   51  cd emboss/
   52  ll
   53  cat emboss-6.6.0-install.md 
   54  mv emboss-6.6.0-install.md emboss-6.6.0-install-README.md 
   55  ll
   56  cat howICompiled 
   57  mv howICompiled emboss-6.3.1-install-README.md 
   58  ll
   59  fixup .
   60  ll
   61  cp -a 6.6.0 6.6.0_
   62  rm -rf 6.6.0
   63  mv 6.6.0_ 6.6.0
   64  cd src/
   65  ll
   66  rm EMBOSS-6.6.0.tar.gz.1
   67  pushd .
   68  cd /sw/mf/common/
   69  ll
   70  cd modulefiles/
   71  ll
   72  ls -la
   73  cd ..
   74  ll includes/
   75  cat RLU 
   76  rm RLU 
   77  ll
   78  cat null 
   79  cd prototype/
   80  ll
   81  ls -la
   82  cd ..
   83  rmdir prototype
   84  ll
   85  ll m4
   86  rmdir m4
   87  ll
   88  cd modulefiles/.old/
   89  cd ..
   90  cd -
   91  ll
   92  dirs
   93  popd
   94  ll
   95  cd ..
   96  ll
   97  mv src 6.6.0/
   98  cd 6.6.0/
   99  ll
  100  cd rackham/
  101  ll
  102  cd bin/
  103  ll
  104  cd ..
  105  ll
  106  cd ..
  107  ll
  108  cd ..
  109  ll
  110  cd mf
  111  ll
  112  mfshow emboss
  113  ll
  114  ln -s 6.5.7 6.6.0
  115  ll
  116  vi 6.6.0 
  117  ll
  118  rm -f 6.6.0 && cp -av 6.3.1 6.6.0
  119  ll
  120  mfshow emboss
  121  rsync -n -Pa * /sw/mf/common/bioinfo-tools/sw_collections/emboss/
  122  rsync  -Pa * /sw/mf/common/bioinfo-tools/sw_collections/emboss/
  123  ll
  124  cd ..
  125  ll
  126  cd 6.
  127  cd 6.6.0/
  128  ll
  129  cd ../../CASAVA/
  130  ll
  131  mspid casava
  132  cd 1.8.2/
  133  ll
  134  mfshow CASAVA
  135  cd ../../bioscope/
  136  ll
  137  cd 1.3.1_kalkyl
  138  ll
  139  cat update-bioscope.sh 
  140  mfshow bioscope
  141  cd ../..
  142  ll
  143  cd bioscope/
  144  ll
  145  cd 1.3.1_kalkyl
  146  ll
  147  cat bioscope
  148  ./bioscope
  149  cd BioScope-1.3.rBS131-55029_20101119113500
  150  ll
  151  cd bin/
  152  ll
  153  cd ../../..
  154  cd -
  155  head select_multiple_deviations.pl
  156  cd ../..
  157  cd ..
  158  ll
  159  cd ..
  160  cd -
  161  wget http://tools.thermofisher.com/content/sfs/manuals/cms_082377.pdf
  162  ll
  163  cd ..
  164  mv bioscope BioScope
  165  ll
  166  mfshow bioscope
  167  cd BioScope/
  168  ll
  169  mkdir mf
  170  cd mf
  171  cp /sw/mf/common/bioinfo-tools/sw_collections/bioscope/.bioscope 1.2.0
  172  cp -av /sw/mf/common/bioinfo-tools/sw_collections/bioscope/.bioscope 1.2.0
  173  ln -s 1.2.0 1.2.1
  174  ln -s 1.2.1 1.2.1-node
  175  ln -s 1.2.1 1.3.1
  176  ll
  177  fixup .
  178  ll
  179  cd ..
  180  ll
  181  rm -rf 1.2.0_grad
  182  mv 1.2.1_kalkyl 1.2.1
  183  cd 1.2.1
  184  ll
  185  cd ..
  186  mv 1.2.1 milou
  187  mkdir 1.2.1
  188  mv milou 1.2.1
  189  ll
  190  mv 1.2.1-node_kalkyl milou
  191  mkdir 1.2.1-node
  192  mv milou 1.2.1-node
  193  ll
  194  mv 1.2.0 kalkyl
  195  mv 1.2.0_kalkyl kalkyl
  196  mkdir 1.2.0
  197  mv kalkyl 1.2.0
  198  ll
  199  mv 1.3.1_kalkyl milou
  200  mkdir 1.3.1
  201  mv milou 1.3.1
  202  ll
  203  rm -f *_milou
  204  rm -f *_nestor
  205  ll
  206  vi BioScope_1.3.1_install-README.md
  207  ll
  208  cd mf
  209  ll
  210  rm -f 1.3.1 && cp 1.2.1 1.3.1
  211  ll
  212  vi 1.3.1
  213  ll
  214  vi 1.2.0 
  215  ll
  216  cat 1.3.1
  217  vi 1.3.1
  218  ll
  219  mfshow bioscope
  220  mv /sw/mf/common/bioinfo-tools/sw_collections/bioscope /sw/mf/common/bioinfo-tools/sw_collections/BioScope
  221  rm -f /sw/mf/common/bioinfo-tools/sw_collections/BioScope/*
  222  rm -f /sw/mf/common/bioinfo-tools/sw_collections/BioScope/.bioscope 
  223  ll
  224  rsync -n -Pa * /sw/mf/common/bioinfo-tools/sw_collections/BioScope/
  225  all_mflink -f BioScope 1.3.1
  226  ml
  227  ml bioinfo-tools BioScope/1.3.1
  228  module --ignore-cash load bioinfo-tools BioScope/1.3.1
  229  mfshow BioScope
  230  ll
  231  rsync  -Pa 1.3.1 /sw/mf/common/bioinfo-tools/sw_collections/BioScope/
  232  all_mflink -f BioScope 1.3.1
  233  ml bioinfo-tools BioScope/1.3.1
  234  vi 1.3.1 
  235  rsync  -Pa 1.3.1 /sw/mf/common/bioinfo-tools/sw_collections/BioScope/
  236  ml
  237  ml -BioScope
  238  ll
  239  mfshow bedtools
  240  mfshow BEDTools
  241  cd ../../BEDOPS/
  242  ll
  243  cd 2.4.3
  244  ll
  245  cd ../2.4.28
  246  ll
  247  cd ..
  248  ll
  249  cat BEDOPS-2.4.28-install-README.md
  250  makeroom
  251  makeroom.sh
  252  TOOL=BEDOPS; VERSION=2.4.39; makeroom.sh -f -t $TOOL -v $VERSION -w https://bedops.readthedocs.io -l "GPL v2" -d "suite of tools to address common questions raised in genomic studies" 
  253  ll
  254  ./makeroom_BEDOPS_2.4.39.sh 
  255  ll
  256  vi BEDOPS-2.4.39_install-README.md
  257  source SOURCEME_BEDOPS_2.4.39 
  258  echo $VERSIoNDIR
  259  echo $VERSIONDIR
  260  vi BEDOPS-2.4.39_install-README.md
  261  ll
  262  vi BEDOPS-2.4.39_post-install.sh 
  263  cat BEDOPS-2.4.39_install-README.md
  264     source SOURCEME_${TOOL}_$(VERSION}
  265      cd $VERSIONDIR
  266      cd src
  267      wget https://github.com/bedops/bedops/releases/download/v${VERSION}/bedops_linux_x86_64-v${VERSION}.tar.bz2
  268      tar xvjf bedops_linux_x86_64-v${VERSION}.tar.bz2
  269      mv bin $PREFIX/
  270  vi    source SOURCEME_${TOOL}_$(VERSION}
  271      cd $VERSIONDIR
  272      cd src
  273      wget https://github.com/bedops/bedops/releases/download/v${VERSION}/bedops_linux_x86_64-v${VERSION}.tar.bz2
  274      tar xvjf bedops_linux_x86_64-v${VERSION}.tar.bz2
  275      mv bin $PREFIX/
  276  vi BEDOPS-2.4.39_install-README.md 
  277  cat BEDOPS-2.4.39_install-README.md 
  278     TOOL=BEDOPS
  279      VERSION=2.4.39
  280    source SOURCEME_${TOOL}_${VERSION}
  281      cd $VERSIONDIR
  282      cd src
  283      wget https://github.com/bedops/bedops/releases/download/v${VERSION}/bedops_linux_x86_64-v${VERSION}.tar.bz2
  284      tar xvjf bedops_linux_x86_64-v${VERSION}.tar.bz2
  285      mv bin $PREFIX/
  286  ll
  287  cd ..
  288  ll
  289  cd rackham/
  290  ll
  291  cd bin/
  292  ll
  293  cd ../..
  294  cd ..
  295  cd mf
  296  ll
  297  rm -f 2.4.39  && ln -s 2.4.28 2.4.39
  298  ll
  299  vi 2.4.3
  300  ll
  301  cd ..
  302  ll
  303  ./BEDOPS-2.4.39_post-install.sh
  304  cd mf
  305  ll
  306  cd ..
  307  mfshow BEDOPS
  308  cd mf
  309  ll
  310  rsync -Pa * /sw/mf/common/bioinfo-tools/sw_collections/BEDOPS/
  311  cd ..
  312  ll
  313  cd bcl2fastq/
  314  ll
  315  mfshow bcl2fastq
  316  ll
  317  cd ..
  318  ll
  319  cat BioScope/mf/1.3.1
  320  cd HiSeq/
  321  ll
  322  cd mf
  323  ll
  324  cd ../0.9/
  325  ll
  326      for CL in snowy irma bianca ; do test -L $CL || ln -sf $CLUSTER $CL ; done
  327  ll
  328  cat readme 
  329  rm -f readme 
  330  cd ..
  331  ll
  332  mfshow HiSeq
  333  cd mf
  334  ll
  335  vi 0.9 
  336  ll
  337  rsync -Pa * /sw/mf/common/bioinfo-tools/sw_collections/HiSeq/
  338  all_mflink -f HiSeq 0.9
  339  vi 0.9 
  340  ll
  341  rsync -Pa * /sw/mf/common/bioinfo-tools/sw_collections/HiSeq/
  342  cd ..
  343  ll
  344  cd ..
  345  cd GATK-Queue/
  346  ll
  347  mfshow GATK-Queue
  348  cd ..
  349  ll
  350  cd SpeedSeq/
  351  ll
  352  mfshow SpeedSeq
  353  cd ../vcftools/
  354  ll
  355  mfshow vcftools
  356  ll
  357  cat vcftools-0.1.15-install-README.md
  358  TOOL=vcftools; VERSION=0.1.16; makeroom.sh -f -t $TOOL -v $VERSION -w https://github.com/vcftools/vcftools -l "GPL v3" -d "set of tools written in Perl and C++ for working with VCF files" 
  359  ./makeroom_vcftools_0.1.16.sh 
  360  ll
  361  vi vcftools-0.1.16_install-README.md
  362  ll
  363  source SOURCEME_vcftools_0.1.16 
  364  cat vcftools-0.1.16_install-README.md
  365     cd $VERSIONDIR
  366      cd src
  367      [[ -f vcftools-${VERSION}.tar.gz ]] || wget https://github.com/vcftools/vcftools/releases/download/v${VERSION}/vcftools-${VERSION}.tar.gz
  368      tar xzf vcftools-${VERSION}.tar.gz
  369      cd vcftools-${VERSION}
  370      module load zlib/1.2.11
  371      module load gcc/6.4.0
  372      ./configure --prefix=$PREFIX
  373      make -j5
  374      make install
  375  cd ..
  376  ll
  377  cd ..
  378  ll
  379  cd rackham/
  380  ll
  381  cd share/
  382  ll
  383  cd perl5/
  384  ll
  385  cd ../man/
  386  ll
  387  cd ..
  388  ll
  389  cd ../bin/
  390  ll
  391  head -n 1 Â$(file * | grep Perl | cut -f1 -d;)
  392  head -n 1 Â$(file * | grep Perl | cut -f1 -d:)
  393  ll
  394  head -n 1 $(file * | grep Perl | cut -f1 -d:)
  395  ll
  396  cd ..
  397  ll
  398  cd ..
  399  cd mf
  400  ll
  401  vi 0.1.16
  402  ll
  403  mfshow vcftools
  404  ll
  405  ln -s 0.1.8a 0.1.11
  406  ll
  407  rm /sw/mf/common/bioinfo-tools/sw_collections/vcftools/.vcftools 
  408  rsync -n -Pa * /sw/mf/common/bioinfo-tools/sw_collections/vcftools/
  409  rsync  -Pa * /sw/mf/common/bioinfo-tools/sw_collections/vcftools/
  410  ll
  411  vi 0.1.8a 
  412  ll
  413  vi 0.1.12 0.1.14
  414  rsync  -Pa * /sw/mf/common/bioinfo-tools/sw_collections/vcftools/
  415  cd ..
  416  vi vcftools-0.1.16_post-install.sh 
  417  ll
  418  ./vcftools-0.1.16_post-install.sh
  419  cd ../staden
  420  ll
  421  cd 2.0.0b6/
  422  ll
  423  cd bin/
  424  ll
  425  ./hetins 
  426  ./gap4
  427  cd ../lib
  428  ll
  429  cd staden/
  430  ll
  431  file libmisc.so
  432  ldd libmisc.so
  433  cd ../..
  434  ll
  435  cd ..
  436  ll
  437  mv 2.0.0b6 rackham
  438  mkdir 2.0.0b6
  439  mv rackham 2.0.0b6/
  440  cd 2.0.0b6/
  441  mv ../staden-2.0.0b6-x86_64.tar.gz .
  442  mkdir src
  443  mv staden-2.0.0b6-x86_64.tar.gz src/
  444  ll
  445      for CL in snowy irma bianca ; do test -L $CL || ln -sf $CLUSTER $CL ; done
  446  ll
  447  fixup .
  448  cd ..
  449  fixup .
  450  mkdir mf
  451  cd mf
  452  mfshow staden
  453  cp /sw/mf/common/bioinfo-tools/sw_collections/staden/.staden 2.0.0b6
  454  rm /sw/mf/common/bioinfo-tools/sw_collections/staden/.staden
  455  vi 2.0.0b6 
  456  cat ../../BioScope/mf/1.3.1 
  457  vi 2.0.0b6 
  458  ll
  459  mfshow staden
  460  rsync -n -Pa * /sw/mf/common/bioinfo-tools/sw_collections/staden/
  461  rsync  -Pa * /sw/mf/common/bioinfo-tools/sw_collections/staden/
  462  cd ..
  463  ll
  464  all_mflink -f staden 2.0.0b6
  465  cd /sw/mf/common/compilers/
  466  ll
  467  cd gc
  468  ll
  469  cd gcc
  470  ll
  471  less gcc.tcl
  472  grep modroot gcc.tcl
  473  view gcc.tcl 
  474  projinfo sens2017106
  475  groups jaksch
  476  ulimit
  477  ulimit -v
  478  ulimit -a
  479  cd /sw/bioinfo/canu/
  480  ll
  481  set -o vi
  482  TOOL=canu; VERSION=2.0; makeroom.sh -f -t $TOOL -v $VERSION -w http://canu.readthedocs.org/ -l "Various" -d "a fork of the Celera Assembler, designed for high-noise single-molecule sequencing (such as the PacBio RS II/Sequel or Oxford Nanopore MinION)" 
  483  ./makeroom_canu_2.0.sh 
  484  source SOURCEME_canu_2.0 
  485  ll
  486  cd 2.0/
  487  ll
  488  cd src/
  489  cat canu-1.8-install-README.md
  490  cat ../../canu-1.8-install-README.md
  491  ll
  492  cd ..
  493  ll
  494  cd ..
  495  ll
  496  vi canu-2.0_install-README.md
  497  mspid gcc
  498  ll
  499  vi canu-2.0_install-README.md
  500  cat canu-2.0_install-README.md
  501      cd ${VERSION}
  502      rmdir $PREFIX
  503      cd src/
  504      [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/marbl/canu/archive/v${VERSION}.tar.gz
  505      [[ -d canu-${VERSION} ]] && rm -rf canu-${VERSION}
  506      tar xzf v${VERSION}.tar.gz
  507      cd canu-${VERSION}
  508      cd src/
  509      module load gcc/9.3.0
  510      module load zlib/1.2.11
  511  make -j10
  512  cat ../../../../canu-2.0_install-README.md 
  513     cd ..
  514      mv Linux-amd64 $PREFIX
  515  ll
  516  cd src/
  517  ll
  518  make -j10
  519  cd ..
  520  ll
  521  cd ../..
  522  ll
  523  cd rackham/
  524  ll
  525  mfshow canu
  526  mshow canu
  527  cd Linux-amd64/
  528  ll
  529  cd bin/
  530  ll
  531  vi canu.defaults 
  532  cd ../..
  533  ll
  534  cd ..
  535  ll
  536  cd ..
  537  ll
  538  vi canu-2.0_install-README.md 
  539  ll
  540  rm -rf 2.0/
  541  ll
  542  ./makeroom_canu_2.0.sh 
  543  ll
  544  vi canu-2.0_install-README.md
  545  ll
  546  source SOURCEME_canu_2.0 
  547  cat canu-2.0_install-README.md 
  548     cd ${VERSION}
  549      cd src/
  550      [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/marbl/canu/archive/v${VERSION}.tar.gz
  551      [[ -d canu-${VERSION} ]] && rm -rf canu-${VERSION}
  552      tar xzf v${VERSION}.tar.gz
  553      cd canu-${VERSION}
  554      cd src/
  555      module load gcc/9.3.0
  556      module load zlib/1.2.11
  557      make -j 10
  558  cd ..
  559  ll
  560  cd ..
  561  ll
  562  vi canu-2.0_install-README.md
  563  vi $PREFIX/Linux-amd64/bin/canu.defaults
  564  ll
  565  ./canu-2.0_post-install.sh 
  566  ll
  567  cd mf
  568  ll
  569  rm plink.log 
  570  cat 2.0 
  571  ll
  572  rm 2.0 
  573  cat 1.8
  574  ll
  575  vi 1.6
  576  ll
  577  ln -s 1.8 2.0
  578  mfshow canu
  579  rsync  -Pa * /sw/mf/common/bioinfo-tools/assembly/canu/
  580  cat /sw/mf/common/bioinfo-tools/assembly/canu/.version 
  581  rm -f /sw/mf/*/bioinfo-tools/assembly/canu/.version 
  582  mfshow canu
  583  cd ..
  584  ll
  585  vi canu-2.0_post-install.sh 
  586  ./canu-2.0_post-install.sh 
  587  ll
  588  cp -av 1.5 1.5_
  589  ll
  590  rm -rf 1.5
  591  mv 1.5_ 1.5
  592  cd mf
  593  ll
  594  cd ..
  595  ll
  596  cat canu-2.0.yaml
  597  cat SOURCEME_canu_2.0 
  598  mshow DATES
  599  ll /sw/bioinfo/DATES/753/rackham/bin
  600  ldd /sw/bioinfo/DATES/753/rackham/bin/dates
  601  ldd /sw/libs/openblas/0.2.20/rackham/lib/libopenblas.so.0
  602  ldd /sw/libs/fftw/3.3.8/rackham/lib/libfftw3.so.3
  603  ml bioinfo-tools
  604  ml DATES
  605  dates
  606  module load bioinfo-tools
  607  module load gsl/2.5
  608  module load DATES/753
  609  dates
  610  which grabpars
  611  ldd /sw/bioinfo/DATES/753/rackham/bin/grabpars
  612  ml
  613  ml -gsl
  614  ml
  615  cd /sw/bioinfo/DATES
  616  ll
  617  source SOURCEME_DATES_753
  618  cd 753/
  619  ll
  620  cd ..
  621  cat *md
  622  which grabpars
  623  ll /sw/bioinfo/DATES/753/rackham/bin/grabpars
  624  cd 753/src/
  625  ll
  626  cd DATES-753/
  627  ll
  628  cd src/
  629  ll
  630  ldd grabpars
  631  make clean
  632  ll
  633  grep grabpars Makefile
  634  ll bin
  635  cat ../../../../DATES-753_install-README.md 
  636     [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/priyamoorjani/${TOOL}/archive/v${VERSION}.tar.gz
  637      [[ -d ${TOOL}-${VERSION} ]] || tar xzf v${VERSION}.tar.gz
  638      cd ${TOOL}-${VERSION}
  639      cd src
  640      module load gcc/6.3.0
  641      module load gsl/2.5
  642      module load openblas/0.2.20
  643      module load fftw/3.3.8
  644  ll
  645  cd ../../..
  646  vi ../../../DATES-753_install-README.md 
  647  ll
  648  cd ..
  649  ll
  650  rm -rf DATES-753/
  651  cat ../../DATES-753_install-README.md 
  652  ml
  653     [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/priyamoorjani/${TOOL}/archive/v${VERSION}.tar.gz
  654      [[ -d ${TOOL}-${VERSION} ]] && rm -rf ${TOOL}-${VERSION}
  655      tar xzf v${VERSION}.tar.gz
  656      cd ${TOOL}-${VERSION}
  657      cd src
  658      module load gcc/6.3.0
  659      module load gsl/2.5
  660      module load openblas/0.2.20
  661      module load fftw/3.3.8
  662  vi Makefile 
  663  ll
  664  make
  665  make clean
  666  make
  667  vi Makefile 
  668  ll nicksrc/
  669  ll
  670  ll nicksrc/
  671  vi Makefile 
  672  make clobber
  673  make
  674  make install
  675  make grabpars
  676  ll
  677  vi Makefile 
  678  make clobber
  679  make && make install
  680  ll
  681  vi Makefile 
  682  vi ../../../../DATES-753_install-README.md 
  683  cat ../../../../DATES-753_install-README.md 
  684      make clean && ( cd nicksrc ; make clean )
  685      make
  686      make install
  687      cp -av bin $PREFIX/
  688  cd $PREFIX
  689  ll
  690  cd bin
  691  ll
  692  vi ../../../mf/753 
  693  mshow DATES
  694  ll
  695  ldd *
  696  ml
  697  ml purge
  698  ml
  699  ldd *
  700  cd ../../..
  701  ll
  702  cd /sw/bioinfo/DATES
  703  ll
  704  cd 753/
  705  ll
  706  cd rackham/
  707  ll
  708  cd ../snowy/
  709  ll
  710  cd bin/
  711  ll
  712  cd /sw/bioinfo/DATES
  713  ll
  714  source SOURCEME_DATES_753
  715  echo $PREFIX
  716  cat DATES-753_install-README.md
  717   cd ${VERSION}/
  718      cd src/
  719      [[ -f v${VERSION}.tar.gz ]] || wget https://github.com/priyamoorjani/${TOOL}/archive/v${VERSION}.tar.gz
  720      [[ -d ${TOOL}-${VERSION} ]] && rm -rf ${TOOL}-${VERSION}
  721      tar xzf v${VERSION}.tar.gz
  722      cd ${TOOL}-${VERSION}
  723      cd src
  724      module load gcc/6.3.0
  725      module load gsl/2.5
  726      module load openblas/0.2.20
  727      module load fftw/3.3.8
  728  ll
  729  vi Makefile 
  730  make clobber
  731  make && make install
  732     cp -av bin $PREFIX/
  733  ll
  734  cd ..
  735  ll
  736  cd example/
  737  ll
  738  ml bioinfo-tools DATES
  739  ll
  740  cd ../..
  741  cd rackham/
  742  ll
  743  cd bin/
  744  ll
  745  cd ..
  746  cd src/
  747  ll
  748  cd DATES-753/
  749  ll
  750  cd example/
  751  ll
  752  cat admix 
  753  cat post.sh 
  754  cp post.sh uppmax_post.sh
  755  vi uppmax_post.sh 
  756  file mergeit
  757  ./mergeit
  758  ll
  759  rm -f core.*
  760  ll ../bin
  761  ll ../
  762  ll ../src/
  763  push d.
  764  pushd .
  765  cd ../../..
  766  ll
  767  cd rackham/
  768  ll
  769  cd bin/
  770  ll
  771  cd ..
  772  ll
  773  cd src/
  774  ll
  775  cd DATES-753/
  776  ll
  777  find . -iname '*merge*'
  778  cd example/
  779  ll
  780  head simulation.
  781  head simulation.py 
  782  vi uppmax_post.sh 
  783  ll
  784  ml
  785  which dates
  786  ./uppmax_post.sh 
  787  ll
  788  rm -f core*
  789  vi uppmax_post.sh 
  790  cd ..
  791  cd snowy/
  792  ll
  793  cd bin/
  794  ll
  795  file calc_error 
  796  ./uppmax_post.sh 
  797  head calc_error 
  798  head dates_expfit 
  799  ll
  800  head dates_jackknife 
  801  vi calc_error dates_jackknife dates_plot dates_wtjack run_dates_expfit 
  802  ll
  803  ll
  804  ./mergeit
  805  ll
  806  rm -f core.*
  807  cat uppmax_post.sh 
  808  cat DATES.log 
  809  cd ../../../rackham/bin/
  810  ll
  811  vi calc_error dates_jackknife dates_plot dates_wtjack run_dates_expfit
  812  ll
  813  cd ../../src/
  814  ll
  815  cd DATES-753/
  816  ll
  817  cd example/
  818  ll
  819  cd ..
  820  cp -av example $PREFIX/
  821  source ../../../SOURCEME_DATES_753 
  822  cp -av example $PREFIX/
  823  cd ../..
  824  cd rackham/
  825  ll
  826  cd example/
  827  ll
  828  head simulation.
  829  head simulation.py 
  830  cat simulation.log 
  831  ll
  832  ./uppmax_post.sh 
  833  cat par.simulation 
  834  cat DATES.log 
  835  ll
  836  cd ..
  837  cp -av example ../snowy/bin/
  838  mv example bin/
  839  ll
  840  cd bin/
  841  ll
  842  mv example ..
  843  mv example ..
  844  ll
  845  cd ..
  846  ll
  847  ml
  848  ml
  849  ml purge
  850  ml bioinfo-tools DATES
  851  cd ../example/
  852  ll
  853  ./uppmax_post.sh 
  854  echo $DATES_ROOT
  855  vi uppmax_post.sh 
  856  dat par.mergeit 
  857  cat par.mergeit 
  858  ll example/
  859  vi uppmax_post.sh 
  860  ./uppmax_post.sh 
  861  vi uppmax_post.sh 
  862  ll
  863  ./uppmax_post.sh 
  864  vi uppmax_post.sh 
  865  ./uppmax_post.sh 
  866  ll
  867  cp uppmax_post.sh ../../rackham/example/
  868  cat par.simulation 
  869  vi uppmax_post.sh 
  870  cat par.simulation 
  871  vi uppmax_post.sh 
  872  cp uppmax_post.sh ../../rackham/example/
  873  cat par.mergeit 
  874  ll
  875  vi uppmax_post.sh 
  876  cp uppmax_post.sh ../../rackham/example/
  877  cat par.dates
  878  vi uppmax_post.sh 
  879  ll
  880  cat ancpop 
  881  cp uppmax_post.sh ../../rackham/example/
  882  vi ../../../mf/753 
  883  ll
  884  cat admix 
  885  cd ../..
  886  ll
  887  cd mf
  888  ll
  889  mfshow DATES
  890  rsync -n -Pa * /sw/mf/common/bioinfo-tools/misc/DATES/
  891  rsync  -Pa * /sw/mf/common/bioinfo-tools/misc/DATES/
  892  ml
  893  ml -DATES
  894  ml DATES
  895  ll
  896  module help DATES/753
  897  vi 753 
  898  rsync  -Pa * /sw/mf/common/bioinfo-tools/misc/DATES/
  899  cd /sw/EasyBuild/
  900  ll
  901  cat to-upgrade-EasyBuild
  902  source source-me-for-EasyBuild-4.1.2-sandbox-snowy-douglas
  903  echo $EASYBUILD_PREFIX
  904  curl -O https://raw.githubusercontent.com/easybuilders/easybuild-framework/develop/easybuild/scripts/bootstrap_eb.py
  905  ll
  906  python bootstrap_eb.py $EASYBUILD_PREFIX
  907  ll
  908  eb --version
  909  ml
  910  ml -EasyBuild
  911  ml EasyBuild
  912  ml -EasyBuild
  913  ml EasyBuild
  914  eb --version
  915  ll
  916  mv source-me-for-EasyBuild-4.1.2-sandbox-snowy-douglas source-me-for-EasyBuild-4.2.0-sandbox-snowy-douglas
  917  vi source-me-for-EasyBuild-4.2.0-sandbox-snowy-douglas
  918  ll
  919  vi source-me-for-EasyBuild-4.2.0-sandbox-snowy-douglas
  920  exit
  921  cd /sw/EasyBuild/
  922  ll
  923  source source-me-for-EasyBuild-4.2.0-sandbox-snowy-douglas 
  924  fixup
  925  ll /sw/apps/gaussian/
  926  cd ..
  927  cd apps/
  928  cd am
  929  cd vasp
  930  ll
  931  cd /sw/EasyBuild/
  932  ll
  933  cd rackham/
  934  ll
  935  cd software/
  936  ll
  937  ls -ltr
  938  cd ..
  939  ll
  940  cd modules/
  941  ll
  942  cd ..
  943  ml
  944  ml R_packages
  945  R
  946  groups iusan
  947  groups mdahlo
  948  cd /sw/EasyBuild/
  949  ll
  950  source source-me-for-EasyBuild-4.2.0-snowy
  951  eb -S beagle
  952  eb -S beast
  953  eb -D Beast-2.5.1-foss-2018b.eb
  954  eb -S CUDA
  955  eb --help
  956  cd /sw/mf/common/bioinfo-tools/
  957  grep 'is-loaded' */*
  958  grep 'is-loaded' */*/*
  959  module avail R
  960  cd /sw/apps/R_packages
  961  ll
  962  ce external_packages/
  963  ll
  964  ce external_packages/
  965  ll
  966  cd external_packages/
  967  ll
  968  wget https://homepages.uni-regensburg.de/~wit59712/easyqc/EasyQC_9.2.tar.gz
  969  cd 3.6.1
  970  cd ../3.6.1
  971  ll
  972  cd external_packages/
  973  ll
  974  mv ../../external_packages/EasyQC_9.2.tar.gz .
  975  ll
  976  cd ..
  977  ll
  978  cd ..
  979  ll
  980  cd /sw/apps/R_packages
  981  ll
  982  ml bioinfo-tools
  983  mshow LUMPY/0.3.0
  984  ml LUMPY/0.3.0
  985  cd /proj/snic2019-35-58/HS_fastq/sparrow_genome/
  986  ll
  987  pushd .
  988  cd /sw/bioinfo/LUMPY/0.3.0/rackham/bin/lumpyexpress.config
  989  cd /sw/bioinfo/LUMPY/0.3.0/rackham/bin
  990  ll
  991  vi lumpyexpress.config 
  992  grep SAMBLASTER *
  993  ml
  994  which samblaster
  995  samblaster
  996  cat lumpyexpress.config 
  997  cd /sw/bioinfo/LUMPY/0.3.0/rackham/bin
  998  view lumpyexpress
  999  vi ../../../LUMPY-0.3.0_install-README.md 
 1000  cd
 1001  cd /sw/bioinfo/LUMPY
 1002  ll
 1003  vi LUMPY-0.3.0_install-README.md
 1004  mshpid smoove
 1005  mspid smoove
 1006  ml
 1007  cd ..
 1008  makeroom.sh
 1009  TOOL=smoove
 1010  VERSION=0.2.5
 1011  makeroom.sh -t $TOOL -v $VERSION -w https://github.com/brentp/smoove -l "Apache 2.0" -d "simplifies and speeds calling and genotyping SVs for short reads"
 1012  makeroom.sh -t $TOOL -v $VERSION -s annotation -w https://github.com/brentp/smoove -l "Apache 2.0" -d "simplifies and speeds calling and genotyping SVs for short reads"
 1013  ./makeroom_smoove_0.2.5.sh 
 1014  cd smoove/
 1015  ll
 1016  source SOURCEME_smoove_0.2.5 
 1017  cd 0.2.5/
 1018  ll
 1019  cd rackham/
 1020  ll
 1021  wget https://github.com/brentp/smoove/releases/download/v0.2.5/smoove
 1022  file smoove 
 1023  ll
 1024  chmod +x smoove 
 1025  ./smoove 
 1026  ll
 1027  cd ../..
 1028  ll
 1029  history >> smoove-0.2.5_install-README.md
