GATK/4.1.4.1
============

<https://software.broadinstitute.org/gatk/>

LOG
---

    TOOL=/sw/bioinfo/GATK
    VERSION=4.1.4.1
    CLUSTER=${CLUSTER?:CLUSTER must be set}
    mkdir -p $TOOL/$VERSION
    cd $TOOL/$VERSION
    [[ $CLUSTER == rackham ]] && for CL in irma snowy bianca ; do test -L $CL || ln -sf $CLUSTER $CL; done
    PREFIX=$PWD/$CLUSTER
    mkdir src
    cd src
    wget https://github.com/broadinstitute/gatk/releases/download/${VERSION}/gatk-${VERSION}.zip
    unzip gatk-${VERSION}.zip 
    mv gatk-${VERSION} $PREFIX

As for 4.0.8.0 and 4.1.0.0, I have NOT installed the `gatk.py` wrapper from
bioconda https://github.com/bioconda/bioconda-recipes/tree/master/recipes/gatk
since this comes with its own wrapper.

To set the values for `-Xms` and `-Xmx` I added this line in the gatk wrapper.

    PACKAGED_LOCAL_JAR_OPTIONS= ["-Dsamjdk.use_async_io_read_samtools=false",
                      "-Dsamjdk.use_async_io_write_samtools=true",
                      "-Dsamjdk.use_async_io_write_tribble=false",
                      "-Dsamjdk.compression_level=2",
                      "-Xms512M","-Xmx5G"] <--------- UPPMAX addition

Now install the GATK conda environment.  This is needed for some tools.

    cd $PREFIX
    mkdir envs
    export CONDA_ENVS_PATH=$PREFIX/envs
    module load conda/latest
    conda env create -n gatk -f gatkcondaenv.yml

