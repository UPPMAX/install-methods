Beagle/4.1
==========

<https://faculty.washington.edu/browning/beagle/beagle.html>

Used under license:
GPL v3


Structure creating script (makeroom_Beagle_4.1.sh) moved to /sw/bioinfo/Beagle/makeroom_4.1.sh

LOG
---

    makeroom.sh "-f" "-t" "Beagle" "-v" "4.1" "-s" "misc" "-w" "https://faculty.washington.edu/browning/beagle/beagle.html" "-l" "GPL v3" "-d" "Beagle is a software package for phasing genotypes and for imputing ungenotyped markers"
    ./makeroom_Beagle_4.1.sh

    source /sw/bioinfo/Beagle/SOURCEME_Beagle_4.1

    # source code
    cd $SRCDIR
    wget https://faculty.washington.edu/browning/beagle/beagle.180127.zip

    # everything else
    cd $PREFIX
    wget https://faculty.washington.edu/browning/beagle/beagle.27Jan18.7e1.jar
    ln -s beagle.27Jan18.7e1.jar beagle.jar
    wget https://faculty.washington.edu/browning/beagle/beagle_4.1_21Jan17.pdf
    wget https://faculty.washington.edu/browning/beagle/run.beagle.27Jan18.7e1.example
    wget https://faculty.washington.edu/browning/beagle/beagle4_release_notes
    wget https://faculty.washington.edu/browning/beagle/gpl_license

### Additional resources

    # symlinks to 5.4 copies of resource directories

    ln -s "${PREFIX/4.1/5.4}/genetic_maps" .
    ln -s "${PREFIX/4.1/5.4}/1000_Genomes_phase3_v5a" .

    # our own copies of bref and conform-gt

    wget https://faculty.washington.edu/browning/beagle/bref.27Jan18.7e1.jar
    ln -s bref.27Jan18.7e1.jar bref3.jar
    wget https://faculty.washington.edu/browning/beagle/bref.16Dec15.pdf

    wget https://faculty.washington.edu/browning/conform-gt/conform-gt.24May16.cee.jar
    ln -s conform-gt.24May16.cee.jar conform-gt.jar

### Beagle utilities <https://faculty.washington.edu/browning/beagle_utilities/utilities.html>

    # our own copies of beagle utilities, make them executable to find them

    wget https://faculty.washington.edu/browning/beagle_utilities/gtstats.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/splitvcf.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/mergevcf.jar 
    wget https://faculty.washington.edu/browning/beagle_utilities/consensusvcf.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/base2genetic.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/beagle2gprobs.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/beagle2linkage.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/beagle2vcf.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/gprobs2beagle.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/linkage2beagle.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/vcf2beagle.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/vcf2gprobs.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/gprobshwe.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/gprobsmetrics.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/gprobsmissing.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/gprobssamplemissing.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/changecolumn.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/changeline.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/cut.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/filtercolumns.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/filterlines.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/paste.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/transpose.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/updategprobs.jar
    wget https://faculty.washington.edu/browning/beagle_utilities/ibdmerge.jar

    chmod +x gtstats.jar splitvcf.jar mergevcf.jar consensusvcf.jar base2genetic.jar beagle2gprobs.jar beagle2linkage.jar beagle2vcf.jar
    chmod +x gprobs2beagle.jar linkage2beagle.jar vcf2beagle.jar vcf2gprobs.jar gprobshwe.jar gprobsmetrics.jar gprobsmissing.jar gprobssamplemissing.jar
    chmod +x changecolumn.jar changeline.jar cut.jar filtercolumns.jar filterlines.jar paste.jar transpose.jar updategprobs.jar ibdmerge.jar

### Segregate docs

    mkdir doc
    mv *.pdf doc/


