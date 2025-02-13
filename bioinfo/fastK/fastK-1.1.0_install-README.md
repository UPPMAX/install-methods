fastK/1.1.0
========================

<https://github.com/thegenemyers/FASTK>

Used under license:
AS IS
<https://github.com/thegenemyers/FASTK?tab=License-1-ov-file>

Structure creating script (makeroom_fastK_1.1.0.sh) moved to /sw/bioinfo/fastK/makeroom_1.1.0.sh

LOG
---

    makeroom.sh "-t" "fastK" "-v" "1.1.0" "-w" "https://github.com/thegenemyers/FASTK" "-l" "AS IS" "-L" "https://github.com/thegenemyers/FASTK?tab=License-1-ov-file" "-d" "A fast K-mer counter for high-fidelity shotgun datasets" "-s" "misc"
    ./makeroom_fastK_1.1.0.sh
    source /sw/bioinfo/fastK/SOURCEME_fastK_1.1.0 && cd $SRCDIR
    wget https://github.com/thegenemyers/FASTK/archive/refs/tags/v1.1.0.tar.gz
    tar xvzf v1.1.0.tar.gz
    cd FASTK-1.1.0/
    ml gcc/11.3.0
> --prefix or --DEST_DIR does not work so change the installation dir (output of $PREFIX) inside Makefile
    vi Makefile 
    make
    make install


