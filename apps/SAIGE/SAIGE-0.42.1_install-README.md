SAIGE/0.42.1
========================

<https://github.com/weizhouUMICH/SAIGE>

Used under license:
GPL v3

Structure creating script (makeroom_SAIGE_0.42.1.sh) moved to /sw/apps/SAIGE/makeroom_0.42.1.sh

LOG
---

    TOOL=SAIGE
    VERSION=0.42.1
    CLUSTER=rackham
    TOOLDIR=/sw/apps/$TOOL
    VERSIONDIR=/sw/apps/$TOOL/$VERSION
    PREFIX=/sw/apps/$TOOL/$VERSION/$CLUSTER
    SRCDIR=/sw/apps/SAIGE/0.42.1/src
    /home/douglas/bin/makeroom.sh -t "SAIGE" -v "0.42.1" -c "apps" -w "https://github.com/weizhouUMICH/SAIGE" -l "GPL v3" -d "An R package with Scalable and Accurate Implementation of Generalized mixed model \(Chen\, H. et al. 2016\). It accounts for sample relatedness and is feasible for genetic association tests in large cohorts and biobanks \(N \> 400\,000\)."
    ./makeroom_SAIGE_0.42.1.sh
    cd /sw/apps/SAIGE/0.42.1/src
    wget http://
    tar xvf 
    make

  195  ./make_adapters.pl 
  196  vi make_adapters.pl
  197  ./make_adapters.pl > reported_adapters.conf
  198  cat reported_adapters.conf 
  199  vi make_adapters.pl
  200  ./make_adapters.pl > reported_adapters.conf
  201  cat reported_adapters.conf 
  202  ll
  203  cp /proj/snic2019-35-58/water_strider/scripts/reported_adapters.conf .
  204  ll
  205  cat complete-illumina-adapters-v4.conf reported_adapters.conf > all_adapters.conf
  206  rm rev.fa 
  207  ./detectAdapters.sh P16702_102_S1_L003_R1_001.fastq.gz P16702_102_S1_L003_R2_001.fastq.gz all_adapters.conf 500000 30
  208  swapd
  209  ll
  210  ./detectAdapters.sh P16702_102_S1_L003_R1_001.fastq.gz P16702_102_S1_L003_R2_001.fastq.gz all_adapters.conf 500000 30
  211  ./detectAdapters.sh P16702_103_S2_L003_R1_001.fastq.gz P16702_103_S2_L003_R2_001.fastq.gz  all_adapters.conf 500000 30
  212  ./cutadaptReportScript.sh *.cutReport
  213  swapd
  214  ll
  215  vi make_adapters.pl 
  216  vi detectAdapters.sh 
  217  ll
  218  ./make_adapters.pl > reported_adapters.conf
  219  cat reported_adapters.conf 
  220  swapd
  221  ll
  222  cp /proj/snic2019-35-58/water_strider/scripts/reported_adapters.conf .
  223  vi detectAdapters.sh 
  224  ll
  225  ./detectAdapters.sh P16702_102_S1_L003_R1_001.fastq.gz P16702_102_S1_L003_R2_001.fastq.gz all_adapters.conf 200000 30
  226  cat reported_adapters.conf 
  227  cat complete-illumina-adapters-v4.conf reported_adapters.conf > all_adapters.conf
  228  ./detectAdapters.sh P16702_102_S1_L003_R1_001.fastq.gz P16702_102_S1_L003_R2_001.fastq.gz all_adapters.conf 200000 30
  229  ./cutadaptReportScript.sh P16702_102_S1_L003_R1_001.cutReport
  230  ll
  231  less P16702_102_S1_L003_R1_001.cutReport
  232  ./cutadaptReportScript.sh P16702_102_S1_L003_R1_001.cutReport
  233  less P16702_102_S1_L003_R1_001.cutReport
  234  ./detectAdapters.sh P16702_103_S2_L003_R1_001.fastq.gz P16702_103_S2_L003_R2_001.fastq.gz  all_adapters.conf 200000 30
  235  view P16702_102_S1_L003_R1_001.cutReport
  236  swapd
  237  ll
  238  vi make_adapters.pl 
  239  ./make_adapters.pl > reported_adapters.conf
  240  swapd
  241  cp /proj/snic2019-35-58/water_strider/scripts/reported_adapters.conf .
  242  cat complete-illumina-adapters-v4.conf reported_adapters.conf > all_adapters.conf
  243  ./detectAdapters.sh P16702_102_S1_L003_R1_001.fastq.gz P16702_102_S1_L003_R2_001.fastq.gz all_adapters.conf 200000 30
  244  view P16702_103_S2_L003_R1_001.cutReport 
  245  ll
  246  ./cutadaptReportScript.sh P16702_102_S1_L003_R1_001.cutReport
  247  less P16702_102_S1_L003_R1_001.cutReport
  248  view P16702_102_S1_L003_R1_001.cutReport
  249  ./cutadaptReportScript.sh P16702_102_S1_L003_R1_001.cutReport
  250  vi cutadaptReportScript.sh 
  251  ll
  252  vi detectAdapters.sh 
  253  cp detectAdapters.sh cutadaptReportScript.sh ~/github-sync/local/bioinfo/scripts/
  254  swapd
  255  ll
  256  vi make_adapters.pl 
  257  ll
  258  ./make_adapters.pl > reported_adapters.conf
  259  swapd
  260  cp /proj/snic2019-35-58/water_strider/scripts/reported_adapters.conf .
  261  cat complete-illumina-adapters-v4.conf reported_adapters.conf > all_adapters.conf
  262  ./detectAdapters.sh P16702_102_S1_L003_R1_001.fastq.gz P16702_102_S1_L003_R2_001.fastq.gz all_adapters.conf 200000 30
  263  ll
  264  ./cutadaptReportScript.sh P16702_102_S1_L003_R1_001.cutReport
  265  ll
  266  cat P16702_103_S2_L003_R1_001.cutReport
  267  ./cutadaptReportScript.sh P16702_102_S1_L003_R1_001.cutReport P16702_103_S2_L003_R1_001.cutReport
  268  ./detectAdapters.sh P16702_103_S2_L003_R1_001.fastq.gz P16702_103_S2_L003_R2_001.fastq.gz all_adapters.conf 200000 30
  269  vi all_adapters.conf 
  270  swapd
  271  ll
  272  vi make_adapters.pl 
  273  ./make_adapters.pl > reported_adapters.conf
  274  swapd
  275  cp /proj/snic2019-35-58/water_strider/scripts/reported_adapters.conf .
  276  cat complete-illumina-adapters-v4.conf reported_adapters.conf > all_adapters.conf
  277  ./detectAdapters.sh P16702_103_S2_L003_R1_001.fastq.gz P16702_103_S2_L003_R2_001.fastq.gz all_adapters.conf 200000 30
  278  ll
  279  ln -s /proj/snic2019-35-58/water_strider/data/A.Husby_20_01_erigu_wingbud_RNAseq_rawdata/raw_data/P16702/P16702_104/02-FASTQ/200925_A00621_0278_AHGFK5DSXY/P16702_104_S3_L003_R* .
  280  ll
  281  ./detectAdapters.sh P16702_102_S1_L003_R1_001.fastq.gz P16702_102_S1_L003_R2_001.fastq.gz all_adapters.conf 200000 30
  282  ln -s /proj/snic2019-35-58/water_strider/data/A.Husby_20_01_erigu_wingbud_RNAseq_rawdata/raw_data/P16702/P16702_105/02-FASTQ/200925_A00621_0278_AHGFK5DSXY/P16702_105_S4_L003_R* .
  283  ll
  284  ln -s /proj/snic2019-35-58/water_strider/data/A.Husby_20_01_erigu_wingbud_RNAseq_rawdata/raw_data/P16702/P16702_106/02-FASTQ/200925_A00621_0278_AHGFK5DSXY/P16702_106_S5_L003_R* .
  285  ll
  286  ./cutadaptReportScript.sh P16702_102_S1_L003_R1_001.cutReport P16702_103_S2_L003_R1_001.cutReport
  287  ./detectAdapters.sh P16702_104_S3_L003_R1_001.fastq.gz P16702_104_S3_L003_R2_001.fastq.gz all_adapters.conf 200000 30
  288  ./detectAdapters.sh P16702_105_S4_L003_R1_001.fastq.gz P16702_105_S4_L003_R2_001.fastq.gz all_adapters.conf 200000 30
  289  ./detectAdapters.sh P16702_106_S5_L003_R1_001.fastq.gz P16702_106_S5_L003_R2_001.fastq.gz all_adapters.conf 200000 30
  290  ll
  291  rm -f *orig.cutReport
  292  ./cutadaptReportScript.sh *.cutReport
  293  grep Adapter_149_PCR_Primer1v2 *.conf
  294  swapd
  295  ll
  296  grep Primer *.conf
  297  vi make_adapters.pl 
  298  ./make_adapters.pl > reported_adapters.conf
  299  swapd
  300  cp /proj/snic2019-35-58/water_strider/scripts/reported_adapters.conf .
  301  ./detectAdapters.sh P16702_102_S1_L003_R1_001.fastq.gz P16702_102_S1_L003_R2_001.fastq.gz reported_adapters.conf 200000 30
  302  ll
  303  ./cutadaptReportScript.sh P16702_102_S1_L003_R1_001.cutReport
  304  ./detectAdapters.sh P16702_103_S2_L003_R1_001.fastq.gz P16702_103_S2_L003_R2_001.fastq.gz reported_adapters.conf 200000 30
  305  ./cutadaptReportScript.sh P16702_102_S1_L003_R1_001.cutReport P16702_103_S2_L003_R1_001.cutReport 
  306  swapd
  307  vi make_adapters.pl 
  308  ./make_adapters.pl > reported_adapters.conf
  309  swapd
  310  cp /proj/snic2019-35-58/water_strider/scripts/reported_adapters.conf .
  311  ./detectAdapters.sh P16702_102_S1_L003_R1_001.fastq.gz P16702_102_S1_L003_R2_001.fastq.gz reported_adapters.conf 200000 30
  312  ./detectAdapters.sh P16702_103_S2_L003_R1_001.fastq.gz P16702_103_S2_L003_R2_001.fastq.gz reported_adapters.conf 200000 30
  313  ./detectAdapters.sh P16702_104_S3_L003_R1_001.fastq.gz P16702_104_S3_L003_R2_001.fastq.gz reported_adapters.conf 200000 30
  314  ./detectAdapters.sh P16702_105_S4_L003_R1_001.fastq.gz P16702_105_S4_L003_R2_001.fastq.gz reported_adapters.conf 200000 30
  315  ./detectAdapters.sh P16702_106_S5_L003_R1_001.fastq.gz P16702_106_S5_L003_R2_001.fastq.gz reported_adapters.conf 200000 30
  316  ll
  317  ./cutadaptReportScript.sh *.cutReport
  318  swapd
  319  ll
  320  ll
  321  vi make_adapters.pl 
  322  ll
  323  ./make_adapters.pl 
  324  ll
  325  cat P16702_108_adapters.conf
  326  swapd
  327  ll
  328  cp $OLDPWD/P16702_*adapters.conf .
  329  ls
  330  ll
  331  swapd
  332  mv make_adapters.pl make_UD_adapters.pl
  333  ll
  334  dirs
  335  rm cutadaptReportScript.sh detectAdapters.sh 
  336  ll
  337  ls
  338  swapd
  339  ll
  340  cp detectAdapters.sh trimAdapters.sh
  341  ls /proj/snic2019-35-58/water_strider/data/A.Husby_20_01_erigu_wingbud_RNAseq_rawdata/raw_data/P16702/
  342  ll /proj/snic2019-35-58/water_strider/data/A.Husby_20_01_erigu_wingbud_RNAseq_rawdata/raw_data/P16702/P16702_103/02-FASTQ/200925_A00621_0278_AHGFK5DSXY/
  343  ll /proj/snic2019-35-58/water_strider/data/A.Husby_20_01_erigu_wingbud_RNAseq_rawdata/raw_data/P16702/P16702_103/02-FASTQ/*/
  344  ll /proj/snic2019-35-58/water_strider/data/A.Husby_20_01_erigu_wingbud_RNAseq_rawdata/raw_data/P16702/P16702_*/02-FASTQ/*/
  345  ll /proj/snic2019-35-58/water_strider/data/A.Husby_20_01_erigu_wingbud_RNAseq_rawdata/raw_data/P16702/P16702_*/02-FASTQ/*/*.fastq.gz
  346  ln -sf /proj/snic2019-35-58/water_strider/data/A.Husby_20_01_erigu_wingbud_RNAseq_rawdata/raw_data/P16702/P16702_*/02-FASTQ/*/*.fastq.gz .
  347  ll
  348  which pigz
  349  vi trimAdapters.sh 
  350  ll
  351  ./trimAdapters.sh P16702_201
  352  vi trimAdapters.sh 
  353  ll P16702_201_S46_L003_R1_001.fastq.gz
  354  ll -L P16702_201_S46_L003_R1_001.fastq.gz
  355  vi trimAdapters.sh 
  356  ./trimAdapters.sh P16702_201
  357  vi trimAdapters.sh 
  358  ./trimAdapters.sh P16702_201
  359  vi trimAdapters.sh 
  360  ./trimAdapters.sh P16702_201
  361  vi trimAdapters.sh 
  362  ./trimAdapters.sh P16702_201
  363  vi trimAdapters.sh 
  364  ./trimAdapters.sh P16702_201
  365  env | grep SLURM_
  366  exit
  367  interactive -A staff --qos=short -t 5:00 -n 7 
  368  vi trimAdapters.sh 
  369  ./trimAdapters.sh P16702_201
  370  vi trimAdapters.sh 
  371  ll
  372  ./trimAdapters.sh P16702_102
  373  ll
  374  vi trimAdapters.sh 
  375  ./trimAdapters.sh P16702_102
  376  vi trimAdapters.sh 
  377  ./trimAdapters.sh P16702_102
  378  ./trimAdapters.sh P16702_102 30
  379  vi trimAdapters.sh 
  380  ./trimAdapters.sh P16702_102 30
  381  vi trimAdapters.sh 
  382  ./trimAdapters.sh P16702_102 30
  383  vi trimAdapters.sh 
  384  ll
  385  ll *cutReport
  386  cat P16702_102.cutReport
  387  vi trimAdapters.sh 
  388  ll
  389  ls *adapters.conf
  390  ls *adapters.conf | cut -c1-10
  391  ls P*adapters.conf | cut -c1-10
  392  for L in $(ls P*adapters.conf | cut -c1-10) ; do sbatch ./trimAdapters.sh $L; done
  393  jiu
  394  ll
  395  scsv
  396  scs 15972986
  397  jiu
  398  scancel 15972986
  399  ./trimAdapters.sh P16702_201 30
  400  ll
  401  jiu
  402  scancel -u douglas
  403  jiu
  404  cat P16702_201.cutReport
  405  ml bioinfo-tools cutadapt/2.3
  406  cutadapt -b Duals_r1=AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -B Duals_r2=AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -b IDT_10nt_UD_039_i1=GATCGGAAGAGCACACGTCTGAACTCCAGTCACTAGGCGAATGATCTCGTATGCCGTCTTCTGCTTG -B IDT_10nt_UD_039_i2r=AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGTCCAGTGAGTGTAGATCTCGGTGGTCGCCGTATCATT --cores 30 --pair-filter=any --minimum-length=20 --output ./P16702_201_S46_L003_R1_001.trimmed.fastq.gz --paired-output ./P16702_201_S46_L003_R2_001.trimmed.fastq.gz P16702_201_S46_L003_R1_001.fastq.gz P16702_201_S46_L003_R2_001.fastq.gz
  407  ls -ltr
  408  rm -f *.tooshort.*
  409  ll P16702_201_S46_L003_R2_001.fastq.gz
  410  ll -L P16702_201_S46_L003_R2_001.fastq.gz
  411  vi trimAdapters.sh 
  412  for L in $(ls P*adapters.conf | cut -c1-10) ; do sbatch -J trim_$L -o $L.out ./trimAdapters.sh $L; done
  413  jiu
  414  scancel 15973042
  415  ./trimAdapters.sh P16702_201 30
  416  jiu
  417  ll P16702_147*
  418  ll ./P16702_201_S46_L003_R2_001.trimmed.fastq.gz
  419  ll P16702_201_S46_L003_R2_001.trimmed.fastq.gz
  420  ll P16702_201*
  421  less P16702_201.cutReport
  422  scancel 15973041
  423  jiu
  424  scu 15972997 timelimit=2:00:00
  425  jiu
  426  jiu | grep douglas
  427  jiu | grep douglas | cut -f1 -d' '
  428  for J in $(jiu | grep douglas | cut -f1 -d' ') ; do scu $J timelimit=2:00:00; done
  429  jiu
  430  ls -ltr
  431  jiu
  432  ls -ltr
  433  ll P16702_147*
  434  ll -L P16702_147*
  435  ll -L P16702_10[23]*
  436  ll -L P16702_147*
  437  ll -L P16702_10[23]*
  438  jiu
  439  ll -L P16702_10[234]*
  440  ll -L P16702_147*
  441  ll -L P16702_10[234]*
  442  jiu
  443  ll -L P16702_10[2-6]*
  444  ll -L P16702_147*
  445  ll -L P16702_10[2-6]*
  446  jiu
  447  ll -L P16702_147*
  448  ./trimAdapters.sh P16702_147 30
  449  jiu
  450  scancel 15973040
  451  ll -L P16702_146*
  452  ll P16702_146_adapters.conf
  453  cat P16702_146_adapters.conf
  454  ll P16702_147.cutReport
  455  view P16702_147.cutReport
  456  scancel -u douglas
  457  ./trimAdapters.sh P16702_146 30
  458  ll
  459  rm -f *.trimmed.*
  460  jiu
  461  ll
  462  cat detectAdapters.sh 
  463  ml
  464  ml
  465  cutadapt --help
  466  vi trimAdapters.sh 
  467  for L in $(ls P*adapters.conf | cut -c1-10) ; do sbatch -J trim_$L -o $L.out ./trimAdapters.sh $L; done
  468  ll *out
  469  jiu
  470  rm -f *.out
  471  ll
  472  jiu
  473  scancel -u douglas
  474  vi trimAdapters.sh 
  475  for L in $(ls P*adapters.conf | cut -c1-10) ; do sbatch -J trim_$L -o $L.out ./trimAdapters.sh $L; done
  476  jiu
  477  scancel 15973232
  478  ./trimAdapters.sh P16702_201 30
  479  scancel 15973230 15973231 
  480  scancel 15973224 15973225 15973226 15973227 15973228 15973229
  481  jiu
  482  ls -ltr
  483  rm -f P16702_201_S46_L003_R2_001.trimmed.fastq.gz P16702_201_S46_L003_R1_001.trimmed.fastq.gz
  484  ls -ltr
  485  rm -f P16702_201.cutReport
  486  jiu
  487  scancel 15973220 15973221 15973222 15973223
  488  for L in P16702_136 P16702_137 P16702_138 P16702_139 ; do ./trimAdapters.sh Â$L 10 ; done
  489  for L in P16702_136 P16702_137 P16702_138 P16702_139 ; do ./trimAdapters.sh $L 10 ; done
  490  for L in P16702_140 P16702_141 P16702_142 P16702_143 P16702_144 P16702_145 P16702_146 P16702_147 P16702_201 ; do ./trimAdapters.sh $L 20 ; done
  491  ll
  492  jiu
  493  ll *.cutReport
  494  ./cutadaptReportScript.sh P16702_102.cutReport P16702_102_*.cutReport
  495  rm -f *_001.cutReport
  496  ls *.cutReport
  497  ./cutadaptReportScript.sh *.cutReport
  498  ./cutadaptReportScript.sh *.cutReport | less2
  499  cat P16702_119.cutReport
  500  for L in $(ls P*adapters.conf | cut -c1-10) ; do echo $L ; done
  501  ll
  502  ll
  503  less P16702_201.cutReport
  504  man sed
  505  vi trimReport.sh
  506  chmod +x trimReport.sh 
  507  ./trimReport.sh P16702_201.cutReport 
  508  vi trimReport.sh
  509  ./trimReport.sh P16702_201.cutReport 
  510  ./trimReport.sh P16702_201
  511  vi trimReport.sh 
  512  ./trimReport.sh P16702_201
  513  vi trimReport.sh 
  514  ./trimReport.sh P16702_201
  515  vi trimReport.sh 
  516  ./trimReport.sh P16702_201
  517  vi trimReport.sh 
  518  less P16702_201.cutReport
  519  grep -P '^Pairs written \(passing filters\):' P16702_201.cutReport
  520  grep -P '^Pairs written \(passing filters\):' P16702_201.cutReport | sed 's/^Pairs written \(passing filters\):\s\+\([0-9,]\+\) (\([[0-9.%]\+\))/\1/' 
  521  grep -P '^Pairs written \(passing filters\):' P16702_201.cutReport | sed 's/^Pairs written (passing filters):\s\+\([0-9,]\+\) (\([[0-9.%]\+\))/\1/' 
  522  ./trimReport.sh P16702_201
  523  vi trimReport.sh 
  524  ./trimReport.sh P16702_201
  525  vi trimReport.sh 
  526  ./trimReport.sh P16702_201
  527  vi trimReport.sh 
  528  ./trimReport.sh 
  529  ./trimReport.sh ""
  530  vi trimReport.sh 
  531  ./trimReport.sh ""
  532  vi trimReport.sh 
  533  ll
  534  ./trimReport.sh 
  535  ./trimReport.sh P16702_201
  536  vi trimReport.sh 
  537  ./trimReport.sh P16702_201
  538  ./trimReport.sh 
  539  vi trimReport.sh 
  540  ./trimReport.sh 
  541  ./trimReport.sh P16702_201
  542  ./trimReport.sh ; for L in $(ls P*adapters.conf | cut -c1-10) ; do ./trimReport.sh $L ; done
  543  vi trimReport.sh 
  544  ./trimReport.sh ; for L in $(ls P*adapters.conf | cut -c1-10) ; do ./trimReport.sh $L ; done
  545  ./trimReport.sh ; for L in $(ls P*adapters.conf | cut -c1-10) ; do ./trimReport.sh $L ; done > trimReport.txt
  546  ( ./trimReport.sh ; for L in $(ls P*adapters.conf | cut -c1-10) ; do ./trimReport.sh $L ; done ) > trimReport.txt
  547  cat trimReport.txt 
  548  clear
  549  groups
  550  cd /proj/snic2019-35-58
  551  ll
  552  cd water_strider/
  553  ll
  554  cd cutadapt_trimmed/
  555  ll
  556  cd ..
  557  cd data
  558  ll
  559  cd A.Husby_20_01_erigu_wingbud_RNAseq_rawdata/
  560  ll
  561  cd raw_data/
  562  ll
  563  cd P16702/
  564  ll
  565  pushd .
  566  cd ..-..-..
  567  cd ../../..
  568  ll
  569  cd ..
  570  ll
  571  cd cutadapt_trimmed/
  572  ll
  573  cd new_data/
  574  ll
  575  view trimAdapters.sh
  576  cat P16702_201_adapters.conf
  577  cat P16702_147_adapters.conf
  578  view P16702_201.cutReport
  579  ll *.trimmed.fastq.gz
  580  less P16702_102_S1_L003_R1_001.trimmed.fastq.gz
  581  ll *.trimmed.fastq.gz
  582  less P16702_123_S21_L003_R1_001.trimmed.fastq.gz
  583  ll
  584  pushd .
  585  popd
  586  swapd
  587  ll
  588  cd 00-Reports/
  589  ll
  590  cat A.Husby_20_01_library_info.txt
  591  firefox A.Husby_20_01_project_summary.html &Â
  592  jobs
  593  ps -fu douglas | grep firefox
  594  killall firefox
  595  ps -fu douglas | grep firefox
  596  firefox A.Husby_20_01_project_summary.html &
  597  ll
  598  cat A.Husby_20_01_sample_info.txt
  599  dirs
  600  ll /proj/snic2019-35-58/water_strider/cutadapt_trimmed/new_data
  601  ll /proj/snic2019-35-58/water_strider/cutadapt_trimmed/new_data/*.txt
  602  cp A.Husby_20_01_sample_info.txt /proj/snic2019-35-58/water_strider/cutadapt_trimmed/new_data/
  603  swapd
  604  ll
  605  cd ..
  606  ll
  607  rm -f *.err *.out
  608  ll
  609  cd new_data/
  610  ll
  611  cat *sample*
  612  cat *sample* > link_samples.pl
  613  chmod +x link_samples.pl 
  614  vi link_samples.pl 
  615  ./link_samples.pl 
  616  vi link_samples.pl 
  617  ./link_samples.pl 
  618  ln -s $PWD/P16702_132*_R1_*.trimmed.fastq.gz Y3-12-2.R1.trimmed.fastq.gz
  619  ln -s $PWD/P16702_132*_R2_*.trimmed.fastq.gz Y3-12-2.R2.trimmed.fastq.gz
  620  ll *.R?.trimmed.fastq.gz
  621  mv *.R?.trimmed.fastq.gz ..
  622  cd ..
  623  ll
  624  ls -lL
  625  ./link_samples.pl | bash
  626  cd 
  627  cd -
  628  cd new_data/
  629  ./link_samples.pl | bash
  630  mv *.R?.trimmed.fastq.gz ..
  631  cd ..
  632  ll
  633  cd ..
  634  ll
  635  cd RNA-seq_data_analysis/
  636  ll
  637  cd ..
  638  cd new_annotation/
  639  ll
  640  cd RNAseq-alignments/
  641  ll
  642  cd ../..
  643  ll
  644  mkdir RNA-seq_wing_bud
  645  cd RNA-seq_wing_bud/
  646  ll ../new_annotation/
  647  ll ../new_annotation/RNAseq-alignments/
  648  ll ../new_annotation/RNAseq-alignments/STAR_index_masked_renamed/
  649  ln -s /proj/snic2019-35-58/water_strider/new_annotation/RNAseq-alignments/STAR_index_masked_renamed .
  650  ll
  651  mv ../STARmap.sh .
  652  ll
  653  ml vim
  654  gvim STARmap.sh 
  655  mkdir cutadapt_trimmed_reads
  656  cd cutadapt_trimmed_reads/
  657  cp -va ../../cutadapt_trimmed/*.trimmed.fastq.gz .
  658  ll
  659  ls
  660  ls -l
  661  ls Y8-12-2.R1.trimmed.fastq.gz
  662  less Y8-12-2.R1.trimmed.fastq.gz
  663  pushd .
  664  cd /proj/snic2019-35-58/water_strider/cutadapt_trimmed/new_data
  665  ll
  666  chmod -w *.trimmed.fastq.gz
  667  ll
  668  chmod -w /proj/snic2019-35-58/water_strider/cutadapt_trimmed/new_data
  669  dirs
  670  swapd
  671  ll
  672  cd ..
  673  ll
  674  ll cutadapt_trimmed_reads/
  675  less STARmap.sh 
  676  vi STARmap.sh 
  677  ./STARmap.sh A2-18-1
  678  ll
  679  cd A2-18-1
  680  ll
  681  cd ..
  682  rm -rf A2-18-1
  683  groups
  684  cd /proj/snic2019-35-58
  685  ll
  686  cd water_strider/RNA-seq_wing_bud/
  687  ml R_packages/4.0.0
  688  htop -u douglas
  689  dirs
  690  swapd
  691  ll
  692  cat A.Husby_20_01_sample_info.txt
  693  cut -f2 A.Husby_20_01_sample_info.txt 
  694  cut -f2 A.Husby_20_01_sample_info.txt  > samples.txt
  695  vi samples.txt 
  696  mv samples.txt ../../../../../RNA-seq_wing_bud/
  697  ll
  698  cd ..-..-..-..
  699  cd ../../../../
  700  ll
  701  cd ../
  702  cd RNA-seq_wing_bud/
  703  ll
  704  cd ..
  705  pushd .
  706  cd /sw/bioinfo/cactus/
  707  ll
  708  cp cactus-1.2.3_install-README.md to-run.md
  709  vi to-run.md 
  710  cd /proj/sllstore2017073/private/G4_proj/cactus/test_files
  711  cd uppmax
  712  mkdir test_files
  713  cd test
  714  cd test_files/
  715  ll
  716  cp /sw/bioinfo/cactus/to-run.md .
  717  jiu
  718  scancel 3101046
  719  ssh s134
  720  ssh s124
  721  screen -S mesos-controller
  722  ssh s175
  723  screen -R cactus100
  724  ssh s122
  725  ssh s122
  726  ssh s145
  727  ssh s122
  728  jiu julieb
  729  jobinfo -u julieb -M snowy
  730  echo $HOSTNAME
  731  vi to-run.md 
  732  ll
  733  ls -ld .
  734  ll /home/douglas/uppmax/test_files
  735  ll /home/douglas/uppmax/test_files/to-run.md
  736  exit
  737  ssh s122
  738  jobinfo -u julieb -M snowy
  739  dc
  740  jobinfo -u julieb -M snowy
  741  exit
  742  salloc -A staff --qos=short -M snowy -n 1 -p core -t 5:00
  743  salloc -A staff --qos=short -M snowy -n 1 -p core -t 5:00 --no-shell
  744  jobinfo -u douglas -M snowy
  745  jobinfo -u douglas -M snowy 3129270
  746  jobinfo -u douglas -M snowy -j 3129270
  747  jobinfo -u douglas -M snowy --job 3129270
  748  ll
  749  cd ..
  750  ll
  751  cd ..
  752  ll
  753  cd RNA-seq_wing_bud/
  754  ll
  755  jobinfo -u julieb -M snowy
  756  cd '/Users/douglasscofield/Dropbox/Calibre-library/Danny Peary/Cult Horror Movies (17481)/'
  757  R
  758  pushd .
  759  cd /sw/bioinfo/cactus
  760  ll
  761  fixup 1.2.3
  762  cat cactus-1.2.3_install-README.md
  763  ll /sw/bioinfo/cactus/1.2.3/snowy/cactus/bin
  764  cd mf
  765  ll
  766  vi 1.2.3
  767  jobinfo -u julieb -M snowy
  768  ps -fu julieb
  769  exit
  770  ssh s78
  771  exit
  772  ssh s75
  773  ml
  774  ml bioinfo-tools cactus/1.2.3
  775  echo $PATH
  776  which cactus
  777  ll /sw/bioinfo/cactus/1.2.3/rackham/cactus_env/bin
  778  ll /sw/bioinfo/cactus/1.2.3/rackham/cactus/bin
  779  ll
  780  mfshow cactus
  781  rsync -n -Pa * /sw/mf/common/bioinfo-tools/alignment/cactus/
  782  rsync  -Pa * /sw/mf/common/bioinfo-tools/alignment/cactus/
  783  ml -cactus
  784  ml cactus/1.2.3
  785  echo $PATH
  786  ml -cactus
  787  cd ..
  788  ll
  789  cat cactus-1.2.3_install-README.md
  790  ps -fu julieb
  791  module reload
  792  ml
  793  exit
  794  ssh s75
  795  ml
  796  ml cactus/1.2.3
  797  cd /sw/apps/nonmem/7.3.0/src
  798  ml
  799  cat ../../nonmem-7.3.0_install-README.md 
  800  ls
  801  rm -rf nm730CD/
  802  vi ../../nonmem-7.3.0_install-README.md
  803  ll
  804  cat ../../nonmem-7.3.0_install-README.md
  805   wget https://nonmem.iconplc.com/nonmem730/NONMEM${VERSION}.zip
  806      unzip -P gz952BqZX5 NONMEM${VERSION}.zip
  807      cd nm${SQUASHEDVERSION}CD
  808      module load gcc/8.3.0
  809  ll
  810      TOOLVERSION=7.3.0
  811    TOOL=nonmem
  812      VERSION=${TOOLVERSION}
  813      SQUASHEDVERSION=${TOOLVERSION//./}
  814      cd /sw/apps/nonmem
  815    source SOURCEME_nonmem_${VERSION}
  816      cd $VERSION/src
  817    unzip -P gz952BqZX5 NONMEM${VERSION}.zip
  818      cd nm${SQUASHEDVERSION}CD
  819      module load gcc/8.3.0
  820  cd /sw/apps/nonmem/
  821  ll
  822  cd licences/
  823  ll
  824  vi makelinks.sh 
  825  ll ../7.3.0/rackham/license/
  826  ll
  827  ./makelinks.sh 
  828  ./makelinks.sh $PWD/20200917-nonmem.lic
  829  rm ../7.3.0/rackham/license/nonmem.lic ../7.3.0/rackham/nonmem.lic 
  830  ./makelinks.sh $PWD/20200917-nonmem.lic
  831  cd /sw/data
  832  ll
  833  cd KGP/
  834  ll
  835  ll central/
  836  cd central/
  837  ll
  838  cd high/
  839  ll
  840  cd NA19443
  841  ll
  842  cd ..
  843  ll
  844      ./SETUP73 $PWD $PREFIX gfortran y ar same rec i
  845  wget ftp://ftp-trace.ncbi.nlm.nih.gov/1000genomes/ftp/1000G_2504_high_coverage/1000G_2504_high_coverage.sequence.index
  846  which pax
  847  man pax
  848  ls
  849  ll central/
  850  cd central/
  851  ll
  852  cd ..
  853  cd central/
  854  pax -rlpe . ../new
  855  pax -rwlpe . ../new
  856  mkdir ../new
  857  pax -rlpe . ../new
  858  pax --help
  859  pax -rlpe -s low ../new/
  860  pax -rwlpe -s low ../new/
  861  which -a pax
  862  pax -r -w -l -p "444"  low ../new/
  863  pax -r -w -l  low ../new/
  864  pax -rwl  low ../new/
  865  pax -rwlpe -s /low/new/  low ../new/
  866  cd ../new
  867  pax -rwlpe -s /low/new/  ../central/low .
  868  ll
  869  cd ..
  870  rmdir new
  871  ll
  872  fixup 1000G_2504_high_coverage.sequence.index
  873  ll
  874  chgrp kgp 1000G_2504_high_coverage.sequence.index
  875  ll
  876  vi cplink.sh
  877  ll
  878  dst=new
  879  src=central
  880  absolute_dst=$(umask 077 && mkdir -p -- "$dst" && cd -P -- "$dst" && pwd -P) && (cd -P -- "$src" && pax -rwlpe . "$absolute_dst")
  881  type pax
  882  pax -xhelp
  883  cd /sw/data/KGP
  884  ll
  885  ll new/
  886  cd h
  887  cd new/
  888  ll
  889  cd high/
  890  ll
  891  cd NA19118
  892  ll
  893  cd ../..
  894  ll
  895  absolute_dst=$(umask 077 && mkdir -p -- "$dst" && cd -P -- "$dst" && pwd -P) && (cd -P -- "$src" && find . | cpio -pl "$absolute_dst")
  896  absolute_dst=$(umask 077 && mkdir -p -- "$dst" && cd -P -- "$dst" && pwd -P) && (cd -P -- "$src" && find . | cpio -pl "$absolute_dst")
  897  ll
  898  rm -rf new
  899  vi cplink.sh 
  900  ll
  901  chmod +x cplink.sh 
  902  ./cplink.sh 
  903  ls -ld .
  904  ll
  905  cd /sw/data/KGP
  906  ll
  907  ll ./NA12760/NA12760.mapped.ILLUMINA.bwa.CEU.low_coverage.20120522.fq.gz
  908  cd central/
  909  ll
  910  cd low/
  911  ll
  912  ll ./NA12760/NA12760.mapped.ILLUMINA.bwa.CEU.low_coverage.20120522.fq.gz
  913  ll
  914  ./cplink.sh central/low new
  915  ll
  916  ll new/
  917  cd new/
  918  ll
  919  ls -R
  920  cd ./NA19375
  921  ll
  922  ls -li
  923  ls -li ../../central/low/NA19375/
  924  cd ..
  925  ll
  926  rm -rf new
  927  vi cplink.sh 
  928  ll
  929  fixup cplink.sh 
  930  ll
  931  chgrp ktp cplink.sh 
  932  ll
  933  chgrp kgp cplink.sh 
  934  ll
  935  ./cplink.sh $PWD/central/low new
  936  ll new
  937  rm -rf new
  938  ll
  939  pushd .
  940  ll /proj/snic2020-2-10/
  941  ll /proj/snic2020-2-10/1000g
  942  ll
  943  mkdir -p 1000G_2504_high_coverage/data
  944  cd 1000G_2504_high_coverage/
  945  ll
  946  mv ../1000G_2504_high_coverage.sequence.index .
  947  ll
  948  00542
  949  ll 1000G_2504_high_coverage.sequence.index
  950  less 1000G_2504_high_coverage.sequence.index
  951  ll
  952  ll /crex/data/KGP/1000G_2504_high_coverage/data/./HG04183.final.cram
  953  ll /proj/snic2020-2-10/1000g/HG04183.final.cram
  954  rm /crex/data/KGP/1000G_2504_high_coverage/data/./HG04183.final.cram
  955  ll
  956  screen -S 1000g
  957  screen -R 1000g
  958  screen -ls
  959  screen -R 1000g
  960  cd /sw/data/
  961  ll
  962  cd KGP/
  963  ll
  964  cd 1000G_2504_high_coverage/
  965  ll
  966  ml vim
  967  vim dist.pl
  968  gvim dist.pl &
  969  ll
  970  head 1000G_2504_high_coverage.sequence.index 
  971  head -n 100 1000G_2504_high_coverage.sequence.index 
  972  ll
  973  md5sum dist.pl 
  974  md5sum dist.pl | od -c
  975  ll
  976  tail 1000G_2504_high_coverage.sequence.index 
  977  cd data/
  978  df -kh .
  979  ll
  980  cd 1000g/
  981  ll
  982  screen -ls
  983  screen -R 1000g
  984  ll
  985  ls
  986  cd ../..
  987  ll
  988  chmod +x dist.pl 
  989  ./dist.pl 
  990  dirs
  991  pushd .
  992  dirs
  993  cd /proj/snic2020-2-10/1000g
  994  ll
  995  swapd
  996  ll
  997  grep HG00096.final.cram 1000G_2504_high_coverage.sequence.index 
  998  screen -R 1000g
  999  ll
 1000  du.
 1001  cd /sw/apps/R_packages/
 1002  ll
 1003  ml vim
 1004  vim R_packages-4.0.0_install-README.md 
 1005  gvim R_packages-4.0.0_install-README.md 
 1006  cat R_packages-4.0.0_install-README.md
 1007    VERSION=4.0.0
 1008      CLUSTER=${CLUSTER?:For some reason, CLUSTER is not set}
 1009      cd /sw/apps
 1010      mkdir -p R_packages
 1011      cd R_packages/
 1012      mkdir -p $VERSION
 1013      mkdir -p mf
 1014      cd $VERSION
 1015      mkdir $CLUSTER
 1016      [[ "$CLUSTER" == "rackham" ]] && for CL in irma bianca snowy ; do test -L $CL || ln -s $CLUSTER $CL; done
 1017      cd $CLUSTER/
 1018      export R_LIBS_USER=$PWD
 1019      module load R/$VERSION
 1020      module load autoconf/2.69
 1021      module load automake/1.14.1
 1022      module load cmake/3.13.2    # some packages require a newish cmake
 1023      module load m4/1.4.17
 1024      module load MariaDB/10.1.29
 1025      module load PostgreSQL/10.3
 1026      module load UDUNITS/2.2.26  # these further modules were added
 1027      module load GDAL/3.1.0
 1028      module load PROJ/6.3.2
 1029      module load Poppler/0.75.0
 1030      module load JAGS/4.3.0
 1031      module load gsl/2.6
 1032      module load libcurl/7.45.0   # there is a bug in the most recent libcurl preventing the 'curl' package from getting build
 1033      echo -e "\nThis should have been set to the appropriate directory in this module, is it?\n\nR_LIBS_USER = $R_LIBS_USER\n"
 1034  R
 1035  cd ../../..
 1036  ll
 1037  cd R_packages/
 1038  ll
 1039  cd 4.0.0/
 1040  ll
 1041  cd rackham/
 1042  ll
 1043  ls SAIGEgds/DESCRIPTION 
 1044  cat SAIGEgds/DESCRIPTION 
 1045  mv SAIGE ../
 1046  ll
 1047  cd ..
 1048  ll
 1049  R
 1050  mv SAIGE SAIGE_removed_to_own_module
 1051  cd ../..
 1052  ll
 1053  makeroom.sh
 1054  makeroom.sh -t SAIGE -v 0.42.1 -c apps -w https://github.com/weizhouUMICH/SAIGE -l "GPL v3" -d "An R package with Scalable and Accurate Implementation of Generalized mixed model (Chen, H. et al. 2016). It accounts for sample relatedness and is feasible for genetic association tests in large cohorts and biobanks (N > 400,000)."
 1055  ./makeroom_SAIGE_0.42.1.sh 
 1056  cd SAIGE/
 1057  ll
 1058  source SOURCEME_SAIGE_0.42.1 
 1059  vi SAIGE-0.42.1_post-install.sh 
 1060  ll
 1061  cat ../R_packages/mf/4.0.0 
 1062  cd mf
 1063  ll
 1064  vi 0.42.1 
 1065  pushd .
 1066  cd /sw/mf/common/bioinfo-tools/
 1067  ll
 1068  cd misc/
 1069  ll
 1070  grep is-loaded */*
 1071  catm vep/89
 1072  cat vep/89
 1073  dirs
 1074  swapd
 1075  ll
 1076  vi 0.42.1 
 1077  cat lfqc/1.1
 1078  cat /sw/mf/common/bioinfo/lfqc/1.1
 1079  cat /sw/mf/common/bioinfo-tools/lfqc/1.1
 1080  cat /sw/mf/common/bioinfo-tools/misc/lfqc/1.1
 1081  vi 0.42.1 
 1082  ll
 1083  cd ..
 1084  ll
 1085  echo $PREFIX
 1086  ll
 1087  cd 0.42.1/
 1088  ll
 1089  cd rackham/
 1090  ll
 1091  export R_LIBS_USER=$PWD
 1092  module load R/4.0.0
 1093  ml
 1094  ml purge
 1095  ml uppmax
 1096  ml vim/8.1-1053
 1097  ml R/4.0.0
 1098  ml
 1099  ml autoconf/2.69 automake/1.14.1 cmake/3.13.2 m4/1.4.17 
 1100  ml
 1101  mspid openblas
 1102  ml openblas/0.2.20
 1103  ml
 1104  ll
 1105  cd ..
 1106  ll
 1107  cd src/
 1108  ll
 1109  ml
 1110  ml cmake/3.17.3
 1111  ml
 1112  ml git
 1113  ml
 1114  git clone --depth 1 -b $VERSION https://github.com/weizhouUMICH/SAIGE
 1115  git clone --depth 1 -b 0.42 https://github.com/weizhouUMICH/SAIGE
 1116  git clone --depth 1  https://github.com/weizhouUMICH/SAIGE
 1117  ll
 1118  which R
 1119  echo $_LIBS_USER
 1120  echo $PREFIX
 1121  echo $R_LIBS_USER
 1122  R CMD INSTALL SAIGE
 1123  R CMD INSTALL --help
 1124  R
 1125  ll ../rackham/
 1126  R CMD INSTALL --help
 1127  R CMD INSTALL SAIGE
 1128  R
 1129  ll
 1130  mkdir external_tarballs
 1131  cd external_tarballs/
 1132  wget https://cran.r-project.org/src/contrib/Archive/MetaSKAT/MetaSKAT_0.80.tar.gz
 1133  R CMD INSTALL MetaSKAT_0.80.tar.gz 
 1134  ll $PREFIX
 1135  cd ..
 1136  ll
 1137  R CMD INSTALL SAIGE
 1138  ml python/3.7.2
 1139  R CMD INSTALL SAIGE
 1140  ll /sw/apps/SAIGE/0.42.1/src/SAIGE/thirdParty/bgen/wscript 
 1141  less /sw/apps/SAIGE/0.42.1/src/SAIGE/thirdParty/bgen/wscript 
 1142  ml python/2.7.15
 1143  rm -rf SAIGE
 1144  git clone --depth 1  https://github.com/weizhouUMICH/SAIGE
 1145  R CMD INSTALL SAIGE
 1146  ml python/3.7.2
 1147  R CMD INSTALL SAIGE
 1148  ml python/2.7.15
 1149  R CMD INSTALL SAIGE
 1150  ml python3/3.7.2
 1151  ll /sw/mf/common/compilers/python3/python3-rpath.tcl 
 1152  vi /sw/mf/common/compilers/python3/python3-rpath.tcl 
 1153  ml python3/3.7.2
 1154  which python2
 1155  which python3
 1156  R CMD INSTALL SAIGE
 1157  ldd /sw/apps/SAIGE/0.42.1/rackham/00LOCK-SAIGE/00new/SAIGE/libs/SAIGE.so
 1158  ml
 1159  strings /sw/libs/openblas/0.2.20/rackham/lib/libopenblas.so | grep sgecon
 1160  echo $LD_RUN_PATH
 1161  ll /sw/apps/SAIGE/0.42.1/rackham/
 1162  echo $LD_LIBRARY_PATH
 1163  cd SAIGE/
 1164  ll
 1165  ll conda_env/
 1166  cd build/
 1167  ll
 1168  cd ..
 1169  ll thirdParty/
 1170  cd thirdParty/
 1171  cat requirements.txt 
 1172  cat readme 
 1173  cd ..
 1174  ll
 1175  vi configure 
 1176  ll
 1177  cd src
 1178  ls
 1179  ll
 1180  ldd SAIGE.so 
 1181  vi Makevars
 1182  ll /sw/libs/openblas/0.2.20/rackham/lib
 1183  vi Makevars
 1184  ll
 1185  rm SAIGE.so 
 1186  R CMD INSTALL SAIGE
 1187  ll
 1188  cd ../..
 1189  ll
 1190  R CMD INSTALL SAIGE
 1191  l
 1192  cd ../..
 1193  ll
 1194  history >> SAIGE-0.42.1_install-README.md
