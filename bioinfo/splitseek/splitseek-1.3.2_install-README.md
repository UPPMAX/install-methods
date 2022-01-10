
This file contains information how to run the SplitSeek program.

-----------------
INSTALLATION 
-----------------

- Make sure that perl is installed and if necessary change the perl path '/usr/bin/perl' in the files splitseek_preproc_solid.pl and splitseek.pl

--------------------------
Run SplitSeek preprocessor
--------------------------

- The SplitSeek preprocessor takes result files from the AB/SOLiD whole transcriptome pipeline as input. The file should have the suffix 'max.merged.filtered.csfasta' 

- Run the preprocessor with the command:

  [splitseek_dir]/splitseek_solid_get_splice_candidates.pl -i [infile] -o [outfile] -t -a -mm --silent --help

  * Use the '--help' agument to get information on the arguments
  
-------------
Run SplitSeek
-------------

- Run SplitSeek with the command:

  [splitseek_dir]/splitseek.pl -i [infile] -o [outfile] -reads -unique -dist -span -chrmap [chrmapfile] -strand -opp --silent --help 

  * Here '-infile' is the outfile from the preprocessor
  * Use the '--help' agument to get information on the arguments


----------------
SplitSeek output
----------------

SplitSeek outputs the predictions in two different file formats, BEDPE and BED. Note that a 'chrmap' file may need to be specified to get the correct chromosome names (see below).

1. BEDPE file - For further analysis, with BEDTools or other programs

Each line in the BEDPE file corresponds to a predicted splice junction (or genomic rearrangement). There are 11 columns:

   'r1chr' - chromosome for 1st part of exon-exon boundary
   'r1start' - start position for 1st part of exon-exon boundary
   'r1end' - end position 1st part of exon-exon boundary
   'r2chr' - chromosome for 2nd part of exon-exon boundary
   'r2start' - start position for 2nd part of exon-exon boundary
   'r2end' - end position 2nd part of exon-exon boundary
   'name' - a unique idenfifies for each prediction
   'score' - number of reads covering the junction
   'strand1' - consensus strand for r1 (if strand option is used)
   'strand2' - consensus strand for r2 (if strand option is used)
   'strand2' - consensus strand for r2 (if strand option is used)
   'pp' - number reads where the split alignments are both on '+' strand
   'mm' - number reads where the split alignments are both on '-' strand
   'pm' - number reads with the first part aligned to '+', the other to '-'
   'mp' - number reads with the first part aligned to '-', the other to '+'

2. BED file - For visualization in the UCSC genome browser

SplitSeek also outputs a BED file that can be directly uploaded as user tracks in the UCSC genome browser. 

------------------------
Specify chromosome names 
------------------------

The user can specify chromosome names in a 'chrmap' file. This may be necessary for example to correctly view a region in the UCSC genome browser. The 'chrmap' consists of two columns, chromosome names in experiment and chromosome names in UCSC browser (see example for the mouse mm9 assembly below). A third column may also be specified containing the first coordinate on the chromosome. This should only be used when target regions were used in the alignment instead of whole chromosomes.  

- When the chrmap has been created, run the SplitSeek program with the '-chrmap' argument set

----------------------------------------
Example chrmap file (mouse mm9 assembly)
----------------------------------------

chr1    chr1
chr2    chr2
chr3    chr3
chr4    chr4
chr5    chr5
chr6    chr6
chr7    chr7
chr8    chr8
chr9    chr9
chr10   chr10
chr11   chr11
chr12   chr12
chr13   chr13
chr14   chr14
chr15   chr15
chr16   chr16
chr17   chr17
chr18   chr18
chr19   chr19
chr20   chrX
chr21   chrY
chr22   chrUn_random





  
  