This takes a while for conda to do its thing.

  504  ml texlive/2019
  505  cd ..
  506  rm -rf beagle-lib-3.1.2-rackham && tar xzf v3.1.2.tar.gz && mv beagle-lib-3.1.2 beagle-lib-3.1.2-rackham && cd beagle-lib-3.1.2-rackham && ./autogen.sh
  507  ml texlive/2019
  508  cd ..
  509  ./configure --prefix=$PREFIX
  510  rm -rf beagle-lib-3.1.2-snowy && tar xzf v3.1.2.tar.gz && mv beagle-lib-3.1.2 beagle-lib-3.1.2-snowy && cd beagle-lib-3.1.2-snowy && ./autogen.sh
  511  make && make doxygen-doc && make doxygen-pdf
  512  view Makefile
  513  make && make doxygen-doc && make doxygen-pdf
  514  make install
  515  cp -av doc $PREFIX
  516  ll
  517  cd .conda
  518  pushd .
  519  cd /sw/bioinfo/GATK/4.1.4.1/rackham
  520  ll
  521  cd envs/
  522  ll
  523  ./configure --prefix=$PREFIX && make && make doxygen-doc && make check && make install && cp -av doc $PREFIX/
  524  cd ../..
  525  ll
  526  ll rackham/
  527  cd ..
  528  ll
  529  history >> beagle-3.1.2_install-README.md
  530  ml 
  531  vi beagle-3.1.2_install-README.md 
  532  ll
  533  cd mf
  534  ll
  535  cd ..
  536  vi beagle-3.1.2_install-README.md 
  537  ll
  538  fixup .
  539  ll
  540  mfshow beagle
  541  ll
  542  cd mf
  543  ll
  544  vi *
  545  ll
  546  rsync -Pa * /sw/mf/common/bioinfo-tools/phylogeny/beagle/
  547  all_mflink -f beagle 3.1.2
  548  cd ../../beast2/
  549  ll
  550  cd mf
  551  ll
  552  vi 2.6.2pre 
  553  mfshow beast2
  554  ll
  555  vi 2.1.2
  556  ll
  557  rm -f 2.6.2pre && cp 2.1.2 2.6.2pre
  558  vi 2.6.2pre 
  559  rsync -Pa * /sw/mf/common/bioinfo-tools/phylogeny/beast2/
  560  mfshow beast2
  561  ml
  562  ll
  563  cd ..
  564  ll
  565  cd ../beagle
  566  ll
  567  cat SOURCEME_beagle_3.1.2
  568  exit
  569  conda env create -n gatk -f gatkcondaenv.yml
  570  cd /sw/bioinfo/SLiM/
  571  ll
  572  cat SLiM-3.2.1-install-README.md
  573  cp SLiM-3.2.1-install-README.md SLiM-2.6-install-README.md
  574  vi SLiM-2.6-install-README.md
  575  ll
  576  cat SLiM-2.6-install-README.md
  577      VERSION=2.6
  578      cd /sw/bioinfo
  579      TOOL=SLiM
  580      mkdir -p $TOOL/$VERSION
  581      cd $TOOL/$VERSION
  582      mkdir $CLUSTER
  583      [[ $CLUSTER == rackham ]] && for CL in snowy irma bianca ; do ln -s $CLUSTER $CL ; done
  584      PREFIX=$PWD/$CLUSTER
  585      mkdir src
  586      cd src
  587      wget https://github.com/MesserLab/SLiM/archive/v${VERSION}.tar.gz
  588      tar xzf v${VERSION}.tar.gz
  589      cd SLiM-${VERSION}
  590      module load cmake/3.13.2 gcc/7.4.0
  591      mkdir build
  592      cd build
  593      cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_AR=$(which gcc-ar) -DCMAKE_RANLIB=$(which gcc-ranlib) ..
  594  cd ..
  595  ll
  596  less README.md 
  597  vi README.html 
  598  ll
  599  rmdir build
  600  ml
  601  ml -cmake
  602  make
  603  ll
  604  ll bin/
  605  cd bin/
  606  ll
  607  ldd *
  608  ml -gcc
  609  ml
  610  ml -gcc
  611  ldd *
  612  cd ..
  613  ll
  614  cd ..
  615  cd 3.2.1/
  616  ll
  617  cd rackham/
  618  ll
  619  cd bin/
  620  ll
  621  cd ../../..
  622  cd 2.6/
  623  ll
  624  cd src/
  625  ll
  626  cd SLiM-2.6/
  627  ll
  628  cp -av bin $PREFIX/
  629  cd ..
  630  ll
  631  cd ../..
  632  ll
  633  vi SLiM-2.6-install-README.md
  634  ll
  635  cd 2.6/
  636  ll
  637  cd src/
  638  ll
  639  cd SLiM-2.6/
  640  ll
  641  vi Makefile
  642  cd ..
  643  ll
  644  ll ../rackham/
  645  ll ../rackham/bin/
  646  cd ../..
  647  ll
  648  vi SLiM-2.6-install-README.md 
  649  ll 3.2.1/rackham/
  650  vi SLiM-2.6-install-README.md 
  651  cd 2.6/
  652  ll
  653  cd rackham/
  654  ll
  655  cd bin/
  656  ll
  657     ./slim -u
  658      ./slim -testEidos
  659      ./slim -testSLiM
  660  cd ../..
  661  cd ..
  662  ll
  663  cd mf
  664  ll
  665  vi 3.2.1 
  666  ll
  667  mv 3.2.1 2.6 && ln -s 2.6 3.2.1
  668  ll
  669  cd ..
  670  fixup .
  671  ll
  672  mfshow SLiM
  673  cd mf
  674  rsync -n -Pa * /sw/mf/common/bioinfo-tools/misc/SLiM/
  675  rsync  -Pa * /sw/mf/common/bioinfo-tools/misc/SLiM/
  676  ll
  677  mfshow SLiM
  678  all_mflink -f SLiM 2.6
  679  cd ..
  680  ll
  681  cp SLiM-3.2.1-install-README.md SLiM-3.3.2-install-README.md
  682  vi SLiM-3.3.2-install-README.md
  683  mspid gcc
  684  vi SLiM-3.3.2-install-README.md
  685  ll
  686  cat SLiM-3.3.2-install-README.md
  687     VERSION=3.3.2
  688      cd /sw/bioinfo
  689      TOOL=SLiM
  690      mkdir -p $TOOL/$VERSION
  691      cd $TOOL/$VERSION
  692      mkdir $CLUSTER
  693      [[ $CLUSTER == rackham ]] && for CL in snowy irma bianca ; do test -L $CL || ln -s $CLUSTER $CL ; done
  694      PREFIX=$PWD/$CLUSTER
  695      mkdir src
  696      cd src
  697      wget https://github.com/MesserLab/SLiM/archive/v${VERSION}.tar.gz
  698      tar xzf v${VERSION}.tar.gz
  699      cd SLiM-${VERSION}
  700      module load cmake/3.13.2 gcc/8.3.0
  701      mkdir build
  702      cd build
  703      cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_AR=$(which gcc-ar) -DCMAKE_RANLIB=$(which gcc-ranlib) ..
  704      make
  705      make install
  706  cd ..
  707  ll
  708  cd ..
  709  ll
  710  vi SLiM-3.3.2-install-README.md
  711    module unload cmake gcc
  712      cd $PREFIX
  713      ldd *
  714      ./slim -u
  715      ./slim -testEidos
  716      ./slim -testSLiM
  717  vi ../../SLiM-3.3.2-install-README.md
  718      module unload cmake gcc
  719      cd $PREFIX/bin
  720      ldd *
  721      ./slim -u
  722      ./slim -testEidos
  723      ./slim -testSLiM
  724  ll
  725  cd ../..
  726  cd ..
  727  ll
  728  cd mf
  729  ll
  730  ln -s 3.2.1 3.3.2
  731  ll
  732  rsync  -Pa * /sw/mf/common/bioinfo-tools/misc/SLiM/
  733  all_mflink -f SLiM 3.3.2
  734  cd /sw/bioinfo/
  735  ls -ltr
  736  makeroom.sh -f -t MetaCRAST -s misc -v clone -w https://github.com/molleraj/MetaCRAST -d "reference-guided CRISPR detection in metagenomes" -l "GPL v3"
  737  ./makeroom_MetaCRAST_clone.sh 
  738  cd MetaCRAST/
  739  ll
  740  cd clone/src/
  741  source ../../SOURCEME_MetaCRAST_clone 
  742  ll
  743  git clone https://github.com/molleraj/MetaCRAST.git
  744  cd MetaCRAST/
  745  ll
  746  cat local_install.sh 
  747  ml cd-hit
  748  ml bioinfo-tools
  749  mspid hit
  750  ml cd-hit/4.8.1
  751  ll
  752  mspid perl
  753  mspid bioperl
  754  ml BioPerl/1.7.2_Perl5.26.2
  755  ml
  756  ll
  757  cd bin/
  758  ll
  759  less MetaCRASTp 
  760  ll
  761  head -n 1 *
  762  sed -i 's,^#!/usr/bin/perl.*$,#!/usr/bin/env perl,' *
  763  ll
  764  chmod +x MetaCRASTp 
  765  ll
  766  ./MetaCRASTp 
  767  ll MetaCRAST
  768  ./MetaCRAST
  769  cd ..
  770  ll
  771  cd query/
  772  ll
  773  cat AMDquery.fa 
  774  cd ../bin
  775  ll
  776  less MetaCRASTp
  777  view MetaCRASTp
  778  ll
  779  which taskset
  780  tastset -h
  781  taskset -h
  782  ll
  783  ll envs/
  784  ll envs/gatk/
  785  cd /sw/bioinfo/trinity/
  786  ll
  787  cat trinity-2.8.2-install-README.md
  788  ll
  789  makeroom.sh -f -t trinity -s assembly -v 2.9.1 -w https://github.com/trinityrnaseq/trinityrnaseq -d "novel method for the efficient and robust de novo reconstruction of transcriptomes from RNA-seq data" -l "Custom open-source 'as is'"
  790  ./makeroom_trinity_2.9.1.sh 
  791  ll
  792  source SOURCEME_trinity_2.9.1 
  793  ll
  794  vi trinity-2.9.1_install-README.md
  795  mspid bowtie2
  796  vi trinity-2.9.1_install-README.md
  797  ll
  798  cd 2.9.1/
  799  ll
  800  cd src
  801  ll
  802  wget https://github.com/trinityrnaseq/trinityrnaseq/releases/download/v2.9.1/trinityrnaseq-v2.9.1.FULL_with_extendedTestData.tar.gz
  803  ll
  804  tar xzf trinityrnaseq-v2.9.1.FULL_with_extendedTestData.tar.gz 
  805  ll
  806  cd trinityrnaseq-v2.9.1/
  807  ll
  808  cat __pull_trinity_ext_sample_data.sh 
  809  ll trinity_ext_sample_data/
  810  du -csh trinity_ext_sample_data/
  811  rmdir ../../rackham
  812  cd ..
  813  mv trinityrnaseq-v2.9.1 ../rackham
  814  cd ../rackham/
  815  ll
  816  cat ../../trinity-2.9.1_install-README.md 
  817     module load cmake/3.7.2
  818      module load gcc/8.3.0
  819      module load java/sun_jdk1.8.0_151
  820      module load bioinfo-tools bowtie2/2.3.5.1
  821  make
  822  make plugins
  823  cat ../../trinity-2.9.1_install-README.md 
  824  sample_data/test_Trinity_Assembly/runMe.sh
  825  mshow trinity
  826  module spider trinity
  827  pushd .
  828  mfshow trinity
  829  cat /sw/mf/common/bioinfo-tools/assembly/trinity/.version 
  830  ml
  831  module avail trinity
  832  vi /sw/mf/common/bioinfo-tools/assembly/trinity/.version 
  833  module avail trinity
  834  mshow trinity/2.8.2
  835  cd ../..
  836  ll
  837  cd -
  838  sample_data/test_Trinity_Assembly/runMe.sh
  839  export TRINITY_HOME=$PWD
  840  sample_data/test_Trinity_Assembly/runMe.sh
  841  ml samtools
  842  ml
  843  sample_data/test_Trinity_Assembly/runMe.sh
  844  ml jellyfish
  845  sample_data/test_Trinity_Assembly/runMe.sh
  846  ml salmon
  847  sample_data/test_Trinity_Assembly/runMe.sh
  848  ml salmon
  849  mspid salmon
  850  ml Salmon/1.1.0
  851  sample_data/test_Trinity_Assembly/runMe.sh
  852  find . -name reads.left.fq.gz
  853  ml
  854  cd sample_data/test_Trinity_Assembly
  855  ll
  856  ./runMe.sh 
  857  ll
  858  cd ..
  859  ll
  860  cd ..
  861  ll
  862  cd -
  863  cat Makefile 
  864  jobinfo
  865  jobinfo -u danie
  866  jobstats -r -p 11874641
  867  ls -ltr
  868  rm -f core.24880 
  869  pushd .
  870  cd /sw/share/slurm/
  871  ll
  872  cd rackham/jobdetails/
  873  cd danie
  874  ll
  875  cd 11877027
  876  ll
  877  cat jobscript 
  878  jobstats -p 11843971
  879  ll
  880  pushd .
  881  cd
  882  jobstats -p 11843971
  883  ls -ltr
  884  finishedjobinfo -h
  885  make
  886  finishedjobinfo danie
  887  finger danie
  888  mkdir blast/2.9.0+
  889  ml blast/2.9.0+
  890  make
  891  cd ..
  892  ll
  893  ml
  894  ll ../../mf/
  895  vi ../../mf/2.9.1 
  896  ll trinity-plugins/
  897  cd trinity-plugins/
  898  ll
  899  make
  900  ll
  901  cd ..
  902  ll
  903  fixup .
  904  ll util/
  905  ll util/misc/
  906  cd ..
  907  ll
  908  cd ..
  909  ll
  910  fixup .
  911  ll
  912  cd mf
  913  ll
  914  cat 2.9.1 
  915  vi 2.9.1 
  916  ll
  917  vi *
  918  ll
  919  mfshow trinity
  920  vi /sw/mf/common/bioinfo-tools/assembly/trinity/
  921  vi /sw/mf/common/bioinfo-tools/assembly/trinity/.version 
  922  rsync -n -Pa * /sw/mf/common/bioinfo-tools/assembly/trinity/
  923  rsync  -Pa * /sw/mf/common/bioinfo-tools/assembly/trinity/
  924  cp /sw/mf/common/bioinfo-tools/assembly/trinity/2014-07-17 .
  925  vi 2014-07-17 
  926  ll
  927  rsync -n -Pa * /sw/mf/common/bioinfo-tools/assembly/trinity/
  928  rsync  -Pa * /sw/mf/common/bioinfo-tools/assembly/trinity/
  929  ll
  930  mfshow trinity
  931  all_mflink -f trinity 2.9.1
  932  ll ..
  933  history >> trinity-2.9.1_install-README.md
  934  vi trinity-2.9.1_install-README.md 
  935  ll
  936  groups
  937  ll
  938  cd ..
  939  ll
  940  history >> trinity-2.9.1_install-README.md
  941  rm mf/trinity-2.9.1_install-README.md 
  942  vi trinity-2.9.1_install-README.md 
  943  mspid
  944  ml
  945  vi trinity-2.9.1_install-README.md 
  946  cd 2.9.1/rackham/
  947  ll
  948  cd sample_data/
  949  ll
  950  cat Makefile 
  951  cd ..
  952  ll
  953  cd ../..
  954  vi trinity-2.9.1_install-README.md 
  955  ll
  956  mfshow trinity
  957  module avail trinity
  958  groups
  959  which eog
  960  dirs
  961  popd
  962  ll
  963  echo $CONDA_ENVS_PATH
  964  ml
  965  source activate gatk
  966  conda list
  967  deactivate
  968  conda deactivate
  969  conda list
  970  source activate gatk
  971  which conda
  972  ml
  973  conda deactivate
  974  ml -conda
  975  source activate gatk
  976  ml conda/latest
  977  echo $CONDA_ENVS_PATH
  978  vi ../../mf/4.1.4.1 
  979  ml
  980  mspid GATK
  981  cd ../mf
  982  cd ../../mf
  983  ll
  984  rsync -n -Pa * /sw/mf/common/bioinfo-tools/sw_collections/GATK/
  985  rsync  -Pa * /sw/mf/common/bioinfo-tools/sw_collections/GATK/
  986  mfshow GATK
  987  ml
  988  ml -GATK
  989  vi 4.1.4.1 
  990  rsync  -Pa * /sw/mf/common/bioinfo-tools/sw_collections/GATK/
  991  ml -GATK
  992  ml
  993  ml GATK/4.1.4.1
  994  module help GATK/4.1.4.1
  995     module load conda/latest
  996      conda activate -f gatk
  997  conda activate gatk
  998  echo $CONDA_ENVS_PATH
  999  vi 4.1.4.1
 1000  ssh douglas@rackham3
 1001  cd /sw/bioinfo/GATK/mf
 1002  ll
 1003  vi 4.1.4.1
 1004  history
 1005  history | grep conda
 1006  rsync  -Pa * /sw/mf/common/bioinfo-tools/sw_collections/GATK/
 1007  vi 4.1.4.1
 1008  rsync  -Pa * /sw/mf/common/bioinfo-tools/sw_collections/GATK/
 1009  cd ..
 1010  ll
 1011  history >> GATK-4.1.4.1-install-README.md
