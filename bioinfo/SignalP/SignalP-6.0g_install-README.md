SignalP/6.0g
========================

<http://>

Used under license:



Structure creating script (makeroom_SignalP_6.0g.sh) moved to /sw/bioinfo/SignalP/makeroom_6.0g.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "SignalP" "-v" "6.0g" "-f"
    ./makeroom_SignalP_6.0g.sh
    
    TOOL=SignalP
    VERSION=6.0g

# Download and extract. Temporary url
    cd $SRCDIR
    wget https://services.healthtech.dtu.dk/download/4113a9e9-fc8f-4df9-b1fd-7b521a7a9340/signalp-6.0g.fast.tar.gz
    tar xfvz signalp-6.0g.fast.tar.gz --strip-components=1

# Install
    module load python/3.9.5
    PYTHONUSERBASE=$PREFIX python -m pip install --user signalp-6-package/

# Add the different run modes
    cp $SRCDIR/signalp-6-package/models/distilled_model_signalp6.pt $PREFIX/lib/python3.9/site-packages/signalp/model_weights/

# Edit shebang in bin/    
    cd $PREFIX/bin
    sed -r -i 's/\#\!\/sw\/comp.*/\#\!\/usr\/bin\/env python/' *


# Test
    mkdir $PREFIX/test
    cd $PREFIX/test

    echo -e ">AAN10520.1 collagen type IV alpha 1, isoform C [Drosophila melanogaster]
MLPFWKRLLYAAVIAGALVGADAQFWKTAGTAGSIQDSVKHYNRNEPKFPIDDSYDIVDSAGVARGDLPP
KNCTAGYAGCVPKCIAEKGNRGLPGPLGPTGLKGEMGFPGMEGPSGDKGQKGDPGPYGQRGDKGERGSPG
LHGQAGVPGVQGPAGNPGAPGINGKDGCDGQDGIPGLEGLSGMPGPRGYAGQLGSKGEKGEPAKENGDYA
KGEKGEPGWRGTAGLAGPQGFPGEKGERGDSGPYGAKGPRGEHGLKGEKGASCYGPMKPGAPGIKGEKGE
PASSFPVKPTHTVMGPRGDMGQKGEPGLVGRKGEPGPEGDTGLDGQKGEKGLPGGPGDRGRQGNFGPPGS
TGQKGDRGEPGLNGLPGNPGQKGEPGRAGATGKPGLLGPPGPPGGGRGTPGPPGPKGPRGYVGAPGPQGL
NGVDGLPGPQGYNGQKGGAGLPGRPGNEGPPGKKGEKGTAGLNGPKGSIGPIGHPGPPGPEGQKGDAGLP
GYGIQGSKGDAGIPGYPGLKGSKGERGFKGNAGAPGDSKLGRPGTPGAAGAPGQKGDAGRPGTPGQKGDM
GIKGDVGGKCSSCRAGPKGDKGTSGLPGIPGKDGARGPPGERGYPGERGHDGINGQTGPPGEKGEDGRTG
LPGATGEPGKPALCDLSLIEPLKGDKGYPGAPGAKGVQGFKGAEGLPGIPGPKGEFGFKGEKGLSGAPGN
DGTPGRAGRDGYPGIPGQSIKGEPGFHGRDGAKGDKGSFGRSGEKGEPGSCALDEIKMPAKGNKGEPGQT
GMPGPPGEDGSPGERGYTGLKGNTGPQGPPGVEGPRGLNGPRGEKGNQGAVGVPGNPGKDGLRGIPGRNG
QPGPRGEPGISRPGPMGPPGLNGLQGEKGDRGPTGPIGFPGADGSVGYPGDRGDAGLPGVSGRPGIVGEK
GDVGPIGPAGVAGPPGVPGIDGVRGRDGAKGEPGSPGLVGMPGNKGDRGAPGNDGPKGFAGVTGAPGKRG
PAGIPGVSGAKGDKGATGLTGNDGPVGGRGPPGAPGLMGIKGDQGLAGAPGQQGLDGMPGEKGNQGFPGL
DGPPGLPGDASEKGQKGEPGPSGLRGDTGPAGTPGWPGEKGLPGLAVHGRAGPPGEKGDQGRSGIDGRDG
INGEKGEQGLQGVWGQPGEKGSVGAPGIPGAPGMDGLPGAAGAPGAVGYPGDRGDKGEPGLSGLPGLKGE
TGPVGLQGFTGAPGPKGERGIRGQPGLPATVPDIRGDKGSQGERGYTGEKGEQGERGLTGPAGVAGAKGD
RGLQGPPGASGLNGIPGAKGDIGPRGEIGYPGVTIKGEKGLPGRPGRNGRQGLIGAPGLIGERGLPGLAG
EPGLVGLPGPIGPAGSKGERGLAGSPGQPGQDGFPGAPGLKGDTGPQGFKGERGLNGFEGQKGDKGDRGL
QGPSGLPGLVGQKGDTGYPGLNGNDGPVGAPGERGFTGPKGRDGRDGTPGLPGQKGEPGMLPPPGPKGEP
GQPGRNGPKGEPGRPGERGLIGIQGERGEKGERGLIGETGNVGRPGPKGDRGEPGERGYEGAIGLIGQKG
EPGAPAPAALDYLTGILITRHSQSETVPACSAGHTELWTGYSLLYVDGNDYAHNQDLGSPGSCVPRFSTL
PVLSCGQNNVCNYASRNDKTFWLTTNAAIPMMPVENIEIRQYISRCVVCEAPANVIAVHSQTIEVPDCPN
GWEGLWIGYSFLMHTAVGNGGGGQALQSPGSCLEDFRATPFIECNGAKGTCHFYETMTSFWMYNLESSQP
FERPQQQTIKAGERQSHVSRCQVCMKNSS" > collagen.fa

    signalp6 --fastafile collagen.fa --output_dir . --organism euk --mode fast --format png







