IMPUTE2 2.3.2
=============

A genotype imputation and haplotype phasing program based on ideas from:

    B. N. Howie, P. Donnelly, and J. Marchini (2009) A flexible and accurate
    genotype imputation method for the next generation of genome-wide association
    studies. PLoS Genetics 5(6): e1000529

<https://mathgen.stats.ox.ac.uk/impute/impute_v2.html#home>


Log
---

    cd /sw/apps/bioinfo/
    mkdir IMPUTE2
    cd IMPUTE2/
    mkdir 2.3.2
    cd 2.3.2/
    ln -s ./milou tintin
    ln -s ./milou nestor
    ln -s ./milou halvan

Note: the `milou/` directory will not yet exist!

    mkdir src
    cd src
    wget https://mathgen.stats.ox.ac.uk/impute/impute_v2.3.2_x86_64_static.tgz
    tar xzf impute_v2.3.2_x86_64_static.tgz 
    mv impute_v2.3.2_x86_64_static ../milou
    cd ../..
    mkdir mf
    cd mf

Get a simple mf file from SNPTEST, and add `$modroot` to `PATH`.

  305  cd Aborealis/
  306  ll
  307  cd ..
  308  ll
  309  gmap_build -d ArcBore ArcBore.fasta 
  310  ll
  311  pushd .
  312  cd /sw/apps/bioinfo/gmap-gsnap/2015-09-28/milou/share
  313  ll
  314  cat *coords
  315  ll
  316  rm -rf ArcBore
  317  rm -rf ArcBore*
  318  ll
  319  popd
  320  ll
  321  env | grep GMAP
  322  env | grep DB
  323  module list
  324  ll
  325  export GMAPDB=$PWD/gmap
  326  mkdir gmap
  327  gmap_build -d ArcBore ArcBore.fasta 
  328  unset GMAPDB
  329  ll
  330  dirs
  331  pushd .
  332  cd /sw/apps/bioinfo/gmap-gsnap/2015-09-28/milou/share
  333  ll
  334  rm -rf ArcBore*
  335  swapd
  336  gmap -h
  337  gmap --help
  338  exit
  339  ll *sh
  340  view blast_orth_all-vs-all.sh
  341  view run_GenFamClust.sh 
  342  cat do_hcluster.sh
  343  ll
  344  view run_GenFamClust.sh 
  345  ll *.nnc
  346  grep nnc *.sh
  347  cd indexing/
  348  ll
  349  grep nnc *
  350  view extractTaxaMappings.pl
  351  view createCategories.pl 
  352  view remap-for-GenFamClust.pl 
  353  grep nc *
  354  cd ..
  355  grep nc *
  356  grep nc *
  357  man grep
  358  grep -l nc *
  359  module load bioinfo-tools
  360  module spider smrt
  361  module load SMRT/2.3.0
  362  source $SMRT_SETUP_SCRIPT
  363  module help SMRT/2.3.0
  364  which smrt_pipe.py
  365  smrtpipe.py 
  366  smrtpipe.py  --help
  367  module spider mhap
  368  module help mhap
  369  module help MHAP
  370  module load bioinfo-tools
  371  module help MHAP
  372  cd /sw/apps/bioinfo
  373  ll
  374  cd MHAP/
  375  ll
  376  cd 1.6/
  377  ll
  378  cd milou/
  379  ll
  380  module spider celera
  381  module spider cabog
  382  module spider cabog
  383  module spider CA
  384  exit
  385  exit
  386  ll
  387  cd viafull-SNP-calls/
  388  ll
  389  date
  390  cd /proj/b2015137/nobackup/mapping
  391  ll
  392  samtools mpileup 
  393  module load samtools
  394  module load bioinfo-tools samtools
  395  which samtools
  396  module load samtools/1.3
  397  which samtools
  398  samtools mpileup
  399  samtools mpileup -f danRer7.fa -q 0 -Q 0 *.sorted.bam | less
  400  exit
  401  samtools mpileup -f danRer7.fa -q 0 -Q 0 *.sorted.bam | grep -v '^Zv9' | less
  402  samtools mpileup -f danRer7.fa -q 0 -Q 0 K6*.sorted.bam | grep -v '^Zv9' | less
  403  cd /proj/b2015137/nobackup/mapping
  404  htop -u douglas
  405  exit
  406  samtools mpileup -f danRer7.fa -q 0 -Q 0 K6*.sorted.bam | grep -v '^Zv9' | less
  407  samtools mpileup -f danRer7.fa -q 0 -Q 0 K6*.sorted.bam | grep -v '^Zv9' | less
  408  module load bioinfo-tools samtools/1.3
  409  samtools mpileup -f danRer7.fa -q 0 -Q 0 K6*.sorted.bam | grep -v '^Zv9' | less
  410  samtools mpileup -f danRer7.fa -q 0 -Q 0 K6*.sorted.bam | less
  411  ll
  412  samtools mpileup -f danRer7.fa -q 0 -Q 0 *.sorted.bam | cut -f1,2,4,7,10,13,16 | less
  413  samtools mpileup -f danRer7.fa -q 0 -Q 0 *.sorted.bam | cut -f1,2,4,7,10,13,16 | less
  414  wget https://raw.githubusercontent.com/douglasgscofield/bioinfo/master/scripts/windowWig
  415  ls -ld .
  416  modules
  417  module list
  418  wget https://raw.githubusercontent.com/douglasgscofield/bioinfo/master/scripts/windowWig
  419  chmod +x windowWig 
  420  samtools mpileup -f danRer7.fa -q 0 -Q 0 K6C-to-danRer7.sorted.bam | head
  421  samtools mpileup -f danRer7.fa -q 0 -Q 0 K6C-to-danRer7.sorted.bam | cut -f1,2,4 | head
  422  samtools mpileup -f danRer7.fa -q 0 -Q 0 K6C-to-danRer7.sorted.bam | cut -f1,2,4 | ./windowWig | head
  423  samtools mpileup -f danRer7.fa -q 0 -Q 0 K6C-to-danRer7.sorted.bam | cut -f1,2,4 | ./windowWig windowsize=1000 | head
  424  samtools mpileup -f danRer7.fa -q 0 -Q 0 K6C-to-danRer7.sorted.bam | cut -f1,2,4 | ./windowWig windowsize=1000 > K6C-to-danRer7.sorted.cvg.wig
  425  bg
  426  ll
  427  ll *.wig
  428  tail K6C-to-danRer7.sorted.cvg.wig
  429  head K6C-to-danRer7.sorted.cvg.wig
  430  grep fixedStep K6C-to-danRer7.sorted.cvg.wig
  431  ll
  432  jobs
  433  ll *wig
  434  tail *wig
  435  kill %+
  436  rm -f *.wig
  437  ll
  438  exit
  439  newgrp b2015137
  440  exit
  441  ssh milou-b
  442  exit
  443  cd /proj/b2013182
  444  ll
  445  su verena
  446  exit
  447  su verena
  448  exit
  449  cd /sw/apps/bioinfo/
  450  mkdir -p canu/1.0
  451  cd canu/1.0/
  452  mkdir milou tintin src
  453  cd src/
  454  wget https://github.com/marbl/canu/archive/v1.0.tar.gz
  455  module load gcc/4.9.2
  456  module load zlib
  457  module list
  458  tar xzf v1.0.tar.gz 
  459  ls
  460  cd canu-1.0/
  461  ls
  462  ll
  463  cd src/
  464  make -j 8
  465  cd ..
  466  ll
  467  cd Linux-amd64/
  468  ll
  469  cd obj/
  470  ll
  471  cd ../bin/
  472  ll
  473  ldd canu
  474  ldd mhapConvert 
  475  cd ..
  476  ll
  477  mv Linux-amd64 ../../milou/
  478  cd ../../milou/Linux-amd64/bin/
  479  ldd canu
  480  ldd mhapConvert 
  481  ll
  482  ldd bogart 
  483  ldd falcon_sense 
  484  cd ..
  485  ll
  486  cd obj/
  487  ll
  488  cd bogart/
  489  ll
  490  cd bogart/
  491  ll
  492  view AS_BAT_PlaceContains.P
  493  ll
  494  cd ../../..
  495  ll
  496  cd ../..
  497  cd ..
  498  ll
  499  mkdir mf
  500  cd mf
  501  cp ../../cabog/mf/8.3 1.0
  502  vi 1.0 
  503  cd ../1.0/
  504  ll
  505  ln -s ./milou halvan
  506  ln -s ./milou nestor
  507  ll
  508  cd src
  509  ll
  510  cd /sw/apps/bioinfo/canu/1.0/src
  511  ll
  512  tar xzf v1.0.tar.gz 
  513  module load zlib gcc/4.9.2
  514  ll
  515  mv canu-1.0 canu-1.0-tintin
  516  cd canu-1.0-tintin/
  517  ll
  518  cd src
  519  ll
  520  cd ..
  521  cd milou/Linux-amd64/
  522  ll
  523  cd bin/
  524  ll
  525  ll lib
  526  ll lib/canu/
  527  ldd *
  528  module list
  529  module unload zlib gcc
  530  module list
  531  ldd *
  532  module load zlib
  533  ldd falcon_sense 
  534  vi ../../../../mf/1.0 
  535  module list
  536  ll
  537  ll
  538  cd ..
  539  mv Linux-amd64 ../../tintin/
  540  cd ../../tintin/
  541  ll
  542  cd Linux-amd64/
  543  cd bin
  544  ll
  545  ldd falcon_sense 
  546  ./falcon_sense 
  547  kill %+
  548  ll /opt/sw/software/lang/python/2.7.3/lib/python2.7/multiprocessing/process.py
  549  ll
  550  view ovStoreSorter 
  551  ./mhapConvert 
  552  ./readConsensus 
  553  cd ../..
  554  cd mf/
  555  ll
  556  vi 1.0 
  557  ll
  558  cd ./cd ../..
  559  cd ../..
  560  fixup -g canu
  561  ll
  562  cd canu/mf/
  563  ll
  564  cd ../../..
  565  cd ../mf
  566  ll
  567  ls -ld .
  568  cd /sw/mf/common/bioinfo-tools/assembly/
  569  mkdir canu
  570  cd canu
  571  cp /sw/apps/bioinfo/canu/mf/1.0 .
  572  ll
  573  cd ..
  574  fixup canu
  575  cd ../../../milou/bioinfo-tools/assembly/
  576  mkdir canu && cd canu && ln -s ../../../../common/bioinfo-tools/assembly/canu/1.0 . && cd .. && fixup canu
  577  ll
  578  ll canu/
  579  cd ../../../tintin/bioinfo-tools/assembly/
  580  mkdir canu && cd canu && ln -s ../.module load bioinfo-tools canu
  581  sembly/canu/1.0 . && cd .. && fixup canu
  582  canu -h
  583  echo $PATH
  584  ll /sw/apps/bioinfo/cabog/1.0/tintin/Linux-amd64/bin
  585  dirs
  586  cd /sw/apps/bioinfo/canu/mf
  587  cd ..
  588  cd 1.0/
  589  cd tintin/
  590  ll
  591  cd Linux-amd64/
  592  ll
  593  cd bin/
  594  ll
  595  cd ../../../../mf
  596  ll
  597  vi 1.0 
  598  cp 1.0 /sw/mf/common/bioinfo-tools/assembly/canu/1.0 
  599  module unload canu
  600  echo $PATH
  601  exit
  602  module load bioinfo-tools canu
  603  canu -h
  604  exit
  605  module spider canu
  606  module list
  607  module unload zlib
  608  module load bioinfo-tools
  609  module load canu/1.0
  610  cd ..
  611  history > canu-1.0-install-README.md
  612  vi canu-1.0-install-README.md 
  613  ll
  614  cd 
  615  cd github-sync/local/uppmax/install-methods/
  616  ./gather-READMEs.sh 
  617  git add .
  618  git status
  619  git commit -a -m "installs"
  620  git push
  621  ll
  622  git status
  623  module spider treemix
  624  cd tmp
  625  ll
  626  mkdir treemix
  627  cd treemix/
  628  wget https://bitbucket.org/nygcresearch/treemix/downloads/treemix-1.12.tar.gz
  629  tar xzf treemix-1.12.tar.gz 
  630  ll
  631  cd treemix-1.12/
  632  ll
  633  module list
  634  module load zlib gcc/4.9.2
  635  cd ..
  636  ll
  637  pushd .
  638  cd
  639  cd /sw/apps/bioinfo
  640  mkdir -p treemix/1.12
  641  cd treemix/1.12/
  642  ll
  643  mv ~/tmp/treemix src
  644  ll
  645  mkdir milou tintin
  646  ln -s ./milou nestor
  647  ln -s ./milou halvan
  648  cd src
  649  ll
  650  cd treemix-1.12/
  651  ll
  652  ./configure --prefix=/sw/apps/bioinfo/treemix/1.12/milou
  653  module spider boost
  654  module load boost/1.59.0_gcc4.9.2
  655  ./configure --prefix=/sw/apps/bioinfo/treemix/1.12/milou
  656  make
  657  make install
  658  cd ../../
  659  ll
  660  cd milou/
  661  ll
  662  cd bin/
  663  ll
  664  ./treemix
  665  cd ../..
  666  cd src
  667  ll
  668  mv treemix-1.12 treemix-1.12-milou
  669  cd ../..
  670  mkdir mf
  671  history > treemix-1.12-install-README.md
  672  vi treemix-1.12-install-README.md 
  673  cd ..
  674  mv treemix TreeMix
  675  ll
  676  cd TreeMix/
  677  ll
  678  cd 1.12/milou/bin/
  679  ll
  680  ldd treemix 
  681  ldd fourpop
  682  ldd f4ratio 
  683  module unload gcc zlib
  684  ldd f4ratio 
  685  cd ../../..
  686  ll
  687  cd mf/
  688  cp ../../pblat/mf/1.6 1.12
  689  vi 1.12
  690  ll
  691  cd ../..
  692  fixup -g TreeMix/
  693  cd TreeMix/
  694  ll
  695  mv treemix-1.12-install-README.md TreeMix-1.12-install-README.md 
  696  cd /sw/apps/bioinfo/TreeMix
  697  ll
  698  cd 1.12/
  699  ll
  700  cd src/
  701  ll
  702  tar xzf treemix-1.12.tar.gz 
  703  mv treemix-1.12 treemix-1.12-tintin
  704  cd treemix-1.12-tintin/
  705  ll
  706  module load gcc/4.9.2 zlib/1.2.8 boost/1.59.0_gcc4.9.2
  707  module spider boost
  708  module load build-tools
  709  module load gcc/4.9.2 zlib/1.2.8 boost/1.59.0_gcc4.9.2
  710  ll
  711  ./configure --prefix=/sw/apps/bioinfo/treemix/1.12/tintin
  712  make -j 4
  713  ll
  714  cd mf/
  715  ll
  716  pushd .
  717  cd /sw/mf/common/bioinfo-tools/misc
  718  ll
  719  mkdir TreeMix
  720  cd TreeMix/
  721  ll
  722  cp /sw/apps/bioinfo/TreeMix/mf/1.12 .
  723  ll
  724  cd ..
  725  fixup TreeMix/
  726  ll TreeMix/
  727  cd /sw/mf/milou/bioinfo-tools/misc/
  728  mkdir TreeMix
  729  cd TreeMix/
  730  ll
  731  ln -s ../../../../common/bioinfo-tools/misc/TreeMix/1.12 .
  732  ll
  733  cd ..
  734  fixup TreeMix/
  735  cd /sw/mf/tintin/bioinfo-tools/misc/
  736  mkdir TreeMix
  737  cd TreeMix/
  738  ln -s ../../../../common/bioinfo-tools/misc/TreeMix/1.12 .
  739  cd ..
  740  fixup TreeMix/
  741  ule unload boost build-tools zlib gcc
  742  mdoule list
  743  module list
  744  module load bioinfo-tools TreeMix
  745  treemix
  746  cd
  747  echo $PATH
  748  cd /sw/apps/bioinfo/TreeMix/1.12/src/treemix-1.12-tintin
  749  make install
  750  ll /sw/apps/bioinfo/treemix/1.12/tintin/bin
  751  treemix
  752  ll /sw/apps/bioinfo/TreeMix/1.12/tintin/bin:
  753  cd ../../..
  754  cd mf/
  755  ll
  756  vi 1.12 
  757  ls /sw/apps/bioinfo/TreeMix/1.12/tintin/bin
  758  cd ../..
  759  exit
  760  ll
  761  cd TreeMix/
  762  ll
  763  vi 1.12 
  764  cd /sw/apps/bioinfo/TreeMix/1.12/tintin
  765  ll
  766  cd ../../..
  767  ll
  768  cd treemix/
  769  ll
  770  cd 1.12/
  771  ll
  772  cd tintin/
  773  ll
  774  mv bin ../../../TreeMix/1.12/tintin/
  775  cd ../../..
  776  rm -rf treemix/
  777  cd TreeMix/
  778  vi TreeMix-1.12-install-README.md 
  779  ll
  780  module load bioinfo-tools TreeMix
  781  treemix
  782  exit
  783  module list
  784  module unload boost
  785  module load bioinfo-tools TreeMix/1.12
  786  cd 1.12/milou/bin/
  787  ll
  788  ./treemix 
  789  w
  790  which mccc
  791  htop
  792  exit
  793  cd /sw/data/uppnex/Kraken/latest
  794  ll
  795  cd ..
  796  ll
  797  du -csh *
  798  pushd .
  799  mail
  800  tail 5
  801  tail -n 200 5
  802  rm 5
  803  groups
  804  cd /proj/b2015084
  805  ls
  806  ll
  807  cd nobackup
  808  ll
  809  cd omneya_Nov15/
  810  ll
  811  cd 151009_M00485_0230_000000000-AHWAP/
  812  ll
  813  htop
  814  module load bioinfo-tools
  815  module load Mothur/1.36.1
  816  mothur
  817  which mothur
  818  ll /sw/apps/bioinfo/Mothur/1.36.1/milou/bin/mothur
  819  cd /sw/apps/bioinfo/tools/mothur
  820  cd /sw/apps/bioinfo/mothur
  821  cd ../..
  822  ll
  823  ll
  824  cd 1.36.1
  825  ll
  826  ll
  827  ll
  828  cd halvan
  829  module list
  830  cd /sw/apps/bioinfo/Mothur
  831  cd bin/
  832  ll /sw/mf/common/bioinfo-tools/misc/Mothur/1.36.1 
  833  vi /sw/mf/common/bioinfo-tools/misc/Mothur/1.36.1 
  834  module unload Mothur
  835  module load Mothur/1.36.1
  836  uname -a
  837  vi /sw/mf/common/bioinfo-tools/misc/Mothur/1.36.1 
  838  pushd .
  839  ll
  840  cd ..
  841  ll
  842  cd 1.36.1/
  843  ll
  844  cd src
  845  ll
  846  cd mothur-1.36.1
  847  ll
  848  vi makefile
  849  make clean
  850  make
  851  cat ../../../Mothur-1.36.1-install-README.md 
  852  cd ..
  853  rm -rf mothur-1.36.1
  854      module load gcc/4.9.2
  855      module load boost/1.59.0_gcc4.9.2
  856      module load zlib
  857  exit
  858  ssh h1
  859  cd /sw/apps/bioinfo/Mothur/1.36.1/
  860  ll
  861  cd src/
  862  ll
  863  cd mothur-1.36.1-halvan/
  864  ll
  865  vi makefile
  866  make
  867  make clean
  868  make
  869  cat ../../../Mothur-1.36.1-install-README.md 
  870  make clean
  871      module load gcc/4.9.2
  872      module load boost/1.59.0_gcc4.9.2
  873      module load zlib
  874  make
  875  make clean
  876  pushd .
  877  cd /proj/b2010042/
  878  ls
  879  cd fosmidpools/
  880  ll
  881  cd ..
  882  cd fosmid-pools-2.0/
  883  ll
  884  make -j8
  885  cat assembly-location.txt
  886  ll
  887  cd /sw/apps/bioinfo/Mothur/1.36.1/src/mothur-1.36.1-halvan
  888  ll
  889  ../mothur-1.36.1-milou/mothur 
  890  ./mothur 
  891  ll
  892  cd ../..
  893  ll
  894  cd milou/
  895  ll
  896  cd bin/
  897  ll
  898  cp mothur mothur-milou-specific
  899  cp ../../src/mothur-1.36.1-halvan/mothur mothur-generic
  900  ll
  901  rm mothur
  902  ln -s ./mothur-generic mothur
  903  ll
  904  cd ../../halvan/
  905  ll
  906  cd bin/
  907  ll
  908  mv mothur mothur-halvan-specific
  909  ln -s ./mothur-halvan-specific mothur
  910  ll
  911  ./uchime
  912  cd ../../milou/
  913  ll
  914  cd bin/
  915  ll
  916  mv uchime uchime-milou-specific
  917  cp ../../src/mothur-1.36.1-halvan/uchime uchime-generic
  918  ln -s ./uchime-generic uchime
  919  ll
  920  cd ../../halvan/bin/
  921  ll
  922  mv uchime uchime-halvan-specific
  923  ln -s ./uchime-halvan-specific uchime
  924  ll
  925  exit
  926  ssh h1
  927  module list
  928  module load bioinfo-tools Mothur/1.36.1
  929  mothur
  930  mothur-halvan-specific
  931  which mothur
  932  ll /sw/apps/bioinfo/Mothur/1.36.1/milou/bin/
  933  mothur-milou-specific 
  934  mothur-generic
  935  exit
  936  exit
  937  ll
  938  exit
  939  cd ..
  940  ll
  941  ll reference/
  942  cd /sw/apps/bioinfo/Mothur/
  943  ll
  944  vi Mothur-1.36.1-install-README.md 
  945  cd 1.36.1/
  946  ll
  947  cd halvan/
  948  ll
  949  cd bin/
  950  ll
  951  cd ../..
  952  cd milou/bin/
  953  ll
  954  exit
  955  pushd .
  956  cd ../../halvan/
  957  ll
  958  cd bin/
  959  ll
  960  mv mothur-halvan-specific uchime-halvan-specific ../../milou/bin/
  961  cd ..
  962  ll
  963  cd ..
  964  ll
  965  rm -rf halvan
  966  ln -s ./milou halvan
  967  ll
  968  cd halvan/
  969  ll
  970  cd bin/
  971  ll
  972  rename-string n-specific n
  973  ~/bin/rename-string n-specific n
  974  ~/bin/rename-string u-specific u
  975  ll
  976  cd ../..
  977  ll
  978  cd ..
  979  ll
  980  vi Mothur-1.36.1-install-README.md 
  981  ll
  982  cd ..
  983  cd Mothur/
  984  ll
  985  cd 
  986  cd github-sync/local/uppmax/install-methods/
  987  ./gather-READMEs.sh 
  988  module spider deep
  989  cd /sw/apps/bioinfo/mirdeep2/
  990  ll
  991  ls -l
  992  cd 2.0.0.5/
  993  ll
  994  cd milou/
  995  ll
  996  cd bin/
  997  ll
  998  cd  /sw/comp/
  999  ll
 1000  fixup -g perl_modules
 1001  ll -d perl_modules/5.18.4/milou/lib/perl5/HTML/Template
 1002  ll -d /sw/comp/perl_modules/5.18.4/milou/lib/perl5/x86_64-linux-thread-multi/auto
 1003  module spider qc
 1004  module spider snp
 1005  cd
 1006  cd tmp
 1007  ls
 1008  mkdir tmp
 1009  cd tmp
 1010  wget http://www.well.ox.ac.uk/~gav/resources/snptest_v2.5.2_CentOS6.5_x86_64_static.tgz
 1011  tar xzf snptest_v2.5.2_CentOS6.5_x86_64_static.tgz 
 1012  ll
 1013  cd snptest_v2.5.2_linux_x86_64_static/
 1014  ll
 1015  ./snptest_v2.5.2 
 1016  cd ..
 1017  wget http://www.well.ox.ac.uk/~gav/resources/snptest_v2.5.2_CentOS6.5_x86_64_dynamic.tgz
 1018  tar xzf snptest_v2.5.2_CentOS6.5_x86_64_dynamic.tgz 
 1019  ll
 1020  cd *dynamic
 1021  ll
 1022  ./snptest_v2.5.2 
 1023  ldd ./snptest_v2.5.2 
 1024  ./snptest_v2.5.2 -help
 1025  ll /proj/b2016021/bin/snptest_v2.5.2_linux_x86_64_dynamic/snptest_v2.5.2
 1026  ll /proj/b2016021/bin/snptest_v2.5.2_linux_x86_64_dynamic
 1027  ll -d /proj/b2016021/bin/snptest_v2.5.2_linux_x86_64_dynamic
 1028  ./snptest_v2.5.2 -help
 1029  module list
 1030  env | grep PATH
 1031  env | grep LIB
 1032  cd ..
 1033  ll
 1034  wget http://www.well.ox.ac.uk/~gav/qctool/resources/qctool_v1.4-scientific-linux-x86_64.tgz
 1035  ll
 1036  tar xzf qctool_v1.4-scientific-linux-x86_64.tgz 
 1037  ll
 1038  cd qctool_v1.4-linux-x86_64/
 1039  ll
 1040  ./qctool 
 1041  ./qctool -help
 1042  cd ..
 1043  ll
 1044  mv qctool_v1.4-linux-x86_64 qctool_v1.4-scientific-linux-x86_64
 1045  ll
 1046  wget http://www.well.ox.ac.uk/~gav/qctool/resources/qctool_v1.4-linux-x86_64.tgz
 1047  ll
 1048  tar xzf qctool_v1.4-linux-x86_64.tgz 
 1049  ll
 1050  cd qctool_v1.4-linux-x86_64/
 1051  ll
 1052  ./qctool 
 1053  ldd qctool 
 1054  cd ..
 1055  ll
 1056  rm -rf qctool_v1.4-linux-x86_64*
 1057  ll
 1058  ldd snptest_v2.5.2_linux_x86_64_dynamic/snptest_v2.5.2 
 1059  ldd snptest_v2.5.2_linux_x86_64_static/snptest_v2.5.2 
 1060  dirs
 1061  pushd .
 1062  cd
 1063  cd /sw/apps/bioinfo/
 1064  ls
 1065  mkdir SNPTEST
 1066  cd SNPTEST/
 1067  mkdir 2.5.2
 1068  cd 2.5.2/
 1069  mkdir milou
 1070  ln -s ./milou tintin
 1071  ln -s ./milou nestor
 1072  ln -s ./milou halvan
 1073  mkdir src
 1074  cd src
 1075  wget http://www.well.ox.ac.uk/~gav/resources/snptest_v2.5.2_CentOS6.5_x86_64_dynamic.tgz
 1076  ll
 1077  tar xzf snptest_v2.5.2_CentOS6.5_x86_64_dynamic.tgz 
 1078  ll
 1079  cd snptest_v2.5.2_linux_x86_64_dynamic/
 1080  ll
 1081  cd ..
 1082  rmdir ../milou
 1083  mv snptest_v2.5.2_linux_x86_64_dynamic ../milou
 1084  cd ../milou
 1085  ll
 1086  cd ..
 1087  mkdir mf
 1088  cd mf
 1089  cp ../../PCAP/mf/PCAP 2.5.2
 1090  vi 2.5.2 
 1091  cd ../..
 1092  fixup -g SNPTEST/
 1093  ll
 1094  cd SNPTEST/
 1095  history > SNPTEST-2.5.2-install-README.md
 1096  cd /sw/mf/common/bioinfo-tools/misc
 1097  mkdir SNPTEST
 1098  cd SNPTEST/
 1099  cp /sw/apps/bioinfo/SNPTEST/mf/2.5.2 .
 1100  cd ..
 1101  fixup SNPTEST/
 1102  cd /sw/mf/milou/bioinfo-tools/misc/
 1103  mkdir SNPTEST
 1104  cd SNPTEST/
 1105  ln -s ../../../../common/bioinfo-tools/misc/SNPTEST/2.5.2 .
 1106  cd ..
 1107  fixup SNPTEST/
 1108  ll
 1109  cd ../../../tintin/bioinfo-tools/misc/
 1110  mkdir SNPTEST
 1111  cd SNPTEST/
 1112  ln -s ../../../../common/bioinfo-tools/misc/SNPTEST/2.5.2 .
 1113  ll
 1114  cd ..
 1115  fixup SNPTEST/
 1116  dirs
 1117  pushd .
 1118  cd /sw/apps/bioinfo/SNPTEST
 1119  ll
 1120  cd 2.5.2/
 1121  ll
 1122  cd milou/
 1123  ll
 1124  ln -s ./snptest_v2.5.2 snptest
 1125  ll
 1126  cd ../..
 1127  ll
 1128  vi SNPTEST-2.5.2-install-README.md 
 1129  ll 2.5.2/milou/
 1130  vi SNPTEST-2.5.2-install-README.md 
 1131  cd ..
 1132  mkdir qctool
 1133  cd qctool/
 1134  mkdir 1.4 mf
 1135  cd 1.4/
 1136  mkdir src
 1137  ln -s ./milou tintin
 1138  ln -s ./milou halvan
 1139  ln -s ./milou nestor
 1140  cd src
 1141  wget http://www.well.ox.ac.uk/~gav/qctool/resources/qctool_v1.4-scientific-linux-x86_64.tgz
 1142  tar xzf qctool_v1.4-scientific-linux-x86_64.tgz 
 1143  ll
 1144  ls qctool_v1.4-linux-x86_64/
 1145  ll qctool_v1.4-linux-x86_64/
 1146  mv qctool_v1.4-linux-x86_64 ../milou
 1147  cd ../../mf
 1148  ll
 1149  cp ../../SNPTEST/mf/2.5.2 1.4
 1150  vi 1.4 
 1151  cd ..
 1152  ll
 1153  cp ../SNPTEST/SNPTEST-2.5.2-install-README.md qctool-1.4-install-README.md
 1154  history >> qctool-1.4-install-README.md 
 1155  vi qctool-1.4-install-README.md 
 1156  ll
 1157  cd mf
 1158  ll
 1159  cd ../..
 1160  fixup -g qctool/
 1161  cd qctool/mf/
 1162  dirs
 1163  swapd
 1164  ll
 1165  mkdir qctool
 1166  cd qctool
 1167  ln -s ../../../../common/bioinfo-tools/misc/qctool/1.4 .
 1168  ll
 1169  cd /sw/mf/milou/bioinfo-tools/misc/
 1170  mkdir qctool
 1171  cd qctool/
 1172  ln -s ../../../../common/bioinfo-tools/misc/qctool/1.4 .
 1173  ll
 1174  cd ../../../../common/bioinfo-tools/misc/
 1175  mkdir qctool
 1176  dirs
 1177  cp /sw/apps/bioinfo/qctool/mf/1.4 .
 1178  ll
 1179  cd qctool/
 1180  ll
 1181  mv ../1.4 .
 1182  ll
 1183  cd ..
 1184  fixup qctool/
 1185  ll qctool/
 1186  ll /sw/mf/tintin/bioinfo-tools/misc/qctool
 1187  ll -d qctool/
 1188  fixup /sw/mf/tintin/bioinfo-tools/misc/qctool
 1189  fixup /sw/mf/milou/bioinfo-tools/misc/qctool
 1190  ll /sw/mf/tintin/bioinfo-tools/misc/qctool
 1191  module spider impute
 1192  dirs
 1193  swapd
 1194  ll
 1195  wget https://mathgen.stats.ox.ac.uk/impute/impute_v2.3.2_x86_64_dynamic.tgz
 1196  ll
 1197  tar xzf impute_v2.3.2_x86_64_dynamic.tgz 
 1198  cd impute_v2.3.2_x86_64_dynamic/
 1199  ll
 1200  ldd impute2 
 1201  cd ..
 1202  wget https://mathgen.stats.ox.ac.uk/impute/impute_v2.3.2_x86_64_static.tgz
 1203  ll
 1204  tar xzf impute_v2.3.2_x86_64_static.tgz 
 1205  ll
 1206  cd impute_v2.3.2_x86_64_static/
 1207  ll
 1208  ldd impute2 
 1209  ll
 1210  cat LICENCE 
 1211  dirs
 1212  swapd
 1213  cd ../..
 1214  ls
 1215  mkdir IMPUTE2
 1216  cd IMPUTE2/
 1217  mkdir 2.3.1 mf
 1218  cd 2.3.1/
 1219  mkdir src
 1220  ln -s ./milou tintin
 1221  ln -s ./milou nestor
 1222  ln -s ./milou halvan
 1223  cd src
 1224  wget https://mathgen.stats.ox.ac.uk/impute/impute_v2.3.2_x86_64_static.tgz
 1225  tar xzf impute_v2.3.2_x86_64_static.tgz 
 1226  mv impute_v2.3.2_x86_64_static ../milou
 1227  cd ..
 1228  ll
 1229  cd ../mf
 1230  ll
 1231  cp ../../qctool/mf/1.4 2.3.2
 1232  cd ..
 1233  ll
 1234  mv 2.3.1 2.3.2
 1235  ll
 1236  cd mf/
 1237  ll
 1238  vi 2.3.2 
 1239  cd ..
 1240  fixup -g IMPUTE2
 1241  dirs
 1242  swapd
 1243  mkdir IMPUTE2
 1244  cd IMPUTE2/
 1245  cp /sw/apps/bioinfo/IMPUTE2/mf/2.3.2 .
 1246  cd ..
 1247  fixup IMPUTE2/
 1248  swapd
 1249  cd IMPUTE2/
 1250  ll
 1251  cp ../SNPTEST/SNPTEST-2.5.2-install-README.md IMPUTE2-2.3.2-install-README.md
 1252  history >> IMPUTE2-2.3.2-install-README.md 
 1253  dirs
 1254  swapd
 1255  cd /sw/mf/milou/bioinfo-tools/misc/
 1256  mkdir IMPUTE2 && cd IMPUTE2 && ln -s ../../../../common/bioinfo+tools/misc/IMPUTE2/2.3.2 . && cd .. && fixup IMPUTE2
 1257  ll
 1258  ll IMPUTE2/
 1259  cd IMPUTE2/
 1260  ll
 1261  ln -sf ../../../../common/bioinfo-tools/misc/IMPUTE2/2.3.2 .
 1262  ll
 1263  cd ..
 1264  fixup IMPUTE2
 1265  cd /sw/mf/tintin/bioinfo-tools/misc/
 1266  mkdir IMPUTE2 && cd IMPUTE2 && ln -s ../../../../common/bioinfo-tools/misc/IMPUTE2/2.3.2 . && cd .. && fixup IMPUTE2
 1267  ll IMPUTE2/
 1268  dirs
 1269  swapd
 1270  ll
 1271  vi IMPUTE2-2.3.2-install-README.md 
 1272  cd ..
 1273  fixup -g IMPUTE2
 1274  mkdir GTOOL
 1275  cd GTOOL/
 1276  mkdir 0.7.5 mf
 1277  cd 0.7.5
 1278  mkdir src
 1279  cd src/
 1280  wget http://www.well.ox.ac.uk/~cfreeman/software/gwas/gtool_v0.7.5_x86_64.tgz
 1281  ll
 1282  wget http://www.well.ox.ac.uk/~cfreeman/software/gwas/gtool_v0.7.5_x86_64.tgz
 1283  ll
 1284  tar xzf gtool_v0.7.5_x86_64.tgz 
 1285  ll
 1286  mkdir ../milou
 1287  mv LICENCE gtool example ../milou/
 1288  cd ../
 1289  ll
 1290  ln -s ./milou tintin
 1291  ln -s ./milou halvan
 1292  ln -s ./milou nestor
 1293  ll
 1294  cd ..
 1295  cd mf
 1296  cp ../../IMPUTE2/mf/2.3.2 0.7.5
 1297  vi 0.7.5 
 1298  cd ../0.7.5/milou/
 1299  ll
 1300  ./gtool 
 1301  ldd gtool 
 1302  cd ../../
 1303  cp ../IMPUTE2/IMPUTE2-2.3.2-install-README.md GTOOL-0.7.5-install-README.md
 1304  history >> GTOOL-0.7.5-install-README.md 
