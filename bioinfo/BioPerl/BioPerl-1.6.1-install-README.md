BioPerl/1.6.1
=============

Hämtas från: <http://www.bioperl.org/wiki/Getting_BioPerl>

Senaste 1.6.1

Kompilerat med perl/5.12.3

packa upp

kör:

    perl Build.PL --install_base //////sw/apps/bioinfo/BioPerl/1.6.1/kalkyl

Kommer att installera några moduler via cpan
Väl att installera bioperl utan några andra hjälpprogram (de ger fel om man väljer alla)

    ./Build test
    ./Build install

Testscript:

    #!/bin/perl -w
     
    use Bio::Seq;
     
    $seq_obj = Bio::Seq->new(-seq => "aaaatgggggggggggccccgtt", -alphabet => 'dna' );
     
    print $seq_obj->seq;

    Ska ge:
    aaaatgggggggggggccccgtt
