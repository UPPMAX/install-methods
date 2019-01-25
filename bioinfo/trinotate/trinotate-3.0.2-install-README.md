trinotate/3.0.2
===============

Annotate transcripts.

<https://trinotate.github.io/>

It has [several required and recommended
prerequisites](https://trinotate.github.io/#SoftwareRequired).  I've updated to
trinity/2.4.0 (a while ago), TransDecoder/5.0.1, SignalP/4.1f with the
recommended changes, and rnammer/1.2 with recommended changes, and additionally
enabling hmmsearch from hmmer/2.3.2-gcc to be available as hmmsearch2 within
rnammer without loading hmmer; we need a later hmmer to be available for other
work here.

We will also load sqlite/3.16.2, blast/2.6.0+, hmmer/3.1b2, tmhmm/2.0c.

Modified `$TRINOTATE_HOME/util/rnammer_support/RnammerTranscriptome.pl`
to find `rnammer` on its own, using `which`.


LOG
---

Install for one cluster, works for all the rest.  The work is in getting the above installed.

    VERSION=3.0.2
    TOOL=/sw/apps/bioinfo/trinotate
    mkdir -p $TOOL
    cd $TOOL
    mkdir -p $VERSION
    cd $VERSION
    git clone https://github.com/Trinotate/Trinotate
    mv Trinotate milou
    for C in rackham irma bianca ; do ln -s milou $C; done

Make sure everything that will go in the mf file can be loaded.

    module spider perl/5.24.1 perl_modules/5.24.1 TransDecoder/5.0.1 SignalP/4.1f rnammer/1.2
    module spider tmhmm/2.0c trinity/2.4.0 sqlite/3.16.2 blast/2.6.0+ hmmer/3.1b2

It must also define `TRINOTATE_HOME`.
