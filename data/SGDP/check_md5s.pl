#!/usr/bin/env perl

use strict; use warnings; use feature 'say';

my $md5file   = 'md5s.txt';
my $indexfile = 'simons_diversity_data.GRCh38DH.alignment.index';

say STDERR "Running with:
    md5file      $md5file
    indexfile    $indexfile
"; 

my %M;

open my $mi, "<", $md5file   or die "could not open $md5file: $!";
open my $fi, "<", $indexfile or die "could not open $indexfile: $!";

while (<$mi>) {  # fill %M with calculated MD5s
    chomp;
    my @l = split /  /;
    $M{$l[1]} = $l[0];
}
$mi->close();

my ($nc, $ni, $nb) = (0, 0, 0);
while (<$fi>) {  # check MD5s against index
    next if /^#/;
    chomp;
    my ($c,$c5,$i,$i5,$b,$b5) = split;
    $c =~ s,^(.*/data/)(.*)$,data/$2,;
    $i =~ s,^(.*/data/)(.*)$,data/$2,;
    $b =~ s,^(.*/data/)(.*)$,data/$2,;
    if ($M{$c} ne $c5) { say STDERR "$c does not match"; ++$nc; }
    if ($M{$i} ne $i5) { say STDERR "$i does not match"; ++$ni; }
    if ($M{$b} ne $b5) { say STDERR "$b does not match"; ++$nb; }
}
say STDERR "Mismatched:   $nc .cram   $ni .crai  $nb .bas";

__END__
f659866520c7428ae460f303c04cb213  data/Abkhasian/SAMEA3302655/alignment/SAMEA3302655.alt_bwamem_GRCh38DH.20200922.Abkhasian.simons.bam.bas
2b5adff40b76574ff99baddcc1faf597  data/Abkhasian/SAMEA3302655/alignment/SAMEA3302655.alt_bwamem_GRCh38DH.20200922.Abkhasian.simons.cram
32b9326e183299392c62bf218caf4d71  data/Abkhasian/SAMEA3302655/alignment/SAMEA3302655.alt_bwamem_GRCh38DH.20200922.Abkhasian.simons.cram.crai
aa5ab5f7d016f41e602ef3a1f1452b83  data/Abkhasian/SAMEA3302693/alignment/SAMEA3302693.alt_bwamem_GRCh38DH.20200922.Abkhasian.simons.bam.bas
d7a65eef1caedd825bcb929af8c43ec1  data/Abkhasian/SAMEA3302693/alignment/SAMEA3302693.alt_bwamem_GRCh38DH.20200922.Abkhasian.simons.cram
133896762162df8652952593c02714d5  data/Abkhasian/SAMEA3302693/alignment/SAMEA3302693.alt_bwamem_GRCh38DH.20200922.Abkhasian.simons.cram.crai
c47bdca544420b6712032f8abd7b5edc  data/Adygei/SAMEA3302656/alignment/SAMEA3302656.alt_bwamem_GRCh38DH.20200922.Adygei.simons.bam.bas
384f8ed910067869ff44dc4750fc0ed9  data/Adygei/SAMEA3302656/alignment/SAMEA3302656.alt_bwamem_GRCh38DH.20200922.Adygei.simons.cram
45c80bdda3494c8a995a4e4604b2a7a2  data/Adygei/SAMEA3302656/alignment/SAMEA3302656.alt_bwamem_GRCh38DH.20200922.Adygei.simons.cram.crai
e2ad33f951cfdd54cc5f5900c1115a96  data/Adygei/SAMEA3302728/alignment/SAMEA3302728.alt_bwamem_GRCh38DH.20200922.Adygei.simons.bam.bas

