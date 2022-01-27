SNP2HLA/1.0.3
========================

<https://software.broadinstitute.org/mpg/snp2hla/>

Used under license:



Structure creating script (makeroom_SNP2HLA_1.0.3.sh) moved to /sw/bioinfo/SNP2HLA/makeroom_1.0.3.sh

LOG
---

    makeroom.sh -t "SNP2HLA" -v "1.0.3" -c "bioinfo" -s misc -w "https://software.broadinstitute.org/mpg/snp2hla/" -d "a tool to impute amino acid polymorphisms and single nucleotide polymorphisms in human luekocyte antigenes (HLA) within the major histocompatibility complex (MHC) region in chromosome 6"
    ./makeroom_SNP2HLA_1.0.3.sh 
    source /sw/bioinfo/SNP2HLA/SOURCEME_SNP2HLA_1.0.3 && cd $SRCDIR


Get software, correct execute permissions, and correct perl hard paths.


    wget https://software.broadinstitute.org/mpg/snp2hla/data/SNP2HLA_package_v1.0.3.tar.gz
    tar xf SNP2HLA_package_v1.0.3.tar.gz 
    find SNP2HLA_package_v1.0.3 -type f -exec chmod -x {} \;
    cd SNP2HLA_package_v1.0.3/
    cd SNP2HLA/
    chmod +x *.csh *.pl
    sed -i 's,^#!/usr/bin/perl,#!/usr/bin/env perl,' *.pl
    cd ../MakeReference
    chmod +x *.csh *.pl
    sed -i 's,^#!/usr/bin/perl,#!/usr/bin/env perl,' *.pl
    cd ..


Move the unpacked SNP2HLA directory over to PREFIX and work there.


    cd $SRCDIR
    rmdir $PREFIX
    mv SNP2HLA_package_v1.0.3 $PREFIX


Get jar files required.  Put them into `SNP2HLA/` and use symlinks from
`MakeReference/`.  NOTE: `linkage2beagle.jar` options syntax has changed, see patch
below for fixes for `SNP2HLA.csh` and `MakeReference.csh`.


    cd $SRCDIR
    wget https://faculty.washington.edu/browning/beagle/recent.versions/beagle_3.0.4_05May09.zip
    unzip beagle_3.0.4_05May09.zip 
    cp -av beagle.3.0.4/beagle.jar $PREFIX/SNP2HLA/
    wget https://faculty.washington.edu/browning/beagle_utilities/linkage2beagle.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/beagle2linkage.jar
    cp -av linkage2beagle.jar beagle2linkage.jar $PREFIX/SNP2HLA/
    cd $PREFIX/MakeReference
    ln -s ../SNP2HLA/{beagle,linkage2beagle}.jar .


Installation instructions say this must have `plink` 1.07 in the same directory
as the scripts, but its location is found using `which` so we just load the
module.  This must also occur in the mf file.


    module load bioinfo-tools plink/1.07


### Patch fixes to SNP2HLA.csh and MakeReference.csh


We need to patch the two main scripts to remove requirements for operating
within the script directory, and to correct for new options syntax for
`linkage2beagle.jar`.

    cd $SRCDIR
    ln -s $PREFIX new
    diff -u -r SNP2HLA_package_v1.0.3 new > UPPMAX.patch

The contents of this patch file are below.


### Testing


To test, create a test directory out of the tree, copy the test files there,
and run the thing.  Dummy up PATH changes from a module load by prefixing
$PREFIX/SNP2HLA and $PREFIX/MakeReference to it.  The module help points to
these locations so users can do this as well.


    cd $SRCDIR
    mkdir test
    cd test

    ln -s $PREFIX/SNP2HLA/{1958,HM_CEU_REF}* .

    SNP2HLA.csh 1958BC HM_CEU_REF 1958BC_IMPUTED plink 2000 1000

    ln -s $PREFIX/MakeReference/{HAPMAP_CEU,HM_CEU_REF}* .

    MakeReference.csh HAPMAP_CEU HAPMAP_CEU_HLA.ped HM_CEU_REF plink


