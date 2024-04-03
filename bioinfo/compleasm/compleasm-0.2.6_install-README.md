compleasm/0.2.6
===============

<https://github.com/huangmengCSU/compleasm>

My fork adding COMPLEASM_LIBRARY_PATH support, now submitted as a pull request.

<https://github.com/douglasgscofield/compleasm>

Used under license:
Apache 2.0 and others
<https://github.com/huangnengCSU/compleasm/blob/0.2.6/LICENSE-BUSCO>

Structure creating script (makeroom_compleasm_0.2.6.sh) moved to /sw/bioinfo/compleasm/makeroom_0.2.6.sh

LOG
---

    makeroom.sh "-f" "-t" "compleasm" "-v" "0.2.6" "-w" "https://github.com/huangmengCSU/compleasm" "-d" "A genome completeness evaluation tool based on miniprot" "-l" "Apache 2.0 and others" "-L" "https://github.com/huangnengCSU/compleasm/blob/0.2.6/LICENSE-BUSCO"
    ./makeroom_compleasm_0.2.6.sh


    # load modules
    module load bioinfo-tools
    module load sepp/4.5.2
    module load miniprot/0.12
    module load hmmer/3.3.2

    # Download
    git clone https://github.com/douglasgscofield/compleasm.git .
    # but the 0.2.6 branch should be the default.
    git checkout tags/v0.2.6
    export PYTHONPATH=$PREFIX/lib/python3.7/site-packages/:$PYTHONPATH

    # To get compleasm list --local to work you have to create a lineage.done file to each lineage. Otherwise list will not work.
    cd /sw/bioinfo/BUSCO/v5_lineage_sets/lineages 
    find -maxdepth 1 -type d -exec touch {}.done \;


    # Doug subextracts the refseqs for each lineage. Compress them again and save the original.
    cd /sw/bioinfo/BUSCO/v5_lineage_sets/lineages
    find -maxdepth 2 -iname "refseq_db.faa.gz" | xargs ls -lahrS


    # Test with S. cerevisiae
    ./compleasm.py analyze  \
        -l saccharomycetes_odb10 \
        -L /sw/bioinfo/BUSCO/v5_lineage_sets/lineages/ \
        -o $SRCDIR/saccharo \
        -g <(miniprot --trans -u -I --outs=0.95 --gff -t 8 \
            /crex/data/reference/Saccharomyces_cerevisiae/S288C/concat/concat.fa \
            /sw/bioinfo/BUSCO/v5_lineage_sets/lineages/saccharomycetes_odb10/refseq_db.faa)






    # To get compleasm list --local to work you have to create a lineage.done file to each lineage. Otherwise list will not work.
    cd /sw/bioinfo/BUSCO/v5_lineage_sets/lineages 
    find -maxdepth 1 -type d -exec touch {}.done \;

    # OLD
    # Disable download_placement and lineage
    #sed -i '72 {s/True/False/g}' compleasm.py
    # Fix nr 2. Compleasm tries to write to files in the lineages directory. Change that to read instead.
    #cd $SRCDIR
    #sed -i -r "s/'w'(\).close)/'r'\1/" compleasm.py  | grep "'r').close"
    # Comment out check for "miniprot.done"
    #sed -i '305,307 {s/^/#/}' compleasm.py 


    # Doug subextracts the refseqs for each lineage. Compress them again and save the original.
    cd /sw/bioinfo/BUSCO/v5_lineage_sets/lineages
    find -maxdepth 2 -iname "refseq_db.faa.gz" | xargs ls -lahrS
 


Stuff for 0.2.6:


    cd /sw/bioinfo/compleasm
    makeroom.sh -f -t compleasm -v 0.2.6 -w https://github.com/huangmengCSU/compleasm -d "A genome completeness evaluation tool based on miniprot" -l "Apache 2.0 and others" -L https://github.com/huangnengCSU/compleasm/blob/0.2.6/LICENSE-BUSCO 
    ./makeroom_compleasm_0.2.6.sh 
    source /sw/bioinfo/compleasm/SOURCEME_compleasm_0.2.6
    cd $SRCDIR
    wget https://github.com/huangnengCSU/compleasm/releases/download/v0.2.6/compleasm-0.2.6_x64-linux.tar.bz2
    tar xf compleasm-0.2.6_x64-linux.tar.bz2 

Unpacks to `compleasm_kit/`. This directory contains executables for miniprot
and hmmsearch. We get those from modules, so ignore them.


Set up venv for installation.

    ml python/3.11.8
    cd $PREFIX
    virtualenv venv
    source venv/bin/activate
    which python3
    which pip3
    ml -python
    pip3 install pandas

Now install from the unpacked tarball.

    cd $SRCDIR
    cd compleasm_kit
    pip3 install .

Edit it so as not to download the lineage or placement files.

    cd $PREFIX/venv/lib/python3.11/site-packages
    sed -i 's/download_lineage=True/download_lineage=False/'     compleasm.py
    sed -i 's/download_placement=True/download_placement=False/' compleasm.py


Lift out the executable, and provide a symlink for `compleasm.py`.

    cd $PREFIX
    mkdir bin
    cd bin
    ln -s $PREFIX/venv/bin/compleasm .
    ln -s compleasm compleasm.py

Be sure the miniprot and hmmsearch executables are not under PREFIX.

    cd $PREFIX
    find . -name miniprot
    find . -name hmmsearch

Rename the versions under $SRCDIR to make sure compleasm is using the module versions.

    cd $SRCDIR/compleasm_kit/
    mv miniprot _miniprot
    mv hmmsearch _hmmsearch

