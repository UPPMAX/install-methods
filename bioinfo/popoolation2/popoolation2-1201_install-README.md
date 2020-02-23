popoolation2/1201
=================


LOG
---

    #!/bin/bash

    # Installed for UPPMAX 2017-06-26 by Linus N.
    # From https://sourceforge.net/p/popoolation2/wiki/Manual/
    # Requirements
    # * Perl 5.8 or higher 
    # * R 2.7 or higher
    # * a short read aligner (e.g.: bwa)
    # * samtools
    # * Perl libraries: Text::NSP::Measures::2D::Fisher::twotailed 

    mkdir src
    if ! [ -e popoolation2_*.zip ]; then
        wget 'https://downloads.sourceforge.net/project/popoolation2/popoolation2_1201.zip?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fpopoolation2%2F&ts=1498457202&use_mirror=vorboss' -O src/popoolation2_1201.zip
    fi
    unzip src/popoolation2_1201.zip
