GTDB-Tk/0.3.2
========================

<https://github.com/Ecogenomics/GTDBTk>

Used under license:
GPL v3

Structure creating script (makeroom_GTDB-Tk_0.3.2.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/GTDB-Tk/makeroom_0.3.2.sh

LOG
---

    TOOL=GTDB-Tk
    VERSION=0.3.2
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_GTDB-Tk_0.3.2.sh
    cd /sw/bioinfo/$TOOL/$VERSION/src
    wget http://
    tar xvf 
    make

  186  mshow Stacks/2.41
  187  cd uppmax
  188  ll
  189  finishedjobinfo snic2019-8-83 | grep '\s105[7-9]\d\d\d\d'
  190  finishedjobinfo snic2019-8-83 | grep '105[7-9][0-9]{4}'
  191  finishedjobinfo snic2019-8-83 | grep '105[7-9]'
  192  which finishedjobinfo
  193  less /sw/uppmax/bin/finishedjobinfo
  194  finishedjobinfo snic2019-8-83 | grep '105[7-9]'
  195  finishedjobinfo snic2019-8-83 | grep '105[7-9]' | jobstats -p -
  196  eog rackham-snic2019-8-83-dpowell-105[789]*.png
  197  cd /sw/share/slurm/rackham/jobdetails/dpowel/10580261
  198  cd /sw/share/slurm/rackham/jobdetails/dpowell
  199  cd 10580261
  200  ll
  201  cat jobscript 
  202  cat scontrol_before
  203  ll /crex/proj/uppstore2019032/
  204  cd no
  205  cd /proj/uppstore2019032
  206  ll
  207  cd nobackup/
  208  ll
  209  ml
  210  ml bioinfo-tools
  211  cd /sw/share/slurm/rackham/jobdetails/dpowell
  212  ll
  213  grep maker */jobscript
  214  dirs
  215  pushd .
  216  cd
  217  cd uppmax
  218  ll
  219  cd /sw/EasyBuild/
  220  ll
  221  vi source-me
  222  mv source-me source-me-for-EasyBuild-4.0.1
  223  ll
  224  cd douglas-temp/
  225  ll
  226  ml
  227  cd ..
  228  source source-me-for-EasyBuild-4.0.1 
  229  cd douglas-temp/
  230  ll
  231  less bianca-login-node.txt 
  232  head bianca-login-node.txt 
  233  head irma-login-node.txt
  234  head rackham-compute-node.txt
  235  head rackham-login-node.txt 
  236  ll
  237  head snowy-compute-node.txt 
  238  head snowy-login-node.txt 
  239  cd /sw/EasyBuild/
  240  ll
  241  mkdir snowy
  242  ln -s snowy irma
  243  ln -s snowy bianca
  244  ll
  245  cd snowy/
  246  ll
  247  export EASYBUILD_PREFIX=/sw/EasyBuild/snowy
  248  python ../bootstrap_eb.py $EASYBUILD_PREFIX 
  249  ll
  250  rm -rf *
  251  cd /sw/EasyBuild/
  252  ll
  253  cp source-me-for-EasyBuild-4.0.1 source-me-for-EasyBuild-4.0.1-snowy
  254  vi source-me-for-EasyBuild-4.0.1-snowy
  255  echo $CLUSTER
  256  ll
  257  source source-me-for-EasyBuild-4.0.1-snowy
  258  cd /sw/EasyBuild/
  259  ll
  260  cd snowy/
  261  ls -la
  262  export EASYBUILD_PREFIX=/sw/EasyBuild/snowy
  263  python ../bootstrap_eb.py $EASYBUILD_PREFIX
  264  fixup .
  265  ll
  266  cd ..
  267  ll
  268  rm source-me-for-EasyBuild-4.0.1
  269  cp source-me-for-EasyBuild-4.0.1-snowy source-me-for-EasyBuild-4.0.1-rackham
  270  vi source-me-for-EasyBuild-4.0.1-rackham
  271  ll
  272  ml
  273  source source-me-for-EasyBuild-4.0.1-snowy 
  274  mshow intel/18.3
  275  export INTEL_LICENSE_FILE=/sw/comp/intel/licenses
  276  eb -D bwa/0.7.17-intel-2018b
  277  eb -D bwa/0.7.17-intel-2018b.eb
  278  echo $EASYBUILD_PREFIX 
  279  cd snowy/
  280  ll
  281  eb -D BWA-0.7.17-intel-2018b.eb
  282  echo $EASYBUILD_PREFIX 
  283  ml
  284  ll
  285  cd ..
  286  ll
  287  source source-me-for-EasyBuild-4.0.1-rackham 
  288  eb  --module-depends-on --robot --module-syntax=Lua   BWA-0.7.17-intel-2018b.eb CDO-1.9.5-intel-2018b Metaxa2-2.2-gompi-2019a.eb -D
  289  echo $MODULEPATH
  290  ln -s . rackham
  291  ll
  292  eb  --module-depends-on --robot --module-syntax=Lua   BWA-0.7.17-intel-2018b.eb CDO-1.9.5-intel-2018b.eb Metaxa2-2.2-gompi-2019a.eb -D
  293  cat source-me-for-EasyBuild-4.0.1-rackham
  294  module load EasyBuild/4.0.1
  295  ll
  296  ll intel
  297  rm intel
  298  ll
  299  cd PROKKA_05282018/
  300  ll
  301  cd ..
  302  rm -rf PROKKA_05282018/
  303  ml
  304  htop
  305  exit
  306  ssh snowy-lr1
  307  ml
  308  echo $EASYBUILD_PREFIX 
  309  ll
  310  exit
  311  cd /sw/EasyBuild/
  312  ll
  313  source source-me-for-EasyBuild-4.0.1-rackham 
  314  mv douglas-temp cluster-cpuinfo
  315  ll
  316  echo $MODULEPATH
  317  ml
  318  eb -S prokka
  319  mspid prokka
  320  eb  --module-depends-on --robot --module-syntax=Lua   prokka-1.13.4-foss-2018b.eb -D
  321  cd rackham
  322  echo $EASYBUILD_PREFIX 
  323  cd ..
  324  ll
  325  vi source-me-for-EasyBuild-4.0.1-rackham
  326  source source-me-for-EasyBuild-4.0.1-rackham
  327  echo $EASYBUILD_PREFIX 
  328  cd rackham
  329  ll
  330  export EASYBUILD_PREFIX=$PWD
  331  ll
  332  ml
  333  ml EasyBuild/4.0.1
  334  ml
  335  echo $EASYBUILD_PREFIX 
  336  ll
  337  eb  --module-depends-on --robot --module-syntax=Lua   prokka-1.13.4-foss-2018b.eb -D
  338  cd ..
  339  ll
  340  rm rackham
  341  mkdir rackham
  342  ll
  343  cd rackham
  344  cd /sw/EasyBuild/
  345  ll
  346  cd rackham/
  347  export EASYBUILD_PREFIX=$PWD
  348  python ../bootstrap_eb.py $EASYBUILD_PREFIX
  349  export INTEL_LICENSE_FILE=/sw/comp/intel/licenses
  350  screen -ls
  351  for EB in BWA-0.7.17-intel-2018b.eb CDO-1.9.5-intel-2018b.eb Metaxa2-2.2-gompi-2019a.eb ; do eb --module-depends-on --robot --module-syntax=Lua $EB; done
  352  ml
  353  cat ../source-me-for-EasyBuild-4.0.1-rackham 
  354  source ../source-me-for-EasyBuild-4.0.1-rackham 
  355  module load R_packages/3.6.1
  356  R
  357  ll
  358  cd uppmax
  359  ll
  360  rm -f rackham-snic2019-8-83-dpowell-10*
  361  ls
  362  rm -f rackham-snic201*
  363  ll
  364  rm -f snowy-snic201*
  365  ll
  366  eog milou-*.png
  367  ml
  368  ml -R_packages
  369  eog milou-*.png
  370  rm -f milou-b201*
  371  ll
  372  cat draw_program.py 
  373  cat n4.SLURM.env 
  374  ll
  375  for EB in BWA-0.7.17-intel-2018b.eb CDO-1.9.5-intel-2018b.eb Metaxa2-2.2-gompi-2019a.eb ; do eb --module-depends-on --robot --module-syntax=Lua $EB; done
  376  screen -S eb-snowy
  377  mspid mirdeep
  378  cd /sw/bioinfo/mirdeep2/
  379  ll
  380  cat mirdeep2-2.0.0.8-install-README.md 
  381  VERSION=2.0.1.2
  382  TOOL=mirdeep2
  383  makeroom.sh
  384  mfshow mirdeep2
  385  rm /sw/mf/common/bioinfo-tools/misc/mirdeep2/#.mirdeep2# 
  386  cd mf
  387  ll
  388  rm /sw/mf/common/bioinfo-tools/misc/mirdeep2/.mirdeep2 
  389  rsync -n -Pa * /sw/mf/common/bioinfo-tools/misc/mirdeep2/
  390  rsync  -Pa * /sw/mf/common/bioinfo-tools/misc/mirdeep2/
  391  mfshow mirdeep2
  392  vi 2.0.0.*
  393  ll
  394  diff 2.0.0.5
  395  diff 2.0.*
  396  ll
  397  cd ..
  398  makeroom.sh
  399  makeroom.sh -t $TOOL -v $VERSION -w https://github.com/rajewsky-lab/mirdeep2 -s misc -d "discover known and novel miRNAs from small RNA sequencing data" -l "GPL v3"
  400  makeroom.sh -f -t $TOOL -v $VERSION -w https://github.com/rajewsky-lab/mirdeep2 -s misc -d "discover known and novel miRNAs from small RNA sequencing data" -l "GPL v3"
  401  ll
  402  ./makeroom_mirdeep2_2.0.1.2.sh 
  403  ll
  404  source SOURCEME_mirdeep2_2.0.1.2 
  405  mshow mirdeep/2.0.0.8
  406  mshow mirdeep2/2.0.0.8
  407  cd /sw/bioinfo/RNAfold/
  408  mspid vienna
  409  cat /sw/mf/common/bioinfo-tools/misc/ViennaRNA/2.3.1 
  410  ll
  411  cat RNAfold-2.3.1-install-README.md
  412  ll
  413  cp RNAfold-2.3.1-install-README.md RNAfold-2.3.1_install-README.md
  414  mv RNAfold-2.3.1_install-README.md RNAfold-2.4.14_install-README.md
  415  ll
  416  vi RNAfold-2.4.14_install-README.md
  417  echo $VERSION
  418  VERSION=2.4.14
  419  echo $VERSION
  420  echo ${VERSION%.*}
  421  echo ${${VERSION%.*}//./_}
  422  echo { v=${VERSION%.*}; ${v//./_}; }
  423  echo { v=${VERSION%.*}; ${v//./_}; 
  424  echo { v=${VERSION%.*}; v=${v//./_}; 
  425  echo v=${VERSION%.*}; v=${v//./_}; 
  426  echo $v
  427  v=${VERSION%.*}; v=${v//./_}; 
  428  echo $v
  429  eval '{ v=${VERSION%."}; v=${v//._}; echo $v }'
  430  eval '{ v=${VERSION%."}; v=${v//._}; echo $v; }'
  431  eval '{ v=${VERSION%.*}; v=${v//._}; echo $v; }'
  432  eval '{ v=${VERSION%.*}; v=${v//./_}; echo $v; }'
  433  echo $(eval '{ v=${VERSION%.*}; v=${v//./_}; echo $v; }')
  434  T=$(eval '{ v=${VERSION%.*}; v=${v//./_}; echo $v; }')
  435  echo $T
  436  T=$(eval '{ _=${VERSION%.*}; _=${_//./_}; echo $_; }')
  437  echo $T
  438  T=$(eval '{ _v=${VERSION%.*}; _v=${_v//./_}; echo $_v; }')
  439  echo $T
  440  echo $_v
  441  unset _v
  442  echo $_v
  443  T=$(eval '{ _v=${VERSION%.*}; _v=${_v//./_}; echo $_v; }')
  444  echo $_v
  445  echo $(eval '{ _v=${VERSION%.*}; _v=${_v//./_}; echo $_v; }')
  446  echo $(_v=${VERSION%.*}; _v=${_v//./_}; echo $_v)
  447  echo $_v
  448  ll
  449  vi RNAfold-2.4.14_install-README.md
  450  ml eb
  451  screen -ls
  452  uptime
  453  screen -ls
  454  cd /sw/EasyBuild/
  455  ll
  456  source source-me-for-EasyBuild-4.0.1-rackham 
  457  eb -S Vienna
  458  screen -R 58839.eb-snowy
  459  ml
  460  echo $MODULEPATH
  461  ll
  462  source ../source-me-for-EasyBuild-4.0.1-snowy 
  463  ml
  464  echo $INTEL_LICENSE_FILE 
  465  for EB in BWA-0.7.17-intel-2018b.eb CDO-1.9.5-intel-2018b.eb Metaxa2-2.2-gompi-2019a.eb ; do eb --module-depends-on --robut --module-syntax=Lua $EB; done
  466  for EB in BWA-0.7.17-intel-2018b.eb CDO-1.9.5-intel-2018b.eb Metaxa2-2.2-gompi-2019a.eb ; do eb --module-depends-on --robot --module-syntax=Lua $EB; done
  467  eb --module-depends-on --robot --module-syntax=Lua  libpng-1.6.36-GCCcore-8.2.0.eb
  468  for EB in BWA-0.7.17-intel-2018b.eb CDO-1.9.5-intel-2018b.eb Metaxa2-2.2-gompi-2019a.eb netCDF-Fortran-4.4.4-intel-2018b.eb PROJ-4.9.3-foss-2016b.eb  PROJ-6.0.0-GCCcore-8.2.0.eb Stacks-2.41-foss-2018b.eb Rosetta-3.7-foss-2016b.eb ; do eb --module-depends-on --robot --module-syntax=Lua $EB; done
  469  cd /sw/data
  470  ll
  471  cd RTG/
  472  ll
  473  ll human/
  474  screen -ls
  475  uptime
  476  cd downloads
  477  ll
  478  rm -f *_checked
  479  ll
  480  cd ..
  481  ll
  482  screen -ls
  483  screen -S eb-rackham
  484  cd /sw/EasyBuild/
  485  cp -av /sw/EasyBuild/sources/r/Rosetta/rosetta_src_3.7_bundle.tgz /sw/EasyBuild/snowy/sources/r/Rosetta/rosetta_src_3.7_bundle.tgz
  486  mkdir -p /sw/EasyBuild/snowy/sources/r/Rosetta
  487  cp -av /sw/EasyBuild/sources/r/Rosetta/rosetta_src_3.7_bundle.tgz /sw/EasyBuild/snowy/sources/r/Rosetta/rosetta_src_3.7_bundle.tgz
  488  htop -u douglas
  489  screen -D -RR 32106.eb-rackham
  490  screen -R 32106.eb-rackham
  491  screen -ls
  492  screen -S eb-snowy
  493  cd ..
  494  cd mirdeep2/
  495  ll
  496  mspid longranger
  497  ml
  498  ml bioinfo-tools longranger/2.2.2
  499  echo $PATH
  500  ll /sw/bioinfo/Chromium-longranger/2.2.2/rackham
  501  longranger
  502  mspid cellranger
  503  mspid cnv
  504  mspid canu
  505  mspid cramtools
  506  mspid cyvcf2
  507  ll /sw/bioinfo/cyvcf2/
  508  ml
  509  cd /sw/share/slurm/
  510  ls
  511  ll
  512  cd rackham/
  513  ll
  514  cd jobdetails/
  515  ll
  516  cd mararc/
  517  ll
  518  ll 10495648
  519  cd 10495648
  520  cat jobscript 
  521  cd /proj/sllstore2017016/maria.d/code.d
  522  ll
  523  cat CNV_consensus_clustering.R
  524  pushd .
  525  cd
  526  cd uppmax
  527  ll
  528  jobstats -p 10495648
  529  ll
  530  ls -ltr
  531  dirs
  532  swapd
  533  pushd .
  534  cd /sw/share/slurm/rackham/jobdetails/mararc
  535  ll
  536  grep CNV_consensus_clustering */jobscript
  537  cd ../..
  538  ll
  539  cd -
  540  cd ..
  541  ll
  542  ls
  543  ls -ld samanta
  544  ls -ld samanta samara sameerh
  545  ll
  546  ml R_packages
  547  ml
  548  R
  549  cd /sw/apps/R_packages
  550  ll
  551  cd 3.6.1
  552  cd ..
  553  ll
  554  view R_packages-3.6.1-install-README.md
  555  cd external_packages/
  556  ll
  557  vi ../R_packages-3.6.1-install-README.md
  558     VERSION=3.6.1
  559      CLUSTER=${CLUSTER?:For some reason, CLUSTER is not set}
  560      cd /sw/apps
  561      mkdir -p R_packages
  562      cd R_packages/
  563      mkdir -p $VERSION
  564      mkdir -p mf
  565      cd $VERSION
  566      mkdir $CLUSTER
  567      [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca snowy ; do test -L $CL || ln -s $CLUSTER $CL; done
  568      cd $CLUSTER/
  569      export R_LIBS_USER=$PWD
  570      module load R/$VERSION
  571      module load build-tools
  572      module load autoconf/2.69
  573      module load automake/1.14.1
  574      module load cmake/3.13.2    # some packages require a newish cmake
  575      module load m4/1.4.17
  576      module load MariaDB/10.1.29
  577      module load PostgreSQL/10.3
  578      module load UDUNITS/2.2.26  # these further modules were added
  579      module load GDAL/2.1.0
  580      module load Poppler/0.54.0
  581      module load JAGS/4.3.0
  582      module load gsl/2.3
  583      module load curl/7.45.0   # there is a bug in the most recent libcurl preventing the 'curl' package from getting build
  584      echo -e "\nThis should have been set to the appropriate directory in this module, is it?\n\nR_LIBS_USER = $R_LIBS_USER\n"
  585  mspid curl
  586  vi ../../R_packages-3.6.1-install-README.md 
  587  mfshow libcurl
  588  mfshow -l libcurl
  589  vi ../../R_packages-3.6.1-install-README.md 
  590     VERSION=3.6.1
  591      CLUSTER=${CLUSTER?:For some reason, CLUSTER is not set}
  592      cd /sw/apps
  593      mkdir -p R_packages
  594      cd R_packages/
  595      mkdir -p $VERSION
  596      mkdir -p mf
  597      cd $VERSION
  598      mkdir $CLUSTER
  599      [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca snowy ; do test -L $CL || ln -s $CLUSTER $CL; done
  600      cd $CLUSTER/
  601      export R_LIBS_USER=$PWD
  602      module load R/$VERSION
  603      module load build-tools
  604      module load autoconf/2.69
  605      module load automake/1.14.1
  606      module load cmake/3.13.2    # some packages require a newish cmake
  607      module load m4/1.4.17
  608      module load MariaDB/10.1.29
  609      module load PostgreSQL/10.3
  610      module load UDUNITS/2.2.26  # these further modules were added
  611      module load GDAL/2.1.0
  612      module load Poppler/0.54.0
  613      module load JAGS/4.3.0
  614      module load gsl/2.3
  615      module load libcurl/7.45.0   # there is a bug in the most recent libcurl preventing the 'curl' package from getting build
  616      echo -e "\nThis should have been set to the appropriate directory in this module, is it?\n\nR_LIBS_USER = $R_LIBS_USER\n"
  617  vi ../../R_packages-3.6.1-install-README.md 
  618  cd ../external_packages/
  619  ll
  620  wget --timestamping -O SAIGE_${SAIGE_VERSION}.tar.gz https://github.com/weizhouUMICH/SAIGE/archive/${SAIGE_VERSION}.tar.gz
  621  vi ../../R_packages-3.6.1-install-README.md 
  622     mkdir -p /sw/apps/R_packages/$VERSION/external_packages
  623      cd /sw/apps/R_packages/$VERSION/external_packages
  624      SAIGE_VERSION=0.35.8.8
  625      [[ -f SAIGE_${SAIGE_VERSION}.tar.gz ]] || wget --timestamping -O SAIGE_${SAIGE_VERSION}.tar.gz https://github.com/weizhouUMICH/SAIGE/archive/${SAIGE_VERSION}.tar.gz
  626  wget https://github.com/weizhouUMICH/SAIGE/releases/download/0.35.8.8/SAIGE_0.35.8.8_R_x86_64-pc-linux-gnu.tar.gz
  627  ll
  628  rm SAIGE_.tar.gz
  629  mkdir t
  630  cd t
  631  tar xzvf ../SAIGE_0.35.8.8_R_x86_64-pc-linux-gnu.tar.gz 
  632  ll
  633  ml
  634  cd SAIGE/
  635  ll
  636  cd libs/
  637  ll
  638  ldd SAIGE.so 
  639  mspid boost
  640  ml boost/1.66.0-gcc8.3.0
  641  ldd SAIGE.so 
  642  ml
  643  ml -boost
  644  ldd SAIGE.so 
  645  echo $LD_LIBRARY_PATH 
  646  echo $LD_RUN_PATH
  647  vi ../../../../../R_packages-3.6.1-install-README.md 
  648  ml
  649  ml boost/1.59.0_gcc4.9.2
  650  ldd SAIGE.so 
  651  ml -boost
  652  ll
  653  cd ..
  654  ml
  655  ll
  656  cd ..
  657  ll
  658  cd ..
  659  ll
  660  rm t
  661  rm -rf t
  662  rm SAIGE_0.35.8.8_R_x86_64-pc-linux-gnu.tar.gz 
  663  ml
  664  mspid boost
  665  ml boost/1.66.0-gcc8.3.0
  666  ml
  667  vi ../../R_packages-3.6.1-install-README.md 
  668  ml
  669  ml -boost/1.66.0-gcc8.3.0
  670  ml
  671  vi ../../R_packages-3.6.1-install-README.md 
  672  ll
  673  grep SAIGE ../../R_packages-3.6.1-install-README.md 
  674  which R
  675  echo $R_LIBS_USER
  676  ll -d /sw/apps/R_packages/3.6.1/rackham
  677  ll -d /sw/apps/R_packages/3.6.1/rackham/*
  678  grep SAIGE ../../R_packages-3.6.1-install-README.md 
  679  echo $SAIGE_VERSION
  680  ll
  681  R CMD INSTALL SAIGE_${SAIGE_VERSION}.tar.gz
  682  ml
  683  ml
  684  mspid python
  685  ml python/3.7.2
  686  cd
  687  rm -rf .local
  688  python
  689  python3
  690  ml python/3.7.2
  691  vi ../../R_packages-3.6.1-install-README.md 
  692  echo $PYTHONPATH
  693  ll /sw/comp/python/3.7.2_rackham/lib/python3.7/site-packages/
  694  vi /sw/comp/python/python-3.7.2_CLUSTER-install-README.md 
  695  chmod -R -w  /sw/comp/python/3.7.2_rackham/lib/python3.7/site-packages
  696  ll /sw/comp/python/3.7.2_rackham/lib/python3.7/site-packages/
  697  ll
  698  ml
  699  vi ../../R_packages-3.6.1-install-README.md 
  700  ml
  701  R CMD INSTALL SAIGE_${SAIGE_VERSION}.tar.gz
  702  vi ../../R_packages-3.6.1-install-README.md 
  703  mspid htslib
  704  module load htslib/1.9
  705  module load bioinfo-tools htslib/1.9
  706  vi ../../R_packages-3.6.1-install-README.md 
  707  grep -m 1 -A 10 SAIGE ../../R_packages-3.6.1-install-README.md 
  708  grep SAIGE -A 10 ../../R_packages-3.6.1-install-README.md 
  709  grep SAIGE -A 10 -m1 ../../R_packages-3.6.1-install-README.md 
  710  grep SAIGE -A 10 -m2 ../../R_packages-3.6.1-install-README.md 
  711  grep SAIGE -A 20 -m2 ../../R_packages-3.6.1-install-README.md 
  712  echo $LD_LIBRARY_PATH
  713  echo $LD_RUN_PATH
  714  ll /sw/comp/python/3.7.2_rackham/lib/python3.7/site-packages/cget/cmake/
  715  ll /sw/comp/python/3.7.2_rackham/lib/python3.7/site-packages/cget
  716  ll /sw/comp/python/3.7.2_rackham/lib/python3.7/site-packages/cget/__pycache__/
  717  ll
  718  tar xzf SAIGE_0.35.8.8.tar.gz 
  719  ll
  720  cd SAIGE-0.35.8.8/
  721  ll
  722  cd thirdParty/
  723  ll
  724  cd cget/
  725  ll
  726  cd cget/
  727  ll
  728  cd pkg/
  729  ll
  730  cd ..
  731  ll
  732  cd ..
  733  ll
  734  cat re
  735  cat readme 
  736  cat requirements.txt 
  737  ll bgen/
  738  which cget
  739  ( export CFLAGS="-fPIC"; export CXXFLAGS="-fPIC"; cget install -f requirements.txt )
  740  mspid sz
  741  mspid xz
  742  ml xz/5.2.2
  743  ( export CFLAGS="-fPIC"; export CXXFLAGS="-fPIC"; cget install -f requirements.txt )
  744  ll
  745  cd cget/
  746  ll
  747  cd cget/
  748  ll
  749  cd pkg/
  750  ll
  751  ll xz
  752  ll xz/deps/
  753  cd ../
  754  ll
  755  cd pkg/
  756  ll
  757  cd xz/
  758  ll
  759  cd install/
  760  ll
  761  cd lib/
  762  ll
  763  rm liblzma.a 
  764  cd ..
  765  ll
  766  cd ..
  767  ll
  768  cd ..
  769  ll
  770  cd zlib/
  771  ll
  772  cd lin
  773  cd install/
  774  ll
  775  cd lib/
  776  ll
  777  rm -f *
  778  cd ..
  779  ll
  780  cd ..
  781  ll
  782  cd zstd/
  783  ll
  784  cd install/
  785  ll
  786  cd lib/
  787  ll
  788  rm libzstd.a 
  789  cd ../../..
  790  ll
  791  cd ../..
  792  ll
  793  cd ..
  794  ll
  795  cat requirements.txt 
  796  cget -h
  797  ( export CFLAGS="-fPIC"; export CXXFLAGS="-fPIC"; cget install -f requirements.txt )
  798  cat requirements.txt 
  799  ( export CFLAGS="-fPIC"; export CXXFLAGS="-fPIC"; cget install xz
  800  ( export CFLAGS="-fPIC"; export CXXFLAGS="-fPIC"; cget install xz )
  801  ml -xz
  802  ( export CFLAGS="-fPIC"; export CXXFLAGS="-fPIC"; cget install xz )
  803  ll
  804  ll cget/
  805  ll cget/cget/
  806  ll cget/cget/pkg/
  807  ll cget/cget/pkg/xz
  808  ll cget/cget/pkg/xz/deps/
  809  ll cget/cget/pkg/xz/deps/jonathonl__shrinkwrap 
  810  cat cget/cget/pkg/xz/deps/jonathonl__shrinkwrap 
  811  rm -rf cget/cget/pkg/xz
  812  ( export CFLAGS="-fPIC"; export CXXFLAGS="-fPIC"; cget install xz )
  813  ( export CFLAGS="-fPIC"; export CXXFLAGS="-fPIC"; cget install xz-mirror/xz )
  814  cd ../..
  815  ll
  816  rm -rf SAIGE-0.35.8.8/
  817  cd /sw/comp/python/3.6.0
  818  ll
  819  cd bin/
  820  ll
  821  cd ..
  822  ll
  823  ml python/3.6.0
  824  python
  825  python3
  826  cd ..
  827  ll
  828  cd 3.6.0_rackham
  829  ll
  830  cd lib/
  831  ll
  832  ml
  833  echo $PYTHONPATH
  834  python3
  835  pushd .
  836  cd /sw/bioinfo/snakemake/
  837  ll
  838  cd 5.4.5/
  839  ll
  840  cd rackham/
  841  ll
  842  ml bioinfo-tools snakemake/5.4.5
  843  mshow snakemake/5.4.5
  844  which snakemake
  845  snakemake
  846  pushd .
  847  finger dussex
  848  pushd .
  849  cd /sw/share/
  850  ll
  851  cd slurm
  852  ll
  853  cd rackham
  854  ls
  855  cd jobdetails/
  856  cd nicd
  857  ls
  858  cd 10585652
  859  ls
  860  ll
  861  cat jobscript 
  862  ls -ld 1058*
  863  cd ..
  864  ls -ld 1058*
  865  cd 10585674
  866  ll
  867  less jobscript 
  868  cd ../10585602
  869  ll
  870  cat jobscript 
  871  cat scontrol_before
  872  cat scontrol_running
  873  cat /crex/proj/sllstore2017093/Ebirds/snakemake_v2.1_Ebirds/slurm-10585602.out
  874  cd .s
  875  cd ..
  876  ls
  877  cd ../../../snowy
  878  cd jobdetails/nicd
  879  ls
  880  ls -ld 84*
  881  ls -ld 8*
  882  cd 838256
  883  ll
  884  cat jobscript 
  885  grep snakemake 8*/jobdetails
  886  grep snakemake 8*/jobscript
  887  cd ..
  888  grep snakemake 8*/jobscript
  889  htop
  890  ml python/3.6.0
  891  python3
  892  exit
  893  ssh s113
  894  ll
  895  mshow python/3.6.0
  896  mshow snakemake/5.4.5
  897  mshow python3/3.6.0
  898  cd /sw/comp/python
  899  ll
  900  cd mf
  901  ll
  902  vi 3.6.0 2.7.9
  903  rsync -n -Pa * /sw/mf/common/compilers/python/
  904  ll /sw/mf/common/compilers/python/
  905  mfshow -c python
  906  cat python-rpath.tcl
  907  cat compilers/python/python-rpath.tcl
  908  cat /sw/mf/common/compilers/python/python-rpath.tcl 
  909  ll
  910  mkdir prev
  911  mv 2* 3* prev/
  912  ll
  913  rsync -n -Pa /sw/mf/common/compilers/python/* .
  914  rsync  -Pa /sw/mf/common/compilers/python/* .
  915  ll
  916  cat 2.7.9.lua 
  917  ll
  918  cat prev/2.7.9 
  919  ll
  920  vi python-rpath.tcl 
  921  ll prev
  922  cd prev
  923  diff 3.7.9 3.6.0
  924  diff 2.7.9 3.6.0
  925  ll
  926  cd ..-..
  927  pushd .
  928  cd ../..
  929  ll
  930  cd 3.6.0_rackham/
  931  ll
  932  cd bin/
  933  ll
  934  ldd python3.6
  935  ml patchelf
  936  patchelf --print-rpath python3.6
  937  ll /sw/apps/sqlite/3.16.2/milou/lib
  938  ll /sw/apps/sqlite/3.16.2/
  939  cd ../lib
  940  ll
  941  ldd libpython3.so
  942  ml
  943  ml -python -gcc -snakemake
  944  ml
  945  ldd libpython3.so
  946  patchelf --print-rpath libpython3.so
  947  patchelf --print-rpath libpython3.6m.so.1.0
  948  cd /sw/apps/sqlite
  949  ll
  950  dirs
  951  swapd
  952  ll
  953  cd ..
  954  ll
  955  diff prev/3.6.0 python-rpath.tcl 
  956  vi python-rpath.tcl 
  957  ll
  958  vi python.tcl
  959  ll
  960  cat python_new.tcl
  961  ml
  962  ml python/2.7.6
  963  echo $LD_LIBRARY_PATH
  964  ml -python
  965  ll
  966  mv python_new.tcl python-set-LD_LIBRARY_PATH.tcl
  967  ln -sf python-set-LD_LIBRARY_PATH.tcl 2.7.6
  968  ll
  969  mfshow python
  970  mfshow -c python
  971  ls
  972  ll
  973  cat python.tcl 
  974  diff python-set-LD_LIBRARY_PATH.tcl python.tcl 
  975  cd ..
  976  ll
  977  cd mf
  978  ll
  979  mv python-set-LD_LIBRARY_PATH.tcl python-set-LD_LIBRARY_PATH_new.tcl
  980  ln -sf python-set-LD_LIBRARY_PATH_new.tcl 2.7.6
  981  ll
  982  mv python.tcl python-set-LD_LIBRARY_PATH.tcl
  983  pushd .
  984  cd
  985  cd github-sync/local/install-methods/
  986  cd bioinfo/
  987  ll
  988  grep 'pip.*user' */*.md
  989  cd /sw/bioinfo/umi_tools/
  990  ll
  991  cd 1.0.0/
  992  ll
  993  cd rackham/
  994  ls
  995  ll
  996  mspid fastani
  997  mspid pplacer
  998  mspid prodigal
  999  mspid fasttree
 1000  dirs
 1001  makeroom.sh
 1002  makeroom.sh -t FastANI -v 1.2 -s misc -d "fast alignment-free computation of whole-genome Average Nucleotide Identity (ANI)" -w https://github.com/ParBLiSS/FastANI -l "Apache 2.0"
 1003  ls -ltr
 1004  ./makeroom_FastANI_1.2.sh
 1005  ls -ltr
 1006  cd /sw/bioinfo/FastANI
 1007  ll
 1008  source SOURCEME_FastANI_1.2 
 1009  echo $PREFIX
 1010  cd 1.2
 1011  ll
 1012  cd src
 1013  wget https://github.com/ParBLiSS/FastANI/releases/download/v1.2/fastANI-Linux64-v1.2.zip
 1014  wget https://github.com/ParBLiSS/FastANI/archive/v1.2.tar.gz
 1015  unzip fastANI-Linux64-v1.2.zip
 1016  ll
 1017  rm -rf __MACOSX
 1018  ldd fastANI
 1019  ml
 1020  ./fastANI 
 1021  ./fastANI -h
 1022  ./fastANI --version
 1023  ll
 1024  mv fastANI $PREFIX/
 1025  ll
 1026  cd ..
 1027  ll
 1028  cd rackham/
 1029  ll
 1030  cd ../..
 1031  echo $PREFIX
 1032  ll
 1033  cd mf
 1034  ll
 1035  vi 1.2 
 1036  mfshow FastANI
 1037  cd ..
 1038  ll
 1039  cat FastANI-1.2_post-install.sh 
 1040  ./FastANI-1.2_post-install.sh 
 1041  type mfshow
 1042  mfshow 
 1043  mfshow FastANI
 1044  all_mflink  FastANI 1.2
 1045  ll
 1046  fixup .
 1047  ml
 1048  cd
 1049  cd -
 1050  ll
 1051  cat FastANI-1.2.yaml
 1052  cd ..
 1053  makeroom.sh -t GTDB-Tk -v 0.3.2 -s misc -d "software toolkit for assigning objective taxonomic classifications to bacterial and archaeal genomes" -w https://github.com/Ecogenomics/GTDBTk -l "GPL v3"
 1054  ls -ltr
 1055  ./makeroom_GTDB-Tk_0.3.2.sh 
 1056  cd GTDB-Tk/
 1057  ll
 1058  source SOURCEME_GTDB-Tk_0.3.2 
 1059  echo $PREFIX
 1060  echo $VERSION
 1061  echo $TOOLDIR
 1062  cat SOURCEME_GTDB-Tk_0.3.2 
 1063  module load python/3.7.2
 1064  which pip
 1065  which pip3
 1066  PYTHONUSERBASE=$PREFIX pip install --user gtdbtk
 1067  ll
 1068  cd 0.3.2/
 1069  cd rackham/
 1070  ll
 1071  cd bin/
 1072  ll
 1073  ml
 1074  ./gtdbtk 
 1075  cd ../lib/
 1076  ll
 1077  cd python3.7/
 1078  ll
 1079  cd site-packages/
 1080  ll
 1081  echo $PYTHONPATH
 1082  export PYTHONPATH=$PWD
 1083  cd ../../../bin/
 1084  ll
 1085  ./gtdbtk 
 1086  ml
 1087  head /sw/bioinfo/GTDB-Tk/0.3.2/rackham/lib/python3.7/site-packages/gtdbtk/main.py
 1088  less /sw/bioinfo/GTDB-Tk/0.3.2/rackham/lib/python3.7/site-packages/gtdbtk/main.py
 1089  which python
 1090  python3
 1091  cd ../lib/
 1092  find . -name '*config*'
 1093  cd ../bin/
 1094  ll
 1095  view gtdbtk 
 1096  python3
 1097  cd ../..
 1098  ll
 1099  cd rackham/
 1100  ll
 1101  rm -rf *
 1102  ml
 1103  ml python/2.7.15
 1104  ml
 1105  unset PYTHONPATH
 1106  PYTHONUSERBASE=$PREFIX pip install --user gtdbtk
 1107  ll
 1108  cd lib/
 1109  ll
 1110  cd python2.7/
 1111  ll
 1112  cd site-packages/
 1113  ll
 1114  echo $PYTHONPATH
 1115  export PYTHONPATH=$PWD
 1116  cd ../../
 1117  cd ..
 1118  ll
 1119  cd bin/
 1120  ll
 1121  echo $PATH
 1122  export PATH=$PWD:$PATH
 1123  which gtdbtk
 1124  gtdbtk
 1125  gtdbtk -h
 1126  cd ../..
 1127  ll
 1128  cd ..
 1129  cd mf/
 1130  ll
 1131  vi 0.3.2 
 1132  makeroom.sh
 1133  vi 0.3.2 
 1134  cd ../..
 1135  makeroom.sh -t GTDB -v R04-RS89 -c data -d "standardised microbial taxonomy based on genome phylogeny" -w https://gtdb.ecogenomic.org
 1136  ls -ltr
 1137  ./makeroom_GTDB_R04-RS89.sh 
 1138  cd /sw/data
 1139  ll
 1140  ls -ltr
 1141  fixup GTDB/
 1142  cd GTDB/
 1143  ll
 1144  cd R04-RS89/
 1145  ll
 1146  cd rackham/
 1147  ll
 1148  cd ../src/
 1149  ll
 1150  mv /proj/uppstore2017197/nobackup/GTDBTK_data/gtdbtk_r89_data.tar.gz .
 1151  cp -av /proj/uppstore2017197/nobackup/GTDBTK_data/gtdbtk_r89_data.tar.gz .
 1152  ll
 1153  tar xvzf gtdbtk_r89_data.tar.gz 
 1154  ll
 1155  ll /proj/uppstore2017197/nobackup/GTDBTK_data/gtdbtk_r89_data.tar.gz
 1156  ml
 1157  cd ../mf
 1158  cd ../../mf
 1159  ll
 1160  dirs
 1161  cd /sw/bioinfo/GTDB-Tk/
 1162  ll
 1163  cd mf/
 1164  ll
 1165  vi 0.3.2 
 1166  ml
 1167  mfshow GTDB-Tk
 1168  cd ..
 1169  ll
 1170  .-GTDB-Tk-0.3.2_post-install.sh
 1171  ./GTDB-Tk-0.3.2_post-install.sh
 1172  fixup .
 1173  mfshow GTDB-Tk
 1174  all_mflink GTDB-Tk 0.3.2
 1175  ml bioinfo-tools GTDB-Tk/0.3.2
 1176  gtdbtk 
 1177  ml
 1178  ml -GTDB-Tk
 1179  ml
 1180  ml bioinfo-tools GTDB-Tk/0.3.2
 1181  echo $GTDBTK_DATA_PATH
 1182  gtdbtk 
 1183  ml
 1184  ll
 1185  history >> GTDB-Tk-0.3.2_install-README.md