#CRAM	CRAM_MD5	CRAI	CRAI_MD5	BAS	BAS_MD5
ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Burusho/SAMEA3302798/alignment/SAMEA3302798.alt_bwamem_GRCh38DH.20200922.Burusho.simons.cram	ebee8e79a36e1349c9ae5977ae5ef2ab	ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Burusho/SAMEA3302798/alignment/SAMEA3302798.alt_bwamem_GRCh38DH.20200922.Burusho.simons.cram.crai	9e39ddfe160eb938080d5b409f1c3c93	ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Burusho/SAMEA3302798/alignment/SAMEA3302798.alt_bwamem_GRCh38DH.20200922.Burusho.simons.bam.bas	eb612e26884235b74c8307ec29a8d1f6
ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Burusho/SAMEA3302795/alignment/SAMEA3302795.alt_bwamem_GRCh38DH.20200922.Burusho.simons.cram	de3ab27a0784cd87042ab3e6f55b5d7a	ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Burusho/SAMEA3302795/alignment/SAMEA3302795.alt_bwamem_GRCh38DH.20200922.Burusho.simons.cram.crai	5a916b07b29abf51aa3fd096139499ce	ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Burusho/SAMEA3302795/alignment/SAMEA3302795.alt_bwamem_GRCh38DH.20200922.Burusho.simons.bam.bas	03c2923e73ba4d78603a0d9556f4f72f
ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Hungarian/SAMEA3302678/alignment/SAMEA3302678.alt_bwamem_GRCh38DH.20200922.Hungarian.simons.cram	950b886880f97cca229b2bde1a0c70c5	ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Hungarian/SAMEA3302678/alignment/SAMEA3302678.alt_bwamem_GRCh38DH.20200922.Hungarian.simons.cram.crai	6ef7372888c5d8632917278d127873ce	ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Hungarian/SAMEA3302678/alignment/SAMEA3302678.alt_bwamem_GRCh38DH.20200922.Hungarian.simons.bam.bas	3d13bdc2b8b7a07bfea5e3333377f37d
ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Hungarian/SAMEA3302649/alignment/SAMEA3302649.alt_bwamem_GRCh38DH.20200922.Hungarian.simons.cram	fcb88246debcee20f0679e21dc658245	ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Hungarian/SAMEA3302649/alignment/SAMEA3302649.alt_bwamem_GRCh38DH.20200922.Hungarian.simons.cram.crai	2058cb59294b77a0fdba7d3571d7ea45	ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Hungarian/SAMEA3302649/alignment/SAMEA3302649.alt_bwamem_GRCh38DH.20200922.Hungarian.simons.bam.bas	fce4b4f4dfa990dd823f50a7c4d9a920
ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Tlingit/SAMEA3302853/alignment/SAMEA3302853.alt_bwamem_GRCh38DH.20200922.Tlingit.simons.cram	ea6f49e079bb152406bd4a20eeea8659	ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Tlingit/SAMEA3302853/alignment/SAMEA3302853.alt_bwamem_GRCh38DH.20200922.Tlingit.simons.cram.crai	9da15014d81790affc97b795d63ee317	ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Tlingit/SAMEA3302853/alignment/SAMEA3302853.alt_bwamem_GRCh38DH.20200922.Tlingit.simons.bam.bas	39d51bbd12acdd93de6db6958a4e376b
ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Tlingit/SAMEA3302889/alignment/SAMEA3302889.alt_bwamem_GRCh38DH.20200922.Tlingit.simons.cram	2cf8d0f514311905abbf85731b1cad98	ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Tlingit/SAMEA3302889/alignment/SAMEA3302889.alt_bwamem_GRCh38DH.20200922.Tlingit.simons.cram.crai	f1537b4093c0da508448a01b10292883	ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Tlingit/SAMEA3302889/alignment/SAMEA3302889.alt_bwamem_GRCh38DH.20200922.Tlingit.simons.bam.bas	9bc0a22cde683a1027df85a9330689ec
ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Khonda_Dora/SAMEA3302861/alignment/SAMEA3302861.alt_bwamem_GRCh38DH.20200922.Khonda_Dora.simons.cram	d88db85b3026105f5caa6e29f63db093	ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Khonda_Dora/SAMEA3302861/alignment/SAMEA3302861.alt_bwamem_GRCh38DH.20200922.Khonda_Dora.simons.cram.crai	b956a8c8544ea90e07cc1077d747a82c	ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Khonda_Dora/SAMEA3302861/alignment/SAMEA3302861.alt_bwamem_GRCh38DH.20200922.Khonda_Dora.simons.bam.bas	ad8141de3a693df2deaa199cfec6ca7d
ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Japanese/SAMEA3302906/alignment/SAMEA3302906.alt_bwamem_GRCh38DH.20200922.Japanese.simons.cram	ac45819369ebff3e2f905769f4ff355b	ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Japanese/SAMEA3302906/alignment/SAMEA3302906.alt_bwamem_GRCh38DH.20200922.Japanese.simons.cram.crai	8cf7f0536c95bbfda9b08b400abf2bae	ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Japanese/SAMEA3302906/alignment/SAMEA3302906.alt_bwamem_GRCh38DH.20200922.Japanese.simons.bam.bas	cf500fa4dc9c159c3a0c32849d380da3
ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Japanese/SAMEA3302852/alignment/SAMEA3302852.alt_bwamem_GRCh38DH.20200922.Japanese.simons.cram	4503fedfd6706c601f8ad831eba553f4	ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Japanese/SAMEA3302852/alignment/SAMEA3302852.alt_bwamem_GRCh38DH.20200922.Japanese.simons.cram.crai	79bb8526aabc5e5b6320932d5f0416d6	ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/simons_diversity_data/data/Japanese/SAMEA3302852/alignment/SAMEA3302852.alt_bwamem_GRCh38DH.20200922.Japanese.simons.bam.bas	667c485904888243c17d62b3d6b1966b
