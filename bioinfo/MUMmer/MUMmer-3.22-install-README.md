Hämta från: http://mummer.sourceforge.net/
Senaste: 3.22

jag har använt gcc/4.5

make

kopiera hela directoryt till //////sw/apps/bioinfo/MUMmer/3.22/kalkyl

Jag har tester i: /bubo/home/staff/agback/kalkyl/mummer-test

Kör:
mummer -mum -b -c H_pylori26695_Eslice.fasta H_pyloriJ99_Eslice.fasta > mummer.mums
mummerplot -x "[0,275287]" -y "[0,265111]" -postscript -p mummer mummer.mums
run-mummer3 H_pylori26695_Eslice.fasta H_pyloriJ99_Eslice.fasta mummer3

Ska inte ge några fel, men skapa ett antal mummer.* filer.
