   36  cd pilot-SNP-calling
   37  ll
   38  less process_sample_SE_80k.sh
   39  screen -ls
   40  screen -R 23937.compress
   41  ll
   42  ll 80k-SNP-calls/
   43  ll
   44  ll viafull-SNP-calls/
   45  ll
   46  cd ..
   47  ll
   48  cd pilot-data-mapping
   49  ll
   50  cat slurm-6941307.out
   51  cat slurm-6941361.out
   52  ll
   53  ll viafull-UME_081101_P01_WE10-to-probes_RG_0801-pilot_scaffolds
   54  ll viafull-UME_081101_P01_WA01-to-probes_RG_0801-pilot_scaffolds
   55  module list
   56  module load R_packages/3.3.2
   57  cd /proj/b2010042/nobackup/linkage-map/probe-evaluation-paper/pilot-data-mapping
   58  ll
   59  ll *.bed
   60  cd ..
   61  ll
   62  ll scripts/
   63  ll pilot-SNP-calling/
   64  screen -ls
   65  module load bioinfo-tools
   66  ll
   67  rm -f *.idx
   68  ll
   69  module load bioinfo-tools
   70  module load tabix
   71  for F in *.vcf ; do echo "$F" && bgzip "$F" && echo "tabix" && tabix -p vcf "$F.gz"; done
   72  ll
   73  exit
   74  screen -R 23937.compress
   75  screen -R 28896.compress2
   76  ll
   77  find . -name '*.bed'
   78  less ./reference/probes_RG_0801-pilot.bed
   79  screen -ls
   80  screen -R 28896.compress2
   81  R
   82  ll
   83  htop -u douglas
   84  mkdir UME_081101
   85  cd UME_081101/
   86  ll
   87  pushd .
   88  cd /proj/b2010042/nobackup/linkage-map/
   89  ll
   90  cd diploid-evaluation/
   91  ll
   92  ll viafull-SNP-calls/
   93  cd ..
   94  ll alt80k-alignments
   95  pushd .
   96  cd ../
   97  ll
   98  cd ..
   99  ll
  100  ll amaryllis/
  101  ll linkage-map/
  102  ll linkage-map/new-SNP-calling/
  103  cd linkage-map/new-SNP-calling/
  104  ll
  105  du.
  106  screen -lks
  107  screen -ls
  108  ll viafull-alignments
  109  cdf ..
  110  cd ..
  111  ll
  112  ll megagam-evaluation
  113  ll diploid-evaluation/
  114  cd ..
  115  ll
  116  screen -R 59933.probe
  117  cd douglas/probe-paper-BAM/
  118  ll
  119  cd UME_081101/
  120  mkdir alt80k-SNP-calls
  121  mkdir alt80k-alignments
  122  mkdir altfull-SNP-calls
  123  mkdir altfull-alignments
  124  ll ../beds
  125  ll
  126  cd alt80k-SNP-calls/
  127  ll
  128  ll ../../alt80k-SNP-calls/
  129  pushd .
  130  cd ../..
  131  ll
  132  diff site-profile.R site-profile-40k.R
  133  vi site-profile-full.R
  134  vi site-profile-utils.R
  135  mv site-profile.R site-profile-funcs.R
  136  vi site-profile-funcs.R 
  137  vi site-profile-40k.R
  138  vi site-profile-funcs.R 
  139  vi site-profile-utils.R 
  140  vi site-profile-funcs.R 
  141  vi site-profile-utils.R 
  142  vi site-profile-full.R
  143  ll
  144  module list
  145  vi sgdp.pl 
  146  ll
  147  cp sgdp.pl sgdp_Feb2017.pl
  148  R --vanilla
  149  ll
  150  vi site-profile-full.R
  151  which vi
  152  which gvim
  153  gvim site-profile-full.R 
  154  fg
  155  ll
  156  mydiff -y site-profile-80k.R site-profile-full.R | less
  157  cp site-profile-full.R site-profile-80k.R
  158  vi site-profile-80k.R
  159  cp site-profile-full.R site-profile-40k.R
  160  vi site-profile-40k.R
  161  ll
  162  ll *.sh
  163  vi scr*sh
  164  cat script-full.sh
  165  vi script-40k.sh
  166  bash -n script-40k.sh 
  167  vi script-40k.sh
  168  rm script-80k.sh 
  169  rm script-full.sh 
  170  ln -s script-40k.sh script-80k.sh
  171  ln -s script-40k.sh script-full.sh
  172  ll
  173  vi script-40k.sh 
  174  ./script-40k.sh 
  175  ./script-80k.sh 
  176  ./script-full.sh 
  177  vi script-40k.sh 
  178  ./script-40k.sh 
  179  vi script-40k.sh 
  180  ./script-40k.sh 
  181  vi script-40k.sh 
  182  ./script-40k.sh 
  183  vi script-40k.sh 
  184  ./script-40k.sh 
  185  dirs
  186  type projinfo
  187  uquota
  188  uquota -h
  189  screen -R 28896.compress2
  190  module list
  191  module unload vep
  192  module load bioinfo-tools
  193  module list
  194  module unload perl_modules
  195  module list
  196  ll
  197  cd private/
  198  ll
  199  cd sRNA-expression/
  200  ll
  201  cd ..
  202  ll
  203  cd sRNA-SS-expression/
  204  ll
  205  lla
  206  find . -name table_SS_chromonly.DESeq.order.hist.png
  207  cat table_SS_DESeq.R 
  208  ll *.R
  209  module spider packages
  210  ll
  211  ll *txt
  212  cat table_SS_chromonly.meta.txt
  213  ll *.sh
  214  cat make_table.sh 
  215  ll table*
  216  less table_SS.txt
  217  view make_table.sh 
  218  ll *.sh
  219  less make_bed.sh 
  220  ll *.sh
  221  \view *.sh
  222  view *.sh
  223  cat table_SS_chromonly.DESeq.20160627_0813.log
  224  ll
  225  view *.sh
  226  cd ..
  227  ll
  228  cd sRNA-ShortStack/
  229  ll
  230  cd ..
  231  ll
  232  cd sRNA-SS-expression
  233  ll
  234  cd ../sRNA-ShortStack/
  235  ll
  236  vi ShortStack.sh
  237  module load vim
  238  gvim ShortStack.sh 
  239  vi ShortStack.sh
  240  cat ShortStack.sh 
  241  ll
  242  cd ShortStack_Ha_1.0rpm
  243  ll
  244  cat Log.txt
  245  ll
  246  less Results.txt
  247  less ShortStack_All.gff3
  248  cat ShortStack_N.gff3
  249  cd MIRNAs
  250  ll
  251  cd ..
  252  ll
  253  cd MIRNAs/
  254  ll
  255  ll | wc -l
  256  less Cluster_829_Y.txt
  257  cd ..
  258  ll
  259  less Counts.txt
  260  less2 Counts.txt 
  261  cd ..
  262  ll
  263  ll *.sh
  264  cd ..
  265  cd sRNA-SS-expression/
  266  ll
  267  ll *.sh
  268  cat make_bed.sh 
  269  cat make_table.sh 
  270  view make_table.sh 
  271  ls
  272  less SS_Ha_merged_alignments_05Ha_20-24.bam
  273  samtools view SS_Ha_merged_alignments_05Ha_20-24.bam | less2
  274  less2 SS_Ha_merged_alignments_05Ha_20-24.bed.bz2
  275  ll *.sh
  276  less make_bed.sh
  277  view make_bed.sh
  278  view make_table.sh
  279  ll table*
  280  less2 table_SS_chromonly.txt
  281  less2 table_SS_chromonly.meta.txt
  282  view table_SS_DESeq.R
  283  eog *.png
  284  bg
  285  view table_SS_DESeq.R
  286  cd ..
  287  ll
  288  cd sRNA-ShortStack
  289  ll
  290  cat ShortStack.sh
  291  module load bioinfo-tools
  292  module load ShortStack/3.4
  293  ShortStack --help
  294  ll
  295  view ShortStack_mincov.sh
  296  cat slurm-10321266.out
  297  cat slurm-8054951.out
  298  ll
  299  cat ShortStack_mm2.sh
  300  grep -A 2 'At specified mincov' slurm*
  301  ll
  302  ll ShortStack_Ha_0.1rpm_mm2
  303  less ShortStack_mm2.sh
  304  ll ShortStack_Ha_0.1rpm
  305  cd ShortStack_Ha_0.1rpm_mm2
  306  ll
  307  less Results.txt
  308  less2 Results.txt
  309  cd MIRNAs/
  310  ll
  311  less Cluster_66945_Y.txt
  312  cd ..
  313  grep Cluster_66945 Results.txt 
  314  grep Cluster_66945 *gff*
  315  ll
  316  cat ShortStack_N.gff3
  317  less ShortStack_D.gff3
  318  less ShortStack_All.gff3
  319  less Counts.txt
  320  cd ..
  321  ll
  322  cat ss.log 
  323  cd ..
  324  ll
  325  ll sRNA-bedifying
  326  ll
  327  cd sRNA-SS-expression/
  328  ll
  329  ll *.sh
  330  ll *.pl
  331  cat make_bed.sh
  332  ll SS_Lb_merged_alignments_27Lb_20-24.bam
  333  ll SS_Lb_merged_alignments_27Lb_20-24.*
  334  ll -L SS_Lb_merged_alignments_27Lb_20-24.*
  335  ll *sh
  336  view make_table.sh
  337  ll table_SS.txt
  338  less2 table_SS.txt
  339  ll table*
  340  less table_SS_chromonly.txt
  341  less2 table_SS_chromonly.txt
  342  type less2
  343  less2 table_SS_chromonly.txt
  344  cat table_SS_chromonly.meta.txt
  345  head -n 1 table_SS_chromonly.txt
  346  ll
  347  view table_SS_DESeq.R
  348  module load R/3.3.2
  349  module load R_packages/3.3.2
  350  module unload R_packages R
  351  module list
  352  module load R_packages/3.3.2
  353  module list
  354  R
  355  view table_SS_DESeq.R
  356  ll *07*bam
  357  ll *07H*bam
  358  ll *H[ab]*bam
  359  ls -1 *H[ab]*bam
  360  ll *meta*
  361  cat table_SS_chromonly.meta.txt
  362  ll table_SS*
  363  less table_SS_chromonly.txt
  364  less2 table_SS_chromonly.txt
  365  exit
  366  module load bioinfo-tools
  367  find . -name '*.nin'
  368  spudh .
  369  cd ./Martin/archy_itsx_db
  370  ll
  371  ll source_files/
  372  cd ../..
  373  ll ./Archy-blast-databases
  374  cd /proj/b2013211/Martin/archy_itsx_db
  375  ll
  376  cd source_files/
  377  ll
  378  cat mothur.1440503136.logfile
  379  ll
  380  cat archy.original.ref.ITSx.fasta.summary.txt
  381  less archy.original.ref.ITSx.fasta.positions.txt
  382  dirs
  383  pushd .
  384  cd ../..
  385  cd ..
  386  ll
  387  cd Archy-blast-databases/
  388  ll
  389  pushd .
  390  B=$PWD
  391  B=$PWD/Archy.fasta
  392  echo $B
  393  cd ../nobackup/
  394  ll
  395  cd shadi/
  396  ll
  397  cd Archy-Pacbio/
  398  ll
  399  less pb_351-1_RoI_09_ITSx_all_.2017-01-05_13.09.full.fasta
  400  head pb_351_complete-amplicons_fungi.readnames.txt
  401  cat pb_351-1_RoI_??_ITSx_fungi_*.full.fasta > pb_351-1_RoI_fungi.full.fasta
  402  source ~/.complete
  403  groups
  404  module load bioinfo-tools
  405  extractFasta
  406  module load BioPerlBioPerl/1.6.924_Perl5.18.4
  407  module load BioPerl/1.6.924_Perl5.18.4
  408  extractFasta
  409  head pb_351_complete-amplicons_fungi.readnames.txt
  410  cp ~/bin/extractFasta .
  411  ./extractFasta 
  412  module list
  413  extractFasta -fn pb_351_complete-amplicons_fungi.readnames.txt -i pb_351-1_RoI_fungi.full.fasta -o pb_351-1_RoI_fungi.full.complete.fasta
  414  wc -l pb_351_complete-amplicons_fungi.readnames.txt
  415  less pb_351-1_RoI_fungi.full.complete.fasta
  416  fastalength pb_351-1_RoI_fungi.full.complete.fasta | head
  417  module load ITSx
  418  ITSx -help
  419  ITSx --help
  420  ./extractFasta -fn pb_351_complete-amplicons_fungi.readnames.txt -i pb_351-1_RoI.fasta -o pb_351-1_RoI.complete.fasta
  421  fastalength pb_351-1_RoI.complete.fasta
  422  module spider blast
  423  module load blast/2.5.0+
  424  blastn -help
  425  blastn -num_threads 8 -db $B -query <(head -n 5 pb_351-1_RoI.complete.fasta) -perc_identity 99 -qcov_hsp_perc 98 
  426  blastn -num_threads 8 -db $B -query <(head -n 50 pb_351-1_RoI.complete.fasta) -perc_identity 99 -qcov_hsp_perc 98 
  427  blastn -num_threads 8 -db $B -query <(head -n 50 pb_351-1_RoI.complete.fasta) -perc_identity 99 -qcov_hsp_perc 98 -outfm 6
  428  blastn -num_threads 8 -db $B -query <(head -n 50 pb_351-1_RoI.complete.fasta) -perc_identity 99 -qcov_hsp_perc 98 -outfmt 6
  429  blastn -num_threads 8 -db $B -query <(head -n 500 pb_351-1_RoI.complete.fasta) -perc_identity 99 -qcov_hsp_perc 98 -outfmt 6
  430  blastn -num_threads 8 -db $B -query <(head -n 5000 pb_351-1_RoI.complete.fasta) -perc_identity 99 -qcov_hsp_perc 98 -outfmt 6
  431  blastn -num_threads 8 -db $B -query pb_351-1_RoI.complete.fasta -perc_identity 99 -qcov_hsp_perc 98 -outfmt 6 | cut -f2 | table
  432  pushd .
  433  popd
  434  swapd
  435  ll
  436  makeblastdb -help
  437  makeblastdb -in ArcBore.fasta -parse_seqids -dbtype nucl 
  438  makeblastdb -in ArcFinl.fasta -parse_seqids -dbtype nucl 
  439  ll
  440  AB=$PWD/ArcBore.fasta
  441  AF=$PWD/ArcFinl.fasta
  442  swapd
  443  blastn -num_threads 8 -db $AB -query <(head -n 50 pb_351-1_RoI.complete.fasta) -perc_identity 99 -qcov_hsp_perc 98 -outfmt 6
  444  blastn -num_threads 8 -db $AB -query <(head -n 500 pb_351-1_RoI.complete.fasta) -perc_identity 99 -qcov_hsp_perc 98 -outfmt 6
  445  blastn -num_threads 8 -db $AB -query <(head -n 500 pb_351-1_RoI.complete.fasta) -perc_identity 99 -qcov_hsp_perc 90 -outfmt 6
  446  blastn -num_threads 8 -db $AB -query <(head -n 500 pb_351-1_RoI.complete.fasta) -perc_identity 99 -qcov_hsp_perc 50 -outfmt 6
  447  blastn -num_threads 8 -db $AB -query <(head -n 500 pb_351-1_RoI.complete.fasta) -perc_identity 98 -qcov_hsp_perc 98 -outfmt 6
  448  blastn -num_threads 8 -db $AB -query <(head -n 500 pb_351-1_RoI.complete.fasta) -perc_identity 97 -qcov_hsp_perc 98 -outfmt 6
  449  blastn -num_threads 8 -db $AB -query <(head -n 500 pb_351-1_RoI.complete.fasta) -perc_identity 90 -qcov_hsp_perc 98 -outfmt 6
  450  blastn -num_threads 8 -db $AB -query <(head -n 100 pb_351-1_RoI.complete.fasta) -perc_identity 90 -qcov_hsp_perc 98
  451  blastn -num_threads 8 -db $AB -query <(head -n 5000 pb_351-1_RoI.complete.fasta) -perc_identity 90 -qcov_hsp_perc 98 -outfmt 6
  452  cat pb_351-1_RoI_??_ITSx_fungi_*.ITS1.fasta > pb_351-1_RoI_fungi.ITS2.fasta
  453  ./extractFasta -fn pb_351_complete-amplicons_fungi.readnames.txt -i pb_351-1_RoI_fungi.ITS2.fasta -o pb_351-1_RoI_fungi.ITS2.complete.fasta
  454  blastn -num_threads 8 -db $B -query <(head -n 500 pb_351-1_RoI_fungi.ITS2.complete.fasta) -perc_identity 99 -qcov_hsp_perc 98 -outfmt 6
  455  blastn -num_threads 8 -db $B -query <(head -n 50 pb_351-1_RoI_fungi.ITS2.complete.fasta) -perc_identity 95 -qcov_hsp_perc 98 -outfmt 6
  456  blastn -num_threads 8 -db $B -query <(head -n 50 pb_351-1_RoI_fungi.ITS2.complete.fasta) -perc_identity 90 -qcov_hsp_perc 98 -outfmt 6
  457  blastn -num_threads 8 -db $B -query <(head -n 50 pb_351-1_RoI_fungi.ITS2.complete.fasta) -perc_identity 80 -qcov_hsp_perc 98 -outfmt 6
  458  blastn -num_threads 8 -db $B -query <(head -n 50 pb_351-1_RoI_fungi.ITS2.complete.fasta) -perc_identity 70 -qcov_hsp_perc 98 -outfmt 6
  459  blastn -num_threads 8 -db $B -query <(head -n 50 pb_351-1_RoI_fungi.ITS2.complete.fasta) -perc_identity 70  -outfmt 6
  460  blastn -num_threads 8 -db $AB -query <(head -n 50 pb_351-1_RoI_fungi.ITS2.complete.fasta) -perc_identity 70  -outfmt 6
  461  blastn -num_threads 8 -db $AB -query <(head -n 500 pb_351-1_RoI_fungi.ITS2.complete.fasta) -perc_identity 70  -outfmt 6
  462  blastn -num_threads 8 -db $AB -query <(head -n 500 pb_351-1_RoI_fungi.ITS2.complete.fasta) -perc_identity 50  -outfmt 6
  463  blastn -num_threads 8 -db $AB -query <(head -n 5000 pb_351-1_RoI_fungi.ITS2.complete.fasta) -perc_identity 50  -outfmt 6
  464  blastn -num_threads 8 -db $AB -query <(head -n 5000 pb_351-1_RoI_fungi.ITS2.complete.fasta) -perc_identity 20  -outfmt 6
  465  blastn -num_threads 8 -db $AB -query <(head -n 5000 pb_351-1_RoI_fungi.ITS2.complete.fasta)  -outfmt 6
  466  ll pipeline.sh 
  467  view pipeline.sh 
  468  cd ../AM-Pacbio/
  469  ll
  470  cd ../Archy-Pacbio/
  471  view pipeline.sh 
  472  dirs
  473  pushd +2
  474  ll
  475  less archy.original.ref.fasta 
  476  less archy.original.ref.ITSx.fasta.positions.txt
  477  cd ..
  478  ll
  479  MA=/proj/b2013211/Martin/archy_itsx_db/archy_itsx_db
  480  dirs
  481  swapd
  482  blastn -num_threads 8 -db $MA -query <(head -n 500 pb_351-1_RoI_fungi.ITS2.complete.fasta)  -outfmt 6
  483  blastn -num_threads 8 -db $MA -query <(head -n 5000 pb_351-1_RoI_fungi.ITS2.complete.fasta)  -outfmt 6
  484  blastn -num_threads 8 -db $MA -query <(head -n 50000 pb_351-1_RoI_fungi.ITS2.complete.fasta)  -outfmt 6
  485  blastn -num_threads 8 -db $MA -query pb_351-1_RoI_fungi.ITS2.complete.fasta  -outfmt 6
  486  pushd .
  487  interactive -n 2 -A stafff --qos=short -t 5:00
  488  interactive -n 2 -A staff --qos=short -t 5:00
  489  cd
  490  cd uppmax/
  491  ll
  492  cd ../ticket142341/
  493  ll
  494  vi slurm.sh
  495  cat slurm.sh 
  496  vi test_SLURM_vars.pl
  497  vi slurm.sh 
  498  chmod +x test_SLURM_vars.pl 
  499  sbatch slurm.sh 
  500  jiu
  501  ll
  502  cat slurm-9697012.out 
  503  vi slurm.sh 
  504  sbatch slurm.sh 
  505  cat slurm.sh 
  506  jiu
  507  ll
  508  cat slurm-9697014.out
  509  ll
  510  vi slurm.sh
  511  cp /sw/apps/bioinfo/A5-miseq/20160825/milou/bin/a5_pipeline.pl .
  512  vi a5_pipeline.pl 
  513  cat a5_pipeline.pl >> test_SLURM_vars.pl 
  514  vi test_SLURM_vars.pl 
  515  sbatch slurm.sh 
  516  ll
  517  perl -c test_SLURM_vars.pl 
  518  ll
  519  cat slurm-9697418.out
  520  vi test_SLURM_vars.pl 
  521  sbatch slurm.sh 
  522  ll
  523  jiu
  524  ll
  525  cat slurm-9697419.out 
  526  rm /sw/apps/bioinfo/A5-miseq/20140604/milou/bin/a5_pipeline_ticket142341.pl 
  527  ll
  528  cd ..
  529  rm -rf ticket142341/
  530  mkdir tmp
  531  cd tmp
  532  ll
  533  module list
  534  module unload ITSx
  535  module list
  536  module unload BioPerl ucsc-utilities blast
  537  module list
  538  module load vep
  539  module help vep
  540  intersect_user douglas berritk
  541  intersect_user douglas berritki
  542  cd /proj/snic2015-6-172
  543  ll
  544  cd nobackup/
  545  ll
  546  cd private/
  547  newgrp snic2015-6-172
  548  exit
  549  newgrp b2013211
  550  exit
  551  exit
  552  vi sgdp_Feb2017.pl 
  553  ll
  554  cd EastAsia/
  555  ll
  556  cd SAMEA3302611__Uygur-1_S__LP6005442-DNA_B01/
  557  ll
  558  watch ls -l
  559  ll
  560  du.
  561  watch ls -l
  562  cd ../..
  563  ll
  564  rm -rf SAMEA3302*
  565  ll
  566  df -kh .
  567  du -csh *
  568  ll gwenna/
  569  rm -rf gwenna/
  570  rm -rf sgdp.pl 
  571  ll
  572  rm ALL_SGDP_fastq_files_ftp_addresses.txt SGDP_Native_American_Public_available_fastq_data_info.txt
  573  ll
  574  cat cmds.sh 
  575  ll
  576  ll EastAsia/SAMEA3302611__Uygur-1_S__LP6005442-DNA_B01/
  577  du.
  578  ll EastAsia/SAMEA3302611__Uygur-1_S__LP6005442-DNA_B01/
  579  ll EastAsia/SAMEA3302611__Uygur-1_S__LP6005442-DNA_B01/
  580  ll
  581  ll EastAsia/
  582  screen -S SGDP
  583  exit
  584  screen -ls
  585  man wget
  586  ll
  587  rm -rf EastAsia/
  588  vi sgdp_Feb2017.pl 
  589  ll
  590  ll -lR EastAsia/
  591  screen -ls
  592  cd /sw/data/uppnex/
  593  ll
  594  ll
  595  cd SGDP
  596  htop -u douglas
  597  cd SGDP_bams
  598  ll
  599  du.
  600  ll EastAsia/
  601  module spider atlas
  602  module load ATLAS/3.10.3
  603  module list
  604  module unload ATLAS
  605  cd /sw/apps/bioinfo/
  606  ll
  607  mkdir ATLAS_aDNA
  608  cd ATLAS_aDNA/
  609  module load git
  610  module list
  611  module load gcc/6.3.0
  612  mkdir 20170221
  613  cd 20170221/
  614  mkdir milou src_milou
  615  cd src_milou/
  616  git clone https://bitbucket.org/phaentu/atlas.git
  617  module spider arma
  618  pushd .
  619  cd ../../../..
  620  cd ../libs
  621  ll
  622  mkdir armadillo
  623  cd armadillo/
  624  ll
  625  mkdir 7.800.0
  626  cd 7.800.0/
  627  mkdir milou
  628  mkdir src_milou
  629  cd src_milou/
  630  wget http://sourceforge.net/projects/arma/files/armadillo-7.800.0.tar.xz
  631  tar xvJf armadillo-7.800.0.tar.xz 
  632  ll
  633  cd armadillo-7.800.0/
  634  ll
  635  module spider blas
  636  module spider open
  637  module list
  638  module unload git gcc
  639  module load openblas/0.2.19
  640  module list
  641  ll
  642  intersect_user douglas martind
  643  intersect_user douglas martin
  644  intersect_user douglas dahlo
  645  cd /proj/b2013023
  646  ll
  647  cd projects/
  648  ll
  649  cd papers/
  650  ll
  651  cd uppmax_vs_uppnex-paper/
  652  ll
  653  cd projects_per_pi/
  654  ll
  655  view projects_per_pi.r 
  656  module load R_packages/3.3.2
  657  module list
  658  R
  659  fg
  660  module load gvim
  661  module load vim
  662  ll
  663  module list
  664  module load vim
  665  cd /proj/b2013023/projects/papers/uppmax_vs_uppnex-paper/projects_per_pi
  666  ll
  667  vi projects_per_pi.r 
  668  gvim projects_per_pi.r 
  669  fg
  670  vi projects_per_pi.r 
  671  screen -S armadillo
  672  ll
  673  ll EastAsia/
  674  du.
  675  module load bioinfo-tools fqzcomp
  676  module help fqzcomp
  677  less /sw/apps/bioinfo/fqzcomp/4.6/milou/README
  678  ll
  679  cd EastAsia/
  680  ll
  681  cd SAMEA3302611__Uygur-1_S__LP6005442-DNA_B01/
  682  ll
  683  module list
  684  for F in *.gz ; do echo $F; zcat $F | fqz_comp > ${F%.gz}.fqz; done
  685  bg
  686  ll /sw/data/uppnex/SGDP/SGDP_bams
  687  ll
  688  ll
  689  du.
  690  pushd .
  691  cd /proj/b2010042/nobackup/linkage-map/probe-evaluation-paper/pilot-SNP-calling
  692   eog milou-b2010042-johnba-9866215.png
  693  cd bin
  694  jid2=$(sbatch  run1Gzip_sbatch.sh)
  695  cat run1Gzip_sbatch.sh
  696  vi run1Gzip_sbatch.sh
  697  jid2=$(sbatch  run1Gzip_sbatch.sh)
  698  echo $jid2
  699  scancel 9879184
  700  man sbatch
  701  jid2=$(sbatch  run1Gzip_sbatch.sh | awk '{print $4}')
  702  echo $jid2
  703  scancel 9879189
  704  man sbatch
  705  ssh rackham5
  706  cd /sw/apps/bioinfo/
  707  ll
  708  mkdir Meerkat
  709  cd Meerkat/
  710  mkdir 0.189
  711  cd 0.189/
  712  mkdir milou src
  713  mv src src_milou
  714  cd src_milou/
  715  wget http://compbio.med.harvard.edu/Meerkat/meerkat_download_page.php
  716  rm meerkat_download_page.php 
  717  ll
  718  tar xvzf Meerkat.0.189.tar.gz 
  719  cd Meerkat/
  720  ll
  721  cat Updates 
  722  ll
  723  cd /sw/apps/bioinfo/
  724  mkdir Primer3
  725  cd Primer3/
  726  wget https://downloads.sourceforge.net/project/primer3/primer3/2.3.7/primer3-2.3.7.tar.gz
  727  mkdir 2.3.7
  728  cd 2.3.7/
  729  mkdir milou rackham src_milou
  730  cd src_milou/
  731  mv ../../primer3-2.3.7.tar.gz .
  732  tar xvzf primer3-2.3.7.tar.gz 
  733  cd primer3-2.3.7/
  734  ll
  735  cat example 
  736  ll
  737  cd src
  738  ll
  739  make
  740  make test
  741  dirs
  742  cd /sw/apps/bioinfo/Primer3/
  743  ll
  744  cd 2.3.7/
  745  ll
  746  cd src_milou/
  747  ll
  748  cd primer3-2.3.7/
  749  ll
  750  cd src/
  751  ll
  752  make
  753  ll
  754  make install
  755  cd .
  756  ll
  757  cd ..
  758  ll
  759  cd -
  760  make install
  761  ll ../test
  762  ll
  763  mkdir ../../../milou/bin
  764  cp primer3_core ntdpal oligotm long_seq_tm_test ../../../milou/bin/
  765  cd ../../..
  766  cd ..
  767  history > Primer3-2.3.7-install-README.md
  768  vi Primer3-2.3.7-install-README.md 
  769  mkdir mf
  770  cd mf
  771  cp ../../samtools/mf/0.1.19 2.3.7
  772  vi 2.3.7 
  773  ll
  774  cd /sw/mf/common/bioinfo-tools/misc
  775  mkdir Primer3
  776  cd Primer3/
  777  cp /sw/apps/bioinfo/Primer3/mf/2.3.7 .
  778  ll
  779  cd ..
  780  cd /sw/mf/milou/bioinfo-tools/misc/
  781  mkdir Primer3
  782  cd Primer3/
  783  ln -s ../../../../common/bioinfo-tools/misc/Primer3/2.3.7 .
  784  ll
  785  ssh rackham5
  786  exit
  787  ssh tintin
  788  cd ..
  789  ll
  790  module load bioinfo-tools
  791  module load blat
  792  which blat
  793  blat -h
  794  which gfServer
  795  blat
  796  cd src/
  797  ll
  798  tar xjvf mybamtools.tbz 
  799  cd mybamtools/
  800  ll
  801  cmake --version
  802  mkdir build
  803  cd build
  804  cmake ..
  805  make
  806  ll
  807  ll ..
  808  ll ../lib
  809  pushd .
  810  cd ../..
  811  cd ..
  812  ll
  813  cd milou/
  814  ll
  815  mkdir lib
  816  cd lib/
  817  ll
  818  ll
  819  export LD_RUN_PATH=$PWD
  820  pushd .
  821  cd ../bin
  822  cd ..
  823  mkdir bin
  824  cd bin
  825  P=$PWD
  826  cd ../../src_milou/Meerkat/src
  827  ll
  828  cd mybamtools/
  829  ll
  830  ll lib/
  831  cd lib/
  832  cd ..
  833  rsync -nrPlt lib $LD_RUN_PATH/
  834  echo $LD_RUN_PATH 
  835  rsync -nrPlt lib $LD_RUN_PATH
  836  rsync -nrPlt lib /sw/apps/bioinfo/Meerkat/0.189/milou/
  837  rsync -rPlt lib /sw/apps/bioinfo/Meerkat/0.189/milou/
  838  cd ..
  839  cd -
  840  BTROOT=$PWD
  841  cd ..
  842  ll
  843  tar xjvf bamreader.tbz 
  844  cd bamreader/
  845  vi Makefile 
  846  make -DBTROOT=$BTROOT
  847  echo $BTROOT
  848  make BTROOT=$BTROOT
  849  ll
  850  ldd bamreader
  851  echo $P
  852  mv bamreader $P
  853  cd ..
  854  ll
  855  tar xjvf dre.tbz 
  856  cd dre/
  857  /make
  858  set -o vi
  859  make BTROOT=$BTROOT
  860  ll
  861  mv dre $P
  862  cd ..
  863  ll
  864  tar xjvf sclus.tbz 
  865  cd sclus/
  866  ll
  867  make
  868  mv sclus $P
  869  ll
  870  cd ..
  871  ll
  872  cd ..
  873  ll
  874  cd bin
  875  ll
  876  cd ..
  877  cd scripts/
  878  ll
  879  vi pre_process.pl 
  880  cd ..
  881  cd scripts/
  882  ll
  883  vi *.pl
  884  ll
  885  cd ..
  886  ll
  887  cp -av scripts ../../$CLUSTER/
  888  cd ..
  889  ll
  890  cd milou/
  891  ll
  892  cd ../../mf
  893  ll
  894  cd ..
  895  mkdir mf
  896  cd mf
  897  ll
  898  ll *
  899  ll -L *
  900  ll vep/84
  901  cat vep/84
  902  cp vep/84 /sw/apps/bioinfo/Meerkat/mf/0.189
  903  cd mf
  904  ll
  905  vi 0.189 
  906  vi 0.189 
  907  cd ../0.189/
  908  ll
  909  mkdir doc
  910  cp src_milou/Meerkat/Manual_0.189.pdf doc/
  911  cd doc
  912  ll
  913  module spider blast
  914  module spider blat
  915  module spider primer
  916  module spider bwa
  917  which Rscript
  918  Rscript --version
  919  vi ../../mf/0.189 
  920  ll
  921  mkdir Meerkat
  922  ll
  923  cd Meerkat/
  924  ll
  925  ln -s ../../../../common/bioinfo-tools/misc/Meerkat/0.189 .
  926  ll
  927  pushd .
  928  cd ../../../../common/bioinfo-tools/misc/
  929  mkdir Meerkat
  930  ll
  931  cd Meerkat/
  932  ll
  933  cp /sw/apps/bioinfo/Meerkat/mf/0.189 .
  934  ll
  935  vi 0.189 
  936  cp 0.189 /sw/apps/bioinfo/Meerkat/mf/0.189
  937  ll
  938  module spider meerkat
  939  ll
  940  vi 0.189 
  941  cp 0.189 /sw/apps/bioinfo/Meerkat/mf/0.189
  942  cd ..
  943  ll
  944  cd milou/
  945  ll
  946  cd bin/
  947  ll
  948  cd ..
  949  cd ../../..
  950  fixup -g Meerkat
  951  fixup -g Primer3
  952  cd Meerkat/
  953  ll
  954  cd 0.189/
  955  ll
  956  cd milou/
  957  ll
  958  cd scripts/
  959  ll
  960  chmod +x *.pl
  961  ll
  962  cd projects/
  963  ll
  964  ll SGDP/
  965  rm -rf SGDP/
  966  intersect_user douglas khriezha
  967  fb166
  968  newgrp b2014310
  969  cd /proj/b2014310/nobackup
  970  ll
  971  cd mapping/
  972  ll
  973  ls -ltr
  974  ll *pl
  975  cd ..
  976  ll
  977  cd paternal-variants/
  978  ll
  979  ls -ltr
  980  cd ..
  981  find . -name hetPoolLikelihoods.pl
  982  ll
  983  cd mapping/
  984  ll
  985  ll *.sh
  986  ls -ltr *.sh
  987  cat run_coverage.sh
  988  pushd .
  989  cd
  990  cd projects/
  991  ll
  992  mkdir gU-test
  993  cd gU-test/
  994  ll
  995  R
  996  kill %+
  997  module load R_packages/3.3.2
  998  jobs
  999  module list
 1000  R
 1001  module spider primer
 1002  cd /sw/apps/bioinfo/Primer3/
 1003  ll
 1004  cd 2.3.7/
 1005  ll
 1006  cd src_milou/
 1007  ll
 1008  cd primer3-2.3.7/
 1009  ll
 1010  cat COPYING.txt 
 1011  cd ../../..
 1012  cd ..
 1013  module list
 1014  module load bioinfo-tools
 1015  module load Meerkat
 1016  module help Meerkat
 1017  module avail Meerkat
 1018  cd Meerkat/
 1019  ll
 1020  cd 0.189/
 1021  ll
 1022  cd milou/
 1023  cd ../src_milou/
 1024  ll
 1025  cd Meerkat/
 1026  ll
 1027  cd src/
 1028  ll
 1029  cd ..
 1030  cd scripts/
 1031  ll
 1032  less pre_process.pl 
 1033  cd ../../../
 1034  cd ..
 1035  history > Meerkat-0.189-install-README.md
