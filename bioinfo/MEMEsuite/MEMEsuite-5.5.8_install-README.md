MEMEsuite/5.5.8
========================

<http://    meme-suite.org>

Used under license:
University of California open-source AS IS


Structure creating script (makeroom_MEMEsuite_5.5.8.sh) moved to /sw/bioinfo/MEMEsuite/makeroom_5.5.8.sh

LOG
---
'''sh
	install-methods/makeroom.sh "-s" "sw_collections" "-t" "MEMEsuite" "-v" "5.5.8" "-w" "http://    meme-suite.org" "-l" "University of California open-source AS IS" "-d" "Motif-based sequence analysis tools" "-f"
	./makeroom_MEMEsuite_5.5.8.sh
	source /sw/bioinfo/MEMEsuite/SOURCEME_MEMEsuite_5.5.1 && cd $TOOLDIR
	cd $SRCDIR
	wget https://meme-suite.org/meme/meme-software/5.5.8/meme-5.5.8.tar.gz
	tar -xvf meme-5.5.8.tar.gz
	module load gcc/9.3.0 openmpi/3.1.5
	module load perl/5.26.2 perl_modules/5.26.2
	module load python/3.10.8
    	./configure --prefix=$PREFIX --with-url=http://meme-suite.org --with-db=/sw/data/MEMEsuite/latest
    	make
    	make  test
        make install
'''

