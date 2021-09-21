braker/2.1.6
============

<https://github.com/Gaius-Augustus/BRAKER>

Used under license:
Artistic


Structure creating script (makeroom_braker_2.1.6.sh) moved to /sw/bioinfo/braker/makeroom_2.1.6.sh

LOG
---

    /home/douglas/bin/makeroom.sh -f" -s "annotation" -t "braker" -v "2.1.6" -w "https://github.com/Gaius-Augustus/BRAKER" -l "Artistic" -d "pipeline for fully automated prediction of protein coding gene structures with GeneMark-ES/ET and AUGUSTUS in novel eukaryotic genomes"
    ./makeroom_braker_2.1.6.sh

    source /sw/bioinfo/braker/SOURCEME_braker_2.1.6 && cd $TOOLDIR

    cd $SRCDIR

    wget https://github.com/Gaius-Augustus/BRAKER/archive/refs/tags/v2.1.6.tar.gz
    tar xf v2.1.6.tar.gz 
    rmdir $PREFIX && mv BRAKER-2.1.6 $PREFIX
    cd $PREFIX
    cd scripts/
    sed -i 's,^#!/usr/bin/perl.*$,#!/usr/bin/env perl,' *.pl

    module load perl/5.26.2
    module load perl_modules/5.26.2
    module load python/3.7.2
    module load bioinfo-tools
    module load biopython/1.76-py3
    module load augustus/3.4.0
    module load bamtools/2.5.1
    module load blast/2.2.31+
    module load GeneMark/4.68-es
    module load GenomeThreader/1.7.1
    module load exonerate/2.2.0
    module load spaln/2.4.0
    module load samtools/1.8
    module load ProtHint/2.6.0
    module load diamond/0.9.31
    module load cdbfasta/1.00
    module load ucsc-utilities/v398
    module load MakeHub/1.0.5-1ecd6bb
    module load GUSHR/1.0.0


Add `$modroot/scripts` to `PATH`.


No testing for this version yet.


Testing
-------

Running `source $AUGUSTUS_CONFIG_COPY` is always required to set up an annotation environment, and that script was modified to print its export line for `AUGUSTUS_CONFIG_PATH` since that always need to be set after the config directory is created.

Running tests:

    cd /sw/bioinfo/braker/2.1.5/src/BRAKER-2.1.5/example

Download missing RNA-Seq test data:

    wget http://bioinf.uni-greifswald.de/bioinf/braker/RNAseq.bam

Run the tests.

    cd tests
    ./test1.sh

All Augustus tools are sought based off `AUGUSTUS_CONFIG_PATH`, so both `AUGUSTUS_BIN_PATH` and `AUGUSTUS_SCRIPTS_PATH` must both be set.  This was in the readme, but buried.  I chose to set these in the augustus/3.3.3 module file.

Biopython was also required, also buried in the readme.

Also, a `--prog=` option is missing from `test2.sh`.

`braker.pl` could not find GenomeThreader's `prothint.py` script, because it was attempting to use `ALIGNMENT_TOOL_PATH`..  So, `braker.pl` was modified as follows:

braker.pl line 4967: find `prothint.py` using `PATH` instead of `ALIGNMENT_TOOL_PATH`.

