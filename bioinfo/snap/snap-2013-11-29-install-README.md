snap 2013-11-29
===============

<http://korflab.ucdavis.edu/Software/snap-2013-11-29.tar.gz>

LOG
---

    VERSION=2013-11-29
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    cd /sw/apps/bioinfo/snap
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    wget http://korflab.ucdavis.edu/Software/snap-${VERSION}.tar.gz
    cd snap

DO NOT load gcc 6+ to compile.  There is an ambiguous comparison on a couple of
Zoe functions which makes the compilation fail.  I wrote Ian Korf, who
responded 2017-04-12 "I wrote some code there but I don't think I've used that
for anything ever."  So it is probably OK to allow compilation to continue, and
sticking with gcc 5 will do that automatically.

    module load gcc/5.4.0
    make

The perl scripts in this directory might be useful, but at least one is using
Korf-lab internal modules so I will provide them, but make no guarantees.  No
need to disable them via `chmod -x` (as I thought earlier) but the user must
beware.

There also appear to be some parameter matrices provided, so just copy the
compilation directory over to the cluster.

    cd ..
    mv snap ../$CLUSTER

Very simple mf file.

## 2021-06-16

Attempted to recompile with gcc/9.3.0, ran into some bugs.  Located at
$VERSIONDIR, issued the command

    diff -r  --exclude={*.o,exonpairs,fathom,forge,hmm-info,snap,zoe-loop} src/snap rackham >> ../snap-2013-11-29-install-README.md

comparing the new source in $PREFIX with the original source unpacked under
$SRCDIR to show the differences. I had diff ignore dependency files.


    diff -r '--exclude=depend' '--exclude=*.o' '--exclude=exonpairs' '--exclude=fathom' '--exclude=forge' '--exclude=hmm-info' '--exclude=snap' '--exclude=zoe-loop' src/snap/Zoe/zoeAlignment.c rackham/Zoe/zoeAlignment.c
    678c678
    < 	else if (h1->q_start > h2->q_start && h2->q_end > h2->q_end) return  1;
    ---
    > 	else if (h1->q_start > h2->q_start && h1->q_end > h2->q_end) return  1;
    684c684
    < 	else if (h1->s_start > h2->s_start && h2->s_end > h2->s_end) return  1;
    ---
    > 	else if (h1->s_start > h2->s_start && h1->s_end > h2->s_end) return  1;
    diff -r '--exclude=depend' '--exclude=*.o' '--exclude=exonpairs' '--exclude=fathom' '--exclude=forge' '--exclude=hmm-info' '--exclude=snap' '--exclude=zoe-loop' src/snap/Zoe/zoeTools.c rackham/Zoe/zoeTools.c
    152,155c152,154
    < 	if (sign < 0)
    < 		s[i++] = '-';
    < 		s[i] = '\0';
    < 		reverse_string(s);
    ---
    > 	if (sign < 0) s[i++] = '-';
    >     s[i] = '\0';
    >     reverse_string(s);
    diff -r '--exclude=depend' '--exclude=*.o' '--exclude=exonpairs' '--exclude=fathom' '--exclude=forge' '--exclude=hmm-info' '--exclude=snap' '--exclude=zoe-loop' src/snap/cds-trainer.pl rackham/cds-trainer.pl
    1c1
    < #!/usr/bin/perl
    ---
    > #!/usr/bin/env perl
    167c167
    < similarity to the codon usage table.
    \ No newline at end of file
    ---
    > similarity to the codon usage table.
    diff -r '--exclude=depend' '--exclude=*.o' '--exclude=exonpairs' '--exclude=fathom' '--exclude=forge' '--exclude=hmm-info' '--exclude=snap' '--exclude=zoe-loop' src/snap/exonpairs.c rackham/exonpairs.c
    86,87c86,88
    < 						if (exon->score < MIN_EINIT_SCORE)  skip = 1; break;
    < 						if (length      < MIN_EINIT_LENGTH) skip = 1; break;
    ---
    > 						if (exon->score < MIN_EINIT_SCORE)  skip = 1;
    > 						if (length      < MIN_EINIT_LENGTH) skip = 1;
    > 						break;
    89,90c90,92
    < 						if (exon->score < MIN_ETERM_SCORE)  skip = 1; break;
    < 						if (length      < MIN_ETERM_LENGTH) skip = 1; break;
    ---
    > 						if (exon->score < MIN_ETERM_SCORE)  skip = 1;
    > 						if (length      < MIN_ETERM_LENGTH) skip = 1;
    > 						break;
    92,93c94,96
    < 						if (exon->score < MIN_EXON_SCORE)   skip = 1; break;
    < 						if (length      < MIN_EXON_LENGTH)  skip = 1; break;
    ---
    > 						if (exon->score < MIN_EXON_SCORE)   skip = 1;
    > 						if (length      < MIN_EXON_LENGTH)  skip = 1;
    > 						break;
    diff -r '--exclude=depend' '--exclude=*.o' '--exclude=exonpairs' '--exclude=fathom' '--exclude=forge' '--exclude=hmm-info' '--exclude=snap' '--exclude=zoe-loop' src/snap/hmm-assembler.pl rackham/hmm-assembler.pl
    1c1
    < #!/usr/bin/perl
    ---
    > #!/usr/bin/env perl
    diff -r '--exclude=depend' '--exclude=*.o' '--exclude=exonpairs' '--exclude=fathom' '--exclude=forge' '--exclude=hmm-info' '--exclude=snap' '--exclude=zoe-loop' src/snap/noncoding-trainer.pl rackham/noncoding-trainer.pl
    1c1
    < #!/usr/bin/perl
    ---
    > #!/usr/bin/env perl
    diff -r '--exclude=depend' '--exclude=*.o' '--exclude=exonpairs' '--exclude=fathom' '--exclude=forge' '--exclude=hmm-info' '--exclude=snap' '--exclude=zoe-loop' src/snap/patch-hmm.pl rackham/patch-hmm.pl
    1c1
    < #!/usr/bin/perl
    ---
    > #!/usr/bin/env perl
    35c35
    < }
    \ No newline at end of file
    ---
    > }
    diff -r '--exclude=depend' '--exclude=*.o' '--exclude=exonpairs' '--exclude=fathom' '--exclude=forge' '--exclude=hmm-info' '--exclude=snap' '--exclude=zoe-loop' src/snap/snap.c rackham/snap.c
    87c87
    < 	char            option[16], name[16];
    ---
    > 	char            option[2048], name[1024];
    diff -r '--exclude=depend' '--exclude=*.o' '--exclude=exonpairs' '--exclude=fathom' '--exclude=forge' '--exclude=hmm-info' '--exclude=snap' '--exclude=zoe-loop' src/snap/zff2gff3.pl rackham/zff2gff3.pl
    1c1
    < #!/usr/bin/perl
    ---
    > #!/usr/bin/env perl
