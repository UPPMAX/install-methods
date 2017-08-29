rtgtools/3.8.1
==============

<https://github.com/RealTimeGenomics/rtg-tools>

LOG
---

A precompiled bundle is downloaded, so we use that for all systems.

    VERSION=3.8.1
    cd /sw/apps/bioinfo/rtgtools/
    VERSION=3.8.1
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    wget https://github.com/RealTimeGenomics/rtg-tools/releases/download/${VERSION}/rtg-tools-${VERSION}-linux-x64.zip
    unzip rtg-tools-$(VERSION}-linux-x64.zip 
    fixup -g rtg-tools-3.8.1
    mv rtg-tools-3.8.1 ../milou
    ln -s milou rackham
    ln -s milou irma
    ln -s milou bianca

There is a config file `rtg.cfg` that must be created prior to users running the tool.  So:

    cd milou
    ./rtg

Answer no to enabling real-time logging.  It will take a bit, then print some
help.  The config file is now created, and we need to disable manually the
pingback feature as well.

    cp -av rtg.cfg rtg.cfg-orig
    vi rtg.cfg

Around line 49 of `rtg.cfg`, set `RTG_TALKBACK=false`:

    RTG_TALKBACK=false

and remove write permission from the copies:

    chmod -w rtg.cfg rtg.cfg-orig

We also download preformatted references for human and metagenomics from
<https://www.realtimegenomics.com/news/pre-formatted-reference-datasets>, put
on a monthly crontab entry.