In general, all the use of environment variables instead of `PATH` makes it less straightforward than it can be to incorporate braker into a module system.

   45  cd ..
   46  ll
   47  du.
   48  rm -f SRR119726?_r{1,2}.bam{,.bai}
   49  ll
   50  cd split/
   51  jiu
   52  ./monitor_r3.sh 
   53  jiu
   54  ./monitor_r3.sh 
   55  ll *sh
   56  ./gatherfasta_p3.sh 
   57  vi gatherfasta_p3.sh
   58  ll
   59  ll *sh
   60  view gatherfasta_p2.sh
   61  ./gatherfasta_p3.sh 
   62  ./monitor_r3.sh 
   63  ./gatherfasta_p3.sh 
   64  jiu
   65  ./gatherfasta_p3.sh 
   66  jiu
   67  ll
   68  cp round3-pilon-rackham-split-dip.sh round4-pilon-rackham-split-dip.sh
   69  vi round4-pilon-rackham-split-dip.sh
   70  ll *sh
   71  cp monitor_r3.sh monitor_r4.sh
   72  vi monitor_r4.sh 
   73  ll *sh
   74  cp gatherfasta_p3.sh gatherfasta_p4.sh
   75  vi gatherfasta_p4.sh 
   76  ll *sh
   77  cd ..
   78  ll *sh
   79  cp round4-bam.sh round5-bam.sh
   80  vi round5-bam.sh 
   81  ml
   82  ml bioinfo-tools bwa samtools
   83  samtools sort
   84  vi round5-bam.sh 
   85  bwa mem
   86  ll
   87  vi round4-bam.sh 
   88  ll
   89  ll *sh
   90  cd split/
   91  ./monitor_r3.sh 
   92  ll
   93  tail *.out
   94  cd ..
   95  ll *sh
   96  vi round4-bam.sh round5-bam.sh 
   97  ll
   98  cd split/
   99  ./monitor_r3.sh 
  100  jiu
  101  ./monitor_r3.sh 
  102  jiu
  103  ./gatherfasta_p3.sh 
  104  jiu
  105  cd ..
  106  ll
  107  jiu
  108  ssh r27
  109  jiu
  110  ll
  111  head round3-bam*out
  112  jobstats -p -M snowy 4985305
  113  jobstats -p -M rackham 20776587
  114  ll
  115  jiu
  116  cd split/
  117  ll
  118  parallel sbatch round4-pilon-rackham-split-dip.sh round3.fa ::: $(seq -f "m_%02.0f" 00 45)
  119  jiu
  120  ls
  121  mkdir round3_SLURM_out
  122  mv round3-pilon-rackham-split-dip*out round3_SLURM_out
  123  mkdir round3_Pilon_out
  124  mv round3_m_??_outdir_rackham_split_dip round3_Pilon_out/
  125  ls
  126  ./monitor_r4.sh 
  127  ls
  128  cp round4-pilon-rackham-split-dip.sh round5-pilon-rackham-split-dip.sh
  129  vi round5-pilon-rackham-split-dip.sh
  130  ll
  131  ll *sh
  132  cp monitor_r4.sh monitor_r5.sh
  133  vi monitor_r5.sh
  134  ll
  135  ll *sh
  136  cp gatherfasta_p4.sh gatherfasta_p5.sh
  137  vi gatherfasta_p5.sh
  138  ll
  139  cd ..
  140  ll
  141  vi round5-bam.sh
  142  ll
  143  cd split/
  144  ll
  145  ll *sh
  146  vi gatherfasta_p4.sh
  147  ll
  148  ll *sh
  149  vi gatherfasta_p5.sh
  150  ll
  151  ll *sh
  152  ls
  153  rm -f SRR119726?_r[123].bam{,.bai}
  154  ls
  155  ./monitor_r4.sh 
  156  ll
  157  ll *sh
  158  vi gatherfasta_p5.sh
  159  ll
  160  cd round4_m_00_outdir_rackham_split_dip
  161  ll
  162  head round4_m_00.fasta
  163  cd ..
  164  ll
  165  jiu
  166  ./monitor_r4.sh 
  167  jiu
  168  ./monitor_r4.sh 
  169  jiu
  170  ./gatherfasta_r4.sh 
  171  ./gatherfasta_p4.sh 
  172  jiu
  173  ll
  174  cd ..
  175  ll
  176  cd -
  177  ls -lL
  178  cd ..
  179  ll
  180  l
  181  set -o vi
  182  rm -f SRR119726?_r[123].bam{,.bai}
  183  ll
  184  rm -f SRR119726?_r[4].bam{,.bai}
  185  ll
  186  rm -f round2.fa.{amb,ann,bwt,pac,sa}
  187  ll
  188  rm -f round3.fa.{amb,ann,bwt,pac,sa}
  189  rm -f round1.fa.{amb,ann,bwt,pac,sa}
  190  ll
  191  ml
  192  ml exonerate
  193  fastalength round3.fa > round3.lengths
  194  fastalength round4.fa > round4.lengths
  195  mkdir bam_out
  196  mv round?-bam-???????.out bam_out
  197  cd bam_out
  198  ll
  199  cd ..
  200  ll
  201  ll bam_out
  202  mv round4-bam-2077658?.out bam_out/
  203  ll
  204  mv round1-bam.sh round2-bam.sh round3-bam.sh round4-bam.sh bam_out/
  205  ls
  206  ll
  207  cd bam_out
  208  ll
  209  tail round4-bam-20776585.out
  210  grep 'Real time' '.out
  211  grep 'Real time' *.out
  212  jiu
  213  cd ..
  214  jiu
  215  cd split/
  216  ll
  217  mkdir round4_SLURM_out
  218  mv round4-pilon-rackham-split-dip-20??????.out round4_SLURM_out/
  219  ls
  220  mkdir round4_Pilon_out
  221  mv round4_m_??_outdir_rackham_split_dip round4_Pilon_out/
  222  ls
  223  parallel sbatch round5-pilon-rackham-split-dip.sh round4.fa ::: $(seq -f "m_%02.0f" 00 45)
  224  jiu
  225  vi round5-pilon-rackham-split-dip.sh
  226  ll
  227  jiu
  228  scontrol show jobid=20832461
  229  for S in $(seq 20832469 20832474); do scontrol show jobid=$S; done | grep Command
  230  for S in $(seq 20832468 20832474); do scontrol show jobid=$S; done | grep Command
  231  parallel sbatch round5-pilon-rackham-split-dip.sh round4.fa ::: 35 41 43 42 38 45 44
  232  jobinfo -u douglas -M snowy
  233  for S in $(seq 20832465 20832467); do scontrol show jobid=$S; done | grep Command
  234  parallel sbatch round5-pilon-rackham-split-dip.sh round4.fa ::: 34 37 39
  235  jobinfo -u douglas -M snowy
  236  for S in $(seq 20832465 20832474); do scancel $S; done
  237  jiu
  238  jobinfo -u douglas -M snowy
  239  jiu
  240  jobinfo -u douglas -M snowy
  241  ls -ltr
  242  cat  round5-pilon-rackham-split-dip-5011678.out
  243  cat  round5-pilon-rackham-split-dip-5011682.out
  244  rm -f round5-pilon-rackham-split-dip-50116*.out
  245  vi round5-pilon-rackham-split-dip.sh
  246  history | grep parallel
  247  parallel sbatch round5-pilon-rackham-split-dip.sh round4.fa ::: m_34 m_37 m_39 m_35 m_41 m_43 m_42 m_38 m_45 m_44
  248  jobinfo -u douglas -M snowy
  249  jiu
  250  ll
  251  ./monitor_r5.sh 
  252  vi monitor_r5.sh 
  253  ./monitor_r5.sh 
  254  ./gatherfasta_p5.sh 
  255  jobinfo -u douglas -M snowy
  256  scontrol show jobif=5012502
  257  scontrol show jobid=5012502
  258  scontrol -M snowy show jobid=5012502
  259  ssh snowy-lr1
  260  ssh snowy-lr2
  261  ll
  262  htop
  263  ll
  264  jobinfo -u douglas -M snowy
  265  scontrol -M snowy show jobid=5012502
  266  scancel -M snowy 5012502
  267  screen -ls
  268  exit
  269  screen -R polish
  270  cd /proj/staff/douglas
  271  ls
  272  ll
  273  cd nobackup/
  274  ll
  275  finger gudmonds
  276  finger erik
  277  intersect_user douglas erigu103
  278  cd /proj/snic2019-35-58
  279  ll
  280  cd water_strider/
  281  ll
  282  cd new_annotation/
  283  ll
  284  cd ..
  285  ll
  286  cd -
  287  ll
  288  cd ..
  289  ll
  290  cd genome/
  291  ll
  292  ll Gbue_2.0
  293  cd ..
  294  ll
  295  cd genome/
  296  ll
  297  cd ..
  298  ll
  299  mkdir genome_polish_p5
  300  cd genome_polish_p5/
  301  ll
  302  cp -av /proj/staff/douglas/nobackup/genome-polish/round5_nosoftmasking.fa .
  303  ll
  304  ml
  305  ll
  306  cp -av /proj/staff/douglas/nobackup/genome-polish/round5.fa .
  307  ll
  308  mv round5.fa round5_aspolished.fa
  309  ll
  310  mv round5_nosoftmasking.fa dovetail_p5_unmasked.fa
  311  ll
  312  ml
  313  ml bioinfo-tools
  314  ll
  315  ml samtools
  316  ll
  317  samtools faidx dovetail_p5_unmasked.fa
  318  ll
  319  fixup
  320  fixup -G snic2019-35-58 .
  321  cd ..
  322  ll
  323  cd genome_polish_p5/
  324  ll
  325  cd ..
  326  cd nobackup/
  327  ll
  328  cd denovo_transcriptome/
  329  ll
  330  du.
  331  cd ..
  332  ll
  333  cd repeats/
  334  ll
  335  less genome.fa 
  336  cd screen-genome-proteins/
  337  ll
  338  cd ..
  339  cd tools/
  340  ll
  341  cd ..
  342  cd 20210203/
  343  ll
  344  cd ..
  345  mkdir 20210704
  346  ll
  347  cp -a ../../genome_polish_p5/dovetail_p5_unmasked.fa .
  348  cd 20210704/
  349  ln -s ../dovetail_p5_unmasked.fa genome.fa
  350  ll
  351  ls
  352  cd /proj/snic2019-35-58/water_strider/nobackup/repeats/20210704
  353  ll
  354  cd ..
  355  ll
  356  cd tools/
  357  ll
  358  cd TransposonPSI_08222010/
  359  ll
  360  cd ..
  361  ll
  362  cd Libraries/
  363  ll
  364  cd general/
  365  ll
  366  cd ..
  367  ll
  368  cd ..
  369  ll
  370  cd 20210203/
  371  ll
  372  less RepeatModeler.log 
  373  cd ..
  374  ll
  375  find . -name '*.sh'
  376  curl -sSLO https://github.com/Dfam-consortium/TETools/raw/master/dfam-tetools.sh
  377  ll
  378  cd ..
  379  mkdir 20210704_tools
  380  cd 20210704_tools/
  381  mv ../20210704/dfam-tetools.sh .
  382  chmod +x dfam-tetools.sh 
  383  ll
  384  ./dfam-tetools.sh 
  385  ll
  386  pushd .
  387  cd
  388  cd .singularity/
  389  ls
  390  cd cache/
  391  ll
  392  cd ..
  393  rm -rf .singularity/
  394  rm -rf .local .cache/
  395  dirs
  396  swapd
  397  ll
  398  pushd .
  399  quit
  400  exit
  401  ./dfam-tetools.sh 
  402  ll
  403  cd
  404  cd .singularity/
  405  ll
  406  cd cache/
  407  ll
  408  cd library/
  409  ll
  410  cd ..
  411  ll
  412  du -csh *
  413  cd blob/
  414  ll
  415  cd blobs/
  416  ll
  417  cd sha256/
  418  ll
  419  cd ../..
  420  cd ..
  421  ll
  422  cd oci-tmp/
  423  ll
  424  file 1af5b0bc8210843cb7db7428e7685268a553aace4b89a222660e5127a15cd2a9 
  425  cd ..
  426  ll
  427  find . -name '*.sif'
  428  cd ..
  429  popd
  430  ll
  431  singularity pull --name tetools_1.4.sif docker://dfam/tetools:latest
  432  ll
  433  file tetools_1.4.sif 
  434  rm dfam-tetools.sh 
  435  cd ..
  436  ll
  437  mv 20210704_tools/tetools_1.4.sif .
  438  ll
  439  rm -rf 20210704_tools
  440  cd Libraries/
  441  ll
  442  cd ..
  443  ll
  444  mv Libraries Libraries_20210203
  445  ll
  446  RepeatMasker --help
  447  exit
  448  singularity run tetools_1.4.sif 
  449  mspid repeat
  450  ll
  451  cd /mnt
  452  ll
  453  ls -l
  454  cd ..
  455  cd /opt/RepeatMasker/
  456  ll
  457  ls -l
  458  cp -av Libraries /mnt/
  459  exit
  460  singularity shell -B $PWD:/mnt tetools_1.4.sif 
  461  ll
  462  chmod -R o-w Libraries
  463  ll
  464  cd /mnt
  465  ll
  466  ls -l
  467  exit
  468  singularity shell -B $PWD:/mnt tetools_1.4.sif 
  469  ll
  470  tar xvf RepBaseRepeatMaskerEdition-20181026.tar.gz 
  471  cd /mnt
  472  ll
  473  ls -l
  474  addRepBase.pl -libdir Libraries/
  475  quit
  476  exit
  477  singularity shell -B $PWD:/mnt tetools_1.4.sif 
  478  ll
  479  mv dovetail_p5_unmasked.fa dovetail_p5.fa
  480  ll
  481  ll 20210203
  482  cd 20210704
  483  ll
  484  ln -sf ../dovetail_p5.fa .
  485  ll
  486  rm -f genome.fa 
  487  ll
  488  cd ..
  489  screen -ls
  490  source ~/.bash_profile
  491  htop
  492  ll
  493  cd 20210704
  494  ll
  495  rm -rf trinity_staged/
  496  screen -S rm
  497  cd /proj/staff/douglas/nobackup
  498  ll
  499  cd ..
  500  ll
  501  screen -ls
  502  cd /proj/snic2019-35-58/water_strider/nobackup/repeats
  503  ll
  504  cd 20210704
  505  ll
  506  cd RM_18159.SunJul42308482021/
  507  ll
  508  htop -u douglas
  509  cd round-5/
  510  ll
  511  cd ..
  512  ll
  513  less consensi.fa
  514  less families.stk 
  515  cd ..
  516  ll
  517  cd ..
  518  ll
  519  which locale
  520  export LC_ALL=C
  521  locale
  522  RepeatMasker --help
  523  quit
  524  exit
  525  singularity run tetools_1.4.sif 
  526  ll
  527  cd 20210704/
  528  ll
  529  cd RM_18159.SunJul42308482021/
  530  ll
  531  head consensi.fa 
  532  mspid genometools
  533  ll /sw/bioinfo/GenomeTools/
  534  ml
  535  ml python
  536  ml
  537  python
  538  ml -python
  539  ml bioinfo-tools
  540  ml IGV
  541  igv-core --help
  542  cd ..
  543  pushd .
  544  cd
  545  cd /sw/bioinfo
  546  ls -ltr
  547  cd phynder
  548  ll
  549  cd 2020-08-17-48b184f/
  550  ll
  551  cd rackham/
  552  ll
  553  ./phynder 
  554  head phynder 
  555  file phynder 
  556  cd ../../..
  557  ls -ltr
  558  cd pathPhynder/
  559  ll
  560  cd 2020-12-19-b8532c0/
  561  ll
  562  cd rackham/
  563  ll
  564  cd pathPhynder/
  565  ll
  566  mshow pathPhynder
  567  ll /sw/bioinfo/htslib/1.12/rackham/lib
  568  ll
  569  less pathPhynder.R 
  570  ./pathPhynder.R 
  571  ll R
  572  ll
  573  grep samtools *
  574  cd R
  575  ll
  576  grep samtools *
  577  cd uppmax
  578  jobstats -p 20847165
  579  cat /sw/share/slurm/rackham/extended_uppmax_jobstats/r340/20847165
  580  dirs
  581  popd
  582  ll
  583  htop -u douglas
  584  cd /proj/snic2019-35-58/water_strider/nobackup/repeats/20210704
  585  ll
  586  cd ..
  587  ll
  588  cd screen-annotation-proteins/
  589  ll
  590  cd ../screen-genome-proteins/
  591  ll
  592  cd ..
  593  ls
  594  ll
  595  cd ..
  596  ll
  597  cd ..
  598  ll
  599  cd scripts/
  600  ll
  601  ll *pl
  602  ll *sh
  603  cd ..
  604  ll
  605  cd genome_polish_p5/
  606  ll
  607  cd ..
  608  cd nobackup/
  609  ll
  610  cd repeats/
  611  ll
  612  ll tools/
  613  mkdir simple_softmasking
  614  cd simple_softmasking/
  615  ll
  616  ln -s ../dovetail_p5.fa .
  617  ll
  618  cd ../..
  619  ll
  620  cd ..
  621  ll
  622  cd RNA-seq_body/
  623  ll
  624  cd ..
  625  cd RNA-seq_wing_bud/
  626  ll
  627  cat STARmap.sh 
  628  ll D3-18-4
  629  ll cutadapt_trimmed_reads/
  630  ll -L cutadapt_trimmed_reads/
  631  cat STARmap.sh 
  632  ll STAR_index_masked_renamed
  633  ll STAR_index_masked_renamed/
  634  ls
  635  cat samples.txt
  636  htop
  637  cd /proj/snic2019-35-58/water_strider/nobackup/repeats/20210704
  638  ll
  639  cd ..
  640  ll
  641  cd simple_softmasking/
  642  ll
  643  rm -f dovetail_p5.fa && cp -av ../dovetail_p5.fa .
  644  ll
  645  screen -ls
  646  source ~/.bash_profile
  647  RepeatMasker --help
  648  exit
  649  ll /mnt
  650  ls /mnt
  651  export LIBDIR=/mnt/Libraries
  652  RepeatMasker --help
  653  RepeatMasker -h
  654  RepeatMasker -libdir /mnt/Libraries -s dovetail_p5.fa 
  655  kill %+
  656  exit
  657  screen -S soft
  658  htop -u douglas
  659  screen -R soft
  660  htop -u douglas
  661  cd ..
  662  ll
  663  ml
  664  export LIBDIR=/mnt/Libraries
  665  cd softmasking_slow/
  666  pwd
  667  cd /mnt/softmasking_slow/
  668  ls
  669  RepeatMasker -libdir /mnt/Libraries -s -pa 4 dovetail_p5.fa 
  670  htop
  671  exit
  672  ml bioinfo-tools 
  673  cd /sw/bioinfo
  674  ls -ltr
  675  cd phynder/
  676  ll
  677  cd ../pathPhynder/
  678  ll
  679  cd 2020-12-19-b8532c0/
  680  ll
  681  cd rackham/
  682  ll
  683  cd pathPhynder/
  684  ll
  685  head -n 1 pathPhynder.R 
  686  ml
  687  ml pathPhynder
  688  ml
  689  echo $ÂPATH
  690  echo $PATH
  691  exit
  692  cd /sw/bioinfo/
  693  ll
  694  ls -ltr
  695  cd pathPhynder/
  696  ll
  697  cd 2020-12-19-b8532c0/
  698  ll
  699  cd rackham/
  700  ll
  701  cd pathPhynder/
  702  ls -la
  703  mv * ..
  704  cd ..
  705  rm -rf pathPhynder
  706  ll
  707  ln -s pathPhynder.R pathPhynder
  708  cd ../../mf
  709  ll
  710  cat 2020-12-19-b8532c0 
  711  vi 2020-12-19-b8532c0 
  712  ll
  713  mfshow pathPhynder
  714  rsync -Pa 2020-12-19-b8532c0 /sw/mf/common/bioinfo-tools/phylogeny/pathPhynder/
  715  ml
  716  ml bioinfo-tools pathPhynder
  717  pathPhynder -h
  718  ml purge
  719  cd /sw/bioinfo
  720  cd MultiQC/
  721  ll
  722  cat MultiQC-1.10.1_install-README.md
  723   TOOL=MultiQC
  724      VERSION=1.11
  725  cd /sw/bioinfo/$TOOL
  726  makeroom.sh -f -s "misc" -t "$TOOL" -v "$VERSION" -w "https://multiqc.info" -l "MIT" -d "Aggregate results from bioinformatics analyses across many samples into a single report"
  727   ./makeroom_${TOOL}_${VERSION}.sh
  728      source SOURCEME_${TOOL}_${VERSION}
  729    PYTHONVERSION=3.7.2
  730      cd $PREFIX
  731      module load python/$PYTHONVERSION
  732      PYTHONUSERBASE=$PREFIX pip install --user multiqc==$VERSION
  733  ll
  734  cd ../..
  735  ll
  736  cd mf
  737  ll
  738  cat 1.9
  739  cd ..
  740  ll
  741  cp MultiQC-1.10.1_install-README.md MultiQC-1.11_install-README.md
  742  vi MultiQC-1.11_install-README.md
  743  ./MultiQC-1.11_post-install.sh
  744  cd /proj/snic2019-35-58/water_strider/nobackup/repeats/softmasking_slow
  745  ll
  746  cd RM_43672.MonJul51243402021/
  747  ll
  748  htop -u douglas
  749  exit
  750  ssh snowy-lr1
  751  cd /proj/snic2019-35-58/water_strider/nobackup/repeats/softmasking_slow
  752  ll
  753  ml
  754  ml -python
  755  ml bioinfo-tools RepeatMasker
  756  RepeatMasker -h
  757  ll
  758  ll RM_43672.MonJul51243402021/
  759  htop -u douglas
  760  exit
  761  ll
  762  rm -rf dovetail_p5_??
  763  ls
  764  rm -f slurm-50240*out
  765  ls
  766  ll
  767  cat howto README
  768  mv howto README
  769  rm -f dovetail_p5_??.fa
  770  ll
  771  cd ..
  772  ll
  773  cd ..
  774  ll
  775  cd ..
  776  ll
  777  cd new_annotation/
  778  ll
  779  cd RNAseq-alignments/
  780  ll
  781  rm -f _*transcriptome/*.bam
  782  rm -f _*transcriptome/*.bam.bai
  783  ll _*transcriptome
  784  rm -f _*transcriptome/newheaer.sam
  785  ll _*transcriptome
  786  rm -f _*transcriptome/newheader.sam
  787  ll _*transcriptome
  788  ll
  789  cat _wholeadultnymphi5k_transcriptome.samples.txt
  790  cd _wholeadultnymphi5k_transcriptome/
  791  ll
  792  ln -s ../_wholeadultnymphi5k_transcriptome.samples.txt .
  793  ll
  794  cd ..
  795  ll
  796  rm -f water_strider_11Jul2018_yVXgK.fasta
  797  rm -f water_strider_11Jul2018_yVXgK.masked.slow.fasta
  798  ll
  799  cp mapSE.sh p5_mapSE.sh
  800  vi p5_map.sh 
  801  ll
  802  vi p5_mapSE.sh
  803  ll
  804  cd _wingbud_transcriptome/
  805  ll
  806  cat _wingbud_transcriptome.samples.txt 
  807  ll ../cutadapt_trimmed_reads/
  808  ll RM_18159.SunJul42308482021/
  809  screen -R rm
  810  screen -R soft
  811  view INSTALL 
  812  less /sw/mf/common/bioinfo-tools/misc/EDirect/15.1 
  813  screen -ls
  814  cd /proj/snic2019-35-58/water_strider/nobackup/repeats/20210704
  815  ll
  816  cd RM_18159.SunJul42308482021/
  817  ll
  818  screen -R 14483.rm
  819  cd /proj/snic2019-35-58/water_strider/new_annotation/RNAseq-alignments/_wingbud_transcriptome
  820  ll
  821  ll */*.bam
  822  ../merge-bams.sh 
  823  cd /proj/snic2019-35-58/water_strider/new_annotation/RNAseq-alignments/_wingbud_transcriptome
  824  ll
  825  htop
  826  for D in *masked; do ( echo $D; cd $D; for F in *.bg ; do echo $F; pbzip2 -p10 $F; done ) ; done
  827  ../merge-bams.sh _wingbud_transcriptome.bam *masked/*.bam
  828  rm -f star_mapping_p5_softmasked_50241*.out
  829  ls
  830  ll
  831  ll *ed/*.bam
  832  rm -f *ed/*.bam
  833  ll
  834  ll B6-18-2_p5_softmasked
  835  ll
  836  zless _wingbud_transcriptome.bam
  837  ml
  838  ml bioinfo-tools
  839  samtools index _wingbud_transcriptome.bam
  840  ml samtools
  841  ll round-6/
  842  intersect_user douglas erigu103
  843  cd /proj/snic2019-35-58
  844  ll
  845  cd water_strider/
  846  ll
  847  cd RNA-seq_wing_bud/
  848  ll
  849  ll *sh
  850  cat STARmap.sh 
  851  ll
  852  ls /proj/snic2019-35-58/water_strider/new_annotation/RNAseq-alignments
  853  vi STARmap.sh 
  854  cp STARmap.sh STARmap_p5.sh 
  855  mv STARmap_p5.sh STARmap.sh.old
  856  vi STARmap.sh
  857  ll ST*
  858  ln -s /proj/snic2019-35-58/water_strider/new_annotation/RNAseq-alignments/STAR_index_p5_softmasked
  859  ..
  860  ls -l
  861  ll STAR_bam_output
  862  ls
  863  ll
  864  cat star_mapping_masked_renamed_15993966.out
  865  ll
  866  rm -f star_mapping_masked_renamed_159939*.out
  867  ls
  868  cat STARmap.sh
  869  cat samples.txt 
  870  ll
  871  mv count_tables_subread count_tables_subread_20201023
  872  ll
  873  cat samples.txt 
  874  cat STARmap.sh
  875  ll
  876  ll cutadapt_trimmed_reads/
  877  vi STARmap.sh
  878  cat samples.txt 
  879  vi STARmap.sh
  880  head STARmap.sh
  881  ml
  882  ml gnuparallel
  883  parallel sbatch STARmap.sh :::: samples.txt 
  884  ll
  885  rm -rf ??-??-?
  886  ll
  887  mkdir _old
  888  mv ??-??-? _old
  889  ll
  890  ll STAR_bam_output/
  891  jiu
  892  cd ..
  893  cd -
  894  ll
  895  jobinfo -u douglas
  896  head STARmap.sh
  897  scancel -n star_mapping_masked_renamed
  898  jiu
  899  vi STARmap.sh
  900  ll
  901  parallel sbatch STARmap.sh :::: samples.txt 
  902  jiu
  903  ll
  904  cd STAR_bam_output
  905  ll
  906  cd /proj/snic2019-35-58/water_strider/new_annotation/RNAseq-alignments/_wingbud_transcriptome
  907  ll
  908  samtools index _wingbud_transcriptome.bam
  909  bg
  910  htop -u douglas
  911  ps -fu douglas | grep samtools
  912  cd ..
  913  ll
  914  ll _*transcriptome
  915  ll
  916  cd ..
  917  ll
  918  ll _wholeadultnymphi5k_transcriptome
  919  ll _wholeembryo_transcriptome
  920  ll _body_transcriptome
  921  cd _body_transcriptome/
  922  ll
  923  ll *ed
  924  ll
  925  cd ..
  926  ll
  927  cat merge-bams.sh 
  928  cd -
  929  jobs
  930  ../merge-bams.sh _body_transcriptome.bam *ked/*.bam
  931  ll
  932  ll *ked
  933  for D in *masked; do ( echo $D; cd $D; for F in *.bg ; do echo $F; pbzip2 -p10 $F; done ) ; done
  934  ll
  935  ll */*.bam
  936  rm -f */*.bam
  937  ll
  938  cd ..
  939  ll
  940  ll */*.bam
  941  ls -lL
  942  cd ..
  943  ll
  944  cd _old/
  945  ll
  946  du.
  947  ls *
  948  ls -lR
  949  cd ..
  950  ll
  951  cd ..
  952  ll
  953  cd new_annotation/
  954  ls
  955  ll
  956  cd ..
  957  mkdir new_annotation_p5
  958  cd new_annotation_p5/
  959  cd ..
  960  rmdir new_annotation_p5/
  961  cd -
  962  cd new_annotation/
  963  ll
  964  cd dovetail_genome
  965  ll
  966  cd ..
  967  ll
  968  cd ..
  969  mkdir new_annotation_p5
  970  cd new_annotation_p5/
  971  mkdir dovetail_p5_softmasked
  972  cd dovetail_p5_softmasked/
  973  ll ../../nobackup/repeats/
  974  cd 20210704
  975  ll
  976  cd ../../nobackup/repeats/
  977  ll
  978  less dovetail_p5_softmasked.fa.gff
  979  mv dovetail_p5_softmasked.fa.gff dovetail_p5_softmasked.softmasksites.gff
  980  ll
  981  cd -
  982  cp -av ../../nobackup/repeats/dovetail_p5* .
  983  ll
  984  cd ..
  985  ll
  986  ll ../new_annotation
  987  ln -s $PWD/dovetail_p5_softmasked/dovetail_p5_softmasked.fa* .
  988  ll
  989  ll dovetail_p5_softmasked
  990  pushd .
  991  cd ../new_annotation
  992  ll
  993  cd braker_v2_rackham5
  994  cd ..
  995  cd filter_primary/
  996  ll
  997  cd ..
  998  cd braker_v2_rackham5_restart/
  999  ll
 1000  cat run_braker_v2_rackham5_restart_option3.sh
 1001  cd /sw/bioinfo/braker
 1002  ll
 1003  cat braker-2.1.5-20210115-e98b812_install-README.md
 1004  ll
 1005  less braker-2.1.5-20210115-e98b812_post-install.sh
 1006  less braker-2.1.5-20210115-e98b812_install-README.md
 1007  makeroom.sh -f -s "annotation" -t "braker" -v "2.1.6" -w "https://github.com/Gaius-Augustus/BRAKER" -l "Artistic" -d "pipeline for fully automated prediction of protein coding gene structures with GeneMark-ES/ET and AUGUSTUS in novel eukaryotic genomes"
 1008  ll
 1009  ./makeroom_braker_2.1.6.sh 
 1010  source /sw/bioinfo/braker/SOURCEME_braker_2.1.6 && cd $TOOLDIR
 1011  ll
 1012  less braker-2.1.5-20210115-e98b812_install-README.md
 1013  ll
 1014  cd 2.1.6/
 1015  ll
 1016  cd src/
 1017  ll
 1018  echo $PREFIX
 1037  view braker.pl 
 1038  ll
 1039  cd ../..
 1040  ll
 1041  cd ..
 1042  ll
 1043  vi braker-2.1.6_install-README.md
 1044  history >> braker-2.1.6_install-README.md
