btrim/0.3.0
===========

<http://graphics.med.yale.edu/trim/>

Used under license:
Open source


Structure creating script (makeroom_btrim_0.3.0.sh) moved to /sw/bioinfo/btrim/makeroom_0.3.0.sh

LOG
---

    makeroom.sh -t btrim -v 0.3.0 -c bioinfo -s misc -w http://graphics.med.yale.edu/trim/ -d "fast and lightweight tool to trim adapters and low quality regions in reads from ultra high-throughput next-generation sequencing machines" -k "adapter trimming read" -l "Open source"
    ./makeroom_btrim_0.3.0.sh 
    source /sw/bioinfo/btrim/SOURCEME_btrim_0.3.0 && cd $SRCDIR
    echo "mirror trim" | lftp http://graphics.med.yale.edu/

Could not download the `paired_end_trim.pl` file from the server.

    cd trim
    chmod +x btrim64*
    ./btrim64
    cd $PREFIX
    cp -av $SRCDIR/trim/{btrim64,illumina_adapter.txt,howto,trim.pdf,readme} .
    ln -s btrim64 btrim
    ln -s btrim64 trim

