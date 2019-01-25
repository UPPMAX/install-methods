See http://smithlabresearch.org/software/preseq

Linked to quite old version of samtools since newer versions failed to be linked
The included samtools was not used but note that it is rather old, according to the changelog
Don't know if there will be a conflict with a newer samtools loaded, but doubt it

Installation:
export SAMTOOLS=/sw/apps/bioinfo/samtools/0.1.12-10
make all SAMTOOLS_DIR=$SAMTOOLS
