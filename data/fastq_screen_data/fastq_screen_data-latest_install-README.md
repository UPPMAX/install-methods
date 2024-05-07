fastq_screen_data/20220330
========================

<https://stevenwingett.github.io/FastQ-Screen/>


The data are available directly at <http://ftp1.babraham.ac.uk/ftpusr46/>.  Visit there to see the date that one should use for versioning the download directory.
You should still use `fastq_screen --get_genomes` to download the data.

Used under license:



Structure creating script (makeroom_fastq_screen_data_20220330.sh) moved to /sw/data/fastq_screen_data/makeroom_20220330.sh

LOG
---

    makeroom.sh -f -c data -t fastq_screen_data -v 20220330 -w https://stevenwingett.github.io/FastQ-Screen/ -d "Reference genomes for FastQ Screen, both standard and bisulfite" 
    ./makeroom_fastq_screen_data_20220330.sh 
    source /sw/data/fastq_screen_data/SOURCEME_fastq_screen_data_20220330 && cd $TOOLDIR

    module load bioinfo-tools
    module load fastq_screen/0.15.2

    cd $PREFIX

    fastq_screen --outdir $PWD --get_genomes

    fastq_screen --outdir $PWD --get_genomes --bisulfite

    cd $TOOLDIR
    rm -f latest
    ln -sf 20220330 latest
