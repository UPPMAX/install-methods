maf_stream/20220523-1d2e146
========================

<https://github.com/joelarmstrong/maf_stream>

Used under license:



Structure creating script (makeroom_maf_stream_20220523-1d2e146.sh) moved to /sw/bioinfo/maf_stream/makeroom_20220523-1d2e146.sh

LOG
---

    makeroom.sh "-t" "maf_stream" "-v" "20220523-1d2e146" "-d" "maf_stream is a collection of utilities to manipulate multiple alignments in the Multiple Alignment Format (MAF)" "-w" "https://github.com/joelarmstrong/maf_stream" "-c" "bioinfo" "-s" "misc" "-f"
    
    ./makeroom_maf_stream_20220523-1d2e146.sh
    source /sw/bioinfo/maf_stream/SOURCEME_maf_stream_20220523-1d2e146 && cd $TOOLDIR/$VERSION/src

    git clone https://github.com/joelarmstrong/maf_stream.git
    cd maf_stream
    module load rust/1.43.1

    cargo build --release

    cd $TOOLDIR/$VERSION/rackham
    mkdir bin && cd bin
    ln -s ../../src/maf_stream/target/release/maf_stream
    
    
 


