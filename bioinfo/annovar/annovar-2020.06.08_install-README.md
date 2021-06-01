annovar/2020.06.08
========================

<https://annovar.openbioinformatics.org/en/latest/>

Used under license:
Custom
<https://www.openbioinformatics.org/annovar/annovar_download_form.php>

Structure creating script (makeroom_annovar_2020.06.08.sh) moved to /sw/bioinfo/annovar/makeroom_2020.06.08.sh

LOG
---

    /home/douglas/bin/makeroom.sh -f" -t "annovar" -v "2020.06.08" -w "https://annovar.openbioinformatics.org/en/latest/" -d "an efficient software tool to utilize update-to-date information to functionally annotate genetic variants detected from diverse genomes" -l "Custom" -L "https://www.openbioinformatics.org/annovar/annovar_download_form.php"
    ./makeroom_annovar_2020.06.08.sh
annovar/2018.04.16
==================

Must ask for a download link from
<http://annovar.openbioinformatics.org/en/latest/user-guide/download/>.
Non-profit only!  Note the link used is xxx'd out, it is in my UU email.

LOG
---

Install for rackham, and make other clusters symlinks.

    VERSION=2018.04.16
    TOOL=/sw/bioinfo/annovar
    cd $TOOL
    mkdir $VERSION
    cd $VERSION
    [[ $CLUSTER == rackham ]] && for CL in irma bianca snowy ; do ln -s $CLUSTER $CL ; done
    mkdir src
    cd src
    wget http://www.openbioinformatics.org/annovar/download/0wgxR2rIVP/annovar.latest.tar.gz
    tar xvzf annovar.latest.tar.gz
    cd annovar
    vi *.pl

Now check all perl scripts' `#!` lines; `coding_change.pl` required switching
to env-perl format.

Move directory over to `../$CLUSTER`

    cd ..
    mv annovar ../$CLUSTER

There are some databases provided in `humandb/`, but most are in
`/sw/data/uppnex/annovar/`.  So many symlinks drawn from there, and more info
in downloading additional databases in its readme.


