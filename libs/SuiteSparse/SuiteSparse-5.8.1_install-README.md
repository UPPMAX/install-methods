SuiteSparse/5.8.1
========================

<http://suitesparse.com>

Used under license:
Multiple
<https://raw.githubusercontent.com/DrTimothyAldenDavis/SuiteSparse/master/LICENSE.txt>

Structure creating script (makeroom_SuiteSparse_5.8.1.sh) moved to /sw/libs/SuiteSparse/makeroom_5.8.1.sh

LOG
---

    TOOL=SuiteSparse
    VERSION=5.8.1
    CLUSTER=rackham
    TOOLDIR=/sw/libs/$TOOL
    VERSIONDIR=/sw/libs/$TOOL/$VERSION
    PREFIX=/sw/libs/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/libs/SuiteSparse/5.8.1/src
    /home/douglas/bin/makeroom.sh -f" -t "SuiteSparse" -v "5.8.1" -c "libs" -l "Multiple" -L "https://raw.githubusercontent.com/DrTimothyAldenDavis/SuiteSparse/master/LICENSE.txt" -w "http://suitesparse.com" -d "Suite of sparse matrix packages"
    ./makeroom_SuiteSparse_5.8.1.sh
    cd $SRCDIR
    wget http://
    tar xvf 
    make

  127  vi README.md 
  128  cd scripts/
  129  ll
  130  diff braker_RNAseq_gtf.pl /proj/snic2019-35-58/water_strider/new_annotation/StringTie_transcriptomes/braker_RNAseq_gtf.pl 
  131  cp /proj/snic2019-35-58/water_strider/new_annotation/StringTie_transcriptomes/braker_RNAseq_gtf.pl .
  132  cd ..
  133  git status
  134  git add .
  135  git status
  136  git commit -a -m 'add braker_RNAseq_gtf.pl to create braker RNAseq hints file from StringTie output GTF'
  137  git push
  138  ml bioinfo-tools 
  139  mfshow Sniffles
  140  ml Sniffles/1.0.12-201218-4ff6ecb
  141  echo $PATH
  142  ll /sw/bioinfo/Sniffles/1.0.12-201218-4ff6ecb/rackham
  143  sniffles
  144  sniffles-debug 
  145  mspid gushr
  146  ml
  147  ml -Sniffles
  148  ml Braker
  149  ml braker
  150  ll
  151  cat Makefile 
  152  head body_transcriptome.merged.StringTie.gtf > ~/github-sync/local/bioinfo/scripts/braker_RNAseq_gtf.input
  153  head body_transcriptome.merged.StringTie.gtf | ./braker_RNAseq_gtf.pl > ~/github-sync/local/bioinfo/scripts/braker_RNAseq_gtf.output
  154  cd scripts/
  155  ll
  156  cd tests/
  157  ll
  158  cd ..
  159  ll
  160  cd ..
  161  make test
  162  make tests
  163  ml bioinfo-tools BioPerl
  164  make tests
  165  ll
  166  cd scripts/tests/
  167  ll
  168  rm -f *19660* *20067*
  169  ll
  170  rm -f *20102*
  171  ll
  172  rm -f *19662* *20069*
  173  ll
  174  rm -f *19773*
  175  ll
  176  cat make.expected 
  177  ./intervalBed_test.sh 
  178  ll
  179  vi intervalBed_test*expected
  180  cd ..
  181  ll
  182  cd -
  183  ll
  184  rm -f *21377*
  185  ls
  186  cat intervalBed_test_02.expected
  187  cat intervalBed_test_04.expected
  188  cat intervalBed_test_03.expected
  189  cat intervalBed_test_06.expected
  190  cat intervalBed_test_07.expected
  191  ../intervalBed intervalBed_test.input
  192  ../intervalBed col=4 intervalBed_test.input
  193  vi intervalBed_test*expected
  194  ./intervalBed_test.sh 
  195  ll
  196  ./convertAlignment_test.sh 
  197  ./pileup2pro_test.sh 
  198  vi ../pileup2pro.pl 
  199  vi ../pileup2pro2.pl 
  200  ./pileup2pro_test.sh 
  201  ls
  202  ./mergePileupColumns_test.sh 
  203  ./pos2bed_test.sh 
  204  ./windowWig_test.sh 
  205  ./fai2Bed_test.sh 
  206  make
  207  cp pos2bed_test_01 braker_RNAseq_gtf_test.sh
  208  cp pos2bed_test.sh braker_RNAseq_gtf_test.sh
  209  vi braker_RNAseq_gtf_test.sh 
  210  ll
  211  cat pos2bed_test_01.options
  212  vi braker_RNAseq_gtf_test.sh 
  213  ll
  214  rm -f *17633*
  215  ll
  216  mv ../braker_RNAseq_gtf.input .
  217  mv ../braker_RNAseq_gtf.output braker_RNAseq_gtf.expected
  218  ll
  219  mv braker_RNAseq_gtf_test_01.expected
  220  mv braker_RNAseq_gtf.expected braker_RNAseq_gtf_test_01.expected
  221  mv braker_RNAseq_gtf.input braker_RNAseq_gtf_test_01.input
  222  ./braker_RNAseq_gtf_test.sh 
  223  ls
  224  vi Makefile 
  225  make
  226  ls
  227  cd ..
  228  ll
  229  make tests
  230  cd ..
  231  make tests
  232  cd scripts/
  233  cd tests/
  234  vi make.expected 
  235  cd ../..
  236  make tests
  237  ll
  238  cd scripts/tests/
  239  make
  240  cd ..
  241  git status
  242  git add .
  243  git commit -a -m 'add tests for braker_RNAseq_gtf.pl and correct existing tests and scripts'
  244  git push
  245  git status
  246  mspid seq
  247  ml
  248  ml
  249  vi braker_RNAseq_gtf.pl
  250  ll
  251  cd ..
  252  ll
  253  ml bioinfo-tools
  254  mspid braker
  255  ml braker/2.1.5-20200826-cf958ec
  256  ml
  257  braker --help
  258  braker.pl --help
  259  ml
  260  cd /sw/bioinfo/ProtHint/
  261  ll
  262  cat ProtHint-2.4.0_install-README.md
  263  TOOL=ProtHit;VERSION=2.5.0; makeroom.sh -f -t $TOOL -v $VERSION -s annotation -w https://github.com/gatech-genemark/ProtHint  -l "GeneMark license" -L https://github.com/gatech-genemark/ProtHint/blob/master/LICENSE -d "pipeline for predicting and scoring hints (in the form of introns, start and stop codons) in the genome of interest by mapping and spliced aligning predicted genes to a database of reference protein sequences"
  264  ll
  265  rm -f makeroom_ProtHit_2.5.0.sh 
  266  TOOL=ProtHint;VERSION=2.5.0; makeroom.sh -f -t $TOOL -v $VERSION -s annotation -w https://github.com/gatech-genemark/ProtHint  -l "GeneMark license" -L https://github.com/gatech-genemark/ProtHint/blob/master/LICENSE -d "pipeline for predicting and scoring hints (in the form of introns, start and stop codons) in the genome of interest by mapping and spliced aligning predicted genes to a database of reference protein sequences"
  267  cd ..
  268  ll
  269  ls -ltr
  270  cd -
  271  ll
  272  ./makeroom_ProtHint_2.5.0.sh 
  273  ll
  274  cd 2.5.0/
  275  ll
  276  cd src/
  277  ll
  278  wget https://github.com/gatech-genemark/ProtHint/releases/download/v2.5.0/ProtHint-2.5.0.tar.gz
  279  tar xzf ProtHint-2.5.0.tar.gz 
  280  ll
  281  cd ../..
  282  ll
  283  cat ProtHint-2.4.0_install-README.md
  284  source SOURCEME_ProtHint_2.5.0 
  285  ll
  286  vi ProtHint-2.5.0_install-README.md
  287  ll
  288  cat ProtHint-2.5.0_install-README.md
  289  cd 2.5.0/
  290  ll
  291  cd src/
  292  ll
  293  rm -rf *
  294  cd ../..
  295     cd /sw/bioinfo/$TOOL/
  296      source SOURCEME_${TOOL}_${VERSION}
  297      cd $VERSION/src
  298      module load perl_modules/5.26.2
  299      module load  python/3.7.2
  300      wget https://github.com/gatech-genemark/$TOOL/releases/download/v${VERSION}/${TOOL}-${VERSION}.tar.gz
  301      tar xzf ${TOOL}-${VERSION}.tar.gz
  302      rmdir $PREFIX
  303      mv ${TOOL}-${VERSION} $PREFIX
  304  cd ../../mf
  305  ll
  306  rm 2.5.0 
  307  mshow ProtHint
  308  ll
  309  cat 2.4.0 
  310  ln -s 2.4.0 2.5.0
  311  ll
  312  cd ..
  313  ll
  314  vi ProtHint-2.5.0_post-install.sh 
  315  ./ProtHint-2.5.0_post-install.sh 
  316  du -csh braker_v1*
  317  ml ProtHint/2.5.0
  318  ml
  319  cd braker_v1_snowy_noUTR_new
  320  ll
  321  rm all_samples_masked_renamed.bam 
  322  cd ..
  323  cd braker_v1_snowy_noUTR
  324  ll
  325  rm all_samples_masked.bam 
  326  mspid augustus
  327  less Hemiptera_OrthoDB_proteins.faa 
  328  cd ..
  329  ll
  330  cd OrthoDB/
  331  ll
  332  cat README.txt 
  333  cat Hemiptera_taxids.txt
  334  cd ..
  335  ll
  336  ll Gbue_2.0_OGSv1.1_materials/
  337  mkdir Proteins_OrthoDB_and_Gbue_2.0
  338  cd Proteins_OrthoDB_and_Gbue_2.0/
  339  cat ../Gbue_2.0_OGSv1.1_materials/gerbue_OGSv1.1_pep.fa ../OrthoDB/Hemiptera_OrthoDB_proteins_renamed.faa > ../Proteins_OrthoDB_and_Gbue_2.0.faa
  340  cd ..
  341  ll
  342  rmdir Proteins_OrthoDB_and_Gbue_2.0
  343  tail Proteins_OrthoDB_and_Gbue_2.0.faa 
  344  cd OrthoDB/
  345  ll
  346  cat rename_fasta.sh 
  347  ll
  348  cat extract_taxa_fasta.sh 
  349  ll
  350  cd ..
  351  ll
  352  mkdir braker_v2_snowy_noUTR
  353  cd braker_v2_snowy_noUTR/
  354  ln -s ../Proteins_OrthoDB_and_Gbue_2.0.faa .
  355  ln -s ../StringTie_transcriptomes/*.gff .
  356  ll
  357  mkdir ProtHint
  358  cd ProtHint/
  359  prothint.py 
  360  ml
  361  which braker.pl 
  362  view /sw/bioinfo/braker/2.1.5/rackham/scripts/braker.pl
  363  cd ..
  364  rmdir ProtHint/
  365  ll
  366  cp ../braker_v1_snowy_noUTR_new/run_braker_snowy_noUTR_new.sh .
  367  vi run_braker_snowy_noUTR_new.sh 
  368  ll ..
  369  ml braker
  370  ml
  371  ml ProtHint/2.5.0
  372  prothint.py --help
  373  cd /proj/snic2019-35-58/water_strider/new_annotation/StringTie_transcriptomes
  374  ll
  375  cd ..
  376  ll
  377  cd braker_v2_snowy_noUTR/
  378  ll
  379  mkdir ProtHint
  380  cd ProtHint/
  381  ll
  382  prothint.py --help
  383  cd ..
  384  ll
  385  ln -s ../water_strider_11Jul2018_yVXgK.masked.slow_renamed.fasta .
  386  ln -s ../Proteins_OrthoDB_and_Gbue_2.0.faa .
  387  ll
  388  cd ProtHint/
  389  ln -s ../Proteins_OrthoDB_and_Gbue_2.0.faa .
  390  ln -s ../water_strider_11Jul2018_yVXgK.masked.slow_renamed.fasta .
  391  prothint.py --threads 20 water_strider_11Jul2018_yVXgK.masked.slow_renamed.fasta Proteins_OrthoDB_and_Gbue_2.0.faa 
  392  ll
  393  cat cmd.log 
  394  ll GeneMark_ES/
  395  cd ..
  396  rm -rf ProtHint/
  397  cd ..
  398  ll
  399  ll Gbue_2.0_OGSv1.1_materials/gerbue_OGSv1.1_pep.fa 
  400  cd braker_v2_snowy_noUTR/
  401  ll
  402  ls
  403  T=(*.StringTie.gff)
  404  echo $T
  405  @T=(*.StringTie.gff)
  406  for F in (*.StringTie.gff); do echo $F; done
  407  T=(*.StringTie.gff)
  408  echo "${T[@]}"
  409  F="${T[@]}"
  410  echo $F
  411  echo ${F// /,}
  412  ml
  413  ml bioinfo-tools StringTie/2.1.5
  414  mspid StringTie
  415  ml bioinfo-tools StringTie/2.1.4
  416  stringtie --merge wingbud_transcriptome.StringTie.gff wingbud_transcriptome.merged.StringTie.gff > t.gff
  417  stringtie --merge wingbud_transcriptome.StringTie.gtf wingbud_transcriptome.merged.StringTie.gtf > t.gtf
  418  ll
  419  rm t.gff
  420  rm -rf tmp.XX996nPA/
  421  ll
  422  ls -lL wingbug*gtf t.gtf
  423  ls -lL wingbud*gtf t.gtf
  424  rm t.gtf 
  425  unset F
  426  ll
  427  ml
  428  mhelp augustus
  429  source $AUGUSTUS_CONFIG_COPY
  430  ll ../braker_v1_snowy_noUTR
  431  vi run_braker_snowy_noUTR_new.sh 
  432  echo $AUGUSTUS_SCRIPTS_PATH
  433  ll
  434  ll augustus_config/
  435  ll augustus_config/species/
  436  ll ../braker_v1_snowy_noUTR_new/augustus_config/
  437  ll ../braker_v1_snowy_noUTR_new/augustus_config/species/
  438  ll ../braker_v1_snowy_noUTR_new/augustus_config/species/Gerris_buenoi/
  439  ll
  440  sbatch run_braker_snowy_noUTR_new.sh 
  441  jiu
  442  jiu -M snowy
  443  jobinfo -M snowy -u douglas
  444  ml
  445  vi run_braker_snowy_noUTR_new.sh 
  446  ll
  447  cd ..
  448  ll
  449  rsync -n -Pa braker_v2_snowy_noUTR braker_v2_rackham5_noUTR
  450  rsync  -Pa braker_v2_snowy_noUTR braker_v2_rackham5_noUTR
  451  ll
  452  cd braker_v2_rackham5_noUTR
  453  ll
  454  mv braker_v2_snowy_noUTR/* .
  455  rmdir braker_v2_snowy_noUTR/
  456  ll
  457  mv run_braker_snowy_noUTR_new.sh run_braker_rackham5_noUTR.sh 
  458  ll
  459  vi run_braker_rackham5_noUTR.sh 
  460  ll
  461  scancel -M snowy 3554619
  462  ./run_braker_rackham5_noUTR.sh 
  463  kill %+
  464  jobs
  465  ll
  466  rm -rf braker
  467  ml
  468  gmes_petap.pl
  469  ml 
  470  ml bioinfo-tools
  471  ml braker
  472  ml
  473  ml ProtHint/2.5.0
  474  gmes_petap.pl
  475  gmes_petap.pl --verbose --cores=20 --ES --gc_donor 0.001 --sequence=water_strider_11Jul2018_yVXgK.masked.slow_renamed.fasta  --soft_mask=1000
  476  ll
  477  cat gmes.log 
  478  date
  479  cd /proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5_noUTR
  480  ll
  481  gmes_petap.pl --verbose --cores=20 --ES --gc_donor 0.001 --sequence=water_strider_11Jul2018_yVXgK.masked.slow_renamed.fasta  --soft_mask=1000
  482  rm -rf data info gmes.log  output run*
  483  ll
  484  mkdir gm
  485  cd gm
  486  cd gm
  487  ll
  488  cat run.cfg 
  489  ll
  490  cd /sw/bioinfo/
  491  ll
  492  htop -u douglas
  493  gmes_petap.pl --verbose --cores=20 --ES --gc_donor 0.001 --sequence=../water_strider_11Jul2018_yVXgK.masked.slow_renamed.fasta  --soft_mask=1000
  494  htop
  495  exit
  496  cd /sw/bioinfo/SACRA/
  497  ll
  498  cd mf/
  499  ll
  500  cat 1.0.0 
  501  cd ../1.0.0/
  502  ll
  503  cd rackham/
  504  ll
  505  cd ../../../last
  506  ll
  507  cd 847/
  508  ll
  509  cd rackham/
  510  ll
  511  cd bin/
  512  ll
  513  mspid seqkit
  514  mspid SeqKit
  515  ll /sw/bioinfo/SeqKit/
  516  cd ..
  517  ll
  518  cd ..
  519  ll
  520  cd doc/
  521  ll
  522  cd ../../mf
  523  ll
  524  cat 847 
  525  cd /sw/apps
  526  cd R_packages
  527  ll
  528  cd 3.6.0
  529  ll
  530  ll ../4.0.0/
  531  ll ..
  532  htop
  533  cd /proj/snic2019-35-58/water_strider/new_annotation
  534  mount
  535  ll
  536  ll
  537  htop
  538  mount
  539  cd /proj/
  540  ls
  541  cd snic2020-15-336
  542  ll
  543  ll -d *35-58*
  544  cd ..
  545  ll -d *35-58*
  546  cd snic2019-35-58
  547  ll
  548  cd water_strider/
  549  ll
  550  cd new_annotation/
  551  ll
  552  cd StringTie_transcriptomes/
  553  ll
  554  rm braker_RNAseq_gtf.pl 
  555  pushd .
  556  cd 
  557  cd github-sync/local/bioinfo/scripts/
  558  ll
  559  git rm braker_RNAseq_gtf.pl
  560  vi README.md 
  561  cd tests
  562  ll
  563  git rm braker_RNAseq_gtf_test*
  564  vi Makefile 
  565  ll
  566  cat README.md 
  567  vi make.expected 
  568  cd ..
  569  ll
  570  cd ..
  571  vi README.md 
  572  git status
  573  git commit -a -m 'remove braker_RNAseq_gtf.pl script'
  574  uptime
  575  source ~/.agent
  576  git pull
  577  git push
  578  dirs
  579  popd
  580  mspid augustus
  581  ml bioinfo-tools augustus/20200915-ed0cb90
  582  ll
  583  cd ..
  584  ll
  585  cd RNAseq-alignments/
  586  ll
  587  cd _body_transcriptome/
  588  ll
  589  which bam2hints 
  590  bam2hints -h
  591  ll
  592  bam2hints --in=body_transcriptome.bam.fwd.bam --out=body_transcriptome.bam.fwd.gff
  593  ll
  594  htop
  595  source ~/.bashrc
  596  screen -S tr
  597  htop
  598  screen -ls
  599  ml bioinfo-tools augustus
  600  ml
  601  ll
  602  for B in body_transcriptome.bam.fwd.bam body_transcriptome.bam.rev.bam ; do echo $B; bam2hints --in=$B --out=${B%.bam}.gff ; done
  603  ll
  604  head body_transcriptome.bam.fwd.gff
  605  head body_transcriptome.bam.rev.gff
  606  bam2hints -h
  607  ll
  608  rm -f *.gtf
  609  cd .snapshot
  610  mv cuttrim2_SF-2243-GB-1x_merged.gtf
  611  rm cuttrim2_SF-2243-GB-1x_merged.gtf
  612  ll
  613  rename-string gff b2h.gff
  614  ll
  615  cd ..
  616  ll
  617  cd ..
  618  ll
  619  mv braker_v2_rackham5_noUTR braker_v2_rackham5
  620  mv braker_v2_snowy_noUTR braker_v2_snowy
  621  ll
  622  cd braker_v2_snowy
  623  ll
  624  rm -f *.gff
  625  ll
  626  ln -s ../RNAseq-alignments/_body_transcriptome/*.{fwd,rev}.bam* .
  627  ll
  628  ll ../RNAseq-alignments/_nymphalleg_transcriptome/
  629  ln -s ../RNAseq-alignments/_nymphalleg_transcriptome/*.{fwd,rev}.bam* .
  630  ll
  631  rm -f *.bam *.bai
  632  ll
  633  cd ../RNAseq-alignments/_body_transcriptome/
  634  ll
  635  rename-string bam.fwd fwd
  636  rename-string bam.rev rev
  637  ll
  638  cd ../_nymphalleg_transcriptome/
  639  ll
  640  rename-string bam.fwd fwd; rename-string bam.rev rev
  641  ll
  642  rm -f gtf
  643  ll
  644  rm -f *.gtf
  645  ll
  646  cd ../_wholeadultnymphi5k_transcriptome/
  647  ll
  648  rename-string bam.fwd fwd; rename-string bam.rev rev
  649  ll
  650  rm -f *.gtf
  651  ll
  652  cd ../_wholeembryo_transcriptome/
  653  ll
  654  rm -f *.gtf
  655  ll
  656  cd ../_wingbud_transcriptome/
  657  ll
  658  rm -f *.gtf
  659  ll
  660  rename-string bam.fwd fwd; rename-string bam.rev rev
  661  ll
  662  cd ../../braker_v2_rackham5/
  663  ll
  664  rm -f *.gff
  665  ll
  666  rm -rf gm
  667  cd ../braker_v2_snowy/
  668  ll
  669  ln -s ../RNAseq-alignments/_body_transcriptome/*.{fwd,rev}.bam* .
  670  ln -s ../RNAseq-alignments/_nymphalleg_transcriptome/*.{fwd,rev}.bam* .
  671  ln -s ../RNAseq-alignments/_wholeadultnymphi5k_transcriptome/*.{fwd,rev}.bam* .
  672  ln -s ../RNAseq-alignments/_wholeembryo_transcriptome/wholeembryo_transcriptome.bam* .
  673  ln -s ../RNAseq-alignments/_wingbud_transcriptome/*.{fwd,rev}.bam* .
  674  ll
  675  vi run_braker_snowy_noUTR_new.sh 
  676  mv run_braker_snowy_noUTR_new.sh run_braker_v2_snowy.sh 
  677  ll
  678  ls *.bam >> run_braker_v2_snowy.sh 
  679  vi run_braker_v2_snowy.sh 
  680  ll
  681  mv wholeembryo_transcriptome.bam wholeembryo_transcriptome.se.bam
  682  mv wholeembryo_transcriptome.bam.bai wholeembryo_transcriptome.se.bam.bai
  683  ll
  684  vi *.sh
  685  ll
  686  rm -f *.fwd.bam* *.rev.bam*
  687  ll
  688  ln -s ../RNAseq-alignments/_body_transcriptome/body_transcriptome.bam* .
  689  ln -s ../RNAseq-alignments/_nymphalleg_transcriptome/nymphalleg_transcriptome.bam* .
  690  ln -s ../RNAseq-alignments/_wholeadultnymphi5k_transcriptome/wholeadultnymphi5k_transcriptome.bam* .
  691  ln -s ../RNAseq-alignments/_wingbud_transcriptome/wingbud_transcriptome.bam* .
  692  ll
  693  rename-string tome.bam tome.fr.bam
  694  ll
  695  vi run_braker_v2_snowy.sh 
  696  d=(*doug*)
  697  [[ -z "$d" ]] && echo "d is empty"
  698  [[ ! -z "$d" ]] && echo "d is empty"
  699  echo $d
  700  vi *.sh
  701  ll
  702  echo $d
  703  shopt -s nullglob
  704  d=(*doug*)
  705  echo $d
  706  [[ -z "$d" ]] && echo "d is empty"
  707  vi *.sh
  708  ml
  709  vi *.sh
  710  ll
  711  exit
  712  screen -R tr
  713  cd /proj/snic2019-35-58/water_strider/new_annotation/braker_v2_snowy
  714  ll
  715  screen -ls
  716  cd ..
  717  ll
  718  cd braker_v2_rackham5/
  719  ll
  720  cp -va ../braker_v2_snowy/*.bam* .
  721  ll
  722  ll ../braker_v2_snowy/
  723  cp ../braker_v2_snowy/run_braker_v2_snowy.sh .
  724  ll
  725  mv run_braker_v2_snowy.sh run_braker_v2_rackham5.sh 
  726  vi *.sh
  727  ll
  728  htop
  729  ll
  730  screen -ls
  731  source ~/.bashrc
  732  screen -S braker
  733  htop -u douglas
  734  mount
  735  screen -ls
  736  htop
  737  screen -R braker
  738  ll /crex/proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5/braker/errors/
  739  cat /crex/proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5/braker/errors/GeneMark-ES.stderr 
  740  which perl
  741  ml perl_modules/5.26.2
  742  screen -R braker
  743  ll /crex/proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5/braker/errors/
  744  date
  745  ll /crex/proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5/braker/
  746  cat /crex/proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5/braker/GeneMark-ES.stdout 
  747  screen -R braker
  748  cd /proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5
  749  ll
  750  cd braker/
  751  ll
  752  tail braker.log 
  753  ll
  754  tail braker.log 
  755  which perl
  756  tail braker.log 
  757  ll /crex/proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5/braker/errors/GeneMark-ES.stderr
  758  tail braker.log 
  759  ll /crex/proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5/braker/errors/GeneMark-ES.stderr
  760  less /crex/proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5/braker/errors/GeneMark-ES.stderr
  761  screen -ls
  762  cd /sw/bioinfo/GeneMark/
  763  ll
  764  cat GeneMark-4.57-es_install-README.md
  765  cd /sw/bioinfo/GeneMark/keyfile
  766  ll
  767  cd ..
  768  ll
  769  cd keyfile/
  770  ll
  771  cp GeneMark-4.57-es_install-README.md GeneMark-4.62-es_install-README.md
  772  cd ..
  773  cp GeneMark-4.57-es_install-README.md GeneMark-4.62-es_install-README.md
  774  vi GeneMark-4.62-es_install-README.md 
  775  ll
  776     cd /sw/bioinfo/GeneMark/
  777      VERSION=4.62-es
  778      PERLVERSION=5.26.2
  779      mkdir $VERSION
  780      cd $VERSION
  781      PREFIX=$PWD/rackham
  782      mkdir src
  783      for CL in irma bianca snowy ; do test -L $CL || ln -sf rackham $CL ; done
  784      cd src
  785  wget    cd /sw/bioinfo/GeneMark/
  786      VERSION=4.62-es
  787      PERLVERSION=5.26.2
  788      mkdir $VERSION
  789      cd $VERSION
  790      PREFIX=$PWD/rackham
  791      mkdir src
  792      for CL in irma bianca snowy ; do test -L $CL || ln -sf rackham $CL ; done
  793      cd src
  794  cd ..
  795  ll
  796  cd ..
  797  ll
  798  rm -rf 4.62-es/
  799  wget http://topaz.gatech.edu/GeneMark/tmp/GMtool_qnnmi/gm_key_64.gz
  800  wget http://topaz.gatech.edu/GeneMark/tmp/GMtool_qnnmi/gmes_linux_64.tar.gz
  801  vi ../../GeneMark-4.62-es_install-README.md 
  802  cat ../../GeneMark-4.62-es_install-README.md 
  803    mkdir -p /sw/bioinfo/GeneMark/keyfile
  804      gunzip gm_key_64.gz
  805      mv gm_key_64 /sw/bioinfo/GeneMark/keyfile/gm_key
  806    tar xzf gmes_linux_64.tar.gz
  807      mv gmes_linux_64 $PREFIX
  808      cd $PREFIX
  809  echo $PREFIX
  810  ll
  811  cd ..
  812  PREFIX=$PWD/rackham
  813  cd src/
  814   mv gmes_linux_64 $PREFIX
  815  cd $PREFIX
  816   rm -f gm_key
  817      ln -s /sw/bioinfo/GeneMark/keyfile/gm_key .
  818    grep 'version:' gmes.cfg
  819  ml
  820    module load perl_modules/$PERLVERSION
  821   ./check_install.bash
  822  pushd .
  823  cd
  824  rm .gm_key 
  825  cp -av /sw/bioinfo/GeneMark/keyfile/gm_key .gm_key
  826  popd
  827  ./check_install.bash 
  828   ./change_path_in_perl_scripts.pl "/usr/bin/env perl"
  829  ll
  830  cd ../..
  831  ll
  832  cd mf
  833  ll
  834  cat 4.57-es 
  835  cp 4.57-es 4.62-es
  836  vi 4.62-es 
  837  ll
  838  mfshow GeneMark
  839  rsync -n -Pa * /sw/mf/common/bioinfo-tools/annotation/GeneMark/
  840  rsync  -Pa * /sw/mf/common/bioinfo-tools/annotation/GeneMark/
  841  all_mflink -f GeneMark 4.62-es
  842  screen -R braker
  843  ll
  844  cd /proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5
  845  cd braker
  846  ll
  847  cat braker.log 
  848  ll *es
  849  rm 4.62-es 
  850  ll
  851  diff 4.38-es 4.57-es 
  852  mv 4.62-es 4.57-es 
  853  ln -s 4.57-es 4.62-es
  854  ll
  855  vi *
  856  rsync  -Pa * /sw/mf/common/bioinfo-tools/annotation/GeneMark/
  857  mfshow GeneMark
  858  ll /crex/proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5/braker/errors/GeneMark-ES.stderr
  859  screen -ls
  860  screen -R braker
  861  ll
  862  cd /proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5
  863  ll
  864  cd braker/
  865  ll
  866  cat braker.log 
  867  cd ..
  868  ll
  869  ml
  870  ml bioinfo-tools 
  871  ml Braker
  872  mspid braker
  873  ml braker/2.1.5-20200826-cf958ec ProtHint/2.5.0 GeneMark/4.62-es
  874  ml
  875  check_headers.pl water_strider_11Jul2018_yVXgK.masked.slow_renamed.fasta Proteins_OrthoDB_and_Gbue_2.0.faa 
  876  vi $(which check_headers.pl)
  877  grep -A 100 check_fasta_ $(which braker.pl)
  878  grep -A 200 check_fasta_ $(which braker.pl)
  879  vi $(which check_headers.pl)
  880  check_headers.pl Proteins_OrthoDB_and_Gbue_2.0.faa 
  881  vi $(which check_headers.pl)
  882  check_headers.pl Proteins_OrthoDB_and_Gbue_2.0.faa 
  883  vi $(which check_headers.pl)
  884  check_headers.pl water_strider_11Jul2018_yVXgK.masked.slow_renamed.fasta 
  885  ll
  886  screen -ls
  887  screen -R braker
  888  cd braker/
  889  ll
  890  cd errors/
  891  ll
  892  cd ..
  893  tail braker.log 
  894  htop -u douglas
  895  ll
  896  cd /proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5/braker
  897  ll
  898  cat braker.log 
  899  which prothint.py
  900  cat braker.log 
  901  htop -u douglas
  902  cat braker.log 
  903  htop -u douglas
  904  cd  /proj/snic2019-35-58/water_strider/new_annotation
  905  ll
  906  cd braker_v2_rackham5
  907  ll
  908  cd braker/
  909  htop -u douglas
  910  ll
  911  tail braker.log 
  912  screen -ls
  913  cd /proj/snic2019-35-58/water_strider/new_annotation/
  914  ml
  915  cd /sw/bioinfo
  916  ll
  917  cd braker
  918  ll
  919  cat braker-2.1.5-20200826-cf958ec_install-README.md
  920  mshow braker
  921  TOOLÂ=braker
  922  TOOL=braker
  923  COMMIT=e98b812
  924  VERSION=2.1.5-20210115-$COMMIT
  925  makeroom.sh -f -s "annotation" -t "$TOOL" -v "$VERSION" -w "https://github.com/Gaius-Augustus/BRAKER" -l "Artistic" -d "pipeline for fully automated prediction of protein coding gene structures with GeneMark-ES/ET and AUGUSTUS in novel eukaryotic genomes"
  926  ll
  927  ./makeroom_braker_2.1.5-20210115-e98b812.sh 
  928  ll
  929  source SOURCEME_braker_2.1.5-20210115-e98b812
  930  mshow >> braker-2.1.5-20210115-e98b812_install-README.md
  931  mshow braker >> braker-2.1.5-20210115-e98b812_install-README.md
  932  mshow braker 2>> braker-2.1.5-20210115-e98b812_install-README.md
  933  vi braker-2.1.5-20210115-e98b812_install-README.md
  934  cd /sw/bioinfo
  935  TOOL=GUSHR; VERSION=1.0.0; makeroom.sh -f -t $TOOL -v $VERSION -c annotation -w https://github.com/Gaius-Augustus/GUSHR -l "GPL v3" -d "Assembly-free construction of UTRs from short read RNA-Seq data on the basis of coding sequence annotation"
  936  ./makeroom_GUSHR_1.0.0.sh 
  937  ll /sw
  938  ls -ltr
  939  rm -f makeroom_GUSHR_1.0.0.sh  irma bianca snowy
  940  TOOL=GUSHR; VERSION=1.0.0; makeroom.sh  -t $TOOL -v $VERSION -s annotation -w https://github.com/Gaius-Augustus/GUSHR -l "GPL v3" -d "Assembly-free construction of UTRs from short read RNA-Seq data on the basis of coding sequence annotation"
  941  ./makeroom_GUSHR_1.0.0.sh 
  942  cd GUSHR/
  943  ll
  944  source SOURCEME_GUSHR_1.0.0 
  945  vi GUSHR-1.0.0_post-install.sh 
  946  ll
  947  ll ../augustus/3.4.0/
  948  ls ../augustus/3.4.0/
  949  ls ../augustus/3.4.0/rackham
  950  mfshow augustus
  951  cd /sw/bioinfo/augustus/
  952  ll
  953  source SOURCEME_augustus_3.4.0
  954  cd 3.4.0/
  955  ll
  956  cd src/
  957  ll
  958  cd augustus-3.4.0/
  959  ll
  960  cd ../..
  961  ll
  962  cd ..
  963  ll
  964  cat augustus-3.3.3-CGP_install-README.md
  965  cd /sw/libs
  966  ll
  967  cd lpsolve/
  968  ll
  969  source SOURCEME_lpsolve_5.5.2.9 
  970  cd 5.5.2.9/
  971  ll
  972  cd rackham/
  973  ll
  974  ll /sw/mf/common/libraries/
  975  ll /sw/mf/common/libraries/lpsolve/
  976  ml lpsolve/5.5.2.9
  977  ml -lpsolve
  978  vi augustus-3.4.0_install-README.md
  979  mspid blas
  980  ll /sw/lib/blas
  981  ll /sw/libs/blas
  982  ll /sw/libs/blas/3.6.0/
  983  ll /sw/libs/blas/3.6.0/rackham/
  984  ll /sw/libs/blas/3.6.0/rackham/lib/
  985  ll /sw/libs/blas/3.6.0/rackham/include/
  986  ll
  987  cd 3.4.0/
  988  ll
  989  cd src/
  990  ll
  991  cd augustus-3.4.0/
  992  ll
  993  view Makefile 
  994  cd src/
  995  ll
  996  grep cholmd *
  997  grep chol *
  998  view Makefile 
  999  ll /usr/include/lpsolve
 1000  echo $PREFIX
 1001  cd /sw/libs
 1002  ls
 1003  makeroom.sh
 1004  TOOL=SuiteSparse; VERSION=5.8.1; makeroom.sh -f -t "$TOOL" -v "$VERSION" -c libs -l Multiple -L "https://raw.githubusercontent.com/DrTimothyAldenDavis/SuiteSparse/master/LICENSE.txt" -w http://suitesparse.com -d "Suite of sparse matrix packages"
 1005  ./makeroom_SuiteSparse_5.8.1.sh 
 1006  cd SuiteSparse/
 1007  ll
 1008  source SOURCEME_SuiteSparse_5.8.1 
 1009  cd 5.8.1/
 1010  ll
 1011  cd src/
 1012  wget https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v5.8.1.tar.gz
 1013  echo $PREFIX
 1014  mspid cmake
 1015  ml cmake/3.17.3
 1016  mspid gmp
 1017  ls
 1018  tar xzf v5.8.1.tar.gz 
 1019  ll
 1020  ml
 1021     module load gcc/9.1.0
 1022      module load openmpi/3.1.3
 1023  ml
 1024  ml git/2.28.0
 1025  ml zlib/1.2.11
 1026  ll
 1027  cd SuiteSparse-5.8.1/
 1028  ll
 1029  mspid OpenBLAS
 1030  module avail openblas
 1031  ml openblas/0.2.20
 1032  ll
 1033  cd GraphBLAS/
 1034  ll
 1035  cd build
 1036  ll
 1037  cmake ..
 1038  make
 1039  make clean
 1040  make -j 10
 1041  cd ../build
 1042  grep install Makefile
 1043  make install INSTALL=$PREFIX
 1044  ll
 1045  rm -rf *
 1046  cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX
 1047  make -j 20
 1048  make install
 1049  cd ..
 1050  ll
 1051  cd ..
 1052  ll
 1053  make library
 1054  whereis gmp
 1055  whereis mpfr
 1056  whereis libmpfr
 1057  module load MPFR/4.1.0
 1058  ml
 1059  make library
 1060  cd ..
 1061  rm -rf SuiteSparse-5.8.1/
 1062  ll
 1063  tar xzf v5.8.1.tar.gz 
 1064  ll
 1065  cd SuiteSparse-5.8.1/
 1066  ll
 1067  ml
 1068  make -j20
 1069  make clean
 1070  ll ../../rackham/*
 1071  rm -rf ../../rackham/*
 1072  ll ../../rackham/*
 1073  ll ../../rackham/
 1074  ll
 1075  make -j 20 library
 1076  echo $LD_RUN_PATH
 1077  ml -GMP -MPFR
 1078  echo $LD_RUN_PATH
 1079  module load MPFR/4.1.0
 1080  echo $LD_RUN_PATH
 1081  make -j 20 library
 1082  gcc -L$MPFR_ROOT/lib -L$GMP_ROOT/lib -L/sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib -shared -Wl,-soname -Wl,libsliplu.so.1 -Wl,--no-undefined slip_matrix_div.o slip_create_mpq_array.o SLIP_free.o SLIP_LU_factorize.o SLIP_realloc.o slip_matrix_mul.o slip_get_largest_pivot.o slip_ref_triangular_solve.o SLIP_backslash.o slip_create_mpz_array.o slip_get_nonzero_pivot.o SLIP_LU_solve.o slip_back_sub.o slip_cumsum.o slip_get_pivot.o SLIP_malloc.o slip_sparse_collapse.o SLIP_calloc.o slip_dfs.o slip_get_smallest_pivot.o SLIP_matrix_allocate.o slip_sparse_realloc.o slip_cast_array.o slip_expand_double_array.o SLIP_gmp.o SLIP_matrix_copy.o SLIP_matrix_check.o slip_cast_matrix.o slip_expand_mpfr_array.o SLIP_initialize.o SLIP_matrix_free.o slip_check_solution.o slip_expand_mpq_array.o SLIP_initialize_expert.o SLIP_matrix_nnz.o SLIP_create_default_options.o SLIP_finalize.o SLIP_LU_analysis_free.o slip_permute_x.o slip_permute_b.o slip_create_mpfr_array.o slip_forward_sub.o SLIP_LU_analyze.o slip_reach.o -o /sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib/libsliplu.so.1.0.2 -lm -lrt -Wl,-rpath=/sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib -lsuitesparseconfig -lamd -lcolamd -lm -lgmp -lmpfr
 1083  gcc -L/sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib -shared -Wl,-soname -Wl,libsliplu.so.1 -Wl,--no-undefined slip_matrix_div.o slip_create_mpq_array.o SLIP_free.o SLIP_LU_factorize.o SLIP_realloc.o slip_matrix_mul.o slip_get_largest_pivot.o slip_ref_triangular_solve.o SLIP_backslash.o slip_create_mpz_array.o slip_get_nonzero_pivot.o SLIP_LU_solve.o slip_back_sub.o slip_cumsum.o slip_get_pivot.o SLIP_malloc.o slip_sparse_collapse.o SLIP_calloc.o slip_dfs.o slip_get_smallest_pivot.o SLIP_matrix_allocate.o slip_sparse_realloc.o slip_cast_array.o slip_expand_double_array.o SLIP_gmp.o SLIP_matrix_copy.o SLIP_matrix_check.o slip_cast_matrix.o slip_expand_mpfr_array.o SLIP_initialize.o SLIP_matrix_free.o slip_check_solution.o slip_expand_mpq_array.o SLIP_initialize_expert.o SLIP_matrix_nnz.o SLIP_create_default_options.o SLIP_finalize.o SLIP_LU_analysis_free.o slip_permute_x.o slip_permute_b.o slip_create_mpfr_array.o slip_forward_sub.o SLIP_LU_analyze.o slip_reach.o -o /sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib/libsliplu.so.1.0.2 -lm -lrt -Wl,-rpath=/sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib -lsuitesparseconfig -lamd -lcolamd -lm -lgmp -lmpfr -L$MPFR_ROOT/lib -L$GMP_ROOT/lib 
 1084  gcc -L/sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib -shared -Wl,-soname -Wl,libsliplu.so.1 -Wl,--no-undefined slip_matrix_div.o slip_create_mpq_array.o SLIP_free.o SLIP_LU_factorize.o SLIP_realloc.o slip_matrix_mul.o slip_get_largest_pivot.o slip_ref_triangular_solve.o SLIP_backslash.o slip_create_mpz_array.o slip_get_nonzero_pivot.o SLIP_LU_solve.o slip_back_sub.o slip_cumsum.o slip_get_pivot.o SLIP_malloc.o slip_sparse_collapse.o SLIP_calloc.o slip_dfs.o slip_get_smallest_pivot.o SLIP_matrix_allocate.o slip_sparse_realloc.o slip_cast_array.o slip_expand_double_array.o SLIP_gmp.o SLIP_matrix_copy.o SLIP_matrix_check.o slip_cast_matrix.o slip_expand_mpfr_array.o SLIP_initialize.o SLIP_matrix_free.o slip_check_solution.o slip_expand_mpq_array.o SLIP_initialize_expert.o SLIP_matrix_nnz.o SLIP_create_default_options.o SLIP_finalize.o SLIP_LU_analysis_free.o slip_permute_x.o slip_permute_b.o slip_create_mpfr_array.o slip_forward_sub.o SLIP_LU_analyze.o slip_reach.o -o /sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib/libsliplu.so.1.0.2 -lm -lrt -Wl,-rpath=/sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib -lsuitesparseconfig -lamd -lcolamd -lm -lgmp -lmpfr
 1085  cd /sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/SLIP_LU/Lib
 1086  ll
 1087  gcc -L/sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib -shared -Wl,-soname -Wl,libsliplu.so.1 -Wl,--no-undefined slip_matrix_div.o slip_create_mpq_array.o SLIP_free.o SLIP_LU_factorize.o SLIP_realloc.o slip_matrix_mul.o slip_get_largest_pivot.o slip_ref_triangular_solve.o SLIP_backslash.o slip_create_mpz_array.o slip_get_nonzero_pivot.o SLIP_LU_solve.o slip_back_sub.o slip_cumsum.o slip_get_pivot.o SLIP_malloc.o slip_sparse_collapse.o SLIP_calloc.o slip_dfs.o slip_get_smallest_pivot.o SLIP_matrix_allocate.o slip_sparse_realloc.o slip_cast_array.o slip_expand_double_array.o SLIP_gmp.o SLIP_matrix_copy.o SLIP_matrix_check.o slip_cast_matrix.o slip_expand_mpfr_array.o SLIP_initialize.o SLIP_matrix_free.o slip_check_solution.o slip_expand_mpq_array.o SLIP_initialize_expert.o SLIP_matrix_nnz.o SLIP_create_default_options.o SLIP_finalize.o SLIP_LU_analysis_free.o slip_permute_x.o slip_permute_b.o slip_create_mpfr_array.o slip_forward_sub.o SLIP_LU_analyze.o slip_reach.o -o /sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib/libsliplu.so.1.0.2 -lm -lrt -Wl,-rpath=/sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib -lsuitesparseconfig -lamd -lcolamd -lm -lgmp -lmpfr -L$MPFR_ROOT/lib -L$GMP_ROOT/lib 
 1088  cd ../..
 1089  make -j 20 library
 1090  make install INSTALL=$PREFIX
 1091  cd /sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/SLIP_LU/Lib
 1092  gcc -L/sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib -shared -Wl,-soname -Wl,libsliplu.so.1 -Wl,--no-undefined slip_matrix_div.o slip_create_mpq_array.o SLIP_free.o SLIP_LU_factorize.o SLIP_realloc.o slip_matrix_mul.o slip_get_largest_pivot.o slip_ref_triangular_solve.o SLIP_backslash.o slip_create_mpz_array.o slip_get_nonzero_pivot.o SLIP_LU_solve.o slip_back_sub.o slip_cumsum.o slip_get_pivot.o SLIP_malloc.o slip_sparse_collapse.o SLIP_calloc.o slip_dfs.o slip_get_smallest_pivot.o SLIP_matrix_allocate.o slip_sparse_realloc.o slip_cast_array.o slip_expand_double_array.o SLIP_gmp.o SLIP_matrix_copy.o SLIP_matrix_check.o slip_cast_matrix.o slip_expand_mpfr_array.o SLIP_initialize.o SLIP_matrix_free.o slip_check_solution.o slip_expand_mpq_array.o SLIP_initialize_expert.o SLIP_matrix_nnz.o SLIP_create_default_options.o SLIP_finalize.o SLIP_LU_analysis_free.o slip_permute_x.o slip_permute_b.o slip_create_mpfr_array.o slip_forward_sub.o SLIP_LU_analyze.o slip_reach.o -o /sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib/libsliplu.so.1.0.2 -lm -lrt -Wl,-rpath=/sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/lib -lsuitesparseconfig -lamd -lcolamd -lm -lgmp -lmpfr -L$MPFR_ROOT/lib -L$GMP_ROOT/lib 
 1093  cd ../..
 1094  make install INSTALL=$PREFIX
 1095  pushd .
 1096  cd /sw/libs/SuiteSparse/5.8.1/src/SuiteSparse-5.8.1/SLIP_LU/Lib
 1097  ll
 1098  vi Makefile 
 1099  popd
 1100  make install INSTALL=$PREFIX
 1101  dirs
 1102  cd -
 1103  cd SLIP_LU/Lib
 1104  ll
 1105  vi Makefile 
 1106  echo 'add -L$(GMP_ROOT)/lib -L$(MPFR_ROOT)/lib to the end of line 104'
 1107  cd ../..
 1108  cd ../../rackham/
 1109  ll
 1110  ll bin/
 1111  ll lib
 1112  ll lib64/
 1113  ls -R
 1114  vi ../../mf/5.8.1 
 1115  ll
 1116  cd ../../mf
 1117  ll
 1118  od -c 5.8.1 
 1119  ll
 1120  vi 5.8.1 
 1121  ml
 1122  vi 5.8.1 
 1123  ll
 1124  cd ..
 1125  ll
 1126  history >> SuiteSparse-5.8.1_install-README.md
