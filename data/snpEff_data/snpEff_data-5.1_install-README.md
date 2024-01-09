snpEff_data/5.1
===============

<https://pcingola.github.io/SnpEff>

Used under license:
MIT
<https://pcingola.github.io/SnpEff/license/>

Structure creating script (makeroom_snpEff_data_5.1.sh) moved to /sw/data/snpEff_data/makeroom_5.1.sh

LOG
---

    makeroom.sh -f -c data -t snpEff_data -v 5.1 -w https://pcingola.github.io/SnpEff -l MIT -L https://pcingola.github.io/SnpEff/license/ -d "Annotation data for the snpEff modules"
    ./makeroom_snpEff_data_5.1.sh 
    source /sw/data/snpEff_data/SOURCEME_snpEff_data_5.1 && cd $PREFIX

Move snpEff/5.1 data here.

    ml bioinfo-tools snpEff/$VERSION
    cd $SNPEFF_ROOT
    mv data $PREFIX && ln -s $PREFIX/data .

Check availability of data, to make sure that it can be read from the new location. Genomes marked with 'OK' are available locally. Some new genomes have been added since the module was installed.

    ml bioinfo-tools snpEff/$VERSION
    snpEff databases > databases_list.mv_to_data
    less databases_list.mv_to_data
    grep -P -v '\tOK ' databases_list.mv_to_data | less

