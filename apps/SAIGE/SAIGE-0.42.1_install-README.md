SAIGE/0.42.1
============

<https://github.com/weizhouUMICH/SAIGE>

Used under license:
GPL v3

Structure creating script (makeroom_SAIGE_0.42.1.sh) moved to /sw/apps/SAIGE/makeroom_0.42.1.sh

LOG
---

    TOOL=SAIGE
    VERSION=0.42.1
    makeroom.sh -t "SAIGE" -v "0.42.1" -c "apps" -w "https://github.com/weizhouUMICH/SAIGE" -l "GPL v3" -d "An R package with Scalable and Accurate Implementation of Generalized mixed model \(Chen\, H. et al. 2016\). It accounts for sample relatedness and is feasible for genetic association tests in large cohorts and biobanks \(N \> 400\,000\)."
    ./makeroom_SAIGE_0.42.1.sh

cd /sw/apps/SAIGE/
source SOURCEME_SAIGE_0.42.1 
cd $SRCDIR
ml R_packages/4.0.0
ml autoconf/2.69 automake/1.14.1 cmake/3.13.2 m4/1.4.17 
ml openblas/0.2.20
ml cmake/3.17.3
git clone --depth 1  https://github.com/weizhouUMICH/SAIGE
export R_LIBS_USER=$PREFIX
mkdir external_tarballs
cd external_tarballs/
wget https://cran.r-project.org/src/contrib/Archive/MetaSKAT/MetaSKAT_0.80.tar.gz
R CMD INSTALL MetaSKAT_0.80.tar.gz 
ll $PREFIX
1139  R CMD INSTALL SAIGE
1140  ll /sw/apps/SAIGE/0.42.1/src/SAIGE/thirdParty/bgen/wscript 
1141  less /sw/apps/SAIGE/0.42.1/src/SAIGE/thirdParty/bgen/wscript 
1142  ml python/2.7.15
1143  rm -rf SAIGE
1144  git clone --depth 1  https://github.com/weizhouUMICH/SAIGE
1145  R CMD INSTALL SAIGE
1146  ml python/3.7.2
1147  R CMD INSTALL SAIGE
1148  ml python/2.7.15
1153  ml python3/3.8.7
1154  which python2
1155  which python3
1156  R CMD INSTALL SAIGE
1157  ldd /sw/apps/SAIGE/0.42.1/rackham/00LOCK-SAIGE/00new/SAIGE/libs/SAIGE.so
1158  ml
1159  strings /sw/libs/openblas/0.2.20/rackham/lib/libopenblas.so | grep sgecon
1160  echo $LD_RUN_PATH
1161  ll /sw/apps/SAIGE/0.42.1/rackham/
1162  echo $LD_LIBRARY_PATH
1163  cd SAIGE/
1164  ll
1165  ll conda_env/
1166  cd build/
1167  ll
1168  cd ..
1169  ll thirdParty/
1170  cd thirdParty/
1171  cat requirements.txt 
1172  cat readme 
1173  cd ..
1174  ll
1175  vi configure 
1176  ll
1177  cd src
1178  ls
1179  ll
1180  ldd SAIGE.so 
1181  vi Makevars

vi Makevars
add  /sw/libs/openblas/0.2.20/rackham/lib/libopenblas.a as last item in OBJECTS line

R CMD INSTALL SAIGE

