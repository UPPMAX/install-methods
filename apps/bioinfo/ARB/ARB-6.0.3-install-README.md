  765  cd /sw/apps/bioinfo
  766  ls
  767  git status
  768  mkdir ARB
  769  cd ARB
  770  mkdir 6.0.3
  771  ldd /bin/su
  772  cd 6.0.3
  773  ll
  774  mkdir milou src
  775  cd src
  776  cd src
  777  wget http://download.arb-home.de/release/latest/arb-6.0.3.centos6-amd64.tgz
  778  tar xzf arb-6.0.3.centos6-amd64.tgz 
  779  ll
  780  rm -rf arb_* bin demo.arb lib PERL_SCRIPTS SH
  781  wget http://download.arb-home.de/release/latest/arb_README.txt
  782  ll
  783  wget http://download.arb-home.de/release/latest/arb_install.sh
  784  git add .
  785  git status
  786  git commit -a -m 'more installs'
  787  git push
  788  cd /sw/apps/bioinfo/ARB/6.0.3/
  789  ll
  790  cd milou/
  791  ll
  792  bash arb_install.sh 
  793  cd .
  794  cd ..
  795  rmdir milou
  796  cd /sw/
  797  ls
  798  cd share
  799  ls
  800  cd uppmax
  801  ll
  802  cd ..
  803  cd uppmax/
  804  ll
  805  ll
  806  cd apps/bioinfo/
  807  ll
  808  ls -ltr
  809  cd Kraken/
  810  ll
  811  cd ../data
  812  ll
  813  cd uppnex/
  814  ll
  815  mkdir ARB
  816  cd ARB
  817  ll
  818  mkdir pt_server
  819  cd pt_server/
  820  cd ..
  821  ll
  822  cd ..
  823  ll
  824  fixup -g ARB
  825  ll
  826  ll tmp
  827  ll Kraken/
  828  du -csh Kraken/*
  829  cd Kraken/
  830  ll
  831  cd ..
  832  ll
  833  cd milou/
  834  ll
  835  view Kraken-0.10.5-beta-install-README.md 
  836  pushd .
  837  cd /sw/apps/bioinfo/ARB/6.0.3/milou
  838  cd ../..
  839  mkdir mf
  840  cd mf
  841  ll
  842  rm -rf 20151201 20160101
  843  ll
  844  du.
  845  cd ..
  846  ll
  847  cd ARB/
  848  ll
  849  cd pt_server/
  850  ll
  851  cp ../../Kraken/mf/0.10.5-beta 6.0.3
  852  cd bin
  853  ll
  854  grep DATA *
  855  ll
  856  head -n 1 *
  857  cd /sw/mf/common/bioinfo-tools/
  858  ls
  859  ll
  860  ll pipelines/
  861  cd pipelines/
  862  mkdir ARB
  863  cd ARB
  864  vi 6.0.3 
  865  cp /sw/apps/bioinfo/ARB/mf/6.0.3 .
  866  ll
  867  cd ..
  868  fixup ARB
  869  cd /sw/mf/milou/bioinfo-tools/pipelines/
  870  mkdir ARB
  871  cd ARB
  872  ln -s ../../../../common/bioinfo-tools/pipelines/ARB/6.0.3 .
  873  ll
  874  cd ..
  875  fixup ARB
  876  cd ../../../common/bioinfo-tools/pipelines/ARB/
  877  ll
  878  cp /sw/apps/bioinfo/ARB/mf/6.0.3 .
  879  ll
  880  cat 6.0.3 
  881  cd tmp
  882  ls
  883  mkdir ARB
  884  cd ARB
  885  ll
  886  module spider arb
  887  module load bioinfo-tools ARB/6.0.3
  888  cp /sw/apps/bioinfo/ARB/6.0.3/milou/demo.arb 
  889  cp /sw/apps/bioinfo/ARB/6.0.3/milou/demo.arb .
  890  ll
  891  arb
  892  cd tmp/ARB
  893  ll
  894  arb 
  895  cd /sw/apps/bioinfo/ARB/
  896  ls
  897  cd 6.0.3/milou/
  898  ll
  899  pushd .
  900  cd /sw/data
  901  ls
  902  cd uppnex/
  903  ls
  904  cd ARB
  905  ll
  906  cd pt_server/
  907  ll
