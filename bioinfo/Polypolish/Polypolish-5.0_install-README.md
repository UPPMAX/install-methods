Polypolish/5.0
========================

<https://github.com/rrwick/Polypolish>

Used under license:
GPL-3.0
<https://github.com/rrwick/Polypolish/blob/main/LICENSE>

Structure creating script (makeroom_Polypolish_5.0.sh) moved to /sw/bioinfo/Polypolish/makeroom_5.0.sh

LOG
---

    makeroom.sh "-t" "Polypolish" "-v" "5.0" "-c" "bioinfo" "-l" "GPL-3.0" "-w" "https://github.com/rrwick/Polypolish" "-L" "https://github.com/rrwick/Polypolish/blob/main/LICENSE" "-d" "Polypolish is a tool for polishing genome assemblies with short reads." "-s" "assembly"
    ./makeroom_Polypolish_5.0.sh
    cd $SRCDIR

    wget https://github.com/rrwick/Polypolish/releases/download/v0.5.0/polypolish-linux-x86_64-musl-v0.5.0.tar.gz
    mkdir -p $PREFIX/bin
    tar xvf polypolish-linux-x86_64-musl-v0.5.0.tar.gz -C $PREFIX/bin
