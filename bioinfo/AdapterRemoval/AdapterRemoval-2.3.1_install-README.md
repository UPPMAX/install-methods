AdapterRemoval/2.3.1
========================

<https://github.com/MikkelSchubert/adapterremoval>

Used under license:
GPLv3
<https://github.com/MikkelSchubert/adapterremoval/blob/master/LICENSE>

Structure creating script (makeroom_AdapterRemoval_2.3.1.sh) moved to /sw/bioinfo/AdapterRemoval/makeroom_2.3.1.sh

LOG
---

    /home/jonass/uppmax/install-methods/makeroom.sh -t "AdapterRemoval" -v "2.3.1" -d "AdapterRemoval searches for and removes adapter sequences from High-Throughput Sequencing \(HTS\) data and \(optionally\) trims low quality bases from the 3\' end of reads following adapter removal." -l "GPLv3" -Lhttps://github.com/MikkelSchubert/adapterremoval/blob/master/LICENSE" -w "https://github.com/MikkelSchubert/adapterremoval" -f"
    ./makeroom_AdapterRemoval_2.3.1.sh
    wget -O adapterremoval-2.3.1.tar.gz https://github.com/MikkelSchubert/adapterremoval/archive/v2.3.1.tar.gz
    tar xvzf adapterremoval-2.3.1.tar.gz
    cd adapterremoval-2.3.1
    make
    make install PREFIX=$PREFIX
