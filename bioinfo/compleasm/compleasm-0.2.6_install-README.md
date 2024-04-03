compleasm/0.2.6
===============

<https://github.com/huangnengCSU/compleasm>

My fork adding COMPLEASM_LIBRARY_PATH support, now submitted as a pull request.

<https://github.com/douglasgscofield/compleasm>

Used under license:
Apache 2.0 and others
<https://github.com/huangnengCSU/compleasm/blob/0.2.6/LICENSE-BUSCO>

Structure creating script (makeroom_compleasm_0.2.6.sh) moved to /sw/bioinfo/compleasm/makeroom_0.2.6.sh

LOG
---

This is an installation from my github fork. It is not the same as an
installation from the compleasm_kit, for that procedure see 0.2.5, but don't
use it unless the pull request is incorporated into the tool. If it does not
get incorporated, keep updating my fork until it is.

    makeroom.sh "-f" "-t" "compleasm" "-v" "0.2.6" "-w" "https://github.com/douglasgscofield/compleasm" "-d" "A genome completeness evaluation tool based on miniprot, fork with support for COMPLEASM_MB_DOWNLOADS environment variable" "-l" "Apache 2.0 and others" "-L" "https://github.com/huangnengCSU/compleasm/blob/0.2.6/LICENSE-BUSCO"
    ./makeroom_compleasm_0.2.6.sh

    source /sw/bioinfo/compleasm/SOURCEME_compleasm_0.2.6

    cd $SRCDIR

    ml bioinfo-tools
    ml sepp/4.5.2
    ml miniprot/0.12
    ml hmmer/3.3.2

    ml git/2.44.0
    git clone git@github.com:douglasgscofield/compleasm.git

Set up venv for installation.

    ml python/3.11.8
    cd $PREFIX
    virtualenv venv
    source venv/bin/activate
    which python3
    which pip3
    ml -python
    pip3 install pandas

Now install from the cloned repository.

    cd $SRCDIR/compleasm
    pip3 install .

Edit it so as not to download the lineage or placement files. We do *not* want
these changes in the pull request so we make them locally, after the `pip3
install`.

    cd $PREFIX/venv/lib/python3.11/site-packages
    sed -i 's/download_lineage=True/download_lineage=False/'     compleasm.py
    sed -i 's/download_placement=True/download_placement=False/' compleasm.py


Lift out the executable, and provide a symlink for `compleasm.py`.

    cd $PREFIX
    mkdir bin
    cd bin
    ln -s $PREFIX/venv/bin/compleasm .
    ln -s compleasm compleasm.py

Be sure the miniprot and hmmsearch executables are not under PREFIX. We get
these from their respective modules.

    cd $PREFIX
    find . -name miniprot
    find . -name hmmsearch


Using the BUSCO v5 lineage files
--------------------------------

To get `compleasm list --local` to work you have to create a lineage.done file
to each lineage. Otherwise list will not work. This is created when we update
the v5 lineages, see BUSCO_data/latest module. No need to worry about it here.
What is done is something like

    cd /sw/data/BUSCO_data/latest/rackham/v5_lineage_sets/lineages
    for LINEAGE in *_odb10 ; do
        touch $LINEAGE.done
    done

We also leave refseq_db.faa.gz gzipped because compleasm wants that as well.
Again, this is all handled by the BUSCO_data/latest installation/update script.
Once these are in place, compleasm can use the v5 lineages in BUSCO_data/latest
no problem.


Wrapping up
-----------

In the mf, add $modroot/bin to PATH, load sepp/4.5.2, miniprot/0.12 and hmmer/3.3.2. Make sure the mf is not a symlink

    cd $TOOLDIR/mf
    ls -l $VERSION

If not a symlink, edit as directed above.

    vi $VERSION

Edit to add $modroot/bin to PATH, load miniprot/0.12 and hmmer/3.3.2, and

We set `dataroot` to the location of the BUSCO v5 lineage sets at `/sw/data/BUSCO_data/latest/rackham/v5_lineage_sets/lineages`.

    depends-on sepp/4.5.2
    depends-on miniprot/0.12
    depends-on hmmer/3.3.2
    prepend-path PATH $modroot/bin
    setenv COMPLEASM_LIBRARY_PATH      $dataroot
    setenv COMPLEASM_BUSCO_V5_LINEAGES $dataroot

Wrap up.

    cd $TOOLDIR
    ./compleasm-0.2.6_post-install.sh


Test
----

    ml purge
    ml bioinfo-tools
    ml compleasm/0.2.6

These should all be the same.

    compleasm list --local
    compleasm list --local --library_path $COMPLEASM_LIBRARY_PATH
    compleasm list --local --library_path $COMPLEASM_BUSCO_V5_LINEAGES

Check operation of default location specified via `COMPLEASM_LIBRARY_PATH`.

    ml purge
    ml bioinfo-tools compleasm/0.2.6

    compleasm list --local

This should be the same as is produced by

    compleasm list --local -L $COMPLEASM_BUSCO_V5_LINEAGES

Check operation without env var set.  Download using `--library_path` and using
default and make sure the contents are the same.  Need to unset
`COMPLEASM_LIBRARY_PATH` for this test.


    ml bioinfo-tools compleasm/0.2.6
    unset COMPLEASM_LIBRARY_PATH
    source /sw/bioinfo/compleasm/SOURCEME_compleasm_0.2.6
    cd $SRCDIR
    mkdir test
    cd test

These download to `my_library_path/` in the current directory.

    compleasm download --library_path my_library_path solanales
    compleasm download --library_path my_library_path eudicots

These download to the default `mb_downloads/` in the current directory.

    compleasm download eudicots
    compleasm download solanales

Now compare the trees.

    diff --recursive mb_downloads my_library_path

No diffs. Remove each.

    rm -rf mb_downloads my_library_path

Now run the examples in the module help. Should be no differences between the summary files.

    ml purge
    ml bioinfo-tools compleasm/0.2.6

    source /sw/bioinfo/compleasm/SOURCEME_compleasm_0.2.6
    cd $SRCDIR
    mkdir test
    cd test

    compleasm run -t 20 -l saccharomycetes_odb10 -o saccharomycetes_output_test1 -a /sw/data/reference/Saccharomyces_cerevisiae/S288C/concat/concat.fa

    miniprot --trans -u -I --outs=0.95 --gff -t 8 /sw/data/reference/Saccharomyces_cerevisiae/S288C/concat/concat.fa $COMPLEASM_LIBRARY_PATH/saccharomycetes_odb10/refseq_db.faa > saccharomycetes.gff
    compleasm analyze -t 20 -l saccharomycetes_odb10 -o saccharomycetes_output_test2 -g saccharomycetes.gff

    diff saccharomycetes_output_test1/summary.txt saccharomycetes_output_test2/summary.txt

The summary file contents:

    rackham5: /sw/bioinfo/compleasm/0.2.6/src/test $ cat saccharomycetes_output_test1/summary.txt
    ## lineage: saccharomycetes_odb10
    S:92.14%, 1969
    D:1.54%, 33
    F:0.00%, 0
    I:0.00%, 0
    M:6.32%, 135
    N:2137
