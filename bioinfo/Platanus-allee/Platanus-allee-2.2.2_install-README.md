Platanus-allee/2.2.2
========================

<http://platanus.bio.titech.ac.jp/platanus2>

Used under license:
GPL3


Structure creating script (makeroom_Platanus-allee_2.2.2.sh) moved to /sw/bioinfo/Platanus-allee/makeroom_2.2.2.sh

LOG
---

    /home/matpiq/install-methods/makeroom.sh "-f" "-t" "Platanus-allee" "-v" "2.2.2" "-s" "assembly" "-w" "http://platanus.bio.titech.ac.jp/platanus2" "-d" "Platanus-allee is a de novo haplotype assembler (phasing tool), which assembles each haplotype sequence in a diploid genome" "-l" "GPL3"
    ./makeroom_Platanus-allee_2.2.2.sh


    ./makeroom_Platanus-allee_2.0.2.sh
    cd /sw/bioinfo/$TOOL/$VERSION/src
    wget -O Platanus_allee_v${VERSION}_Linux_x86_64.tgz http://platanus.bio.titech.ac.jp/?ddownload=348
    tar xzf Platanus_allee_v${VERSION}_Linux_x86_64.tgz
    cd Platanus_allee_${VERSION}
    module load gcc/4.9.4
    make -j 4
    cp -av platanus_allee $PREFIX/
    cp -av README.md $PREFIX/

Load minimap2 and longranger when this module is loaded.

There's a multithreading bug revealed by the test data... attempted to get around it by backing off the optimisation, but it persists.

