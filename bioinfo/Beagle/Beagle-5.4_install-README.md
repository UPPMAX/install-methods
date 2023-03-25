Beagle/5.4
==========

<https://faculty.washington.edu/browning/beagle/beagle.html>

Used under license:
GPL v3


Structure creating script (makeroom_Beagle_5.4.sh) moved to /sw/bioinfo/Beagle/makeroom_5.4.sh

LOG
---

    makeroom.sh "-f" "-t" "Beagle" "-v" "5.4" "-s" "misc" "-w" "https://faculty.washington.edu/browning/beagle/beagle.html" "-l" "GPL v3" "-d" "Beagle is a software package for phasing genotypes and for imputing ungenotyped markers"
    ./makeroom_Beagle_5.4.sh

    source /sw/bioinfo/Beagle/SOURCEME_Beagle_5.4
    cd $SRCDIR

    wget http://faculty.washington.edu/browning/beagle/beagle.22Jul22.46e.jar
    ln -s beagle.22Jul22.46e.jar beagle.jar
    wget http://faculty.washington.edu/browning/beagle/beagle_5.4_18Mar22.pdf
    wget http://faculty.washington.edu/browning/beagle/run.beagle.22Jul22.46e.example
    wget http://faculty.washington.edu/browning/beagle/beagle5_release_notes
    wget http://faculty.washington.edu/browning/beagle/gpl_license

### Additional resources

    echo "mirror genetic_maps"            | lftp https://bochet.gcc.biostat.washington.edu/beagle
    echo "mirror 1000_Genomes_phase3_v5a" | lftp https://bochet.gcc.biostat.washington.edu/beagle
    echo "mirror beagle3_examples"        | lftp https://bochet.gcc.biostat.washington.edu/beagle

    wget http://faculty.washington.edu/browning/beagle/bref3.24May18.pdf
    wget http://faculty.washington.edu/browning/beagle/bref3.22Jul22.46e.jar
    ln -s bref3.22Jul22.46e.jar bref3.jar
    wget http://faculty.washington.edu/browning/beagle/unbref3.22Jul22.46e.jar
    ln -s unbref3.22Jul22.46e.jar unbref.jar
    wget http://faculty.washington.edu/browning/conform-gt/conform-gt.24May16.cee.jar
    ln -s conform-gt.24May16.cee.jar conform-gt.jar

### Beagle utilities <https://faculty.washington.edu/browning/beagle_utilities/utilities.html>

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

### Segregate docs

    mkdir doc
    mv *.pdf doc/

### Move all to PREFIX

    mv -v * $PREFIX/

### Grab the source code, we don't use it but we'll keep it for reference

    wget http://faculty.washington.edu/browning/beagle/beagle.220722.zip