SignalP/6.0
========================

<https://services.healthtech.dtu.dk/cgi-bin/sw_request>

Used under license:
Custom as-is
<https://services.healthtech.dtu.dk/cgi-bin/sw_request>

Structure creating script (makeroom_SignalP_6.0.sh) moved to /sw/bioinfo/SignalP/makeroom_6.0.sh

LOG
---

    /home/douglas/bin/makeroom.sh -f" -t "SignalP" -v "6.0" -w "https://services.healthtech.dtu.dk/cgi-bin/sw_request" -l "Custom as-is" -L "https://services.healthtech.dtu.dk/cgi-bin/sw_request" -d "Signal peptide and cleavage sites in gram+\, gram- and eukaryotic amino acid sequences"
    ./makeroom_SignalP_6.0.sh
SignalP/5.0b
========================

<http://www.cbs.dtu.dk/services/SignalP/>

Used under license:


Structure creating script (makeroom_SignalP_5.0b.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/SignalP/makeroom_5.0b.sh

LOG
---

We need perl > 5.6 and gnuplot > 4.0.

    TOOL=SignalP
    VERSION=5.0b

    cd /sw/bioinfo/$TOOL
    makeroom.sh -f -t $TOOL -v $VERSION -w http://www.cbs.dtu.dk/services/SignalP/ -s annotation -d "Predicts the presence of signal peptides and the location of their cleavage sites in proteins from Archaea, Gram-positive Bacteria, Gram-negative Bacteria and Eukarya" 
    ./makeroom_${TOOL}_${VERSION}.sh 
    source SOURCEME_${TOOL}_${VERSION} 
    cd $VERSION
    cd src/

Remove cluster directory, we will move the unpacked directory to it.
Downloaded SignalP to my desktop after agreeing to licence, so get it and its
licence file from there.

    tar xzf signalp-${VERSION}.Linux.tar.gz 
    rm $PREFIX
    mv signalp-${VERSION} $PREFIX
    cd $PREFIX
    mkdir -p man/man1
    cp signalp.1 man/man1/

There is no longer a Perl script to update, as there was for previous versions.

Updated the mf files, linked everything, and now testing output.

    cd $PREFIX/..
    mkdir test
    cd test
    module load bioinfo-tools SignalP/5.0b
    signalp --help
    signalp -fasta ../rackham/test/euk10.fsa -org euk -format short -prefix euk_10_short
    signalp -fasta ../rackham/test/euk10.fsa -org euk -format long -prefix euk_10_long
    for F in * ; do echo "After test, checking differences between $F and expected output"; diff ../rackham/test/$F $F; done > test_results.txt

The test works fine, the only difference is timestamps.