cd /sw/bioinfo/Platanus-allee/
1014  cd ..
1015  mydiff -y --suppress-common-lines --report-identical-files -r test_run_result test_run
1016  ll
1017  cd test_run_result/
1018  ll
1019  cd ../test_run
1020  ll
1021  cd ../..
1022  ll
1023  less Platanus-allee-2.2.2_install-README.md
1024  cd doug/
1025  ll
1026  cat ../Platanus-allee-2.2.2_install-README.md 
1027  source ../SOURCEME_Platanus-allee_2.2.2 
1028  wget -O Platanus_allee_v${VERSION}_Linux_x86_64.tgz http://platanus.bio.titech.ac.jp/?ddownload=348
1029  tar xf Platanus_allee_v2.2.2_Linux_x86_64.tgz 
1030  ll
1031  cd Platanus_allee_v2.0.2/
1032  ll
1033  cd ..
1034  wget -O Platanus_allee_v${VERSION}_Linux_x86_64.tgz http://platanus.bio.titech.ac.jp/?ddownload=431
1035  tar xf Platanus_allee_v2.2.2_Linux_x86_64.tgz 
1036  ll
1037  rm -rf Platanus_allee_v2.*
1038  rsync -Pa dousc151@fb166.ebc.uu.se:Downloads/Platanus* .
1039  ll
1040  tar xf Platanus_allee_v2.2.2_Linux_x86_64.tgz 
1041  ll
1042  cd Platanus_allee_v2.2.2_Linux_x86_64/
1043  ll
1044  file platanus_allee 
1045  cd minimap2-2.0-r191/
1046  ll
1047  cd ..
1048  ll
1049  cd ..
1050  ll
1051  rsync
1052  rsync -Pa dousc151@fb166.ebc.uu.se:Downloads/Platanus* .
1053  ll
1054  tar xf Platanus_allee_test_data_v2.2.2.tgz 
1055  ll
1056  cd Platanus_allee_test_data_v2.2.2/
1057  ll
1058  cat README.md 
1059  cd ..
1060  ll
1061  cd Platanus_allee_v2.2.2_Linux_x86_64/
1062  ll
1063  cat README.md 
1064  ll
1065  export PATH="$PWD:$PATH"
1066  cd ../Platanus_allee_test_data_v2.2.2/
1067  ll
1068  cat README.md 
1069  cd test_run
1070  ll
1071  cat run.sh 
1072  cp -a run.sh run.sh.orig
1073  vi run.sh
1074  ll
1075  sh run.sh 
1076  ll
1077  ll iEHN0A 
1078  ll ../test_run_result/
1079  less out.assembleLog
1080  ll
1081  view run.sh
1082  less out.phaseLog
1083  ll ../../Platanus_allee_v2.2.2_Linux_x86_64/minimap2-2.0-r191/minimap2
1084  cp run.sh rrun.sh
1085  vi rrun.sh 
1086  sh rrun.sh 
1087  ll
1088  cat out.consensusLog
1089  cd ../..
1090  ll
1091  cd Platanus_allee_v2.2.2_Linux_x86_64/
1092  ll
1093  cd minimap2-2.0-r191/
1094  ll
1095  cd ..
1096  ln minimap2-2.0-r191/minimap2 .
1097  ll
1098  cd ../Platanus_allee_test_data_v2.2.2/
1099  ll
1100  cd test_run
1101  ll
1102  sh rrun.sh 
1103  ll
1104  cat out.consensusLog
1105  vi rrun.sh 
1106  sh rrun.sh 
1107  ll
1108  cat rrun.sh 
1109  ll
1110  mkdir phase
1111  rm -rf ??????
1112  rm -f core.*
1113  ll
1114  cp run.sh.orig run.sh
1115  vi run.sh
1116  ll
1117  vi rrun.sh 
1118  vi run.sh
1119  ll
1120  cat run.sh
1121  chmod +x run.sh
1122  ./run.sh 
1123  ll
1124  platanus_allee assemble -t 10 -tmp tmp.assemble -m 60 -o out -f ../reads/Illumina_PE500/R*.fq 2>out.assembleLog
1125  platanus_allee phase -t 10 -tmp tmp.phase -o out -mapper minimap2 -c out_contig.fa -IP1 ../reads/Illumina_PE500/R*.fq -OP2 ../reads/Illumina_MP3000/R*.fq -p ../reads/PacBio/subreads.fq -x ../reads/10X/barcoded.fq 2>out.phaseLog
1126  platanus_allee phase -t 10 -tmp tmp.phase -o out -c out_contig.fa -IP1 ../reads/Illumina_PE500/R*.fq -OP2 ../reads/Illumina_MP3000/R*.fq -p ../reads/PacBio/subreads.fq -x ../reads/10X/barcoded.fq 2>out.phaseLog
1127  which minimap2
1128  minimap2
1129  platanus_allee phase -t 10 -tmp tmp.phase -o out -c out_contig.fa -IP1 ../reads/Illumina_PE500/R*.fq -OP2 ../reads/Illumina_MP3000/R*.fq -p ../reads/PacBio/subreads.fq -x ../reads/10X/barcoded.fq 2>out.phaseLog
1130  platanus_allee phase -t 10 -tmp tmp.phase -o out -c out_contig.fa -IP1 ../reads/Illumina_PE500/R*.fq -OP2 ../reads/Illumina_MP3000/R*.fq -p ../reads/PacBio/subreads.fq -x ../reads/10X/barcoded.fq 
1131  cd ../..
1132  ll
1133  rsync -Pa dousc151@fb166.ebc.uu.se:Downloads/Platanus* .
1134  tar xf Platanus_allee_v2.2.2.tgz 
1135  ll
1136  cd Platanus_allee_v2.2.2
1137  ll
1138  ll minimap2-2.0-r191/
1139  ll
1140  cat Makefile 
1141  ml gcc/9.3.0
1142  make
1143  ml gcc/6.4.0
1144  make clean
1145  make
1146  make clean
1147  ll
1148  ml gcc/9.3.0
1149  make -j4
1150  cd minimap2-2.0-r191/
1151  ll
1152  make
1153  make clean
1154  make
1155  cd ..
1156  ll
1157  ln -s minimap2-2.0-r191/minimap2 .
1158  ll
1159  echo $PATH
1160  export PATH="/sw/comp/gcc/9.3.0_rackham/bin:/sw/bioinfo/Platanus-allee/doug/Platanus_allee_v2.2.2:/home/douglas/myprefix/bin:/home/douglas/github-sync/local/uppmax/misc:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sw/uppmax/bin"
1161  which platanus_allee
1162  which minimap2
1163  cd ../Platanus_allee_test_data_v2.2.2/
1164  ll
1165  cd test_run
1166  ll
1167  cd ..
1168  ll
1169  cd ..
1170  ll
1171  rm -rf Platanus_allee_test_data_v2.2.2
1172  tar xf Platanus_allee_test_data_v2.2.2.tgz 
1173  cd Platanus_allee_test_data_v2.2.2/
1174  ll
1175  cd test_run
1176  ll
1177  cp run.sh run.sh.orig
1178  ll
1179  vi run.sh
1180  ll
1181  which platanus_allee
1182  which minimap2
1183  chmod +x run.sh
1184  ./run.sh 
1185  vi run.sh
1186  ll
1187  rm -f out.assembleLog 
1188  ./run.sh 
1189  ll
1190  rm -f core.27196 out*
1191  rm -rf core.27196 out*
1192  ll
1193  rm -f 8Sdk4e AyNMD0 NhRXQC 
1194  ll
1195  cd ../../Platanus_allee_v2.2.2
1196  ll
1197  vi Makefile 
1198  make
1199  make clean
1200  ll
1201  make
1202  cd minimap2-2.0-r191/
1203  make lean
1204  make clean
1205  make
1206  cat /proc/cpuinfo | grep sse4
1207  ll
1208  cd ..
1209  ll
1210  cd ../Platanus_allee_test_data_v2.2.2/
1211  ll
1212  cd test_run
1213  l
1214  ll
1215  ./run.sh 
1216  ll
1217  rm -rf out* core.6445 T234ga dA9uW0 
1218  ll
1219  vi run.sh
1220  ./run.sh 
1221  platanus_allee phase -t 1 -tmp . -o out -mapper minimap2 -c out_contig.fa -IP1 ../reads/Illumina_PE500/R1.fq ../reads/Illumina_PE500/R2.fq -OP2 ../reads/Illumina_MP3000/R1.fq ../reads/Illumina_MP3000/R2.fq -p ../reads/PacBio/subreads.fq -x ../reads/10X/barcoded.fq
1222  platanus_allee consensus -t 1 -tmp . -o out -mapper minimap2 -c out_consensusInput.fa -IP1 ../reads/Illumina_PE500/R1.fq ../reads/Illumina_PE500/R2.fq -OP2 ../reads/Illumina_MP3000/R1.fq ../reads/Illumina_MP3000/R2.fq -p ../reads/PacBio/subreads.fq -x ../reads/10X/barcoded.fq
1223  ml
1224  echo $PATH
1225  ls -ltr
1226  cd ../../..
1227  ll
1228  history >> Platanus-allee-2.2.2_install-README.md
