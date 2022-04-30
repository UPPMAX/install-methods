binutils/2.38
========================

<https://www.gnu.org/software/binutils/>

Used under license:
GPL v3


Structure creating script (makeroom_binutils_2.38.sh) moved to /sw/comp/binutils/makeroom_2.38.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-c" "comp" "-t" "binutils" "-v" "2.38" "-w" "https://www.gnu.org/software/binutils/" "-l" "GPL v3" "-d" "a collection of binary tools, built with plugin support"
    ./makeroom_binutils_2.38.sh
binutils-2.28-install-README.md
===============================

binutils/2.28, built with plugin support

<https://www.gnu.org/software/binutils/>

LOG
---

    VERSION=2.28
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/comp
    mkdir binutils
    cd binutils
    mkdir -p ${VERSION}
    cd ${VERSION}
    mkdir -p src
    mkdir -p $CLUSTER
    cd $CLUSTER
    PREFIX=$PWD
    cd ../src
    [[ -f binutils-${VERSION}.tar.gz ]] || wget http://ftp.gnu.org/gnu/binutils/binutils-${VERSION}.tar.gz
    tar xzf binutils-${VERSION}.tar.gz
    mv binutils-${VERSION} binutils-${VERSION}_$CLUSTER
    cd binutils-${VERSION}_$CLUSTER/
    module load gcc/5.3.0
    ./configure --enable-plugins --prefix=$PREFIX
    make -j 6
    make install

Use previous mf for binutils.

    cd /sw/comp/binutils/mf
    ln -s 2.26 $VERSION