Manage the lineage files.  To get compleasm list --local to work you have to
create a lineage.done file to each lineage. Otherwise list will not work.

    cd /sw/data/BUSCO_data/latest/rackham/v5_lineage_sets/lineages
    for LINEAGE in *_odb10 ; do
        touch $LINEAGE.done
    done

Make sure the compressed sources are there.

    cd /sw/data/BUSCO_data/latest/rackham/v5_lineage_sets/lineages
    find -maxdepth 2 -iname "refseq_db.faa.gz" | xargs ls -lahrS

In the mf, add $modroot/bin to PATH, load miniprot/0.12 and hmmer/3.3.2. Make sure the mf is not a symlink

    cd $TOOLDIR/mf
    ls -l $VERSION

If not a symlink, edit as directed above.

    vi $VERSION

Edit to add $modroot/bin to PATH, load miniprot/0.12 and hmmer/3.3.2, and

    depends-on miniprot/0.12
    depends-on hmmer/3.3.2
    prepend-path PATH $modroot/bin
    setenv COMPLEASM_BUSCO_V5_LINEAGES /sw/data/BUSCO_data/latest/rackham/v5_lineage_sets/lineages

This is the new location of BUSCO lineage sets.

Wrap up.

    cd $TOOLDIR
    ./compleasm-0.2.5_post-install.sh

Load module and test.

    ml purge
    ml bioinfo-tools
    ml compleasm/0.2.5

    compleasm list --local -L $COMPLEASM_BUSCO_V5_LINEAGES
compleasm/0.2.6
========================

<https://github.com/douglasgscofield/compleasm>

Used under license:
Apache 2.0 and others
<https://github.com/huangnengCSU/compleasm/blob/0.2.6/LICENSE-BUSCO>

Structure creating script (makeroom_compleasm_0.2.6.sh) moved to /sw/bioinfo/compleasm/makeroom_0.2.6.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-t" "compleasm" "-v" "0.2.6" "-w" "https://github.com/douglasgscofield/compleasm" "-d" "A genome completeness evaluation tool based on miniprot, fork with support for COMPLEASM_MB_DOWNLOADS environment variable" "-l" "Apache 2.0 and others" "-L" "https://github.com/huangnengCSU/compleasm/blob/0.2.6/LICENSE-BUSCO"
    ./makeroom_compleasm_0.2.6.sh
compleasm/0.2.6
========================

<https://github.com/douglasgscofield/compleasm>

Used under license:
Apache 2.0 and others
<https://github.com/huangnengCSU/compleasm/blob/0.2.6/LICENSE-BUSCO>

