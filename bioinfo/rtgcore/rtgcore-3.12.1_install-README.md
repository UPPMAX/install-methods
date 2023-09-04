rtgcore/3.12.1
========================

<https://github.com/RealTimeGenomics/rtg-core>

Used under license:
Custom
<https://raw.githubusercontent.com/RealTimeGenomics/rtg-core/master/LICENSE.txt>

Structure creating script (makeroom_rtgcore_3.12.1.sh) moved to /sw/bioinfo/rtgcore/makeroom_3.12.1.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-t" "rtgcore" "-v" "3.12.1" "-d" "https://github.com/RealTimeGenomics/rtg-core/releases/download/3.12.1/rtg-core-non-commercial-3.12.1-linux-x64.zip" "-l" "Custom" "-L" "https://raw.githubusercontent.com/RealTimeGenomics/rtg-core/master/LICENSE.txt" "-w" "https://github.com/RealTimeGenomics/rtg-core"
    ./makeroom_rtgcore_3.12.1.sh
rtgcore/3.8.3
==============

<https://github.com/RealTimeGenomics/rtg-core>

**NOTE** This appears to include all the functionality available in the rtgtools module.  Ensure both are not loaded at the same time by creating conflicts on the mf files.

LOG
---

A precompiled bundle is downloaded, so we use that for all systems.

    VERSION=3.8.3
    cd /sw/apps/bioinfo/rtgcore/
    mkdir $VERSION
    cd $VERSION
    mkdir src
    cd src
    wget https://github.com/RealTimeGenomics/rtg-core/releases/download/${VERSION}/rtg-core-non-commercial-${VERSION}-linux-x64.zip
    unzip rtg-core-non-commercial-${VERSION}-linux-x64.zip 
    fixup -g rtg-core-non-commercial-${VERSION}
    mv rtg-core-non-commercial-${VERSION} ../milou
    cd ..
    ln -s milou rackham
    ln -s milou irma
    ln -s milou bianca

There is a config file `rtg.cfg` that must be created prior to users running the tool.  So:

    cd milou
    ./rtg

Agree to the licence, and answer no to enabling real-time logging.  It will
take a bit, then print some help.  The config file is now created, and we need
to disable manually the pingback feature as well.

    cp -av rtg.cfg rtg.cfg-orig
    vi rtg.cfg

Around line 28 of `rtg.cfg`, set `RTG_TALKBACK=false`:

    RTG_TALKBACK=false

and remove write permission from the copies:

    chmod -w rtg.cfg rtg.cfg-orig

We also download preformatted references for human and metagenomics from
<https://www.realtimegenomics.com/news/pre-formatted-reference-datasets>, put
on a monthly crontab entry.