Repeat for rackham.
   98  ll
   99  ml
  100  cd ../../../..
  101  cd ../..
  102  ll
  103  ml
  104  ll
  105  cd mf
  106  ll
  107  vi 4.0.0.lua
  108  mfshow -a R
  109  cd /sw/mf/miarka/applications/R/
  110  ll
  111  rm -f 3*
  112  ll
  113  cd ..
  114  ll
  115  mfshow -a R
  116  dirs
  117  cd /sw/apps/R/mf
  118  rsync -n -Pa * /sw/mf/common/applications/R/
  119  ll
  120  rm -f _4.1.1 
  121  rsync  -Pa * /sw/mf/common/applications/R/
  122  cd ..
  123  ll
  124  cd ..
  125  ll
  126  cd R_packages/
  127  ll
  128  mfshow -a R_packages
  129  rm -f /sw/mf/miarka/applications/R_packages/3.*
  130  ml
  131  ml R/4.0.0
  132  R
  133  ml
  134  ml R/4.0.4
  135  R
  136  ml
  137  ml R/4.1.1
  138  ml
  139  R
  140  ml
  141  exit
  142  ssh miarka3
  143  cd /sw/data
  144  cd ../bioinfo/
  145  ll
  146  mspid impute
  147  cd IMPUTE2/
  148  ll
  149  cat *md
  150  ll
  151  ll ../IMPUTE5/
  152  pushd .
  153  cd /sw/data
  154  ls
  155  cdd 1000_genome/
  156  cd 1000_genome/
  157  ll
  158  fixup du-csh.txt 
  159  ll
  160  cat du-csh.txt 
  161  mkdir impute_haplotypes
  162  cd impute_haplotypes/
  163  ll
  164  wget https://mathgen.stats.ox.ac.uk/impute/1000GP_Phase3.tgz
  165  wget https://mathgen.stats.ox.ac.uk/impute/1000GP_Phase3_chrX.tgz
  166  tar xf 1000GP_Phase3.tgz 
  167  ll
  168  tar xf 1000GP_Phase3_chrX.tgz 
  169  ll
  170  ll 1000GP_Phase3
  171  mkdir src
  172  ll
  173  mv *.gtz src/
  174  mv *.tgz src/
  175  ll
  176  rm -f *gz *txt
  177  cd 1000GP_Phase3/
  178  tar xf ../src/1000GP_Phase3_chrX.tgz 
  179  ll
  180  chmod -x *
  181  ll
  182  cd ..
  183  ll
  184  cd ..
  185  ll
  186  fixup -h
  187  fixup -G kgp -p .
  188  ll
  189  fixup -G kgp -p impute_haplotypes/
  190  ll
  191  chmod -R g+s 1000G_2504_high_coverage central regional
  192  chmod -R g-s 1000G_2504_high_coverage central regional
  193  ll
  194  ll 1000G_2504_high_coverage
  195  cd 1000G_2504_high_coverage/
  196  ll
  197  cd ..
  198  ls -ld .
  199  fixup -G kgp -p . &
  200  ll
  201  ls -ld .
  202  cd impute_haplotypes/
  203  ll
  204  cd ..
  205  ll
  206  history > impute_haplotypes.md
  207  vi impute_haplotypes.md 
  208  ll
  209  mv impute_haplotypes impute_haplotypes_install-README.md
  210  mv impute_haplotypes_install-README.md impute_haplotypes
  211  ll
  212  mv impute_haplotypes.md impute_haplotypes_install-README.md
  213  ll
  214  cd ..
  215  ll
  216  cd KGP/
  217  ll
  218  fixup *md
  219  fixup du-csh.txt 
  220  ll
  221  vi impute_haplotypes_install-README.md 
  222  ll
  223  ll impute_haplotypes
  224  cd 1000G_2504_high_coverage/
  225  ll
  226  cd ../impute_haplotypes/1000GP_Phase3/
  227  ll
  228  cd ..
  229  ll
  230  vi ~/github-sync/local/install-methods/gather-READMEs.sh 
  231  cd ..
  232  ll
  233  ll *
  234  vi ~/github-sync/local/install-methods/gather-READMEs.sh 
  235  ll
  236  cd
  237  cd github-sync/local/install-methods/
  238  git status
  239  ml git
  240  ml
  241  git status
  242  git commit -a -m "add /sw/data/KGP to scanned list"
  243  git status
  244  ./gather-READMEs.sh 
  245  git stus
  246  git status
  247  git add .
  248  git status
  249  cd /sw/libs
  250  ls
  251  cd __dlib/
  252  ll
  253  rm -f dlib-19-15-install-README.md 
  254  ls -la
  255  cd ..
  256  mv __dlib .dlib
  257  ll
  258  mv _wxWidgets .wxWidgets
  259  ll
  260  ls
  261  cd -
  262  dirs
  263  cd ~/github-sync/local/install-methods/
  264  vi gather-READMEs.sh 
  265  git status
  266  ./gather-READMEs.sh 
  267  git status
  268  git rm libs/__dlib
  269  git rm -r libs/__dlib
  270  git rm -rf libs/__dlib
  271  git status
  272  git rm -rf libs/.dlib
  273  git status
  274  rm -rf libs/.dlib
  275  git status
  276  git commit -a -m 'installs 20220331'
  277  git pull
  278  ssh-add ~/.ssh/github_rsa
  279  git pull
  280  git status
  281  git push
  282  git status
  283  cd /sw/apps
  284  ll
  285  cd R_packages/
  286  ll
  287  ll -d */miarka
  288  rm -f 3.*/miarka
  289  ll -d */miarka
  290  cd ../R
  291  cd x86_64/
  292  ll
  293  ll -d */miarka
  294  rm -f 3.*/miarka
  295  ll
  296  cd ..
  297  cd 4.1.1/
  298  ll
  299  cd ..
  300  ll
  301  cat R-4.1.1_install-README.md
  302  vi R-4.1.1_install-README.md
  303  mshow R
  304  vi R-4.1.1_install-README.md
  305  ssh miarka3
  306  exit
  307  exit
  308  cd /sw/bioinfo/HESS
  309  ll
  310  cd 0.5.4-beta/
  311  ll
  312  cd rackham/
  313  ll
  314  find . -name '*.py'
  315  mshow HESS
  316  cd misc
  317  ll
  318  head *.py
  319  head -n 1 *.py
  320  grep estimate_lambdagc *.py
  321  vi *.py
  322  mshow HESS
  323  ll
  324  chmod +x *.py
  325  ll
  326  head -n 1 *.py
  327  ml
  328  cd ../../../mf
  329  vi 0.5.4-beta 
  330  mfshow Hess
  331  mfshow HESS
  332  rsync -Pa * /sw/mf/common/bioinfo-tools/misc/HESS/
  333  ml
  334  ml bioinfo-tools HESS
  335  ml -HESS
  336  vi 0.5.4-beta 
  337  ml
  338  rsync -Pa * /sw/mf/common/bioinfo-tools/misc/HESS/
  339  ml HESS
  340  vi 0.5.4-beta 
  341  rsync -Pa * /sw/mf/common/bioinfo-tools/misc/HESS/
  342  ml HESS
  343  local_rhog_manhattan.py 
  344  local_rhog_manhattan.py --help
  345  vi 0.5.4-beta 
  346  rsync -Pa * /sw/mf/common/bioinfo-tools/misc/HESS/
  347  ml -HESS
  348  ml HESS
  349  exit
  350  mspid cook
  351  wget https://github.com/alexhbnr/mitoBench-ancientMT/blob/master/resources/contamMix_1.0-10.tar.gz
  352  ll
  353  ls -ltr
  354  file contamMix_1.0-10.tar.gz 
  355  rm -f contamMix_1.0-10.tar.gz 
  356  wget --timestamping https://github.com/alexhbnr/mitoBench-ancientMT/blob/master/resources/contamMix_1.0-10.tar.gz?raw=true
  357  ll
  358  ls -ltr
  359  file contamMix_1.0-10.tar.gz\?raw\=true 
  360  mv contamMix_1.0-10.tar.gz\?raw\=true contamMix_1.0-10.tar.gz
  361  cd /sw/apps/R
  362  ll
  363  cd ../R_packages/
  364  ll
  365  source SOURCEME_R_packages_4.1.1
  366  cd 4.1.1
  367  ll
  368  source source-for-setup 
  369  ls
  370  ll
  371  cd external/
  372  ll
  373  cp -av ~/contamMix_1.0-10.tar.gz 
  374  cp -av ~/contamMix_1.0-10.tar.gz .
  375  ll
  376  fixup contamMix_1.0-10.tar.gz 
  377  cd ..
  378  ll
  379  view R_packages-4.1.1_install-README.md
  380  cd 4.1.1/external/
  381  which R
  382  ll
  383  R CMD INSTALL contamMix_1.0-10.tar.gz 
  384  cd /sw/apps/R_packages/4.0.4
  385  ll
  386  source source-for-setup 
  387  ll
  388  cd ..
  389  ll
  390  cd external_repositories/
  391  ll
  392  cd ..
  393  ls
  394  cd external_tarballs/
  395  ls
  396  ll
  397  mv ../4.1.1/external/contamMix_1.0-10.tar.gz .
  398  echo $R_LIBS_USER
  399  R CMD INSTALL contamMix_1.0-10.tar.gz 
  400  cd /sw/apps/R_packages/4.0.0
  401  ll
  402  cd rackham/
  403  ls
  404  cd ..
  405  ll
  406  cd ..
  407  ll
  408  cat R_packages-4.0.0_install-README.md
  409  cd 4.0.0
  410  ll
  411  cat > source-for-setup
  412  source source-for-setup 
  413  cd ..
  414  vi source-for-setup 
  415  R CMD INSTALL ../external_tarballs/contamMix_1.0-10.tar.gz 
  416  cd ..
  417  ll
  418  history >> R_packages-4.1.1_install-README.md
  419  vi R_packages-4.1.1_install-README.md
  420  ml
  421  ml R_packages/4.0.0
  422  R
  423  exit
  424  exit
  425  cd /sw/apps/R
  426  ls
  427  cd 4.1.1/
  428  ll
  429  cd src/
  430  ll
  431  tar xf R-4.1.1.tar.gz 
  432  ls
  433  cd R-4.1.1/
  434  ll
  435  cd src/
  436  ll
  437  cd main/
  438  ll
  439  less connections.c 
  440  ml
  441  ml R_packages/4.1.1
  442  R
  443  interactive --qos=short -t 5:00 -N 3 -p devnode -A staff
  444  interactive --qos=short -t 5:00 -N 3 -A staff
  445  interactive --qos=short -t 5:00 -N 2 -A staff
  446  env | grep SLURM
  447  pushd .
  448  cd
  449  exit
  450  interactive --qos=short -t 3:00 -N 2 -A staff
  451  cd /sw/share/uppmax/
  452  ll
  453  cd sbin/
  454  ll
  455  which jobstats
  456  cd /sw/uppmax/bin/
  457  view jobstats 
  458  ll
  459  pushd .
  460  cd
  461  cd github-sync/local/
  462  ll
  463  cd install-methods/
  464  ll
  465  cat catim
  466  rm -f tags 
  467  vi nodelist.R
  468  env | grep SLURM
  469  env | grep SNIC
  470  ml
  471  R
  472  mv nodelist.R parseNodes.R
  473  vi parseNodes.R 
  474  R
  475  vi parseNodes.R 
  476  R
  477  vi parseNodes.R 
  478  R
  479  vi parseNodes.R 
  480  R
  481  vi parseNodes.R 
  482  R
  483  vi parseNodes.R 
  484  R
  485  vi parseNodes.R 
  486  R
  487  vi parseNodes.R 
  488  R
  489  vi parseNodes.R 
  490  R
  491  vi parseNodes.R 
  492  R
  493  vi parseNodes.R 
  494  R
  495  ls -la
  496  rm -f .RData .Rhistory 
  497  vi parseNodes.R 
  498  ml git
  499  ml
  500  ml purge
  501  ml git
  502  git status
  503  git pull
  504  git add .
  505  git commit -a -m "add parseNodes.R containing a function to parse node names out of a SLURM_NODELIST format"
  506  git push
  507  vi parseNodes.R 
  508  git commit -a -m "further attribution for parseNodes.R"
  509  git push
  510  cat parseNodes.R 
  511  interactive --qos=short -t 15:00 -N 2 -A staff
  512  v
  513  R
  514  ls -la
  515  pushd .
  516  cd
  517  exit
  518  cd /sw/comp/gcc
  519  ls
  520  cd 10.3.0_rackham/
  521  ls
  522  cd lib
  523  ls
  524  cd ../libexec/
  525  ls
  526  exit
  527  mkdir t
  528  cd t
  529  ll t
  530  cat t
  531  rm -f t
  532  mkdir t
  533  cd t
  534  wget https://github.com/google-coral/pycoral/releases/download/v1.0.1/tflite_runtime-2.5.0-cp35-cp35m-linux_x86_64.whl#sha256=8531bdd3f21c94d4953128a73b9df5bf39e93ba67c2a70e6daf572849ca388b1
  535  sha256sum tflite_runtime-2.5.0-cp35-cp35m-linux_x86_64.whl
  536  file tflite_runtime-2.5.0-cp35-cp35m-linux_x86_64.whl 
  537  unzip tflite_runtime-2.5.0-cp35-cp35m-linux_x86_64.whl
  538  ldd tflite_runtime-2.5.0.data/purelib/tflite_runtime/_pywrap_tensorflow_interpreter_wrapper.cpython-35m-x86_64-linux-gnu.so
  539  ml gcc/9.3.0
  540  ldd tflite_runtime-2.5.0.data/purelib/tflite_runtime/_pywrap_tensorflow_interpreter_wrapper.cpython-35m-x86_64-linux-gnu.so
  541  ll
  542  pip install --user tflite_runtime-2.5.0-cp35-cp35m-linux_x86_64.whl 
  543  ml python/3.8.7
  544  pip install --user tflite_runtime-2.5.0-cp35-cp35m-linux_x86_64.whl 
  545  ll
  546  cd tflite_runtime-2.5.0.dist-info
  547  ll
  548  cat METADATA 
  549  ml python/3.7.2
  550  cd ..
  551  ll
  552  pip install --user tflite_runtime-2.5.0-cp35-cp35m-linux_x86_64.whl 
  553  echo $PYTHONPATH
  554  echo $PYTHON_ROOT
  555  echo $PYTHON_ROOT/
  556  ls $PYTHON_ROOT/
  557  ls $PYTHON_ROOT/lib/python3.7/site-packages
  558  ml
  559  pip install https://github.com/iCorv/tflite-runtime/raw/master/tflite_runtime-2.4.0-py3-none-any.whl --user
  560  python
  561  ll
  562  rm -rf *
  563  pip install --index-url https://google-coral.github.io/py-repo/
  564  pip install --index-url https://google-coral.github.io/py-repo/ tflite_runtime --user
  565  which python
  566  python
  567  ll
  568  pip install --index-url https://google-coral.github.io/py-repo/ tflite_runtime==2.5.0 --user
  569  python
  570  pip install --index-url https://google-coral.github.io/py-repo/ tflite_runtime==2.4.0 --user
  571  rm -rf *
  572  rm -rf ~/.local
  573  rm -rf ~/.cache
  574  wget https://github.com/google-coral/pycoral/releases/download/v2.0.0/tflite_runtime-2.5.0.post1-cp39-cp39-linux_x86_64.whl#sha256=132f8c184b99d69e40040d8067eb962d9435cd2579f5563c33b8673d257d353d
  575  ll
  576  pip install --user tflite_runtime-2.5.0.post1-cp39-cp39-linux_x86_64.whl 
  577  wget https://github.com/google-coral/pycoral/releases/download/v1.0.1/tflite_runtime-2.5.0-cp35-cp35m-linux_aarch64.whl#sha256=358ba7558711ef451192fe5d34e369df686012885a08c99d63c3ada91aeb0f18
  578  ll
  579  pip install --user tflite_runtime-2.5.0-cp35-cp35m-linux_aarch64.whl
  580  pip install --user tflite_runtime
  581  python
  582  rm -rf ~/.local
  583  python
  584  ml python/3.9.5
  585  pip install --user tflite_runtime
  586  python
  587  pip install --user tflite_runtime==
  588  ml python/3.7.2
  589  pip install --user tflite_runtime==
  590  ml
  591  pip install --user tflite_runtime==2.5.0
  592  pip3 install --extra-index-url https://google-coral.github.io/py-repo/tflite_runtime tflite_runtime=2.5.0
  593  pip3 install --extra-index-url https://google-coral.github.io/py-repo/tflite_runtime tflite_runtime==2.5.0
  594  pip install --index-url https://google-coral.github.io/py-repo/ tflite_runtime==2.5.0 --user
  595  python
  596  ldd /home/douglas/.local/lib/python3.7/site-packages/tflite_runtime/_pywrap_tensorflow_interpreter_wrapper.cpython-37m-x86_64-linux-gnu.so
  597  rm -rf ~/.local ~/.cache
  598  module spider gsl
  599  which gdb
  600  ls -l /usr/bin/gdb
  601  ls -l /usr/bin/ls
  602  cd /sw/apps/R_packages/
  603  ll
  604  source SOURCEME_R_packages_4.1.1 
  605  cd 4.1.1/
  606  ll
  607  source source-for-setup 
  608  R
  609  cd ..
  610  ll
  611  cd external_tarballs/
  612  wget http://lifeome.net/software/lracluster/LRAcluster_1.0.tgz
  613  ls
  614  R CMD INSTALL LRAcluster_1.0.tgz 
  615  R
  616  cd ../4.1.1
  617  ll
  618  ls -la
  619  R
  620  cd rackham/
  621  ls -la .R*
  622  cd ..
  623  R
  624  cat .Rhistory 
  625  history | tail
  626  history | tail -n 50
  627  cd ..
  628  ll
  629  vi R_packages-4.1.1_install-README.md 
  630  ml
  631  R
  632  vi R_packages-4.1.1_install-README.md 
  633  cd 4.1.1
  634      cd $VERSIONDIR
  635      ./installed.R -c | tee counts.txt
  636  vi ../R_packages-4.1.1_install-README.md 
  637  R
  638  cd ..
  639  vi R_packages-4.1.1_install-README.md 
  640  echo $VERSIONDIR
  641      cd $VERSIONDIR
  642      ./installed.R -c | tee counts.txt
  643      ./installed.R -t > table.txt
  644      ../create_html_table.pl table.txt > table.html
  645  ll
  646  cat counts.txt 
  647  cd ../mf
  648  ll
  649  vi 4.1.1
  650  ll
  651  mshow -a R_packages
  652  mshow -a R_packages
  653  mfshow -a R_packages
  654  cp -av /sw/mf/common/applications/R_packages/4.1.1 4.1.1_orig
  655  cp -av 4.1.1 /sw/mf/common/applications/R_packages/
  656  ml
  657  ml -R_packages
  658  ml
  659  ml purge
  660  vi 4.1.1
  661  cp -av 4.1.1 /sw/mf/common/applications/R_packages/
  662  vi 4.1.1
  663  cp -av 4.1.1 /sw/mf/common/applications/R_packages/
  664  vi 4.1.1
  665  cp -av 4.1.1 /sw/mf/common/applications/R_packages/
  666  cd /sw/data/Kraken2_data/
  667  ll
  668  ls -ltr
  669  tail slurm-nt-6101328.out
  670  vi Kraken2-update-nt.sh
  671  ll
  672  sbatch Kraken2-update-nt.sh
  673  cat slurm-nt-5925830.out
  674  ll
  675  cat slurm-rackham-thin-25681370.out
  676  vi Kraken2-update-db.sh
  677  sbatch Kraken2-update-db.sh
  678  ll
  679  cat slurm-rackham-thin-24922654.out
  680  cat slurm-rackham-thin-25112714.out
  681  jiu
  682  scancel 25737598
  683  sbatch -t 1-19:00:00 Kraken2-update-db.sh
  684  jiu
  685  ll
  686  ls -ltr
  687  rm -f snowy-staff-douglas-4*
  688  ll
  689  rm -rf 20210927-094423_nt 
  690  rm -f slurm-1*
  691  ll
  692  rm -rf 20220211-162453 20220213-152607 20220301-003203 20220401-003610
  693  ll
  694  cd ../Kraken_data/
  695  ll
  696  cat slurm-rackham-mem1TB-25695333.out
  697  ll
  698  cat slurm-rackham-mem1TB-24922219.out
  699  ll
  700  rm -rf 20220212-004412 20220303-090031
  701  rm -rf 20220403-022624
  702  cat Kraken-update-db.sh 
  703  ll
  704  cat slurm-rackham-mem1TB-25695333.out
  705  pushd .
  706  cd /sw/bioinfo/Kraken
  707  ll
  708  cd 1.1.1
  709  ll
  710  cd rackham/
  711  ll
  712  vi rsync_from_ncbi.pl 
  713  cd ../..
  714  ll
  715  cat Kraken-1.1.1-install-README.md
  716  cat src/pull-request-258fcf8bdae4498dd655526b692d43481e22362c/rsync_from_ncbi.pl
  717  cd 1.1.1
  718  ll
  719  cat src/pull-request-258fcf8bdae4498dd655526b692d43481e22362c/rsync_from_ncbi.pl
  720  grep full_path src/pull-request-258fcf8bdae4498dd655526b692d43481e22362c/rsync_from_ncbi.pl
  721  cd ..
  722  ll
  723  makeroom.sh
  724  makeroom.sh -t Kraken -v 1.1.1-20210927-375654f -w https://github.com/DerrickWood/kraken -l "GPL v3" -d "Kraken taxonomic sequence classification system"
  725  makeroom.sh -f -t Kraken -v 1.1.1-20210927-375654f -w https://github.com/DerrickWood/kraken -l "GPL v3" -d "Kraken taxonomic sequence classification system"
  726  ./makeroom_Kraken_1.1.1-20210927-375654f.sh 
  727  source /sw/bioinfo/Kraken/SOURCEME_Kraken_1.1.1-20210927-375654f && cd $SRCDIR
  728  cat ../../Kraken-1.1.1-install-README.md 
  729  ml git gcc/8.3.0
  730  git clone --recursive https://github.com/DerrickWood/kraken
  731  ll
  732  cd kraken/
  733  ll
  734  ./install_kraken.sh $PREFIX
  735  cd $PREFIX
  736  ll
  737  view rsync_from_ncbi.pl 
  738  ll
  739  cd ../..
  740  ll
  741  ./Kraken-1.1.1-20210927-375654f_post-install.sh 
  742  mspid kraken2
  743  ll
  744  cd mf
  745  ll
  746  cat 1.1.1-20210927-375654f
  747  ll
  748  vi 1.1-352e780 
  749  ll
  750  vi 0.10.5-beta 
  751  mfshow Kraken
  752  rsync -Pa * /sw/mf/common/bioinfo-tools/misc/Kraken/
  753  cd ..
  754  ll
  755  history >> Kraken-1.1.1-20210927-375654f_install-README.md
  756  vi Kraken-1.1.1-20210927-375654f_install-README.md
  757  ll
  758  cd /sw/data/Kraken_data/
  759  ll
  760  vi Kraken-update-db.sh 
  761  ll
  762  view slurm-rackham-mem1TB-25695333.out
  763  ll
  764  ./Kraken-update-db.sh 
  765  ll
  766  ls -ltr
  767  cat Kraken-update-db.sh 
  768  vi Kraken-update-db.sh 
  769  ./Kraken-update-db.sh 
  770  ./Kraken-update-db.sh -f
  771  vi Kraken-update-db.sh 
  772  ./Kraken-update-db.sh -f
  773  ll
  774  vi Kraken-update-db.sh 
  775  ./Kraken-update-db.sh -f
  776  vi Kraken-update-db.sh 
  777  ./Kraken-update-db.sh -f 20
  778  vi Kraken-update-db.sh 
  779  ./Kraken-update-db.sh -f 20
  780  ll
  781  rm -rf 20220404-140251
  782  dirs
  783  cd /sw/bioinfo/Kraken/1.1.1-20210927-375654f/
  784  ll
  785  cd rackham/
  786  ll
  787  cd ../src/
  788  ll
  789  cp -av ../../1.1.1/src/pull-request-258fcf8bdae4498dd655526b692d43481e22362c .
  790  ll
  791  cd ../rackham/
  792  cp -av ../src/pull-request-258fcf8bdae4498dd655526b692d43481e22362c/rsync_from_ncbi.pl .
  793  ll
  794  cd .snapshot
  795  ll
  796  cd hourly.2022-04-04_1405/
  797  ll
  798  cp -av rsync_from_ncbi.pl ../../rsync_from_ncbi.pl 
  799  cd ../..
  800  ll
  801  diff rsync_from_ncbi.pl ../src/pull-request-258fcf8bdae4498dd655526b692d43481e22362c/rsync_from_ncbi.pl 
  802  cp -av ../src/pull-request-258fcf8bdae4498dd655526b692d43481e22362c/rsync_from_ncbi.pl .
  803  chmod +x rsync_from_ncbi.pl 
  804  ll
  805  swapd
  806  ./Kraken-update-db.sh -f 20
  807  ll
  808  rm -rf 20220404-141202/
  809  vi Kraken-update-db.sh 
  810  ./Kraken-update-db.sh -f 20
  811  lftp https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/762/265
  812  ll
  813  cd 20220404-142413/
  814  ll
  815  cd library/
  816  ll
  817  cd archaea/
  818  ll
  819  cat assembly_summary.txt 
  820  cd ../
  821  ll
  822  cd archaea/
  823  ml
  824  ml bioinfo-tools Kraken
  825  ml
  826  rsync_from_ncbi.pl 
  827  rsync_from_ncbi.pl --help
  828  view $(rsync_from_ncbi.pl)
  829  cd /sw/data/Kraken_data/20220404-142413/library/archaea
  830  ml bioinfo-tools Kraken
  831  view $(which rsync_from_ncbi.pl)
  832  rsync_from_ncbi.pl assembly_summary.txt 
  833  kill %+
  834  view $(which rsync_from_ncbi.pl)
  835  cd ../../..
  836  ./Kraken-update-db.sh -f 20
  837  kill %+
  838  vi Kraken-update-db.sh 
  839  ll
  840  rm -rf 20220404-1*
  841  screen -ls
  842  screen -R liftover
  843  htop -u douglas
  844  screen -R liftover
  845  cd /crex/proj/staff/douglas/nobackup/Callosobruchus_maculatus/liftover/
  846  ll
  847  cd flo-liftover/
  848  ll
  849  cd run/
  850  ll
  851  ls -ltr
  852  cat joblog.blat 
  853  cat joblst.faSplit
  854  screen -R liftover
  855  htop -u douglas
  856  ./Kraken-update-db.sh -f 20
  857  cd /sw/data/
  858  screen -ls
  859  htop -u douglas
  860  which blat
  861  ml bioinfo-tools blat
  862  blat -help
  863  blat
  864  htop
  865  screen -ls
  866  screen -R liftover
  867  cd ..
  868  cd /proj/staff/douglas/
  869  ll
  870  cd nobackup/
  871  ll
  872  cd Callosobruchus_maculatus/
  873  ll
  874  du -csh liftover
  875  pushd .
  876  cd
  877  uquota douglas
  878  uquota -u douglas
  879  cd /sw/
  880  ll
  881  cd bioinfo/
  882  ll
  883  cd doug-dumping-ground/
  884  ll
  885  rm -rf * 2>/dev/null
  886  bg
  887  cp -av /proj/staff/douglas/nobackup/Callosobruchus_maculatus/liftover .
  888  ll
  889  rm -rf liftover/
  890  ls
  891  ll
  892  man cp
  893  cp -aLv /proj/staff/douglas/nobackup/Callosobruchus_maculatus/liftover .
  894  ll
  895  cd liftover/
  896  ll
  897  ll /proj/staff/douglas/nobackup/Callosobruchus_maculatus/liftover 
  898  rm -f assembly-orig.fasta assembly-scaffolded.fasta 
  899  ln -s pb_155_falcon_primary_rn_min500_quiver.corr.DP_filtered_6_176.SIZE_wi_10bp.fasta assembly-orig.fasta
  900  ln -s pb_155_falcon_primary_rn_min500_quiver.corr.DP_filtered_6_176.SIZE_wi_10bp.FINAL.fasta assembly-scaffolded.fasta
  901  ll
  902  htop -u douglas
  903  mspid pblat
  904  cd /sw/bioinfo/pblat
  905  ll
  906  mshow pblat/2.1
  907  makeroom.sh -f -t pblat -v 2.5 -w https://icebert.github.io/pblat/ -l "Custom free-to-academics" -L https://github.com/icebert/pblat/blob/master/LICENSE -d "parallelized blat with multi-threads support"
  908  ./makeroom_pblat_2.5.sh 
  909  source /sw/bioinfo/pblat/SOURCEME_pblat_2.5 && cd $SRCDIR
  910  wget https://github.com/icebert/pblat/archive/refs/tags/2.5.tar.gz
  911  ml gcc/10.3.0
  912  ml
  913  ll
  914  tar xvf 2.5.tar.gz 
  915  ll
  916  cd pblat-2.5/
  917  ll
  918  cat mak
  919  cat Makefile 
  920  ml
  921  make -j5
  922  ml gcc/6.3.0
  923  make clean
  924  make
  925  make clean
  926  make gcc/9.3.0
  927  ml gcc/9.3.0
  928  make clean
  929  make
  930  make clean
  931  ml gcc/10.3.0
  932  make
  933  make clean
  934  ml
  935  ml gcc/9.3.0
  936  make clean
  937  make -j10
  938  ll
  939  cp -av $PREFIX/pblat
  940  cp -av pblat $PREFIX/
  941  cd ..
  942  ll
  943  rm -rf pblat-2.5/
  944  cd ../../mf
  945  ll
  946  cat 2.5 
  947  cd ../2.5/src/
  948  tar xf 2.5.tar.gz 
  949  ll
  950  cd pblat-2.5/
  951  ll
  952  cd blatSrc/
  953  ll
  954  less blat.c 
  955  cd ..
  956  ll
  957  less README.rst 
  958  ll
  959  cd lib/
  960  ll
  961  cd ..
  962  ll
  963  cd ..
  964  cd -
  965  cat Dockerfile 
  966  ml
  967  make clean
  968  ml
  969  ml zlib/1.2.11
  970  ml
  971  make -j10
  972  ml purge
  973  ldd pblat
  974  make clean
  975  mspid pcre
  976  ml gcc/9.3.0 pcre/8.40 zlib/1.2.11
  977  make
  978  cp -av pblat $PREFIX/
  979  cd ..
  980  rm -rf pblat-2.5/
  981  ml purge
  982  cd $PREFIX
  983  ldd pblat 
  984  ll
  985  ls -ltr
  986  file chunk_19.fa.psl
  987  less chunk_19.fa.psl
  988  tail chunk_05.fa.psl 
  989  head chunk_05.fa.psl 
  990  ll
  991  ll 20220404-155215/
  992  ll 20220404-155215/library/
  993  ll 20220404-155215/library/archaea/
  994  ll 20220404-155215/library/bacteria/
  995  ll 20220404-155215/library/viral/
  996  cd /sw/bioinfo/Kraken/1.1.1-20210927-375654f/
  997  cd rackham/
  998  ll
  999  diff rsync_from_ncbi.pl ../src/pull-request-258fcf8bdae4498dd655526b692d43481e22362c/rsync_from_ncbi.pl 
 1000  htop -u douglas
 1001  cd /sw/comp/gcc/mf
 1002  ll
 1003  cd ..
 1004  ll
 1005  mfshow -c gcc
 1006  ll
 1007  cd mf
 1008  ll
 1009  cd ..
 1010  rmdir mf
 1011  ll
 1012  rm -f 8.4.0_bianca && ln -s 8.4.0_rackham 8.4.0_bianca
 1013  ll
 1014  fixup 8.4.0_bianca
 1015  ll
 1016  ln -s 8.4.0_rackham 8.4.0_irma
 1017  ls -ltr
 1018  fixup 5.4.0_miarka 8.4.0_irma 2>/dev/null
 1019  ls -ltr
 1020  ls -ld 8.4.0*
 1021  cd ../binutils/
 1022  ll
 1023  cd 2.28/
 1024  ll
 1025  cd rackham/
 1026  ll
 1027  cd bin/
 1028  ll
 1029  cd ../include/
 1030  ll
 1031  mshow binutils/2.28
 1032  whereis plugin-api.h
 1033  cd ../../..
 1034  ll
 1035  cat binutils-2.28-install-README.md
 1036  makeroom.sh -f -t binutils -v 2.38 -w "https://www.gnu.org/software/binutils/" -l "GPL v3" -d "a collection of binary tools, built with plugin support"
 1037  ll
 1038  makeroom.sh -f -c comp -t binutils -v 2.38 -w "https://www.gnu.org/software/binutils/" -l "GPL v3" -d "a collection of binary tools, built with plugin support"
 1039  mshow binutils
 1040  mfshow -c binutils
 1041  mfshow -a binutils
 1042  mfshow -b binutils
 1043  mfshow -l binutils
 1044  mfshow -b binutils
 1045  mfshow -d binutils
 1046  ll
 1047  ./makeroom_binutils_2.38.sh 
 1048  source /sw/comp/binutils/SOURCEME_binutils_2.38 && cd $SRCDIR
 1049  cat ../../binutils-2.28
 1050  cat ../../binutils-2.28-install-README.md 
 1051   [[ -f binutils-${VERSION}.tar.gz ]] || wget http://ftp.gnu.org/gnu/binutils/binutils-${VERSION}.tar.gz
 1052  tar xf binutils-2.38.tar.gz 
 1053  cd binutils-${VERSION}
 1054  module load gcc/10.3.0
 1055  ./configure --enable-plugins --prefix=$PREFIX
 1056  ml gcc/9.3.0
 1057  ./configure --enable-plugins --prefix=$PREFIX
 1058  ll /sw/comp/gcc/9.3.0_rackham/libexec/gcc/x86_64-pc-linux-gnu/9.3.0/liblto_plugin.so
 1059  ll /sw/comp/gcc/9.3.0_rackham/libexec/gcc/x86_64-pc-linux-gnu/9.3.0/liblto_plugin.so.0.0.0
 1060  ml gcc/6.3.0
 1061  ml gcc/6.4.0
 1062  ./configure --enable-plugins --prefix=$PREFIX
 1063  cd ..
 1064  ll
 1065  cd -
 1066  ml gcc/10.3.0
 1067  ./configure --enable-plugins --prefix=$PREFIX
 1068  ./configure --help
 1069  mspid gmp
 1070  ml GMP/6.2.1
 1071  mspid MPC
 1072  ml MPC/1.2.1
 1073  mspid mpfr
 1074  ml MPFR/4.1.0
 1075  ml gcc/5.40
 1076  ml gcc/5.4.0
 1077  ./configure --enable-plugins --enable-gold --enable-ld --enable-gmp --enable-mpfr --enable-mpc --prefix=$PREFIX
 1078  ml gcc/10.3.0
 1079  ./configure --enable-plugins --enable-gold --enable-ld --enable-gmp --enable-mpfr --enable-mpc --prefix=$PREFIX
 1080  make -j10
 1081  make check
 1082  make install
 1083  cd $PREFIX
 1084  ls -lR
 1085  ll
 1086  ml purge
 1087  cd bin/
 1088  ll
 1089  ldd ld
 1090  ldd ld.gold 
 1091  ldd ld.bfd 
 1092  ldd *
 1093  cd ..
 1094  ll
 1095  cd ..
 1096  ll
 1097  history >> binutils-2.38_install-README.md
