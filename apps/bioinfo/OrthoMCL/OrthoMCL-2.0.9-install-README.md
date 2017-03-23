OrthoMCL-2.0.9-install-README.md
================================

12  ll
13  module load GATK/3.7
14  module list
15  module unload picard
16  env | grep GATK
17  java -jar $GATK_HOME/GenomeAnalysisTK.jar -help
18  java -jar $GATK_HOME/GenomeAnalysisTK.jar -T MuTect2 --help
19  ll
20  less haplotype_call.sh
21  cp haplotype_call.sh haplotype_call_interval.sh 
22  vi haplotype_call_interval.sh
23  ./haplotype_call_interval.sh 
24  cat haplotype_call_interval.sh 
25  vi haplotype_call_interval.sh 
26  ./haplotype_call_interval.sh 
27  ./haplotype_call_interval.sh 130
28  ./haplotype_call_interval.sh 130 131
29  vi haplotype_call_interval.sh 
30  ./haplotype_call_interval.sh 130 131
31  ./haplotype_call_interval.sh 130 131 chr1.bed
32  vi haplotype_call_interval.sh 
33  ./haplotype_call_interval.sh 130 131 chr1.bed
34  vi haplotype_call_interval.sh 
35  clear
36  ./haplotype_call_interval.sh 130 131 chr1.bed
37  vi haplotype_call_interval.sh 
38  ll *.bed
39  ll
40  ll HaplotypeCaller_without_Queue/slurm-9831286.out
41  less HaplotypeCaller_without_Queue/slurm-9831286.out
42  ./haplotype_call_interval.sh 130 131 chr6.bed
43  kill %+
44  ls -ltr
45  rm SNP130_131-to-danRer10.chr6.7722.vcf
46  interactive -A b2016209 -n 8 -t 5:00 --qos=short
47  ll
48  rm -f *.interval_list
49  ll
50  rm SNP130_131-to-danRer10.chr7.9908923.vcf
51  cat f | grep -v '^chr[0-9]' | awk 'BEGIN{OFS="\t"}{print $1,0,$2}' > chrUn.bed 
52  cat f | awk 'BEGIN{OFS="\t"}{print $1,0,$2}' | while read -r line ; do echo "$line" | grep -q '^chr[0-9]' && echo "$line" > $(echo "$line" | awk '{print $1}').bed; done
53  ll
54  cat chr19.bed
55  module list
56  module load picard
57  module list
58  module unload picard
59  module load picard/2.0.1
60  for F in chr*.bed ; do java -jar $PICARD_HOME/picard.jar BedToIntervalList I=$F O=${F%.bed}.interval_list SD=/proj/b2016209/nobackup/reference/danRer10.dict; done
61  vi haplotype_call_interval.sh 
62  ./haplotype_call_interval.sh 130 131 chr6.interval_list 
63  ll
64  rm -f *.interval_list
65  vi haplotype_call_interval.sh
66  ll
67  exit
68  newgrp b2016209
69  exit
70  cd /sw/apps/bioinfo/
71  ll
72  cd vep
73  ll
74  cat vep-84-install-README.md 
75  module list
76  module load bioinfo-tools
77  module load vep
78  module help vep
79  module spider perl
80  module load perl_modules
81  module load perl_modules
82  module list
83  ll
84  cp vep-84-install-README.md vep-87-install-README.md 
85  module load bioinfo-tools OrthoMCL
86  module help OrthoMCL
87  module list
88  cat /sw/apps/bioinfo/OrthoMCL/2.0.9/milou/config.example.txt
89  which sqlite
90  orthomcl_wrapper_UPPMAX
91  less /sw/apps/bioinfo/OrthoMCL/2.0.9/milou/doc/OrthoMCLEngine/Main/UserGuide.txt
92  grep DropSchema /sw/apps/bioinfo/OrthoMCL/2.0.9/milou/doc/OrthoMCLEngine/Main/UserGuide.txt
93  orthomclInstallSchema
94  ll *orth*
95  vi vep-87-install-README.md 
96  cat vep-87-install-README.md 
97  module list
98  module unload OrthoMCL
99  module list
100  cd /sw/apps/bioinfo/vep
101  ll
102  cat vep-87-install-README.md
103      TOOL=/sw/apps/bioinfo/vep
104      mkdir -p $TOOL
105      cd $TOOL
106      VERSION=87
107      mkdir -p $VERSION mf
108      VERSIONDIR=$TOOL/$VERSION
109      cd $VERSIONDIR
110      CLUSTERDIR=$VERSIONDIR/$CLUSTER
111      CLUSTER=milou
112      mkdir -p $CLUSTER src
113      cd src
114      wget https://github.com/Ensembl/ensembl-tools/archive/release/${VERSION}.zip
115      unzip ${VERSION}.zip
116      cd ensembl-tools-release-${VERSION}/scripts/variant_effect_predictor/
117  ll
118     CACHEDIR=/sw/data/uppnex/vep/${VERSION}
119      mkdir -p $CACHEDIR
120      module load perl/5.18.4
121      export PATH=$CLUSTERDIR/htslib:$PATH
122      export PERL5LIB=$CLUSTERDIR:$PERL5LIB
123      module load perl_modules/5.18.4
124      ./INSTALL.pl -d $CLUSTERDIR -t -c $CACHEDIR
125  module list
126  module unload vep
127  module list
128  cd ../../..
129  ll
130  cd ..
131  cd src/
132  ll
133  rm -rf ensembl-tools-release-87/
134  ll
135  module list
136     unzip ${VERSION}.zip
137      cd ensembl-tools-release-${VERSION}/scripts/variant_effect_predictor/
138      CACHEDIR=/sw/data/uppnex/vep/${VERSION}
139      mkdir -p $CACHEDIR
140      module load perl/5.18.4
141      module load perl_modules/5.18.4
142      export PATH=$CLUSTERDIR/htslib:$PATH
143      export PERL5LIB=$CLUSTERDIR:$PERL5LIB
144      ./INSTALL.pl -d $CLUSTERDIR -t -c $CACHEDIR
145  kill %+
146  cd ../../..
147  cd ..
148  ll
149  rm -rf *
150  echo $PATH
151  module list
152  module unload perl_modules
153  module unload perl
154  echo $PATH
155  PATH=/usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/sw/uppmax/bin
156  echo $PERL5LIB
157  unset PERL5LIB
158  echo $PATH
159  export PATH PERL5LIB
160      VERSION=87
161      cd $VERSIONDIR
162      VERSIONDIR=$TOOL/$VERSION
163      CLUSTERDIR=$VERSIONDIR/$CLUSTER
164      CLUSTER=${CLUSTER?:CLUSTER must be set}
165      mkdir -p $VERSION mf
166      TOOL=/sw/apps/bioinfo/vep
167      mkdir -p $TOOL
168      cd $TOOL
169      mkdir -p $CLUSTER src
170      cd src
171  ll
172     wget https://github.com/Ensembl/ensembl-tools/archive/release/${VERSION}.zip
173      unzip ${VERSION}.zip
174      cd ensembl-tools-release-${VERSION}/scripts/variant_effect_predictor/
175    CACHEDIR=/sw/data/uppnex/vep/${VERSION}
176      mkdir -p $CACHEDIR
177      module load perl/5.18.4
178      module load perl_modules/5.18.4
179      export PATH=$CLUSTERDIR/htslib:$PATH
180      export PERL5LIB=$CLUSTERDIR:$PERL5LIB
181  cd github-sync/local/
182  ll
183  cd bioinfo/
184  git pull
185  ssh-agent -l
186  ssh-agent -s
187  SSH_AUTH_SOCK=/tmp/ssh-u1XSZWXXSV6d/agent.29019; export SSH_AUTH_SOCK;
188  SSH_AGENT_PID=29021; export SSH_AGENT_PID;
189  echo Agent pid 29021;
190  ssh-add ~/.ssh/github_rsa
191  git pull
192  ll
193  cd scripts/
194  ll
195  groups
196  show_proj b2016267
197  show_proj b2016292
198  show_proj b2016209
199  ll
200  ll tests/
201  cp /proj/b2016209/nobackup/reference/danRer10.fa.fai .
202  ll
203  vi danRer10.fa.fai 
204  ./fai2Bed.pl danRer10.fa.fai 
205  cat danRer10.fa.fai | ./fai2Bed.pl -
206  cat *.fai
207  ll
208  cp danRer10.fa.fai tests/
209  ll
210  cd tests/
211  ll
212  mv danRer10.fa.fai fai2Bed_test_01.input
213  cp pileup2pro_test.sh fai2Bed_test.sh
214  vi fai2Bed_test.sh 
215  ll pileup2pro_test_01.input
216  cat pileup2pro_test_01.options
217  ll
218  touch fai2Bed_test_01.options
219  vi fai2Bed_test_01.options
220  ll
221  vi fai2Bed_test.sh
222  ./fai2Bed_test.sh 
223  ll
224  cat fai2Bed_test_01.2411.1
225  mv fai2Bed_test_01.2411.1 fai2Bed_test_01.expected
226  ./fai2Bed_test.sh 
227  vi fai2Bed_test.sh
228  vi ../fai2Bed.pl 
229  vi fai2Bed_test.sh
230  vi fai2Bed_test_01.options
231  ./fai2Bed_test.sh 
232  vi ../fai2Bed.pl 
233  ./fai2Bed_test.sh 
234  ll
235  rm fai2Bed_test_01.5115.1
236  cp fai2Bed_test_01.input fai2Bed_test_02.input
237  vi fai2Bed_test_02.input
238  ssh-agent -l
239  vi fai2Bed_test_02.input
240  ll
241  vi fai2Bed_test_02.input
242  rm fai2Bed_test_02.input
243  vi Makefile 
244  cat README.md 
245  make
246  ll
247  cd ..
248  ll
249  git status
250  rm danRer10.fa.fai 
251  git add .
252  git commit -a -m 'add fai2Bed.pl test'
253  git push
254  git status
255  vi vep-87-install-README.md
256  pushd .
257  cd ..
258  cd ANGSD/
259  ll
260  cd
261  cd /sw/apps/bioinfo/vep/
262  ll
263  cd mf/
264  ll
265  cat 84 
266  vi 82
267  ll
268  ln -s 82 87
269  ll
270  cd /sw/mf/common/bioinfo-tools/misc/vep/
271  ll
272  module list
273  module load bep/84
274  module load vep/84
275  module unload vep
276  vi .vep-82 
277  ln -s .vep-82 87
278  ll
279  vi 87
280  ll
281  module load vep/84
282  module help vep
283  ll /sw/data/uppnex/vep/
284  vi .vep-82 
285  module help vep
286  vi .vep-82 
287  module help vep
288  cd /sw/mf/milou/bioinfo-tools/misc/
289  cd vep
290  ll
291  ln -s ../../../../common/bioinfo-tools/misc/vep/87 .
292  ll
293  module spider htseq
294  exit
295  screen -ls
296  screen -R 16449.SGDP
297  screen -D -RR 16449.SGDP
298  screen -R 16449.SGDP
299  cd /sw/data/uppnex/SGDP/SGDP_bams/
300  ll
301  du -csh EastAsia Oceania SouthAsia
302  pushd .
303  cd /sw/data/uppnex/vep/84
304  ll
305  cd ..
306  ll
307  cd 87
308  ll
309  pushd .
310  popd
311  pushd +2
312  ll
313  cd 87
314  ll
315  cd milou/
316  ll
317  ls ../../84
318  ls ../../84/milou/
319  ls ../../84/milou/scripts/
320  ll
321  ll ../../84/milou/
322  cd ..
323  cd src/
324  ll
325  cd ensembl-tools-release-87/
326  ll
327  cd scripts/
328  ll
329  ll variant_effect_predictor/
330  cd variant_effect_predictor/
331  ll
332  cat stdout_warnings.txt
333  cat README.txt 
334  cat README.txt 
335  ll
336  cd ..
337  rsync -nrPlt variant_effect_predictor /sw/apps/bioinfo/vep/87/milou/scripts
338  ll /sw/apps/bioinfo/vep/87/milou/scripts
339  rsync -nrPlt variant_effect_predictor/* /sw/apps/bioinfo/vep/87/milou/scripts
340  rsync -rPlt variant_effect_predictor/* /sw/apps/bioinfo/vep/87/milou/scripts
341  cd ../../../milou/
342  ll
343  cd scripts/
344  ll
345  cd t/
346  ll
347  cat convert_cache.t 
348  cd ..
349  ll
350  vi convert_cache.pl 
351  echo $PATH
352  module unload vep
353  module list
354  dirs
355  swapd
356  ll
357  cd ailuropoda_melanoleuca/
358  ll
359  cd 87_ailMel1/
360  ll
361  cat info.txt 
362  cd ..
363  dirs
364  swapd +2
365  type swapd
366  vi /home/douglas/.bashrc
367  vi /home/douglas/.bashrc_complete
368  vi /home/douglas/.bashrc
369  vi /home/douglas/.bash_profile
370  vi /home/douglas/.bashrc_simple
371  vi /home/douglas/.bash_profile
372  vi /home/douglas/.bashrc_simple
373  vi /home/douglas/.bash_profile
374  vi /home/douglas/.bash_profile_complete
375  echo $LESSOPEN 
376  grep LESS ~/.bash_profile*
377  ll ~/.lesshst 
378  cat ~/.lesshst 
379  ll
380  view INSTALL.pl 
381  which perl
382  echo $PERL5LIB
383  module load perl_modules/5.18.4
384  cd ..
385  ll
386  echo $PERL5LIB
387  export PERL5LIB=$PWD:$PERL5LIB
388  echo $PERL5LIB
389  vi scripts/INSTALL.pl 
390  dirs
391  cd /sw/data/uppnex/vep/87/ailuropoda_melanoleuca
392  ll
393  cd 87_ailMel1/
394  ll
395  ll GL272367.1/
396  cd ../
397  cd ..
398  ll
399  ll tmp/
400  cd tmp/ailuropoda_melanoleuca/
401  ll
402  cd ..
403  cd /sw/data/uppnex/vep/87
404  ll
405  ls
406  vi scripts/INSTALL.pl 
407  dirs
408  pushd .
409  cd /sw/apps/bioinfo/vep/87/milou
410  ll
411  module list
412  which perl
413  perl scripts/convert_cache.pl --dir /sw/data/uppnex/vep/87 --species ailuropoda_melanoleuca --version 87_ailMel1
414  vi scripts/INSTALL.pl 
415  echo $PERL5LIB
416  perl -MList::Util -e'print $_ . " => " . $INC{$_} . "\n" for keys %INC'
417  perl -MBio::EnsEMBL::Variation::Utils::VEP -e'print $_ . " => " . $INC{$_} . "\n" for keys %INC'
418  scripts/convert_cache.pl --dir /sw/data/uppnex/vep/87 --species ailuropoda_melanoleuca --version 87_ailMel1
419  vi scripts/convert_cache.pl 
420  ll /sw/data/uppnex/vep/87/ailuropoda_melanoleuca/87_ailMel1/info.txt
421  cat /sw/data/uppnex/vep/87/ailuropoda_melanoleuca/87_ailMel1/info.txt
422  cat /sw/data/uppnex/vep/87/bos_taurus/87_UMD3.1/info.txt 
423  cat /sw/data/uppnex/vep/84/bos_taurus/84_UMD3.1/info.txt 
424  cat /sw/data/uppnex/vep/84/ailuropoda_melanoleuca/84_ailMel1/info.txt
425  view /sw/apps/bioinfo/vep/87/milou/Bio/EnsEMBL/Variation/Utils/VEP.pm
426  perl -d scripts/convert_cache.pl --dir /sw/data/uppnex/vep/87 --species ailuropoda_melanoleuca --version 87_ailMel1
427  echo $PERL5LIB
428  echo $PATH
429  export PATH=/sw/apps/bioinfo/vep/87/milou/htslib:$PATH
430  CLUSTERDIR=/sw/apps/bioinfo/vep/87/milou
431  echo $VERSION
432  VERSION=87
433  CACHEDIR=/sw/data/uppnex/vep/${VERSION}
434  cd scripts/
435  ll
436  vi /home/douglas/.vimrc 
437  cd scripts/
438  ll
439  ll ailuropoda_melanoleuca/
440  cd tmp/
441  ll
442  ll ailuropoda_melanoleuca
443  ll ailuropoda_melanoleuca/87_ailMel1/
444  cd ..
445  cd ailuropoda_melanoleuca/
446  ll
447  cd 87_ailMel1/
448  ll
449  cat info.txt 
450  mkdir tmp
451  cd tmp
452  wget ftp://ftp.ensembl.org/pub/release-84/variation/VEP/ailuropoda_melanoleuca_vep_84_ailMel1.tar.gz
453  ll
454  tar xzf ailuropoda_melanoleuca_vep_84_ailMel1.tar.gz 
455  ll
456  ll ailuropoda_melanoleuca
457  ll ailuropoda_melanoleuca/84_ailMel1/
458  cat ailuropoda_melanoleuca/84_ailMel1/info.txt 
459  ll
460  rm -rf ailuropoda_melanoleuca
461  wget ftp://ftp.ensembl.org/pub/release-86/variation/VEP/ailuropoda_melanoleuca_vep_86_ailMel1.tar.gz
462  ll
463  tar xzf ailuropoda_melanoleuca_vep_86_ailMel1.tar.gz 
464  ll
465  cd ailuropoda_melanoleuca/
466  ll
467  cd 86_ailMel1/
468  ll
469  cat info.txt 
470  ./INSTALL.pl -d $CLUSTERDIR -t -c $CACHEDIR
471  which tabix
472  which bgzip
473  ./convert_cache.pl --species ailuropoda_melanoleuca --version 87
474  ./convert_cache.pl --species ailuropoda_melanoleuca --version 87 --cache $CACHEDIR 
475  ./convert_cache.pl --species ailuropoda_melanoleuca --version 87 --cache $CACHEDIR 
476  ./convert_cache.pl 
477  ./convert_cache.pl --species ailuropoda_melanoleuca --version 87 -d $CACHEDIR 
478  ./convert_cache.pl --species ailuropoda_melanoleuca --version all -d $CACHEDIR 
479  cat info.txt 
480  cd ..
481  ll
482  cd ..
483  ll
484  rm -rf ailuropoda_melanoleuca/
485  ll tmp
486  ll tmp/ailuropoda_melanoleuca/
487  cd ailuropoda_melanoleuca/
488  ll
489  cd 87_ailMel1/
490  ll
491  cat info.txt 
492  cd ../..
493  cat ailuropoda_melanoleuca/87_ailMel1/info.txt 
494  cd tmp
495  ll
496  ll ailuropoda_melanoleuca/
497  cd ..
498  mkdir tmp86
499  cd tmp86
500  wget ftp://ftp.ensembl.org/pub/release-86/variation/VEP/ailuropoda_melanoleuca_vep_86_ailMel1.tar.gz
501  tar xzf ailuropoda_melanoleuca_vep_86_ailMel1.tar.gz 
502  ll
503  cat ailuropoda_melanoleuca/86_ailMel1/info.txt 
504  ./INSTALL.pl -d $CLUSTERDIR -t -c $CACHEDIR
505  ./convert_cache.pl --species ailuropoda_melanoleuca --version all -d $CACHEDIR 
506      ./INSTALL.pl -d $CLUSTERDIR -t -c $CACHEDIR
507  cd ../../..
508  module list
509  ll
510  cp vep-87-install-README.md vep-86-install-README.md 
511  vi vep-86-install-README.md 
512  vi INSTALL.pl 
513  cat cat vep-86-install-README.md
514  cd ../../..
515  cat cat vep-86-install-README.md
516      CLUSTER=${CLUSTER?:CLUSTER must be set}
517      TOOL=/sw/apps/bioinfo/vep
518     VERSION=86
519      mkdir -p $TOOL
520      cd $TOOL
521      mkdir -p $VERSION mf
522      VERSIONDIR=$TOOL/$VERSION
523      cd $VERSIONDIR
524      CLUSTERDIR=$VERSIONDIR/$CLUSTER
525      mkdir -p $CLUSTER src
526      cd src
527      wget https://github.com/Ensembl/ensembl-tools/archive/release/${VERSION}.zip
528      unzip ${VERSION}.zip
529      cd ensembl-tools-release-${VERSION}/scripts/variant_effect_predictor/
530     CACHEDIR=/sw/data/uppnex/vep/${VERSION}
531      mkdir -p $CACHEDIR
532      module load perl/5.18.4
533      module load perl_modules/5.18.4
534      export PERL5LIB=$CLUSTERDIR:$PERL5LIB
535      export PATH=$CLUSTERDIR/htslib:$PATH
536  which tabix
537  cd ../../..
538  cd ..
539  cd 86/
540  ll
541  cd milou/
542  ll
543      ./INSTALL.pl -d $CLUSTERDIR -t -c $CACHEDIR
544  echo $PERL5LIB
545  PERL5LIB=/sw/apps/bioinfo/vep/86/milou:/sw/comp/perl_modules/5.18.4/milou/lib/perl5:/sw/comp/perl_modules/5.18.4/milou/lib/perl5/x86_64-linux-thread-multi:/sw/comp/perl/5.18.4/milou/lib
546  echo $PATH
547  PATH=/sw/apps/bioinfo/vep/86/milou/htslib:/sw/comp/perl_modules/5.18.4/milou/bin:/sw/comp/perl/5.18.4/milou/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/sw/uppmax/bin
548      ./INSTALL.pl -d $CLUSTERDIR -t -c $CACHEDIR
549  cd ..
550  ll
551  cd variant_effect_predictor/
552  ll htslib/
553  cd ..
554  ll
555  rm -rf tmp86
556  screen -ls
557  screen -R 16449.SGDP
558  cd /sw/data/uppnex/SGDP/SGDP_bams/
559  ll
560  du -csh *
561  cd SouthAsia/
562  ll
563  ll SAMEA3302861__Khonda_Dora-1_S__LP6005519-DNA_E05
564  ll SAMEA3302885__Punjabi-3_S__LP6005442-DNA_B12
565  screen -ls
566  screen -R 16449.SGDP
567  cd SAMEA3302861__Khonda_Dora-1_S__LP6005519-DNA_E05
568  ll
569  mkdir orig
570  mv core* *.gz orig/
571  ll
572  screen -S SGDP2
573  screen -ls
574  screen -R 16449.SGDP
575  screen -ls
576  screen -R 32974.SGDP2
577  screen -R 16449.SGDP
578  htop -u douglas
579  screen -R 16449.SGDP
580  screen -R 32974.SGDP2
581  screen -R 16449.SGDP
582  cd /sw/data/uppnex/SGDP/SGDP_bams/
583  ll
584  ll EastAsia/SAMEA3302692__Burmese-2_S__LP6005519-DNA_A06
585  cd EastAsia/SAMEA3302692__Burmese-2_S__LP6005519-DNA_A06
586  ll
587  rm ERR1395610_1.fastq.gz.md5
588  grep ERR1395610_1.fastq.gz ../../ALL_SGDP_fastq_files_ftp_addresses_Feb2017_Nobam__All_regions__paperName.tsv
589  cd ../..
590  cp cmds.sh cmds_redo.sh
591  vi cmds_redo.sh
592  screen -ls
593  cd /sw/data/uppnex/SGDP/SGDP_bams/
594  ll
595  ls -lR EastAsia/
596  ls -lR EastAsia/
597  ls -lR Oceania
598  ls -lR SouthAsia
599  rm -rf SouthAsia/SAMEA3302861__Khonda_Dora-1_S__LP6005519-DNA_E05/orig
600  rm -rf SouthAsia/SAMEA3302861__Khonda_Dora-1_S__LP6005519-DNA_E05/do_it
601  ls -lR SouthAsia
602  screen -ls
603  ll EastAsia/SAMEA3302745__Atayal-1_S__LP6005442-DNA_E07
604  ll EastAsia/
605  ll -R EastAsia/
606  ll EastAsia/SAMEA3302755__Xibo-1_S__LP6005442-DNA_D01
607  rm EastAsia/SAMEA3302755__Xibo-1_S__LP6005442-DNA_D01/*.md5
608  ll -R EastAsia/
609  ll EastAsia/SAMEA3302692__Burmese-2_S__LP6005519-DNA_A06
610  screen -R 16449.SGDP
611  vi sgdp_Feb2017.pl
612  screen -R 16449.SGDP
613  ./sgdp_Feb2017.pl --timestamp
614  module load perl_modules/5.18.4
615  ./sgdp_Feb2017.pl --timestamp
616  ./sgdp_Feb2017.pl --se --timestamp
617  ll SouthAsia/SAMEA3302911__Kusunda-2_S__LP6005443-DNA_D09/ERR1347712_2.fastq.gz
618  vi sgdp_Feb2017.pl
619  ./sgdp_Feb2017.pl --se --timestamp | bash
620  ./sgdp_Feb2017.pl --se --timestamp | bash | grep -v '^+ '
621  ./sgdp_Feb2017.pl --se --timestamp | bash 2>/dev/null
622  06/ERR1395610_1.fastq.gz
623  ll EastAsia/SAMEA3302692__Burmese-2_S__LP6005519-DNA_A06
624  ls -lR EastAsia/
625  ll -d EastAsia/SAMEA3302846__Miao-1_S__LP6005441-DNA_C08
626  ll EastAsia/SAMEA3302846__Miao-1_S__LP6005441-DNA_C08/*
627  ll EastAsia/SAMEA3302692__Burmese-2_S__LP6005519-DNA_A06
628  screen -R 16449.SGDP
629  man wget
630  ll EastAsia/SAMEA3302692__Burmese-2_S__LP6005519-DNA_A06
631  stat EastAsia/SAMEA3302692__Burmese-2_S__LP6005519-DNA_A06/ERR1395610_2.fastq.gz
632  find . -type f -name '*.fastq.gz' -mtime -7
633  find . -type f -name '*.fastq.gz' -mtime -7
634  vi sgdp_Feb2017.pl
635  ./sgdp_Feb2017.pl --se --timestamp
636  screen -ls
637  screen -R 16449.SGDP
638  ll EastAsia/SAMEA3302692__Burmese-2_S__LP6005519-DNA_A06
639  screen -ls
640  screen -R 32974.SGDP2
641  screen -R 16449.SGDP
642  screen -ls
643      ./INSTALL.pl -d $CLUSTERDIR -t -c $CACHEDIR
644  screen -R 59933.probe
645  screen -ls
646  cd /sw/data/uppnex/SGDP/SGDP_bams
647  ll
648  een -R 16449.SGDP
649  screen -R 32974.SGDP2
650  clear
651  screen -ls
652  ./sgdp_Feb2017.pl --se --timestamp
653  cd /sw/data/uppnex/SGDP/SGDP_bams
654  ./sgdp_Feb2017.pl --se --timestamp
655  module load perl_modules/5.18.4
656  ./sgdp_Feb2017.pl --se --timestamp
657  find . -type f -name '*.fastq.gz' -mtime -7
658  ll ./SouthAsia/SAMEA3302639__Pathan-2_S__LP6005441-DNA_D10
659  ll
660  ll Oceania/SAMEA3302696__Igorot-2_S__LP6005519-DNA_D06
661  screen -R 16449.SGDP
662  screen -ls
663  clear
664  screen -ls
665  screen -R 16449.SGDP
666  cd /sw/data/uppnex/SGDP/SGDP_bams
667  find . -type f -name '*.fastq.gz' -mtime -7
668  ll ./SouthAsia/SAMEA3302639__Pathan-2_S__LP6005441-DNA_D10
669  screen -ls
670  mdoule list
671  module load bioinfo-tools
672  module list
673  module unload gnuparallel diamond bioinfo-tools
674  module list
675  module help diamond/0.8.26
676  module load bioinfo-tools
677  module help diamond/0.8.26
678  screen -ls
679  ll
680  ./diamond-update-dbs.sh 
681  ll
682  ll RefSeq/
683  cat Makefile 
684  vi diamond-update-dbs.sh 
685  ll
686  cd RefSeq/
687  ll
688  cd 79/download/
689  ll
690  cd ..
691  ll
692  mv 79 79_old && ln -sf 79_old latest
693  ll
694  mkdir 79
695  ll
696  cd 79
697  ll
698  ls ../79_old/
699  mv ../79_old/download .
700  ll
701  cd download/
702  ll
703  cat RELEASE_NUMBER 
704  ll
705  vi ../../../diamond-update-dbs.sh 
706  man mget
707  man lftp
708  ll
709  mv *.gz ..
710  ll
711  cd ..
712  ll
713  rm -rf download/
714  ll
715  vi ../../diamond-update-dbs.sh 
716  ll
717  zcat complete.nonredundant_protein.*.protein.faa.gz > complete.nonredundant_protein.protein.faa 
718  module list
719  module load diamond/0.8.26
720  module load gnuparallel/20150522
721  screen -ls
722  /usr/bin/time -v diamond makedb --in complete.nonredundant_protein.protein.faa --threads 10 -d complete.nonredundant_protein.protein
723  ll
724  mdkir download
725  mkdir download
726  mv -vf complete.nonredundant_protein.*.protein.faa.gz  download/
727  ll
728  rm complete.nonredundant_protein.protein.faa
729  zcat complete.*.protein.faa.gz > complete.protein.faa 
730  ll
731  /usr/bin/time -v diamond makedb --in complete.protein.faa --threads 10 -d complete.protein
732  ll
733  rm complete.protein.faa
734  mv -vf complete.*.protein.faa.gz  download/
735  ll
736  ll download/
737  cd download/
738  wget --timestamping ftp://ftp.ncbi.nlm.nih.gov/refseq/release/RELEASE_NUMBER
739  ll
740  cd ..
741  ll
742  cd ..
743  find . -name '*.dmnd'| parallel -v --line-buffer -j 1 diamond getseq --db {} '|' head '>/dev/null'
744  ll
745  ln -sf 79 latest
746  ll
747  rm -rf 79_old
748  ll
749  ln -sf 79 latest
750  ll
751  ll 79
752  cd ..
753  find . -name '*.dmnd'| parallel -v --line-buffer -j 1 diamond getseq --db {} '|' head '>/dev/null'
754  cd Blast/
755  ll
756  rm -rf 20161202/
757  du.
758  cd ..
759  ll
760  rm diamond-0.8.26-database-compatibility.log 
761  ll
762  ./diamond-update-dbs.sh 
763  ll
764  ll Blast/
765  cd RefSeq/
766  ll
767  ll 79/
768  ll 79/download/
769  cd ..
770  ll
771  cd Blast/
772  ll
773  cd 20170112/
774  ll
775  ll download/
776  ll
777  cd ..
778  du.
779  cd ..
780  ll
781  cd UniRef90/
782  ll
783  ll 2016_11/
784  ll
785  ll 2016_11/
786  cd ..
787  ll
788  cat diamond-0.8.26-database-compatibility-79.log
789  vi diamond-update-dbs.sh 
790  bash -c diamond-update-dbs.sh 
791  ll
792  man bash
793  bash -n diamond-update-dbs.sh 
794  ll
795  mv diamond-0.8.26-database-compatibility-79.log diamond-0.8.26-database-compatibility-20170112.log
796  ll
797  vi DIAMOND-DBs.md 
798  ll
799  vi DIAMOND-DBs.md 
800  make
801  ll
802  vi DIAMOND-DBs.html 
803  ll
804  cd RefSeq/
805  ll
806  cd ..
807  cd RefSeq/
808  ll
809  mv 79 79_old && ln -sf 79_old latest
810  ll
811  cd ..
812  ll
813  vi diamond-update-dbs.sh 
814  man lftp
815  ll
816  cd RefSeq/
817  ll
818  cd ..
819  vi diamond-update-dbs.sh 
820  man lftp
821  grep -A 5 lftp diamond-update-dbs.sh 
822  cd RefSeq/
823  ll
824  mkdir test
825          lftp ftp://ftp.ncbi.nlm.nih.gov/refseq/release/complete
826  ll
827  cd ..
828  ll
829  vi diamond-update-dbs.sh 
830  screen -ls
831  ll
832  ./diamond-update-dbs.sh 
833  ll
834  ll RefSeq/
835  cd RefSeq/
836  du -csh *
837  ll 80/
838  ll 80/download/
839  cd ..
840  ll
841  vi diamond-update-dbs.sh 
842  ll
843  rm diamond-0.8.26-database-compatibility-20170112.log
844  ll Blast/
845  cd Blast/
846  ll
847  rm -rf 20170102/
848  cd ../RefSeq/
849  ll
850  rm -rf 79
851  ll
852  cd ..
853  ll
854  module list
855  ll RefSeq/
856  ll RefSeq/80/
857  ll Blast/20170112/
858  ll Blast/20170112/download/
859  pushd .
860  mkdir test
861  cd test
862  cp /sw/apps/bioinfo/OrthoMCL/2.0.9/src_milou/OrthoMCL/wrapper/test/_utils/SAR11-HIMB058_2265129005_genes.fasta .
863  ll
864  head SAR11-HIMB058_2265129005_genes.fasta 
865  ll
866  module list
867  diamond
868  diamond help
869  module list
870  diamond blastp --db $DIAMOND_REFSEQ_NONREDUNDANT --query SAR11-HIMB058_2265129005_genes.fasta --out test.out --outfmt 6 -v 
871  ll
872  diamond blastp --db $DIAMOND_REFSEQ_NONREDUNDANT --query SAR11-HIMB058_2265129005_genes.fasta --out test.out --outfmt 6 -v --threads 8
873  ll
874  tail test.out
875  cd ..
876  rm -rf test
877  ll
878  rm -rf diamond-0.8.26-database-compatibility-20170*
879  ll
880  ll Blast/
881  ll RefSeq/
882  ll UniRef90/
883  fb166
884  ll
885  exit
886  screen -R 61210.diamond
887  screen -R 61210.diamond
888  screen -R 61210.diamond
889  screen -ls
890  screen -ls
891  screen -ls
892  cd 28896.compress2
893  screen -R 28896.compress2
894  ll Oceania/SAMEA3302696__Igorot-2_S__LP6005519-DNA_D06
895  rm -f Oceania/SAMEA3302696__Igorot-2_S__LP6005519-DNA_D06/core.?????
896  ll Oceania/SAMEA3302696__Igorot-2_S__LP6005519-DNA_D06/core.????
897  ll Oceania/SAMEA3302696__Igorot-2_S__LP6005519-DNA_D06/
898  ll ./Oceania/SAMEA3302704__Papuan-7_S__LP6005443-DNA_F07
899  cd ..
900  ll
901  du.
902  df -kh .
903  screen -ls
904  module spider vep
905  ll
906  cd ..
907  ll
908  cd src/
909  ll
910  cd ensembl-tools-release-86/
911  ll
912  cd scripts/
913  ll
914  cd variant_effect_predictor/
915  ll
916  cd ..
917  cd ..
918  rsync -rPlt variant_effect_predictor/* ../../../milou/scripts
919  cd ../../../milou/
920  ll
921  cd scripts/
922  ll
923  cd ..
924  ll
925  chmod -x INSTALL.pl 
926  vi vep-86-install-README.md
927  cd mf
928  ll
929  ln -s 82 86
930  vi 86
931  pushd .
932  cd /sw/mf/common/bioinfo-tools/misc/vep
933  ll
934  cp /sw/apps/bioinfo/vep/mf/82 .vep-82 
935  ln -s .vep-82 86
936  ll
937  module list
938  module load bioinfo-tools
939  module load vep/84
940  vi .vep-82 
941  module load vep/84
942  vi .vep-82 
943  module unload vep/84
944  module load vep/84
945  module help vep
946  module unload vep
947  module list
948  ll
949  cd ../../../../milou/bioinfo-tools/misc/vep/
950  ll
951  ln -s ../../../../common/bioinfo-tools/misc/vep/86 .
952  ll
953  df -kh .
954  ll
955  cd 87
956  ll
957  ll homo_sapiens
958  ll homo_sapiens/87_GRCh38
959  cat homo_sapiens/87_GRCh38/info.txt 
960  screen -ls
961  module list
962  module load bioinfo-tools vep/87
963  cd /sw/apps/bioinfo/vep/87/
964  ll
965  cd milou/
966  ll
967      ./INSTALL.pl -d $CLUSTERDIR -t -c $CACHEDIR
968  echo $CLUSTERDIR
969  cd ../../../87/
970  cd milou/
971  ll
972  cd scripts/
973  ll
974  echo $CACHEDIR
975  echo $CLUSTERDIR
976  module list
977  ./INSTALL.pl  -d $CLUSTERDIR -t -c $CACHEDIR
978  echo $PATH
979  echo $PERL5LIB
980  ./INSTALL.pl  -d $CLUSTERDIR -t -c $CACHEDIR
981  dirs
982  cd ../../..
983  cd ../..
984  cd data
985  cd uppnex/
986  ll
987  cd vep
988  ll
989  module help orthomcl
990  module list
991  module load OrthoMCL
992  module help OrthoMCL
993  module help OrthoMCL
994  groups
995  module list
996  cd
997  cd glob
998  ll
999  which orthomcl_wrapper_UPPMAX 
1000  htop -u anush
1001  cd /sw/apps/bioinfo/OrthoMCL/
1002  ll
1003  cd 2.0.9/
1004  ll
1005  cd milou/
1006  ll
1007  htop -u anush
1008  cd ../..
1009  hi Ortho
1010  history | grep -i ortho
1011  history > OrthoMCL-2.0.9-install-README.md
