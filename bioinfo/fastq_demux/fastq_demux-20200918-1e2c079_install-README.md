fastq_demux/20200918-1e2c079
========================

<https://github.com/Molmed/fastq_demux>

Used under license:
GNU General Public License


Structure creating script (makeroom_fastq_demux_20200918-1e2c079.sh) moved to /sw/bioinfo/fastq_demux/makeroom_20200918-1e2c079.sh

LOG
---

    TOOL=fastq_demux      
    VERSION=20200918-1e2c079

    makeroom.sh -t $TOOL -v $VERSION -w "https://github.com/Molmed/fastq_demux" -c "bioinfo" -l "GNU General Public License" -d "A simple program to demultiplex Illumina FASTQ files based on barcodes in the FASTQ headers" -s "misc" -f

    ./makeroom_${TOOL}_${VERSION}.sh
    source SOURCEME_${TOOL}_${VERSION}
    
   cd $PREFIX
   module load python/3.9.5
   python -m venv fastq_dmux_env
   source fastq_dmux_env/bin/activate

   git clone https://github.com/Molmed/fastq_demux.git
   
   cd fastq_demux

   pip install -r requirements.txt
   python setup.py install