### UPPMAX.patch



    diff -u -r SNP2HLA_package_v1.0.3/MakeReference/HLAtoSequences.pl new/MakeReference/HLAtoSequences.pl
    --- SNP2HLA_package_v1.0.3/MakeReference/HLAtoSequences.pl	2015-03-10 01:09:16.000000000 +0100
    +++ new/MakeReference/HLAtoSequences.pl	2022-01-27 12:14:28.860305000 +0100
    @@ -1,4 +1,4 @@
    -#!/usr/bin/perl
    +#!/usr/bin/env perl
      
     #########################################################################################
     #
    diff -u -r SNP2HLA_package_v1.0.3/MakeReference/MakeReference.csh new/MakeReference/MakeReference.csh
    --- SNP2HLA_package_v1.0.3/MakeReference/MakeReference.csh	2015-03-10 01:09:16.000000000 +0100
    +++ new/MakeReference/MakeReference.csh	2022-01-27 13:16:01.862061000 +0100
    @@ -16,7 +16,8 @@
     # ./MakeReference.csh T1DGC T1DGC.HLA_TYPES.ped T1DGC.REF
     
     if ($#argv != 4) then
    -    echo "USAGE: ./MakeReference.csh SNPS (.bed/.bim/.fam) HLAfile (FID,IID,pID,mID,SEX,PHENO,A,B,C,DPA1,DPB1,DQA1,DQB1,DRB1) OUTPUT (.bgl.phased/.markers/.bed) plink"; exit 1
    +    ## UPPMAX echo "USAGE: ./MakeReference.csh SNPS (.bed/.bim/.fam) HLAfile (FID,IID,pID,mID,SEX,PHENO,A,B,C,DPA1,DPB1,DQA1,DQB1,DRB1) OUTPUT (.bgl.phased/.markers/.bed) plink"; exit 1
    +    echo "USAGE: MakeReference.csh SNPS (.bed/.bim/.fam) HLAfile (FID,IID,pID,mID,SEX,PHENO,A,B,C,DPA1,DPB1,DQA1,DQB1,DRB1) OUTPUT (.bgl.phased/.markers/.bed) plink"; exit 1
     endif
     
     set SCRIPTPATH=`dirname $0`
    @@ -33,19 +34,19 @@
         echo "Please install Beagle 3 (http://faculty.washington.edu/browning/beagle/beagle.html#download) and copy the run file (beagle.3.0.4/beagle.jar) into $SCRIPTPATH/"; exit 1
     else if (! -e $SCRIPTPATH/linkage2beagle.jar) then
         echo "Please copy linkage2beagle.jar (http://faculty.washington.edu/browning/beagle_utilities/utilities.html) (beagle.3.0.4/utility/linkage2beagle.jar) into $SCRIPTPATH/"; exit 1
    -else if (! -e HLAtoSequences.pl) then
    +else if (! -e `which HLAtoSequences.pl`) then
         echo "Please copy HLAtoSequences.pl (included with this package) into this directory."; exit 1
    -else if (! -e encodeVariants.pl) then
    +else if (! -e `which encodeVariants.pl`) then
         echo "Please copy encodeVariants.pl (included with this package) into this directory."; exit 1
    -else if (! -e encodeHLA.pl) then
    +else if (! -e `which encodeHLA.pl`) then
         echo "Please copy encodeHLA.pl (included with this package) into this directory."; exit 1
    -else if (! -e HLA_DICTIONARY_AA.map) then
    +else if (! -e $SCRIPTPATH/HLA_DICTIONARY_AA.map) then
         echo "Please copy HLA_DICTIONARY_AA.map (included with this package) into this directory."; exit 1
    -else if (! -e HLA_DICTIONARY_AA.txt) then
    +else if (! -e $SCRIPTPATH/HLA_DICTIONARY_AA.txt) then
         echo "Please copy HLA_DICTIONARY_AA.txt (included with this package) into this directory."; exit 1
    -else if (! -e HLA_DICTIONARY_SNPS.map) then
    +else if (! -e $SCRIPTPATH/HLA_DICTIONARY_SNPS.map) then
         echo "Please copy HLA_DICTIONARY_SNPS.map (included with this package) into this directory."; exit 1
    -else if (! -e HLA_DICTIONARY_SNPS.txt) then
    +else if (! -e $SCRIPTPATH/HLA_DICTIONARY_SNPS.txt) then
         echo "Please copy HLA_DICTIONARY_SNPS.txt (included with this package) into this directory."; exit 1
     endif
     
    @@ -74,11 +75,11 @@
     # Encode HLA amino acids
     if ($ENCODE_AA) then
         echo "[$i] Generating amino acid sequences from HLA types.";  @ i++
    -    ./HLAtoSequences.pl $HLA_DATA HLA_DICTIONARY_AA.txt AA > $OUTPUT.AA.ped
    -    cp HLA_DICTIONARY_AA.map $OUTPUT.AA.map
    +    HLAtoSequences.pl $HLA_DATA $SCRIPTPATH/HLA_DICTIONARY_AA.txt AA > $OUTPUT.AA.ped
    +    cp $SCRIPTPATH/HLA_DICTIONARY_AA.map $OUTPUT.AA.map
     
         echo "[$i] Encoding amino acids positions." ;  @ i++
    -    ./encodeVariants.pl $OUTPUT.AA.ped $OUTPUT.AA.map $OUTPUT.AA.CODED
    +    encodeVariants.pl $OUTPUT.AA.ped $OUTPUT.AA.map $OUTPUT.AA.CODED
     
         plink --file $OUTPUT.AA.CODED --missing-genotype 0 --make-bed --out $OUTPUT.AA.TMP
         awk '{if ($5 == "0" || $5 == "x" || $6 == "x"){print $2}}' $OUTPUT.AA.TMP.bim | grep -v INS | cut -f2 > to_remove
    @@ -90,18 +91,18 @@
     # Encode classical HLA alleles into binary format
     if ($ENCODE_HLA) then
         echo "[$i] Encoding HLA alleles.";  @ i++
    -    ./encodeHLA.pl $HLA_DATA $OUTPUT.HLA.map > $OUTPUT.HLA.ped
    +    encodeHLA.pl $HLA_DATA $OUTPUT.HLA.map > $OUTPUT.HLA.ped
         plink --file $OUTPUT.HLA --make-bed --out $OUTPUT.HLA
     endif
     
     # Encode HLA SNPs
     if ($ENCODE_SNPS) then
         echo "[$i] Generating DNA sequences from HLA types.";  @ i++
    -    ./HLAtoSequences.pl $HLA_DATA HLA_DICTIONARY_SNPS.txt SNPS > $OUTPUT.SNPS.ped
    -    cp HLA_DICTIONARY_SNPS.map $OUTPUT.SNPS.map
    +    HLAtoSequences.pl $HLA_DATA $SCRIPTPATH/HLA_DICTIONARY_SNPS.txt SNPS > $OUTPUT.SNPS.ped
    +    cp $SCRIPTPATH/HLA_DICTIONARY_SNPS.map $OUTPUT.SNPS.map
     
         echo "[$i] Encoding SNP positions." ;  @ i++
    -    ./encodeVariants.pl $OUTPUT.SNPS.ped $OUTPUT.SNPS.map $OUTPUT.SNPS.CODED
    +    encodeVariants.pl $OUTPUT.SNPS.ped $OUTPUT.SNPS.map $OUTPUT.SNPS.CODED
         plink --file $OUTPUT.SNPS.CODED --missing-genotype 0 --make-bed --out $OUTPUT.SNPS.TMP
     
         awk '{if ($5 == "0" || $5 == "x" || $6 == "x"){print $2}}' $OUTPUT.SNPS.TMP.bim | grep -v INS | cut -f2 > to_remove
    @@ -174,7 +175,11 @@
         cut -d ' ' -f1-5,7- $OUTPUT.ped > $OUTPUT.nopheno.ped
     
         echo "[$i] Converting to beagle format.";  @ i++
    -    linkage2beagle pedigree=$OUTPUT.nopheno.ped data=$OUTPUT.dat beagle=$OUTPUT.bgl standard=true > $OUTPUT.bgl.log
    +    ## UPPMAX: accomodate new linkage2beagle.jar argument format: https://faculty.washington.edu/browning/beagle_utilities/utilities.html#linkage2beagle
    +    ## linkage2beagle pedigree=$OUTPUT.nopheno.ped data=$OUTPUT.dat beagle=$OUTPUT.bgl standard=true > $OUTPUT.bgl.log
    +    ##     usage: java -jar linkage2beagle.jar [data] [ped] > [bgl]
    +    echo "accomodating new linkage arguments for linkage2beagle.jar" > $OUTPUT.bgl.log
    +    linkage2beagle $OUTPUT.dat $OUTPUT.nopheno.ped > $OUTPUT.bgl
     endif 
     
     if ($PHASE) then
    Only in new/MakeReference: beagle.jar
    diff -u -r SNP2HLA_package_v1.0.3/MakeReference/encodeHLA.pl new/MakeReference/encodeHLA.pl
    --- SNP2HLA_package_v1.0.3/MakeReference/encodeHLA.pl	2015-03-10 01:09:16.000000000 +0100
    +++ new/MakeReference/encodeHLA.pl	2022-01-27 12:14:31.525342000 +0100
    @@ -1,4 +1,4 @@
    -#!/usr/bin/perl
    +#!/usr/bin/env perl
     
     ###########################################################################################
     #
    diff -u -r SNP2HLA_package_v1.0.3/MakeReference/encodeVariants.pl new/MakeReference/encodeVariants.pl
    --- SNP2HLA_package_v1.0.3/MakeReference/encodeVariants.pl	2015-03-10 01:09:16.000000000 +0100
    +++ new/MakeReference/encodeVariants.pl	2022-01-27 12:14:39.428333000 +0100
    @@ -1,4 +1,4 @@
    -#!/usr/bin/perl
    +#!/usr/bin/env perl
     
     ###########################################################################################
     #
    Only in new/MakeReference: linkage2beagle.jar
    diff -u -r SNP2HLA_package_v1.0.3/SNP2HLA/SNP2HLA.csh new/SNP2HLA/SNP2HLA.csh
    --- SNP2HLA_package_v1.0.3/SNP2HLA/SNP2HLA.csh	2015-03-10 01:09:16.000000000 +0100
    +++ new/SNP2HLA/SNP2HLA.csh	2022-01-27 12:59:26.717115000 +0100
    @@ -24,7 +24,8 @@
     ######################################################################################################
     
     if ($#argv < 4) then
    -    echo "USAGE: ./SNP2HLA.csh DATA (.bed/.bim/.fam) REFERENCE (.bgl.phased/.markers) OUTPUT plink {optional: java_max_memory[mb] marker_window_size}"; exit 1
    +    ## UPPMAX echo "USAGE: ./SNP2HLA.csh DATA (.bed/.bim/.fam) REFERENCE (.bgl.phased/.markers) OUTPUT plink {optional: java_max_memory[mb] marker_window_size}"; exit 1
    +    echo "USAGE: SNP2HLA.csh DATA (.bed/.bim/.fam) REFERENCE (.bgl.phased/.markers) OUTPUT plink {optional: java_max_memory[mb] marker_window_size}"; exit 1
     endif
     
     set SCRIPTPATH=`dirname $0`
    @@ -72,9 +73,9 @@
     set JAVATMP=$OUTPUT.javatmpdir
     mkdir -p $JAVATMP
     alias plink '$PLINK --noweb --silent --allow-no-sex'
    -alias beagle 'java -Djava.io.tmpdir=$JAVATMP -Xmx$MEM\m -jar $SCRIPTPATH/beagle.jar'
    -alias linkage2beagle 'java -Djava.io.tmpdir=$JAVATMP -Xmx$MEM\m -jar $SCRIPTPATH/linkage2beagle.jar'
    -alias beagle2linkage 'java -Djava.io.tmpdir=$JAVATMP -Xmx$MEM\m -jar $SCRIPTPATH/beagle2linkage.jar'
    +alias beagle 'java -Djava.io.tmpdir=$JAVATMP -Xmx${MEM}m -jar $SCRIPTPATH/beagle.jar'
    +alias linkage2beagle 'java -Djava.io.tmpdir=$JAVATMP -Xmx${MEM}m -jar $SCRIPTPATH/linkage2beagle.jar'
    +alias beagle2linkage 'java -Djava.io.tmpdir=$JAVATMP -Xmx${MEM}m -jar $SCRIPTPATH/beagle2linkage.jar'
     
     # Functions to run
     set EXTRACT_MHC = 1
    @@ -165,7 +166,11 @@
     
     if ($CONVERT_IN) then
         echo "[$i] Convering data to beagle format."; @ i++
    -    linkage2beagle pedigree=$MHC.QC.nopheno.ped data=$MHC.QC.dat beagle=$MHC.QC.bgl standard=true > $OUTPUT.bgl.log
    +    ## UPPMAX: accomodate new linkage2beagle.jar argument format: https://faculty.washington.edu/browning/beagle_utilities/utilities.html#linkage2beagle 
    +    ## linkage2beagle pedigree=$MHC.QC.nopheno.ped data=$MHC.QC.dat beagle=$MHC.QC.bgl standard=true > $OUTPUT.bgl.log
    +    ##     usage: java -jar linkage2beagle.jar [data] [ped] > [bgl]
    +    echo "accomodating new linkage arguments for linkage2beagle.jar" > $OUTPUT.bgl.log
    +    linkage2beagle $MHC.QC.dat $MHC.QC.nopheno.ped > $MHC.QC.bgl
     
         echo "===============================================================================" >> $OUTPUT.bgl.log
     
    Only in new/SNP2HLA: beagle.jar
    Only in new/SNP2HLA: beagle2linkage.jar
    Only in new/SNP2HLA: linkage2beagle.jar
    diff -u -r SNP2HLA_package_v1.0.3/SNP2HLA/merge_tables.pl new/SNP2HLA/merge_tables.pl
    --- SNP2HLA_package_v1.0.3/SNP2HLA/merge_tables.pl	2015-03-10 01:09:16.000000000 +0100
    +++ new/SNP2HLA/merge_tables.pl	2022-01-27 12:00:04.812404000 +0100
    @@ -1,4 +1,4 @@
    -#!/usr/bin/perl
    +#!/usr/bin/env perl
     #
     
     use strict;
