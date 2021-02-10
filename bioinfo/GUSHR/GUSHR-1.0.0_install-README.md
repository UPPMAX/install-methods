GUSHR/1.0.0
========================

<https://github.com/Gaius-Augustus/GUSHR>

Used under license:
GPL v3
<>

Structure creating script (makeroom_GUSHR_1.0.0.sh) moved to /sw/bioinfo/GUSHR/makeroom_1.0.0.sh

LOG
---

    TOOL=GUSHR
    VERSION=1.0.0
    CLUSTER=rackham
    TOOLDIR=/sw/bioinfo/$TOOL
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/bioinfo/GUSHR/1.0.0/src
    /home/douglas/bin/makeroom.sh -t "GUSHR" -v "1.0.0" -s "annotation" -w "https://github.com/Gaius-Augustus/GUSHR" -l "GPL v3" -d "Assembly-free construction of UTRs from short read RNA-Seq data on the basis of coding sequence annotation"
    ./makeroom_GUSHR_1.0.0.sh
    cd $SRCDIR
    wget http://
    tar xvf 
    make

   84  ./braker_RNAseq_gtf.pl body_transcriptome.merged.StringTie.gtf > body_transcriptome.merged.StringTie.gff 2>body_transcriptome.merged.StringTie.err
   85  ll
   86  ls -lL
   87  rm -f *.err
   88  parallel -j 10 --verbose  ./braker_RNAseq_gtf.pl {} '>' {.}.gff ::: *.gtf
   89  ll
   90  pushd .
   91  cd ~/github-sync
   92  ls
   93  cd local/
   94  ls
   95  cd bioinfo/
   96  ll
   97  ssh-agent > ~/.agent
   98  source ~/.agent
   99  ssh-add ~/.ssh/github_rsa 
  100  git pull
  101  git status
  102  git diff
  103  ll
  104  cd scripts/
  105  ll
  106  grep shuffle detectAdapters.sh 
  107  grep -i core detectAdapters.sh 
  108  git pull
  109  git commit -a -m 'update adapter detection scripts'
  110  git push
  111  git pull
  112  vi scripts/detectAdapters.sh
  113  ll
  114  vi detectAdapters.sh 
  115  cd ..
  116  git pull
  117  vi scripts/detectAdapters.sh 
  118  git commit -a -m 'fixups'
  119  git push
  120  dirs
  121  cp /proj/snic2019-35-58/water_strider/new_annotation/StringTie_transcriptomes/braker_RNAseq_gtf.pl .
  122  ll
  123  mv braker_RNAseq_gtf.pl scripts/
  124  vi README.md 
  125  cd scripts/
  126  ll
  127  diff braker_RNAseq_gtf.pl /proj/snic2019-35-58/water_strider/new_annotation/StringTie_transcriptomes/braker_RNAseq_gtf.pl 
  128  cp /proj/snic2019-35-58/water_strider/new_annotation/StringTie_transcriptomes/braker_RNAseq_gtf.pl .
  129  cd ..
  130  git status
  131  git add .
  132  git status
  133  git commit -a -m 'add braker_RNAseq_gtf.pl to create braker RNAseq hints file from StringTie output GTF'
  134  git push
  135  ml bioinfo-tools 
  136  mfshow Sniffles
  137  ml Sniffles/1.0.12-201218-4ff6ecb
  138  echo $PATH
  139  ll /sw/bioinfo/Sniffles/1.0.12-201218-4ff6ecb/rackham
  140  sniffles
  141  sniffles-debug 
  142  mspid gushr
  143  ml
  144  ml -Sniffles
  145  ml Braker
  146  ml braker
  147  ll
  148  cat Makefile 
  149  head body_transcriptome.merged.StringTie.gtf > ~/github-sync/local/bioinfo/scripts/braker_RNAseq_gtf.input
  150  head body_transcriptome.merged.StringTie.gtf | ./braker_RNAseq_gtf.pl > ~/github-sync/local/bioinfo/scripts/braker_RNAseq_gtf.output
  151  cd scripts/
  152  ll
  153  cd tests/
  154  ll
  155  cd ..
  156  ll
  157  cd ..
  158  make test
  159  make tests
  160  ml bioinfo-tools BioPerl
  161  make tests
  162  ll
  163  cd scripts/tests/
  164  ll
  165  rm -f *19660* *20067*
  166  ll
  167  rm -f *20102*
  168  ll
  169  rm -f *19662* *20069*
  170  ll
  171  rm -f *19773*
  172  ll
  173  cat make.expected 
  174  ./intervalBed_test.sh 
  175  ll
  176  vi intervalBed_test*expected
  177  cd ..
  178  ll
  179  cd -
  180  ll
  181  rm -f *21377*
  182  ls
  183  cat intervalBed_test_02.expected
  184  cat intervalBed_test_04.expected
  185  cat intervalBed_test_03.expected
  186  cat intervalBed_test_06.expected
  187  cat intervalBed_test_07.expected
  188  ../intervalBed intervalBed_test.input
  189  ../intervalBed col=4 intervalBed_test.input
  190  vi intervalBed_test*expected
  191  ./intervalBed_test.sh 
  192  ll
  193  ./convertAlignment_test.sh 
  194  ./pileup2pro_test.sh 
  195  vi ../pileup2pro.pl 
  196  vi ../pileup2pro2.pl 
  197  ./pileup2pro_test.sh 
  198  ls
  199  ./mergePileupColumns_test.sh 
  200  ./pos2bed_test.sh 
  201  ./windowWig_test.sh 
  202  ./fai2Bed_test.sh 
  203  make
  204  cp pos2bed_test_01 braker_RNAseq_gtf_test.sh
  205  cp pos2bed_test.sh braker_RNAseq_gtf_test.sh
  206  vi braker_RNAseq_gtf_test.sh 
  207  ll
  208  cat pos2bed_test_01.options
  209  vi braker_RNAseq_gtf_test.sh 
  210  ll
  211  rm -f *17633*
  212  ll
  213  mv ../braker_RNAseq_gtf.input .
  214  mv ../braker_RNAseq_gtf.output braker_RNAseq_gtf.expected
  215  ll
  216  mv braker_RNAseq_gtf_test_01.expected
  217  mv braker_RNAseq_gtf.expected braker_RNAseq_gtf_test_01.expected
  218  mv braker_RNAseq_gtf.input braker_RNAseq_gtf_test_01.input
  219  ./braker_RNAseq_gtf_test.sh 
  220  ls
  221  vi Makefile 
  222  make
  223  ls
  224  cd ..
  225  ll
  226  make tests
  227  cd ..
  228  make tests
  229  cd scripts/
  230  cd tests/
  231  vi make.expected 
  232  cd ../..
  233  make tests
  234  ll
  235  cd scripts/tests/
  236  make
  237  cd ..
  238  git status
  239  git add .
  240  git commit -a -m 'add tests for braker_RNAseq_gtf.pl and correct existing tests and scripts'
  241  git push
  242  git status
  243  mspid seq
  244  ml
  245  ml
  246  vi braker_RNAseq_gtf.pl
  247  ll
  248  cd ..
  249  ll
  250  ml bioinfo-tools
  251  mspid braker
  252  ml braker/2.1.5-20200826-cf958ec
  253  ml
  254  braker --help
  255  braker.pl --help
  256  ml
  257  cd /sw/bioinfo/ProtHint/
  258  ll
  259  cat ProtHint-2.4.0_install-README.md
  260  TOOL=ProtHit;VERSION=2.5.0; makeroom.sh -f -t $TOOL -v $VERSION -s annotation -w https://github.com/gatech-genemark/ProtHint  -l "GeneMark license" -L https://github.com/gatech-genemark/ProtHint/blob/master/LICENSE -d "pipeline for predicting and scoring hints (in the form of introns, start and stop codons) in the genome of interest by mapping and spliced aligning predicted genes to a database of reference protein sequences"
  261  ll
  262  rm -f makeroom_ProtHit_2.5.0.sh 
  263  TOOL=ProtHint;VERSION=2.5.0; makeroom.sh -f -t $TOOL -v $VERSION -s annotation -w https://github.com/gatech-genemark/ProtHint  -l "GeneMark license" -L https://github.com/gatech-genemark/ProtHint/blob/master/LICENSE -d "pipeline for predicting and scoring hints (in the form of introns, start and stop codons) in the genome of interest by mapping and spliced aligning predicted genes to a database of reference protein sequences"
  264  cd ..
  265  ll
  266  ls -ltr
  267  cd -
  268  ll
  269  ./makeroom_ProtHint_2.5.0.sh 
  270  ll
  271  cd 2.5.0/
  272  ll
  273  cd src/
  274  ll
  275  wget https://github.com/gatech-genemark/ProtHint/releases/download/v2.5.0/ProtHint-2.5.0.tar.gz
  276  tar xzf ProtHint-2.5.0.tar.gz 
  277  ll
  278  cd ../..
  279  ll
  280  cat ProtHint-2.4.0_install-README.md
  281  source SOURCEME_ProtHint_2.5.0 
  282  ll
  283  vi ProtHint-2.5.0_install-README.md
  284  ll
  285  cat ProtHint-2.5.0_install-README.md
  286  cd 2.5.0/
  287  ll
  288  cd src/
  289  ll
  290  rm -rf *
  291  cd ../..
  292     cd /sw/bioinfo/$TOOL/
  293      source SOURCEME_${TOOL}_${VERSION}
  294      cd $VERSION/src
  295      module load perl_modules/5.26.2
  296      module load  python/3.7.2
  297      wget https://github.com/gatech-genemark/$TOOL/releases/download/v${VERSION}/${TOOL}-${VERSION}.tar.gz
  298      tar xzf ${TOOL}-${VERSION}.tar.gz
  299      rmdir $PREFIX
  300      mv ${TOOL}-${VERSION} $PREFIX
  301  cd ../../mf
  302  ll
  303  rm 2.5.0 
  304  mshow ProtHint
  305  ll
  306  cat 2.4.0 
  307  ln -s 2.4.0 2.5.0
  308  ll
  309  cd ..
  310  ll
  311  vi ProtHint-2.5.0_post-install.sh 
  312  ./ProtHint-2.5.0_post-install.sh 
  313  du -csh braker_v1*
  314  ml ProtHint/2.5.0
  315  ml
  316  cd braker_v1_snowy_noUTR_new
  317  ll
  318  rm all_samples_masked_renamed.bam 
  319  cd ..
  320  cd braker_v1_snowy_noUTR
  321  ll
  322  rm all_samples_masked.bam 
  323  mspid augustus
  324  less Hemiptera_OrthoDB_proteins.faa 
  325  cd ..
  326  ll
  327  cd OrthoDB/
  328  ll
  329  cat README.txt 
  330  cat Hemiptera_taxids.txt
  331  cd ..
  332  ll
  333  ll Gbue_2.0_OGSv1.1_materials/
  334  mkdir Proteins_OrthoDB_and_Gbue_2.0
  335  cd Proteins_OrthoDB_and_Gbue_2.0/
  336  cat ../Gbue_2.0_OGSv1.1_materials/gerbue_OGSv1.1_pep.fa ../OrthoDB/Hemiptera_OrthoDB_proteins_renamed.faa > ../Proteins_OrthoDB_and_Gbue_2.0.faa
  337  cd ..
  338  ll
  339  rmdir Proteins_OrthoDB_and_Gbue_2.0
  340  tail Proteins_OrthoDB_and_Gbue_2.0.faa 
  341  cd OrthoDB/
  342  ll
  343  cat rename_fasta.sh 
  344  ll
  345  cat extract_taxa_fasta.sh 
  346  ll
  347  cd ..
  348  ll
  349  mkdir braker_v2_snowy_noUTR
  350  cd braker_v2_snowy_noUTR/
  351  ln -s ../Proteins_OrthoDB_and_Gbue_2.0.faa .
  352  ln -s ../StringTie_transcriptomes/*.gff .
  353  ll
  354  mkdir ProtHint
  355  cd ProtHint/
  356  prothint.py 
  357  ml
  358  which braker.pl 
  359  view /sw/bioinfo/braker/2.1.5/rackham/scripts/braker.pl
  360  cd ..
  361  rmdir ProtHint/
  362  ll
  363  cp ../braker_v1_snowy_noUTR_new/run_braker_snowy_noUTR_new.sh .
  364  vi run_braker_snowy_noUTR_new.sh 
  365  ll ..
  366  ml braker
  367  ml
  368  ml ProtHint/2.5.0
  369  prothint.py --help
  370  cd /proj/snic2019-35-58/water_strider/new_annotation/StringTie_transcriptomes
  371  ll
  372  cd ..
  373  ll
  374  cd braker_v2_snowy_noUTR/
  375  ll
  376  mkdir ProtHint
  377  cd ProtHint/
  378  ll
  379  prothint.py --help
  380  cd ..
  381  ll
  382  ln -s ../water_strider_11Jul2018_yVXgK.masked.slow_renamed.fasta .
  383  ln -s ../Proteins_OrthoDB_and_Gbue_2.0.faa .
  384  ll
  385  cd ProtHint/
  386  ln -s ../Proteins_OrthoDB_and_Gbue_2.0.faa .
  387  ln -s ../water_strider_11Jul2018_yVXgK.masked.slow_renamed.fasta .
  388  prothint.py --threads 20 water_strider_11Jul2018_yVXgK.masked.slow_renamed.fasta Proteins_OrthoDB_and_Gbue_2.0.faa 
  389  ll
  390  cat cmd.log 
  391  ll GeneMark_ES/
  392  cd ..
  393  rm -rf ProtHint/
  394  cd ..
  395  ll
  396  ll Gbue_2.0_OGSv1.1_materials/gerbue_OGSv1.1_pep.fa 
  397  cd braker_v2_snowy_noUTR/
  398  ll
  399  ls
  400  T=(*.StringTie.gff)
  401  echo $T
  402  @T=(*.StringTie.gff)
  403  for F in (*.StringTie.gff); do echo $F; done
  404  T=(*.StringTie.gff)
  405  echo "${T[@]}"
  406  F="${T[@]}"
  407  echo $F
  408  echo ${F// /,}
  409  ml
  410  ml bioinfo-tools StringTie/2.1.5
  411  mspid StringTie
  412  ml bioinfo-tools StringTie/2.1.4
  413  stringtie --merge wingbud_transcriptome.StringTie.gff wingbud_transcriptome.merged.StringTie.gff > t.gff
  414  stringtie --merge wingbud_transcriptome.StringTie.gtf wingbud_transcriptome.merged.StringTie.gtf > t.gtf
  415  ll
  416  rm t.gff
  417  rm -rf tmp.XX996nPA/
  418  ll
  419  ls -lL wingbug*gtf t.gtf
  420  ls -lL wingbud*gtf t.gtf
  421  rm t.gtf 
  422  unset F
  423  ll
  424  ml
  425  mhelp augustus
  426  source $AUGUSTUS_CONFIG_COPY
  427  ll ../braker_v1_snowy_noUTR
  428  vi run_braker_snowy_noUTR_new.sh 
  429  echo $AUGUSTUS_SCRIPTS_PATH
  430  ll
  431  ll augustus_config/
  432  ll augustus_config/species/
  433  ll ../braker_v1_snowy_noUTR_new/augustus_config/
  434  ll ../braker_v1_snowy_noUTR_new/augustus_config/species/
  435  ll ../braker_v1_snowy_noUTR_new/augustus_config/species/Gerris_buenoi/
  436  ll
  437  sbatch run_braker_snowy_noUTR_new.sh 
  438  jiu
  439  jiu -M snowy
  440  jobinfo -M snowy -u douglas
  441  ml
  442  vi run_braker_snowy_noUTR_new.sh 
  443  ll
  444  cd ..
  445  ll
  446  rsync -n -Pa braker_v2_snowy_noUTR braker_v2_rackham5_noUTR
  447  rsync  -Pa braker_v2_snowy_noUTR braker_v2_rackham5_noUTR
  448  ll
  449  cd braker_v2_rackham5_noUTR
  450  ll
  451  mv braker_v2_snowy_noUTR/* .
  452  rmdir braker_v2_snowy_noUTR/
  453  ll
  454  mv run_braker_snowy_noUTR_new.sh run_braker_rackham5_noUTR.sh 
  455  ll
  456  vi run_braker_rackham5_noUTR.sh 
  457  ll
  458  scancel -M snowy 3554619
  459  ./run_braker_rackham5_noUTR.sh 
  460  kill %+
  461  jobs
  462  ll
  463  rm -rf braker
  464  ml
  465  gmes_petap.pl
  466  ml 
  467  ml bioinfo-tools
  468  ml braker
  469  ml
  470  ml ProtHint/2.5.0
  471  gmes_petap.pl
  472  gmes_petap.pl --verbose --cores=20 --ES --gc_donor 0.001 --sequence=water_strider_11Jul2018_yVXgK.masked.slow_renamed.fasta  --soft_mask=1000
  473  ll
  474  cat gmes.log 
  475  date
  476  cd /proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5_noUTR
  477  ll
  478  gmes_petap.pl --verbose --cores=20 --ES --gc_donor 0.001 --sequence=water_strider_11Jul2018_yVXgK.masked.slow_renamed.fasta  --soft_mask=1000
  479  rm -rf data info gmes.log  output run*
  480  ll
  481  mkdir gm
  482  cd gm
  483  cd gm
  484  ll
  485  cat run.cfg 
  486  ll
  487  cd /sw/bioinfo/
  488  ll
  489  htop -u douglas
  490  gmes_petap.pl --verbose --cores=20 --ES --gc_donor 0.001 --sequence=../water_strider_11Jul2018_yVXgK.masked.slow_renamed.fasta  --soft_mask=1000
  491  htop
  492  exit
  493  cd /sw/bioinfo/SACRA/
  494  ll
  495  cd mf/
  496  ll
  497  cat 1.0.0 
  498  cd ../1.0.0/
  499  ll
  500  cd rackham/
  501  ll
  502  cd ../../../last
  503  ll
  504  cd 847/
  505  ll
  506  cd rackham/
  507  ll
  508  cd bin/
  509  ll
  510  mspid seqkit
  511  mspid SeqKit
  512  ll /sw/bioinfo/SeqKit/
  513  cd ..
  514  ll
  515  cd ..
  516  ll
  517  cd doc/
  518  ll
  519  cd ../../mf
  520  ll
  521  cat 847 
  522  cd /sw/apps
  523  cd R_packages
  524  ll
  525  cd 3.6.0
  526  ll
  527  ll ../4.0.0/
  528  ll ..
  529  htop
  530  cd /proj/snic2019-35-58/water_strider/new_annotation
  531  mount
  532  ll
  533  ll
  534  htop
  535  mount
  536  cd /proj/
  537  ls
  538  cd snic2020-15-336
  539  ll
  540  ll -d *35-58*
  541  cd ..
  542  ll -d *35-58*
  543  cd snic2019-35-58
  544  ll
  545  cd water_strider/
  546  ll
  547  cd new_annotation/
  548  ll
  549  cd StringTie_transcriptomes/
  550  ll
  551  rm braker_RNAseq_gtf.pl 
  552  pushd .
  553  cd 
  554  cd github-sync/local/bioinfo/scripts/
  555  ll
  556  git rm braker_RNAseq_gtf.pl
  557  vi README.md 
  558  cd tests
  559  ll
  560  git rm braker_RNAseq_gtf_test*
  561  vi Makefile 
  562  ll
  563  cat README.md 
  564  vi make.expected 
  565  cd ..
  566  ll
  567  cd ..
  568  vi README.md 
  569  git status
  570  git commit -a -m 'remove braker_RNAseq_gtf.pl script'
  571  uptime
  572  source ~/.agent
  573  git pull
  574  git push
  575  dirs
  576  popd
  577  mspid augustus
  578  ml bioinfo-tools augustus/20200915-ed0cb90
  579  ll
  580  cd ..
  581  ll
  582  cd RNAseq-alignments/
  583  ll
  584  cd _body_transcriptome/
  585  ll
  586  which bam2hints 
  587  bam2hints -h
  588  ll
  589  bam2hints --in=body_transcriptome.bam.fwd.bam --out=body_transcriptome.bam.fwd.gff
  590  ll
  591  htop
  592  source ~/.bashrc
  593  screen -S tr
  594  htop
  595  screen -ls
  596  ml bioinfo-tools augustus
  597  ml
  598  ll
  599  for B in body_transcriptome.bam.fwd.bam body_transcriptome.bam.rev.bam ; do echo $B; bam2hints --in=$B --out=${B%.bam}.gff ; done
  600  ll
  601  head body_transcriptome.bam.fwd.gff
  602  head body_transcriptome.bam.rev.gff
  603  bam2hints -h
  604  ll
  605  rm -f *.gtf
  606  cd .snapshot
  607  mv cuttrim2_SF-2243-GB-1x_merged.gtf
  608  rm cuttrim2_SF-2243-GB-1x_merged.gtf
  609  ll
  610  rename-string gff b2h.gff
  611  ll
  612  cd ..
  613  ll
  614  cd ..
  615  ll
  616  mv braker_v2_rackham5_noUTR braker_v2_rackham5
  617  mv braker_v2_snowy_noUTR braker_v2_snowy
  618  ll
  619  cd braker_v2_snowy
  620  ll
  621  rm -f *.gff
  622  ll
  623  ln -s ../RNAseq-alignments/_body_transcriptome/*.{fwd,rev}.bam* .
  624  ll
  625  ll ../RNAseq-alignments/_nymphalleg_transcriptome/
  626  ln -s ../RNAseq-alignments/_nymphalleg_transcriptome/*.{fwd,rev}.bam* .
  627  ll
  628  rm -f *.bam *.bai
  629  ll
  630  cd ../RNAseq-alignments/_body_transcriptome/
  631  ll
  632  rename-string bam.fwd fwd
  633  rename-string bam.rev rev
  634  ll
  635  cd ../_nymphalleg_transcriptome/
  636  ll
  637  rename-string bam.fwd fwd; rename-string bam.rev rev
  638  ll
  639  rm -f gtf
  640  ll
  641  rm -f *.gtf
  642  ll
  643  cd ../_wholeadultnymphi5k_transcriptome/
  644  ll
  645  rename-string bam.fwd fwd; rename-string bam.rev rev
  646  ll
  647  rm -f *.gtf
  648  ll
  649  cd ../_wholeembryo_transcriptome/
  650  ll
  651  rm -f *.gtf
  652  ll
  653  cd ../_wingbud_transcriptome/
  654  ll
  655  rm -f *.gtf
  656  ll
  657  rename-string bam.fwd fwd; rename-string bam.rev rev
  658  ll
  659  cd ../../braker_v2_rackham5/
  660  ll
  661  rm -f *.gff
  662  ll
  663  rm -rf gm
  664  cd ../braker_v2_snowy/
  665  ll
  666  ln -s ../RNAseq-alignments/_body_transcriptome/*.{fwd,rev}.bam* .
  667  ln -s ../RNAseq-alignments/_nymphalleg_transcriptome/*.{fwd,rev}.bam* .
  668  ln -s ../RNAseq-alignments/_wholeadultnymphi5k_transcriptome/*.{fwd,rev}.bam* .
  669  ln -s ../RNAseq-alignments/_wholeembryo_transcriptome/wholeembryo_transcriptome.bam* .
  670  ln -s ../RNAseq-alignments/_wingbud_transcriptome/*.{fwd,rev}.bam* .
  671  ll
  672  vi run_braker_snowy_noUTR_new.sh 
  673  mv run_braker_snowy_noUTR_new.sh run_braker_v2_snowy.sh 
  674  ll
  675  ls *.bam >> run_braker_v2_snowy.sh 
  676  vi run_braker_v2_snowy.sh 
  677  ll
  678  mv wholeembryo_transcriptome.bam wholeembryo_transcriptome.se.bam
  679  mv wholeembryo_transcriptome.bam.bai wholeembryo_transcriptome.se.bam.bai
  680  ll
  681  vi *.sh
  682  ll
  683  rm -f *.fwd.bam* *.rev.bam*
  684  ll
  685  ln -s ../RNAseq-alignments/_body_transcriptome/body_transcriptome.bam* .
  686  ln -s ../RNAseq-alignments/_nymphalleg_transcriptome/nymphalleg_transcriptome.bam* .
  687  ln -s ../RNAseq-alignments/_wholeadultnymphi5k_transcriptome/wholeadultnymphi5k_transcriptome.bam* .
  688  ln -s ../RNAseq-alignments/_wingbud_transcriptome/wingbud_transcriptome.bam* .
  689  ll
  690  rename-string tome.bam tome.fr.bam
  691  ll
  692  vi run_braker_v2_snowy.sh 
  693  d=(*doug*)
  694  [[ -z "$d" ]] && echo "d is empty"
  695  [[ ! -z "$d" ]] && echo "d is empty"
  696  echo $d
  697  vi *.sh
  698  ll
  699  echo $d
  700  shopt -s nullglob
  701  d=(*doug*)
  702  echo $d
  703  [[ -z "$d" ]] && echo "d is empty"
  704  vi *.sh
  705  ml
  706  vi *.sh
  707  ll
  708  exit
  709  screen -R tr
  710  cd /proj/snic2019-35-58/water_strider/new_annotation/braker_v2_snowy
  711  ll
  712  screen -ls
  713  cd ..
  714  ll
  715  cd braker_v2_rackham5/
  716  ll
  717  cp -va ../braker_v2_snowy/*.bam* .
  718  ll
  719  ll ../braker_v2_snowy/
  720  cp ../braker_v2_snowy/run_braker_v2_snowy.sh .
  721  ll
  722  mv run_braker_v2_snowy.sh run_braker_v2_rackham5.sh 
  723  vi *.sh
  724  ll
  725  htop
  726  ll
  727  screen -ls
  728  source ~/.bashrc
  729  screen -S braker
  730  htop -u douglas
  731  mount
  732  screen -ls
  733  htop
  734  screen -R braker
  735  ll /crex/proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5/braker/errors/
  736  cat /crex/proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5/braker/errors/GeneMark-ES.stderr 
  737  which perl
  738  ml perl_modules/5.26.2
  739  screen -R braker
  740  ll /crex/proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5/braker/errors/
  741  date
  742  ll /crex/proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5/braker/
  743  cat /crex/proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5/braker/GeneMark-ES.stdout 
  744  screen -R braker
  745  cd /proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5
  746  ll
  747  cd braker/
  748  ll
  749  tail braker.log 
  750  ll
  751  tail braker.log 
  752  which perl
  753  tail braker.log 
  754  ll /crex/proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5/braker/errors/GeneMark-ES.stderr
  755  tail braker.log 
  756  ll /crex/proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5/braker/errors/GeneMark-ES.stderr
  757  less /crex/proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5/braker/errors/GeneMark-ES.stderr
  758  screen -ls
  759  cd /sw/bioinfo/GeneMark/
  760  ll
  761  cat GeneMark-4.57-es_install-README.md
  762  cd /sw/bioinfo/GeneMark/keyfile
  763  ll
  764  cd ..
  765  ll
  766  cd keyfile/
  767  ll
  768  cp GeneMark-4.57-es_install-README.md GeneMark-4.62-es_install-README.md
  769  cd ..
  770  cp GeneMark-4.57-es_install-README.md GeneMark-4.62-es_install-README.md
  771  vi GeneMark-4.62-es_install-README.md 
  772  ll
  773     cd /sw/bioinfo/GeneMark/
  774      VERSION=4.62-es
  775      PERLVERSION=5.26.2
  776      mkdir $VERSION
  777      cd $VERSION
  778      PREFIX=$PWD/rackham
  779      mkdir src
  780      for CL in irma bianca snowy ; do test -L $CL || ln -sf rackham $CL ; done
  781      cd src
  782  wget    cd /sw/bioinfo/GeneMark/
  783      VERSION=4.62-es
  784      PERLVERSION=5.26.2
  785      mkdir $VERSION
  786      cd $VERSION
  787      PREFIX=$PWD/rackham
  788      mkdir src
  789      for CL in irma bianca snowy ; do test -L $CL || ln -sf rackham $CL ; done
  790      cd src
  791  cd ..
  792  ll
  793  cd ..
  794  ll
  795  rm -rf 4.62-es/
  796  wget http://topaz.gatech.edu/GeneMark/tmp/GMtool_qnnmi/gm_key_64.gz
  797  wget http://topaz.gatech.edu/GeneMark/tmp/GMtool_qnnmi/gmes_linux_64.tar.gz
  798  vi ../../GeneMark-4.62-es_install-README.md 
  799  cat ../../GeneMark-4.62-es_install-README.md 
  800    mkdir -p /sw/bioinfo/GeneMark/keyfile
  801      gunzip gm_key_64.gz
  802      mv gm_key_64 /sw/bioinfo/GeneMark/keyfile/gm_key
  803    tar xzf gmes_linux_64.tar.gz
  804      mv gmes_linux_64 $PREFIX
  805      cd $PREFIX
  806  echo $PREFIX
  807  ll
  808  cd ..
  809  PREFIX=$PWD/rackham
  810  cd src/
  811   mv gmes_linux_64 $PREFIX
  812  cd $PREFIX
  813   rm -f gm_key
  814      ln -s /sw/bioinfo/GeneMark/keyfile/gm_key .
  815    grep 'version:' gmes.cfg
  816  ml
  817    module load perl_modules/$PERLVERSION
  818   ./check_install.bash
  819  pushd .
  820  cd
  821  rm .gm_key 
  822  cp -av /sw/bioinfo/GeneMark/keyfile/gm_key .gm_key
  823  popd
  824  ./check_install.bash 
  825   ./change_path_in_perl_scripts.pl "/usr/bin/env perl"
  826  ll
  827  cd ../..
  828  ll
  829  cd mf
  830  ll
  831  cat 4.57-es 
  832  cp 4.57-es 4.62-es
  833  vi 4.62-es 
  834  ll
  835  mfshow GeneMark
  836  rsync -n -Pa * /sw/mf/common/bioinfo-tools/annotation/GeneMark/
  837  rsync  -Pa * /sw/mf/common/bioinfo-tools/annotation/GeneMark/
  838  all_mflink -f GeneMark 4.62-es
  839  screen -R braker
  840  ll
  841  cd /proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5
  842  cd braker
  843  ll
  844  cat braker.log 
  845  ll *es
  846  rm 4.62-es 
  847  ll
  848  diff 4.38-es 4.57-es 
  849  mv 4.62-es 4.57-es 
  850  ln -s 4.57-es 4.62-es
  851  ll
  852  vi *
  853  rsync  -Pa * /sw/mf/common/bioinfo-tools/annotation/GeneMark/
  854  mfshow GeneMark
  855  ll /crex/proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5/braker/errors/GeneMark-ES.stderr
  856  screen -ls
  857  screen -R braker
  858  ll
  859  cd /proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5
  860  ll
  861  cd braker/
  862  ll
  863  cat braker.log 
  864  cd ..
  865  ll
  866  ml
  867  ml bioinfo-tools 
  868  ml Braker
  869  mspid braker
  870  ml braker/2.1.5-20200826-cf958ec ProtHint/2.5.0 GeneMark/4.62-es
  871  ml
  872  check_headers.pl water_strider_11Jul2018_yVXgK.masked.slow_renamed.fasta Proteins_OrthoDB_and_Gbue_2.0.faa 
  873  vi $(which check_headers.pl)
  874  grep -A 100 check_fasta_ $(which braker.pl)
  875  grep -A 200 check_fasta_ $(which braker.pl)
  876  vi $(which check_headers.pl)
  877  check_headers.pl Proteins_OrthoDB_and_Gbue_2.0.faa 
  878  vi $(which check_headers.pl)
  879  check_headers.pl Proteins_OrthoDB_and_Gbue_2.0.faa 
  880  vi $(which check_headers.pl)
  881  check_headers.pl water_strider_11Jul2018_yVXgK.masked.slow_renamed.fasta 
  882  ll
  883  screen -ls
  884  screen -R braker
  885  cd braker/
  886  ll
  887  cd errors/
  888  ll
  889  cd ..
  890  tail braker.log 
  891  htop -u douglas
  892  ll
  893  cd /proj/snic2019-35-58/water_strider/new_annotation/braker_v2_rackham5/braker
  894  ll
  895  cat braker.log 
  896  which prothint.py
  897  cat braker.log 
  898  htop -u douglas
  899  cat braker.log 
  900  htop -u douglas
  901  cd  /proj/snic2019-35-58/water_strider/new_annotation
  902  ll
  903  cd braker_v2_rackham5
  904  ll
  905  cd braker/
  906  htop -u douglas
  907  ll
  908  tail braker.log 
  909  screen -ls
  910  cd /proj/snic2019-35-58/water_strider/new_annotation/
  911  ml
  912  cd /sw/bioinfo
  913  ll
  914  cd braker
  915  ll
  916  cat braker-2.1.5-20200826-cf958ec_install-README.md
  917  mshow braker
  918  TOOLÂ=braker
  919  TOOL=braker
  920  COMMIT=e98b812
  921  VERSION=2.1.5-20210115-$COMMIT
  922  makeroom.sh -f -s "annotation" -t "$TOOL" -v "$VERSION" -w "https://github.com/Gaius-Augustus/BRAKER" -l "Artistic" -d "pipeline for fully automated prediction of protein coding gene structures with GeneMark-ES/ET and AUGUSTUS in novel eukaryotic genomes"
  923  ll
  924  ./makeroom_braker_2.1.5-20210115-e98b812.sh 
  925  ll
  926  source SOURCEME_braker_2.1.5-20210115-e98b812
  927  mshow >> braker-2.1.5-20210115-e98b812_install-README.md
  928  mshow braker >> braker-2.1.5-20210115-e98b812_install-README.md
  929  mshow braker 2>> braker-2.1.5-20210115-e98b812_install-README.md
  930  vi braker-2.1.5-20210115-e98b812_install-README.md
  931  cd /sw/bioinfo
  932  TOOL=GUSHR; VERSION=1.0.0; makeroom.sh -f -t $TOOL -v $VERSION -c annotation -w https://github.com/Gaius-Augustus/GUSHR -l "GPL v3" -d "Assembly-free construction of UTRs from short read RNA-Seq data on the basis of coding sequence annotation"
  933  ./makeroom_GUSHR_1.0.0.sh 
  934  ll /sw
  935  ls -ltr
  936  rm -f makeroom_GUSHR_1.0.0.sh  irma bianca snowy
  937  TOOL=GUSHR; VERSION=1.0.0; makeroom.sh  -t $TOOL -v $VERSION -s annotation -w https://github.com/Gaius-Augustus/GUSHR -l "GPL v3" -d "Assembly-free construction of UTRs from short read RNA-Seq data on the basis of coding sequence annotation"
  938  ./makeroom_GUSHR_1.0.0.sh 
  939  cd GUSHR/
  940  ll
  941  source SOURCEME_GUSHR_1.0.0 
  942  vi GUSHR-1.0.0_post-install.sh 
  943  ll
  944  ll ../augustus/3.4.0/
  945  ls ../augustus/3.4.0/
  946  ls ../augustus/3.4.0/rackham
  947  mfshow augustus
  948  cd /sw/bioinfo/augustus/
  949  ll
  950  source SOURCEME_augustus_3.4.0
  951  cd 3.4.0/
  952  ll
  953  cd src/
  954  ll
  955  cd augustus-3.4.0/
  956  ll
  957  cd ../..
  958  ll
  959  cd ..
  960  ll
  961  cat augustus-3.3.3-CGP_install-README.md
  962  cd /sw/libs
  963  ll
  964  cd lpsolve/
  965  ll
  966  source SOURCEME_lpsolve_5.5.2.9 
  967  cd 5.5.2.9/
  968  ll
  969  cd rackham/
  970  ll
  971  ll /sw/mf/common/libraries/
  972  ll /sw/mf/common/libraries/lpsolve/
  973  ml lpsolve/5.5.2.9
  974  ml -lpsolve
  975  vi augustus-3.4.0_install-README.md
  976  mspid blas
  977  ll /sw/lib/blas
  978  ll /sw/libs/blas
  979  ll /sw/libs/blas/3.6.0/
  980  ll /sw/libs/blas/3.6.0/rackham/
  981  ll /sw/libs/blas/3.6.0/rackham/lib/
  982  ll /sw/libs/blas/3.6.0/rackham/include/
  983  ll
  984  cd 3.4.0/
  985  ll
  986  cd src/
  987  ll
  988  cd augustus-3.4.0/
  989  ll
  990  view Makefile 
  991  cd src/
  992  ll
  993  grep cholmd *
  994  grep chol *
  995  view Makefile 
  996  ll /usr/include/lpsolve
  997  echo $PREFIX
  998  cd /sw/libs
  999  ls
 1000  makeroom.sh
 1001  cd /sw/bioinfo/SACRA
 1002  ll
 1003  cd mf
 1004  ll
 1005  cat 1.0.0 
 1006  cd ..
 1007  ll
 1008  cd 1.0.0/
 1009  ll
 1010  cd rackham/
 1011  ll
 1012  cd scripts/
 1013  ll
 1014  head -n 1 *.pl
 1015  cd /sw/bioinfo/last
 1016  ll
 1017  cd 963/
 1018  ll
 1019  cd rackham/
 1020  ll
 1021  cd bin/
 1022  ll
 1023  head -n 1 *
 1024  dirs
 1025  cd /sw/bioinfo/SACRA/1.0.0/rackham/scripts
 1026  ll
 1027  head -n 1 *.pl
 1028  cd ..
 1029  ll
 1030  cd ../..
 1031  ll
 1032  cd ..
 1033  ll
 1034  ls -ltr
 1035  cd SeqKit/
 1036  ll
 1037  cd 0.15.0/
 1038  ll
 1039  cd rackham/
 1040  ll
 1041  file seqkit 
 1042  cd ../../..
 1043  cd GUSHR/
 1044  ll
 1045  cd 1.0.0/
 1046  ll
 1047  mfshow GUSHR
 1048  ll
 1049  cd rackham/
 1050  ll
 1051  cd ../src/
 1052  ll
 1053  ml git/2.28.0
 1054  git clone https://github.com/Gaius-Augustus/GUSHR
 1055  ll
 1056  cd GUSHR/
 1057  ll
 1058  grep jar gushr.py 
 1059  head gushr.py 
 1060  cd ..
 1061  rmdir $PREFIX
 1062  cd ../..
 1063  ll
 1064  source SOURCEME_GUSHR_1.0.0 
 1065  cd 1.0.0/src/
 1066  rmdir $PREFIX
 1067  mv GUSHR $PREFIX
 1068  cd $PREFIX
 1069  ll
 1070  mspid java
 1071  cd ../../mf
 1072  ll
 1073  vi 1.0.0 
 1074  ll
 1075  cd ..
 1076  ll
 1077  cd 1.0.0/
 1078  ll
 1079  cd rackham/
 1080  ll
 1081  cd ..
 1082  ll
 1083  history >> GUSHR-1.0.0_install-README.md
