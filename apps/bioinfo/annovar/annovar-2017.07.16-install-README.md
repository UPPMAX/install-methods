annovar/2017.07.16
==================

Must ask for a download link from
<http://annovar.openbioinformatics.org/en/latest/user-guide/download/>.
Non-profit only!  Note the link used is xxx'd out, it is in my UU email.

LOG
---

Install for milou, and make other clusters symlinks.

    VERSION=2017.07.16
    TOOL=/sw/apps/bioinfo/annovar
    cd $TOOL
    cd $VERSION
    mkdir src
    cd src
    wget http://www.openbioinformatics.org/annovar/download/xxxxxxxxxxx/annovar.latest.tar.gz
    tar xzvf ../src/annovar.latest.tar.gz 
    tar xvzf annovar.latest.tar.gz 
    mv annovar ../milou
    cd ../milou
    vi *.pl

Now check all perl scripts' `#!` lines; `coding_change.pl` required switching
to env-perl format.

There are some databases provided in `humandb/`, but most are in
`/sw/data/uppnex/annovar/`.  So many symlinks drawn from there, and more info
in downloading additional databases in its readme.

