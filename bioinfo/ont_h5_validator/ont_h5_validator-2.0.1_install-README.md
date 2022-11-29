ont_h5_validator/2.0.1
======================

Contiuing Diana's installation. Changed by using older python/3.7.2 contemporaneous with the codebase and by downloading a tagged tarball.

<https://github.com/nanoporetech/ont_h5_validator>



Structure creating script (makeroom_ont_h5_validator_2.0.1.sh) moved to /sw/bioinfo/ont_h5_validator/makeroom_ont_h5_validator_2.0.1.sh

LOG
---

    makeroom.sh -t "ont_h5_validator" -v "2.0.1" -d "Validation tool for testing Fast5 files against the schema" -w "https://github.com/nanoporetech/ont_h5_validator" -s "misc" -f

    ./makeroom_ont_h5_validator_2.0.1.sh

    cd /sw/bioinfo7ont_h5_validator

    module load python/3.7.2

    source SOURCEME_ont_h5_validator_2.0.1 
    cd $SRCDIR
    wget https://github.com/nanoporetech/ont_h5_validator/archive/refs/tags/release_2.0.1.tar.gz
    tar xf release_2.0.1.tar.gz 
    cd ont_h5_validator-release_2.0.1/
    virtualenv $PREFIX/venv
    $PREFIX/venv/bin/pip install .
    cd $PREFIX
    mkdir bin
    cd bin
    ln -s $PREFIX/venv/bin/h5_validate .
    head -n 1 *

Not sure if the default schemas in `$PREFIX/venv/lib/python3.9/site-packages/h5_validator/schemas` will be found when the tool is running... added verbage to module help in case they don't.