Structure creating script (makeroom_compleasm_0.2.6.sh) moved to /sw/bioinfo/compleasm/makeroom_0.2.6.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-t" "compleasm" "-v" "0.2.6" "-w" "https://github.com/douglasgscofield/compleasm" "-d" "A genome completeness evaluation tool based on miniprot, fork with support for COMPLEASM_MB_DOWNLOADS environment variable" "-l" "Apache 2.0 and others" "-L" "https://github.com/huangnengCSU/compleasm/blob/0.2.6/LICENSE-BUSCO"
    ./makeroom_compleasm_0.2.6.sh
  107      wget https://github.com/git-lfs/git-lfs/releases/download/v${VERSION}/${TOOL}-v${VERSION}.tar.gz
  108  sha256sum ${TOOL}-v${VERSION}.tar.gz
  109  vi ../../git-lfs-3.5.1_install-README.md
  110  cat ../../git-lfs-3.5.1_install-README.md
  111  ls
  112  ll
  113    tar xf ${TOOL}-v${VERSION}.tar.gz
  114      cd ${TOOL}-${VERSION}/
  115      module load go/1.20.3
  116      make
  117  make
  118  cd ..
  119  ll
  120  wget https://github.com/git-lfs/git-lfs/releases/download/v3.5.1/git-lfs-linux-amd64-v3.5.1.tar.gz
  121  ll
  122  rm -rf git-lfs-3.5.1/
  123  tar xf git-lfs-linux-amd64-v3.5.1.tar.gz 
  124  ll
  125  cd git-lfs-3.5.1/
  126  ll
  127  cat install.sh 
  128  echo $PREFIX
  129  ll man
  130  ll $PREFIX/bin
  131  ll $PREFIX
  132  ll
  133  ldd git-lfs 
  134  mkdir -p $PREFIX/{share,bin}
  135  cp -av git-lfs $PREFIX/bin/
  136  cp -av man $PREFIX/share/
  137  cd ..
  138  ll
  139  rm -rf git-lfs-v3.5.1.tar.gz git-lfs-3.5.1/
  140  cd ../
  141  cd ..
  142  screen -S blast-taxdb
  143  ll
  144  history >> git-lfs-3.5.1_install-README.md
  145  vi git-lfs-3.5.1_install-README.md
  146  cd -
  147  cd src/
  148  ll
  149   sha256sum ${TOOL}-linux-amd64-v${VERSION}.tar.gz
  150  cd ../..
  151  vi git-lfs-3.5.1_install-README.md
  152  ll
  153  cd mf
  154  ll
  155  vi 3.5.1 
  156  ll
  157  cd ..
  158  vi git-lfs-3.5.1_install-README.md
  159  ll
  160  vi git-lfs-3.5.1_install-README.md
  161  ./git-lfs-3.5.1_post-install.sh 
  162  ll 2.9.1/
  163  miarkafy.sh 2.9.1
  164  ll 2.9.1/
  165  mfshow -c git-lfs
  166  all_mflink -f -c git-lfs 2.9.1
  167  ll
  168  ll mf
  169  ./gather-READMEs.sh 
  170  git status
  171  cd apps/ascp
  172  ll
  173  cat ascp-4.2.0.183804_install-README.md
  174  cd ../..
  175  ll
  176  git status
  177  ll /sw/bioinfo/phylip
  178  cd /sw/bioinfo/phylip
  179  cd 3.697/
  180  ll
  181  cd rackham/
  182  ll
  183  cd bin/
  184  ll
  185  cat font2
  186  ll
  187  ldd libdrawgram.so 
  188  cd ..
  189  ll
  190  cd ../..
  191  ll
  192  cat *md
  193  cd /proj/staff/douglas/nobackup/uppmax
  194  cd /proj/staff/douglas
  195  ls
  196  ll
  197  cd ticket-work/
  198  ll
  199  cd ..
  200  ll
  201  ll nobackup/
  202  cd nobackup/
  203  mkdir 289271
  204  cd 289271/
  205  ml bioinfo-tools AGAT
  206  cp -av /proj/snic2020-16-217/seraina/sand_lizard_MHC/scripts/gendiv_01_extract_fasta_pri.sh .
  207  less gendiv_01_extract_fasta_pri.sh 
  208  ml
  209  less gendiv_01_extract_fasta_pri.sh 
  210  cp /proj/snic2020-16-217/seraina/sand_lizard_MHC/logfiles_nobackup/slurm_45698676_extract_pri_alleles.out .
  211  ll
  212  less *out
  213  ml
  214  mspid bioperl
  215  ml
  216  ml BioPerl/1.7.8-perl5.32.1
  217  ml
  218  ll
  219  less gendiv_01_extract_fasta_pri.sh 
  220  vi *.sh
  221  ll
  222  chmod +x gendiv_01_extract_fasta_pri.sh 
  223  ./gendiv_01_extract_fasta_pri.sh 
  224  ll
  225  ll _Inline/
  226  ll
  227  rm -rf MHCI* _Inline/ sand_lizard_MHC/
  228  ll
  229  ml
  230  ml purge
  231  ./gendiv_01_extract_fasta_pri.sh 2>&1 | tee my.log
  232  ll
  233  ./gendiv_01_extract_fasta_pri.sh 
  234  ll
  235  cat MHCI.agat.log 
  236  ml purge
  237  cd
  238  cd /sw/AGAT
  239  cd /sw/bioinfo-tools/AGAT
  240  cd /sw/bioinfo/AGAT
  241  ll
  242  cat AGAT-1.0.0_install-README.md
  243  cp AGAT-1.0.0_install-README.md AGAT-1.3.2_install-README.md 
  244  ll
  245  vi AGAT-1.3.2_install-README.md 
  246  mspid bioperl
  247  vi AGAT-1.3.2_install-README.md 
  248  ll
  249  ml
  250  cat AGAT-1.3.2_install-README.md 
  251  vi AGAT-1.3.2_install-README.md 
  252  cat AGAT-1.3.2_install-README.md 
  253  vi AGAT-1.3.2_install-README.md 
  254  cat AGAT-1.3.2_install-README.md 
  255     VERSION=1.3.2
  256      makeroom.sh -f -t AGAT -v ${VERSION} -w https://github.com/NBISweden/AGAT -s misc -l "GPL v3" -d "Another Gtf/Gff Analysis Toolkit"
  257      ./makeroom_AGAT_${VERSION}.sh
  258      source /sw/bioinfo/AGAT/SOURCEME_AGAT_${VERSION}
  259      cd $SRCDIR
  260      wget https://github.com/NBISweden/AGAT/archive/refs/tags/v${VERSION}.tar.gz
  261      tar xf v${VERSION}.tar.gz
  262      cd AGAT-${VERSION}/
  263      ml perl/5.32.1
  264      ml perl_modules/5.32.1
  265      ml bioinfo-tools
  266      ml BioPerl/1.7.8-perl5.32.1
  267      echo $PREFIX
  268      perl Makefile.PL PREFIX=$PREFIX
  269  make
  270  make install
  271  cd ../..
  272  cd ..
  273  ll
  274  cd mf
  275  ll
  276  vi 1.3.2
  277  ml
  278  vi 1.3.2
  279  ll
  280  cd ..
  281  ./AGAT-1.3.2_post-install.sh 
  282  ml
  283  ml purge
  284  dirs
  285  pushd .
  286  cd /proj/staff/douglas/nobackup
  287  ls
  288  ll
  289  cd 289271/
  290  ll
  291  vi *sh
  292  ll
  293  rm -rf MHCI* _Inline/ my.log 
  294  ll
  295  ./gendiv_01_extract_fasta_pri.sh 
  296  ll
  297  ml
  298  ml bioinfo-tools AGAT/1.3.2
  299  dirs
  300  swapd
  301  cd mf
  302  ll
  303  vi 1.3.2 
  304  mfshow AGAT
  305  rsync -n -Pa * /sw/mf/common/bioinfo-tools/misc/AGAT/
  306  rsync  -Pa * /sw/mf/common/bioinfo-tools/misc/AGAT/
  307  ml
  308  dirs
  309  swapd
  310  ll
  311  rm -rf AGAT-1.3.2-sand_lizard_MHC/
  312  vi *sh
  313  ml
  314  ml bioinfo-tools
  315  ml AGAT/1.3.2
  316  ./gendiv_01_extract_fasta_pri.sh 
  317  ll
  318  cd AGAT-1.3.2-sand_lizard_MHC/
  319  ll
  320  cd data/
  321  ll
  322  cat mhc_id.txt 
  323  cd ../..
  324  ll
  325  cd ..
  326  rm -rf 289271
  327  ll
  328  cd /sw/comp/python
  329  ll
  330  cat python-3.11.8_install-README.md
  331  ll
  332  cat python-3.9.5_install-README.md
  333  cat python-3.11.8_install-README.md
  334  screen -S BUSCO-v5
  335  cd /sw/data
  336  ls
  337  ll
  338  ls
  339  cd ChEMBL/
  340  ll
  341  du.
  342  cd ..
  343  screen -ls
  344  ll ../blast_databases/taxdb*
  345  cd ../blast_scripts
  346  ls
  347  vi install_check_prepdb_blastdb.sh
  348  ll  /sw/data/blast_tmp/blastdb/*.timestamp
  349  vi install_check_prepdb_blastdb.sh
  350  ll
  351  ./install_check_prepdb_blastdb.sh 
  352  ll tax*
  353  cd ../blast_databases
  354  ll tax*
  355  cd -
  356  grep taxonomy *.sh
  357  vi install_check_prepdb_blastdb.sh
  358  mspid diamond
  359  mspid gnuparallel
  360  vi install_check_prepdb_blastdb.sh
  361  ll
  362  cat cron-wrapper.sh 
  363  cd
  364  cd github-sync/local/
  365  cd install-methods/
  366  ml git/2.34.1
  367  ./gather-READMEs.sh 
  368  git status
  369  ml
  370  ./gather-READMEs.sh 
  371  git status
  372  git add .
  373  git status
  374  git commit -a -m 'installs 2024-03-26'
  375  ssh-agent > ~/.agent
  376  source ~/.agent
  377  ssh-add ~/.ssh/github_rsa
  378  git pull
  379  git push
  380  git status
  381  exit
  382  screen -R 9077.blast-taxdb
  383  ll
  384  ./BUSCO-update-v5-lineage-sets.sh 2>&1  | tee BUSCO-update-v5-lineage-sets.sh.log
  385  kill %+
  386  cd -
  387  cd latest/rackham/v5_lineage_sets.new/
  388  ls
  389  cd lineages/
  390  ls
  391  rm -rf *odb10
  392  dirs
  393  pushd .
  394  cd ../../../../..
  395  cd -
  396  cd ../../../..
  397  vi BUSCO-update-v5-lineage-sets.sh 
  398  swapd
  399  ll *checked
  400  swapd
  401  ./BUSCO-update-v5-lineage-sets.sh 2>&1  | tee BUSCO-update-v5-lineage-sets.sh.log
  402  dirs
  403  swapd
  404  cd ..
  405  ll
  406  grep placement file_versions.tsv
  407  grep -P '(placement|lineage)' file_versions.tsv
  408  grep -P '(placement|information)' file_versions.tsv
  409  dirs
  410  swapd
  411  ./BUSCO-update-v5-lineage-sets.sh 2>&1  | tee -a BUSCO-update-v5-lineage-sets.sh.log
  412  swapd
  413  cd lineages
  414  rm -f *_checked
  415  cd ..
  416  swapd
  417  ./BUSCO-update-v5-lineage-sets.sh 2>&1  | tee -a BUSCO-update-v5-lineage-sets.sh.log
  418  swapd
  419  ls
  420  cd information/
  421  ls
  422  ll
  423  cd ../placement_files/
  424  ll
  425  cd ..
  426  swapd
  427  ll
  428  less BUSCO-update-v5-lineage-sets.sh.log
  429  ./BUSCO-update-v5-lineage-sets.sh 2>&1  | tee -a BUSCO-update-v5-lineage-sets.sh.log
  430  swapd
  431  ll placement_files/mapping_taxid-lineage.archaea_odb10.2019-12-16.txt.tar.gz
  432  tar tvf placement_files/mapping_taxid-lineage.archaea_odb10.2019-12-16.txt.tar.gz
  433  ll placement_files/list_of_reference_markers.eukaryota_odb1*
  434  swapd
  435  bash -x ./BUSCO-update-v5-lineage-sets.sh 2>&1  | tee -a BUSCO-update-v5-lineage-sets.sh.log
  436  swapd
  437  ll placement_files/tree.eukaryota_odb10.nwk*
  438  ll placement_files/tree.eukaryota_odb10*
  439  grep -P '(placement|information)' file_versions.tsv
  440  tar tvf placement_files/tree.eukaryota_odb10.2019-12-16.nwk.tar.gz
  441  ll information/virus_datasets.2020-11-26.txt*
  442  ll information/
  443  dirs
  444  swapd
  445  ./BUSCO-update-v5-lineage-sets.sh 2>&1  | tee -a BUSCO-update-v5-lineage-sets.sh.log
  446  swapd
  447  ls
  448  head file_versions.tsv
  449  cut -f5 file_versions.tsv
  450  ml tinyutils
  451  cut -f5 file_versions.tsv | table
  452  dirs
  453  swapd
  454  ./BUSCO-update-v5-lineage-sets.sh 2>&1  | tee -a BUSCO-update-v5-lineage-sets.sh.log
  455  rm -f BUSCO-update-v5-lineage-sets.sh.log
  456  ./BUSCO-update-v5-lineage-sets.sh 2>&1  | tee  BUSCO-update-v5-lineage-sets.sh.log
  457  swapd
  458  ls -ltr
  459  cd lineages/
  460  ls -ltr
  461  rm -f *_checked *alteromonadales_odb10.2024-01-08.tar.gz.20240320-173053
  462  ls -ltr
  463  cd ..
  464  swapd
  465  ll
  466  swapd
  467  ls
  468  ll
  469  cd lineages/
  470  cd t
  471  cd ../t
  472  ll
  473  cd ..
  474  rm -rf t
  475  cd lineages/
  476  ls
  477  rm -f alteromonadales_odb10.2024-01-08.tar.gz.20240320-153052
  478  rm -f *.done
  479  rm -rf *odb10
  480  cd ..
  481  swapd
  482  ll
  483  rm -f *.log
  484  ./BUSCO-update-v5-lineage-sets.sh 2>&1  | tee  BUSCO-update-v5-lineage-sets.sh.log
  485  ll
  486  vi BUSCO-update-v5-lineage-sets.sh
  487  ll
  488  cd latest/
  489  ll
  490  cd rackham/
  491  ll
  492  ll v5_lineage_sets
  493  ll v5_lineage_sets/lineages
  494  ll
  495  mv v5_lineage_sets v5_lineage_sets.20210225 && mv v5_lineage_sets.new v5_lineage_sets
  496  ll
  497  cat file_versions.tsv
  498  ll
  499  cd v5_lineage_sets.20210225/
  500  ll
  501  cat file_versions.tsv 
  502  cd ..
  503  ll
  504  cd ../..
  505  ll
  506  less BUSCO-update-v5-lineage-sets.sh.log
  507  crontab -l
  508  ll
  509  cd r
  510  cd latest/
  511  ll
  512  cd rackham/
  513  ll
  514  cd v4_lineage_sets/
  515  ll
  516  cd lineages/
  517  ls
  518  cd ..
  519  ls
  520  ll
  521  cat file_versions.tsv 
  522  cd ..
  523  ll
  524  cd v5_lineage_sets
  525  ll
  526  ls lineages
  527  exit
  528  screen -R 13593.BUSCO-v5
  529  screen -ls
  530  source ~/.bashrc
  531  screen -S sw-data
  532  ll
  533  ls
  534  cd DRAM_data/
  535  ll
  536  cd Df
  537  cd ../Dfam/
  538  ll
  539  cd ../ExAC/
  540  ll
  541  cat ExAC-release1-install-README.md
  542  du -csh * > du-csh.txt
  543  ll
  544  cat du-csh.txt 
  545  cd ..
  546  ls
  547  cd GTDB/
  548  ll
  549  cd ../GetOrganelleDB/
  550  ll
  551  cd ../Kraken2_data/
  552  ll
  553  ls
  554  ls -ltr
  555  tail slurm-update-db-rackham-mem256GB-45826949.out
  556  grep slurm-update-db-rackham-mem256GB *.sh
  557  jiu
  558  jobinfo -u douglas -M snowy
  559  rm -rf 20240319-210950
  560  crontab -l | grep Kraken2-update-db.sh
  561  crontab -l | grep -C 10 Kraken2-update-db.sh
  562  less Kraken2-update-db.sh
  563  view /sw/data/Kraken2_data/Kraken2-update-db.sh
  564  mspid kraken2
  565  vi /sw/data/Kraken2_data/Kraken2-update-db.sh
  566  ll
  567  tail slurm-update-db-rackham-mem256GB-45304785.out
  568  cat slurm-update-db-rackham-mem256GB-45826949.out
  569  sbatch /sw/data/Kraken2_data/Kraken2-update-db.sh
  570  crontab -e
  571  ll
  572  jobinfo -u douglas -M snowy
  573  ls -ltr
  574  cat slurm-update-db-snowy-mem512GB-9219582.out
  575  cd ..
  576  ll
  577  cd KrakenUniq_data
  578  ll
  579  ls -ltr
  580  tail -n 200  slurm-snowy-custom-veryfat-8771925.out
  581  less slurm-snowy-custom-veryfat-8771925.out
  582  wc -l slurm-snowy-custom-veryfat-8771925.out
  583  tail slurm-snowy-custom-veryfat-8771925.out
  584  clear
  585  tail slurm-snowy-custom-veryfat-8771925.out
  586  ll
  587  grep slurm-snowy-custom-veryfat- *.sh
  588  vi KrakenUniq_data-update-custom-db_veryfat.sh
  589  crontab -l | grep KrakenUniq_data-update-custom-db_veryfat.sh
  590  crontab -l | grep  KrakenUniq_
  591  crontab -l | grep  KrakenUniq
  592  sbatch KrakenUniq_data-update-custom-db_veryfat.sh
  593  vi KrakenUniq_data-update-custom-db_veryfat.sh
  594  sbatch KrakenUniq_data-update-custom-db_veryfat.sh
  595  ll
  596  ls -ltr
  597  tail slurm-snowy-custom-veryfat-8771925.out
  598  head slurm-snowy-custom-veryfat-8771925.out
  599  ll
  600  ll 20240212-072537-custom/
  601  rm -rf 20240212-072537-custom/
  602  ll
  603  cd ..
  604  ll
  605  cd MMseqs2_data
  606  ll
  607  mspid MMseqs2_data
  608  cat slurm-snowy-largeDBs-mem512GB-8771943.out
  609  ll
  610  cd mv
  611  cd mf
  612  ll
  613  mspid MMseqs2_data
  614  mv 20230125 20230125.deprecated
  615  mv 20230816 20230816.deprecated
  616  mfshow -d MMseqs2_data
  617  rm -vf /sw/mf/*/data/MMseqs2_data/20230125
  618  rm -vf /sw/mf/*/data/MMseqs2_data/20230816
  619  ll
  620  mfshow -d MMseqs2_data
  621  cd ..
  622  ll
  623  du -csh * > du-csh.txt
  624  cat du-csh.txt 
  625  rm -rf 20230125 20230816
  626  ll
  627  cd ..
  628  ls
  629  cd Pfam/
  630  ll
  631  cd ../PhyloPhlAn_data/
  632  ll
  633  cd ../RTG/
  634  ll
  635  cd ../RepeatMasker_data/
  636  ll
  637  cd ../ViWrap/
  638  ll
  639  cd ../WGS_RNAseq_Data/
  640  ll
  641  cat README 
  642  ll
  643  cd ..
  644  ll
  645  grep RNAseq du-csh.20230927.txt
  646  cd annotations/
  647  ll
  648  cd ..
  649  ll
  650  cd annovar_data/
  651  ll
  652  cat annovar_data-2021-05-18_install-README.md
  653  mfshow annovar_data
  654  mfshow -d annovar_data
  655  ll
  656  du -csh *
  657  ll
  658  rm -vf /sw/mf/*/data/annovar_data/2019.10.21
  659  mfshow -d annovar_data
  660  cd mf
  661  ll
  662  mv 2019.10.21 2019.10.21.deprecated
  663  ll
  664  cd ..
  665  cd -
  666  ll
  667  rm -f 2021.05.18
  668  cp -av 2019.10.21.deprecated 2021.05.18
  669  ll
  670  cat 2021.05.18
  671  ll
  672  cd ..
  673  ll
  674  rm -rf 2019.10.21/
  675  ll
  676  cd ..
  677  ll
  678  cd bioscopedata/
  679  ll
  680  cd ../cdd
  681  ll
  682  du -csh * > du-csh.txt
  683  cat du-csh.txt 
  684  mfshow cdd
  685  mfshow -d cdd
  686  rm -rf 3.14 3.16
  687  cd mf
  688  ll
  689  cd ..
  690  ll
  691  vi cdd-3.16-install-README.md
  692  ll
  693  cd ..
  694  cd -
  695  cat du-csh.txt 
  696  cd ..
  697  ll
  698  cd chain_files/
  699  ll
  700  du -csh 20230825/
  701  ll
  702  cd ../diamond_databases/
  703  ll
  704  cd Blast/
  705  ll
  706  rm -rf 20240203-003014
  707  cd ../RefSeq/
  708  ll
  709  cd ../UniRef90/
  710  ll
  711  cd ..
  712  cd reference_proteomes/
  713  ll
  714  cd ..
  715  ll
  716  tail diamond-update-reference_proteomes.out.20240213.s229
  717  tail -n 100 diamond-update-reference_proteomes.out.20240213.s229
  718  ll
  719  cat diamond-update-reference_proteomes.out.20240213.s229
  720  ll
  721  cat diamond-update-reference_proteomes.sh
  722  mspid diamond
  723  ll
  724  cd reference_proteomes/
  725  ll
  726  du -csh *
  727  rm -rf tmp.8*
  728  view diamond-update-reference_proteomes.sh
  729  cd ..
  730  vi diamond-update-reference_proteomes.sh
  731  ll
  732  less diamond-update-reference_proteomes.out.20240213.s229
  733  grep reference *.sh
  734  vi diamond-update-reference_proteomes.sh
  735  crontab -l | grep reference
  736  grep diamond-update-reference_proteomes.sh *
  737  ll
  738  ll reference_proteomes/
  739  tail diamond-update-reference_proteomes.out.20240213.s229
  740  sbatch -M snowy -t 10-00:00:00 -C mem512GB -p node -n 16 -A staff diamond-update-reference_proteomes.sh
  741  jobinfo -u douglas -M snowy
  742  ll
  743  ll reference_proteomes/
  744  cat slurm-9219624.out 
  745  cat /sw/data/diamond_databases
  746  cd /sw/data/diamond_databases
  747  ll slurm-9219624.out
  748  cat slurm-9219624.out
  749  ll
  750  cd reference_proteomes/
  751  ll
  752  ll tmp.28345/
  753  cd ..
  754  ll
  755  cd eggNOG
  756  cd ../eggNOG_data/
  757  ll
  758  du -csh * > du-csh.txt
  759  bg
  760  ll
  761  ll 4.5.1
  762  mfshow -d eggNOG_data
  763  ll
  764  rm -vf /sw/mf/*/data/eggNOG_data/4.5.1 
  765  jobs
  766  kill %+
  767  cd mf
  768  ll
  769  mv 4.5.1 4.5.1.deprecated
  770  ll
  771  cd ..
  772  vi eggNOG_data-4.5.1_install-README.md
  773  ll
  774  rm -rf 4.5.1
  775  ll
  776  cd ..
  777  ls
  778  cd diamond_databases/
  779  ll
  780  ls -ltr
  781  cat slurm-9219624.out
  782  ll
  783  jobinfo -u douglas -M snowy
  784  cd ..
  785  ls
  786  cd ncbi_taxonomy/
  787  ll
  788  cd ../panther/
  789  ll
  790  mfshow panther
  791  mfshow -d panther
  792  du -csh * > du-csh.txt &
  793  cd ..
  794  ll
  795  cd piper_references/
  796  ll
  797  cd 2016-04-07/
  798  ll
  799  cd ../
  800  cat du-csh.txt 
  801  cd ../reference/
  802  ll
  803  cd ..-sil
  804  cd ../silva/
  805  ll
  806  mfshow -d silva
  807  cd ..
  808  ll
  809  cd snpEff_data/
  810  ll
  811  du -csh * > du-csh.txt &
  812  jobs
  813  ll
  814  mspid git
  815  mspid git-lfs
  816  exit
  817  mspid schmutzi
  818  mavail schmutzi
  819  mfshow schmutzi
  820  cat /sw/mf/common/bioinfo-tools/misc/schmutzi/.version 
  821  exit
  822  cd /sw/data
  823  ll
  824  cd Kraken2_data/
  825  ls -ltr
  826  tail slurm-update-nt-rackham-mem1TB-46012326.out
  827  less slurm-update-db-snowy-mem512GB-9219582.out
  828  ll
  829  ls -ltr
  830  ll 20240326-103446/
  831  ll 20240326-103446/library/
  832  screen -ls
  833  screen -R sw-data
  834  ml R_packages
  835  R
  836  screen -ls
  837  vi /sw/apps/R_packages/R_packages-4.3.1_install-README.md 
  838  mspid pisces
  839  makeroom.sh -t Pisces -v 5.3.0.0 -w https://github.com/Illumina/Pisces/releases/tag/v5.3.0.0 -d "Somatic and germline variant caller for amplicon data. Recommended caller for tumor-only workflows." -l "GPL 3" -c bioinfo -s misc
  840  ./makeroom_Pisces_5.3.0.0.sh 
  841  source /sw/bioinfo/Pisces/SOURCEME_Pisces_5.3.0.0 && cd $SRCDIR
  842  wget https://github.com/tamsen/Pisces/releases/download/v5.3.0.0/pisces_all_5.3.0.0.tar.gz
  843  vi ../../Pisces-5.3.0.0_install-README.md 
  844  ll
  845  tar xvf pisces_all_5.3.0.0.tar.gz 
  846  vi ../../Pisces-5.3.0.0_install-README.md 
  847  ll
  848  cd pisces_all/
  849  ll Pisces
  850  ldd Pisces
  851  ./Pisces
  852  ./Pisces -h
  853  cd ..
  854  rmdir $PREFIX && mv pisces_all $PREFIX
  855  cd ../../
  856  cd mf
  857  ll
  858  vi 5.3.0.0 
  859  ll
  860  cd ..
  861  ll
  862  ./Pisces-5.3.0.0_post-install.sh 
  863  history >> Pisces-5.3.0.0_install-README.md 
  864  vi Pisces-5.3.0.0_install-README.md
  865  ll
  866  ml
  867  ml bioinfo-tools Pisces/5.3.0.0
  868  Pisces -h
  869  exit
  870  wget -O detect.sh https://www.openwall.com/lists/oss-security/2024/03/29/4/3
  871  cat detect.sh 
  872  ll detect*
  873  bash detect.sh 
  874  screen -ls
  875  source ~/.bashrc
  876  screen -ls
  877  screen -S compleasm
  878  cd /sw/bioinfo/compleasm
  879  ll
  880  vi compleasm-0.2.6_install-README.md
  881  cd 0.2.5/
  882  ll
  883  cd rackham/
  884  ll
  885  cd bin/
  886  ll
  887  grep download *.py
  888  cd ../venv/
  889  ll
  890  cd lib/
  891  ll
  892  cd python3.11/
  893  ll
  894  cd site-packages/
  895  ll
  896  cd compleasm-0.2.5.dist-info/
  897  ll
  898  cd ..
  899  ll pkg_resources/
  900  grep download compleasm.py
  901  grep download_dir compleasm.py
  902  :q
  903  ll
  904  dirs
  905  pushd .
  906  cd /sw/bioinfo/compleasm/
  907  ll
  908  ./makeroom_compleasm_0.2.6.sh 
  909  ll
  910  vi compleasm-0.2.6_install-README.md
  911  export XXX=/home/xxx
  912  ml python/3.11.8
  913  python
  914  unset XXX
  915  ll
  916  vi compleasm-0.2.6_install-README.md
  917  XXX=xxx
  918  export XXX
  919  python
  920  XXX=
  921  fg
  922  screen -D -RR compleasm
  923  screen -R sw-data
  924  cd /sw/bioinfo/compleasm
  925  ll
  926  cat compleasm-0.2.5_install-README.md
  927  cp compleasm-0.2.5_install-README.md compleasm-0.2.6_install-README.md
  928  vi compleasm-0.2.6_install-README.md
  929  cat ~/.bashrc-miniconda3.bak 
  930  ll
  931  vi compleasm-0.2.6_install-README.md
  932  ml
  933  mspid git
  934  ml git/2.44.0
  935   makeroom.sh "-f" "-t" "compleasm" "-v" "0.2.6" "-w" "https://github.com/douglasgscofield/compleasm" "-d" "A genome completeness evaluation tool based on miniprot, fork with support for COMPLEASM_MB_DOWNLOADS environment variable" "-l" "Apache 2.0 and others" "-L" "https://github.com/huangnengCSU/compleasm/blob/0.2.6/LICENSE-BUSCO"
  936  source /sw/bioinfo/compleasm/SOURCEME_compleasm_0.2.6 && cd $SRCDIR
  937  cd ../..
  938  ll
  939  rm -rf 0.2.6 compleasm-0.2.6_post-install.sh compleasm-0.2.6.yaml SOURCEME_compleasm_0.2.6 mf/0.2.6 
  940  ll
  941  ./makeroom_compleasm_0.2.6.sh 
  942  source /sw/bioinfo/compleasm/SOURCEME_compleasm_0.2.6 && cd $SRCDIR
  943  ml
  944  git clone  git clone https://github.com/douglasgscofield/compleasm.git
  945  git clone --recursive https://github.com/douglasgscofield/compleasm.git
  946  ll
  947  cd compleasm/
  948  ll
  949  vi compleasm.py 
  950  ll
  951  vi compleasm.py 
  952  du -csh * > du-csh.20240326.txt 2>&1 
  953  ll
  954  fixup du-csh.20240326.txt
  955  cat du-csh.20240326.txt
  956  ll
  957  cd Kraken2_data
  958  ll
  959  ls -ltr
  960  cat slurm-update-db-snowy-mem512GB-9219582.out
  961  ml bioinfo-tools
  962  ml Kraken2/2.1.3-20231102-acc2248
  963  kraken2-build --use-ftp --standard --threads 16 --db /sw/data/Kraken2_data/20240326-103446
  964  kraken2-build
  965  ll
  966  cd 20240326-103446/
  967  ll
  968  cd library/
  969  ls
  970  cd archaea/
  971  ls
  972  ls -l
  973  cd all
  974  ls
  975  ls -ltr
  976  crontab -l | grep -i kraken2
  977  ls -ltr
  978  cd ../....
  979  cd ../../..
  980  cd ..
  981  ll
  982  rm -rf 20240326-103446/
  983  cd _tmp_Kraken2-build.22806
  984  ls
  985  ll 20240327-030052_nt/
  986  cd ..
  987  jobinfo -u douglas -M snowy
  988  jobinfo -u douglas 
  989  crontab -l | grep -i kraken2
  990  sbatch /sw/data/Kraken2_data/Kraken2-update-db.sh
  991  jobinfo -u douglas -M snowy
  992  ls -ltr
  993  cat slurm-update-db-snowy-mem512GB-9224608.out
  994  ls
  995  ls 20240327-162424
  996  ls 20240327-162424/library/
  997  ls 20240327-162424/library/bacteria/
  998  ls 20240327-162424/library/bacteria/all
  999  cat slurm-update-db-snowy-mem512GB-9224608.out
 1000  kraken2-build --standard --threads 10 --db /sw/data/Kraken2_data/20240327-162424
 1001  source ~/.bashrc
 1002  cd /sw/bioinfo/compleasm
 1003  ll
 1004  source SOURCEME_compleasm_0.2.6
 1005  ll
 1006  cd $SRCDIR
 1007  ll
 1008  cd compleasm/
 1009  ll
 1010  echo $PREFIX
 1011  dirs
 1012  pushd .
 1013  cd $PREFIX
 1014  ll
 1015  ml python/3.11.8
 1016  virtualenv venv
 1017  source venv/bin/activate
 1018  which python3
 1019  which pip3
 1020  ml -python
 1021  pip3 install pandas
 1022  cd $SRCDIR/compleasm
 1023  ll
 1024  pip3 install .
 1025  dirs
 1026  cd $PREFIX
 1027  ll
 1028  mkdir bin
 1029  ll venv/bin/
 1030  cd bin
 1031  ln -s /sw/bioinfo/compleasm/0.2.6/rackham/venv/bin/compleasm .
 1032  ln -s compleasm compleasm.py
 1033  ll
 1034  head -n 1 *
 1035  cd ../../..
 1036  ll
 1037  ./compleasm-0.2.6_post-install.sh 
 1038  cd mf
 1039  ll
 1040  vi 0.2.6
 1041  ll
 1042  mfshow compleasm
 1043  rsync -n -Pa * /sw/mf/common/bioinfo-tools/annotation/compleasm/
 1044  rsync  -Pa * /sw/mf/common/bioinfo-tools/annotation/compleasm/
 1045  ml
 1046  ml bioinfo-tools
 1047  ml -bioinfo-tools
 1048  ml
 1049  ml bioinfo-tools
 1050  cd $SRCDIR
 1051  ll
 1052  cd compleasm/
 1053  ll
 1054  vi compleasm.py 
 1055  pip3 install .
 1056  vi compleasm.py 
 1057  pip3 install .
 1058  vi compleasm.py 
 1059  pip3 install .
 1060  python
 1061  which python
 1062  ll
 1063  vi compleasm.py 
 1064  ml
 1065  ml git
 1066  git diff
 1067  ssh-agent > ~/.agent
 1068  source ~/.agent
 1069  ssh-add ~/.ssh/github_rsa
 1070  git commit -a -m "Add ability to set library path via COMPLEASM_LIBRARY_PATH environment variable if --library_path not specified"
 1071  git push
 1072  cd ..
 1073  ll
 1074  mkdir t
 1075  cd t
 1076  git clone --recursive git@github.com:douglasgscofield/compleasm.git
 1077  ll
 1078  cd compleasm/
 1079  ll
 1080  cp ../../compleasm/compleasm.py .
 1081  cd ..
 1082  ll
 1083  rm -rf compleasm/
 1084  mv t/compleasm .
 1085  ll
 1086  rmdir t
 1087  cd compleasm/
 1088  pip3 install .
 1089  ml
 1090  git status
 1091  ll
 1092  rm -rf build compleasm.egg-info/
 1093  git diff
 1094  vi compleasm.py 
 1095  pip3 install .
 1096  ll
 1097  rm -rf build compleasm.egg-info/
 1098  git diff
 1099  git log
 1100  git commit -a -m "Add ability to set library path via COMPLEASM_LIBRARY_PATH environment variable if --library_path not specified"
 1101  git push
 1102  screen -ls
 1103  cd ../..
 1104  cd ..
 1105  ll
 1106  history >> compleasm-0.2.6_install-README.md
