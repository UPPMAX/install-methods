RStudio/1.1.233-buggy
===============

Attempting to build rstudio from scratch, for milou.

LOG
---

    cd /sw/apps/
    cd RStudio
    mkdir 1.1.233
    cd 1.1.233
    mkdir milou src
    cd milou 
    PFX=$PWD
    cd ../src
    wget https://github.com/rstudio/rstudio/archive/v1.1.233.tar.gz
    tar xzf v1.1.233.tar.gz 
    cd rstudio-1.1.233/

    module load gcc/4.7.4

    module list
    ./install-boost 
    ll
    cd ../../
    cd ..
    ll
    cd -
    ll
    cd dependencies/
    ll
    cd linux/
    ll
    vi ../common/install-boost 
    ll
    ./install-boost
    ll
    cat install-boost 
    cd ..
    ll
    cd common/
    ll
    rm -rf boost-build boost_1_63_0.tar.bz2 
    ll
    cd ../linux
    ll
    vi install-boost
    vi ../common/install-boost 
    screen -ls
    999  module list
    1000  module unload gcc
    1001  module load uppmax
    1002  module load gcc/4.7.4
    1003  ll
    1004  ./install-boost 
    1005  dirs
    1006  pushd .
    1007  cd ..
    1008  ll
    1009  cd rstudio-tools/
    1010  ll
    1011  cd boost/
    1012  ll
    1013  cd boost_1_63_0/
    1014  ll
    1015  cd ..
    1016  cd rstudio-1.1.233/
    1017  ll
    1018  cd dependencies/
    1019  ll
    1020  cd linux/
    1021  ll
    1022  vi ../common/install-boost 
    1023  ll
    1024  vi uppmax-directories
    1025  ll
    1026  mv uppmax-directories uppmax-directories.md
    1027  vi uppmax-directories.md 
    1028  ll
    1029  screen -ls
    1030  view install-qt-sdk 
    1031  ll
    1032  vi uppmax-directories.md 
    1033  view install-qt-sdk 
    1034  cat uppmax-directories.md 
    1035  view install-qt-sdk 
    1036  ll
    1037  ./install-qt-sdk 
    1038  ll
    1039  cd ../..
    1040  cd ..
    1041  cd rstudio-tools/
    1042  ll
    1043  cd /sw/apps/rstudio/1.1.233/src/rstudio-1.1.233/dependencies/linux
    1044  ls -la
    1045  vi install-qt-sdk 
    1046  ./install-qt-sdk 
    1047  pushd .
    1048  cd /sw/apps/rstudio/1.1.233/src/rstudio-tools
    1049  ll
    1050  cd Qt5.4.0/
    1051  ll
    1052  cd 5.4/
    1053  ll
    1054  cd gcc_64/
    1055  ll
    1056  cd bin/
    1057  ll
    1058  ldd qmake 
    1059  ./qmake
    1060  cd ..
    1061  ll
    1062  cd ../..
    1063  ll
    1064  cd rstudio-1.1.233/
    1065  ll
    1066  cd dependencies/
    1067  ll
    1068  cd linux/
    1069  ll
    1070  vi uppmax-directories.md 
    1071  ll /sw/apps/rstudio/1.1.233/src/rstudio-tools/boost
    1072  ll /sw/apps/rstudio/1.1.233/src/rstudio-tools/boost/boost_1_63_0
    1073  ll
    1074  cat install-dependencies-yum 
    1075  ll
    1076  module list
    1077  module load zlib/1.2.8
    1078  module avail bzip2
    1079  module load bzip2/1.0.6
    1080  module avail cmake
    1081  module load cmake/2.8.12.2
    1082  cd ..
    1083  ll
    1084  cd tools/
    1085  ll
    1086  cat prune-mathjax 
    1087  cd ..
    1088  ll
    1089  cd linux/
    1090  ll
    1091  cat install-dependencies-zypper 
    1092  whereis pango
    1093  cd ../..
    1094  ll
    1095  cd build/
    1096  ll
    1097  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX
    1098  cd ..
    1099  rm -rf build
    1100  mkdir build
    1101  cd build
    1102  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX
    1103  echo $PFX
    1104  cd ..
    1105  rm -rf build
    1106  cd ../../milou/
    1107  ll
    1108  PFX=$PWD
    1109  cd ../src/rstudio-1.1.233/
    1110  mkdir build
    1111  cd build
    1112  ll ..
    1113  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX
    1114  vi /sw/apps/build/cmake/2.8.12.2_milou/share/cmake-2.8/Modules/FindBoost.cmake
    1115  cd ..
    1116  rm -rf build
    1117  mkdir build
    1118  cd build
    1119  cat ../dependencies/linux/uppmax-directories.md 
    1120  export BOOST_ROOT=/sw/apps/rstudio/1.1.233/src/rstudio-tools/boost/boost_1_63_0
    1121  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_SYSTEM_PATHS=ON -DQt5Core_DIR=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/lib/cmake/Qt5Core/Qt5CoreConfig.cmake
    1122  pushd .
    1123  cd ../dependencies/
    1124  cd linux/
    1125  ll
    1126  cat uppmax-directories.md 
    1127  find /sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0 -name '*.cmake'
    1128  dirs
    1129  swapd
    1130  ll
    1131  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_SYSTEM_PATHS=ON -DQt5Core_DIR=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/lib/cmake/Qt5Core
    1132  module load R/3.3.2
    1133  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_SYSTEM_PATHS=ON -DQt5Core_DIR=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/lib/cmake/Qt5Core -DQt5Widgets_DIR=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/lib/cmake/Qt5Widgets
    1134  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_SYSTEM_PATHS=ON -DQt5Core_DIR=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/lib/cmake/Qt5Core -DQt5Widgets_DIR=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/lib/cmake/Qt5Widgets -DQt5Network_DIR=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/lib/cmake/Qt5Network
    1135  echo $CMAKE_PREFIX_PATH
    1136  export CMAKE_PREFIX_PATH=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/lib/cmake/Qt5WebKit
    1137  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_SYSTEM_PATHS=ON 
    1138  ls /sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/lib/cmake
    1139  export QTC=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/lib/cmake
    1140  unexport QTC
    1141  unset QTC
    1142  QTC=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/lib/cmake
    1143  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_SYSTEM_PATHS=ON -DQt5Core_DIR=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/lib/cmake/Qt5Core -DQt5Widgets_DIR=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/lib/cmake/Qt5Widgets -DQt5Network_DIR=$QTC/Qt5Network
    1144  view src/cpp/desktop/CMakeLists.txt
    1145  ll
    1146  view ../src/cpp/desktop/CMakeLists.txt
    1147  cat ../dependencies/linux/uppmax-directories.md 
    1148  export QT_SDK_DIR=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0
    1149  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_SYSTEM_PATHS=ON 
    1150  cd ..
    1151  rm -rf build
    1152  mkdir build
    1153  cd build
    1154  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_SYSTEM_PATHS=ON 
    1155  view ../src/cpp/desktop/CMakeLists.txt
    1156  echo $QT_BIN_DIR
    1157  echo $CMAKE_PREFIX_PATH
    1158  ll /sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/bin/
    1159  export QT_BIN_DIR=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/bin
    1160  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_SYSTEM_PATHS=ON 
    1161  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_SYSTEM_PATHS=ON -DQT_BIN_DIR=$QT_BIN_DIR
    1162  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_SYSTEM_PATHS=ON -DQT_BIN_DIR=$QT_BIN_DIR/qmake
    1163  cat /sw/apps/rstudio/1.1.233/src/rstudio-1.1.233/build/CMakeFiles/CMakeOutput.log
    1164  cat /sw/apps/rstudio/1.1.233/src/rstudio-1.1.233/build/CMakeFiles/CMakeError.log 
    1165  ll
    1166  view CMakeCache.txt 
    1167  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_SYSTEM_PATHS=ON 
    1168  unset QT_BIN_DIR
    1169  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_SYSTEM_PATHS=ON -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake
    1170  ll /sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/bin/qmake
    1171  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_SYSTEM_PATHS=ON -DQT_QMAKE_EXECUTABLE=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/bin/qmake
    1172  view ../src/cpp/session/CMakeLists.txt
    1173  ll ../dependencies/common/
    1174  view CMakeCache.txt 
    1175  cd ../dependencies/
    1176  ll
    1177  cd linux/
    1178  ll
    1179  cd ../linux/
    1180  cd ../common/
    1181  ll
    1182  cat install-cef 
    1183  ./install-cef 
    1184  ll
    1185  vi install-cef 
    1186  ll
    1187  bash -x install-cef
    1188  cat install-common 
    1189  view ../../src/cpp/session/CMakeLists.txt
    1190  ll
    1191  cat install-dictionaries 
    1192  bash -x install-dictionaries 
    1193  ll
    1194  cat install-common 
    1195  cat install-gwt 
    1196  bash -x install-gwt 
    1197  ll
    1198  cat install-common 
    1199  bash -x install-mathjax
    1200  bash -x install-pandoc
    1201  ll
    1202  cat install-packages.cmd 
    1203  cat install-common 
    1204  bash -x install-libclang 
    1205  ll
    1206  bash -x install-packages
    1207  cat install-common 
    1208  ll
    1209  cat update-mathjax.sh 
    1210  cat update-pandoc 
    1211  cd ../../build/
    1212  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_SYSTEM_PATHS=ON -DQT_QMAKE_EXECUTABLE=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/bin/qmake
    1213  ll
    1214  htop
    1215  ll
    1216  make -j 4
    1217  echo $BOOST_ROOT
    1218  view /sw/apps/rstudio/1.1.233/src/rstudio-1.1.233/src/cpp/core/include/core/BoostErrors.hpp
    1219  make -j 4
    1220  view /sw/apps/rstudio/1.1.233/src/rstudio-1.1.233/src/cpp/core/BoostErrors.cpp
    1221  make -j 4
    1222  view /sw/apps/rstudio/1.1.233/src/rstudio-1.1.233/src/cpp/core/include/core/BoostErrors.hpp
    1223  echo $BOOST_ROOT
    1224  ll $BOOST_ROOT/boost/system/error_code.hpp
    1225  ll $BOOST_ROOT/include/boost/system/error_code.hpp
    1226  set -o vi
    1227  ll $BOOST_ROOT/include/boost/system/error_code.hpp
    1228  view $BOOST_ROOT/include/boost/system/error_code.hpp
    1229  view $BOOST_ROOT/include/boost/system/error_code.hpp:q
    1230  ll
    1231  view /sw/apps/rstudio/1.1.233/src/rstudio-1.1.233/src/cpp/core/include/core/BoostErrors.hpp
    1232  ll
    1233  make -j 4
    1234  view /sw/apps/rstudio/1.1.233/src/rstudio-1.1.233/src/cpp/core/Assert.cpp
    1235  find ../src/cpp/core -type f -exec grep -Hn RSTUDIO_BOOST_NAMESPACE {} \;
    1236  find ../src/cpp/core -type f -exec grep -Hn 'namespace boost' {} \;
    1237  find ../src/cpp/core -type f -exec grep -Hn 'namespace rstudio_boost' {} \;
    1238  find ../src/ -type f -exec grep -Hn RSTUDIO_BOOST_NAMESPACE {} \;
    1239  vi ../src/cpp/CMakeLists.txt
    1240  make -j 4
    1241  ls /sw/apps/rstudio/1.1.233/src/rstudio-1.1.233/src/cpp/core
    1242  view Makefile 
    1243  view /sw/apps/rstudio/1.1.233/src/rstudio-1.1.233/build/CMakeFiles
    1244  ll CMakeFiles/
    1245  make -j 4 -v
    1246  make -j 4 --verbose
    1247  make -j 4 -n
    1248  ll
    1249  vi CMakeCache.txt 
    1250  ls ..
    1251  ls ../..
    1252  ls ../../rstudio-
    1253  ls ../../rstudio-tools/
    1254  ls ../../rstudio-tools/boost/
    1255  find ../../rstudio-tools/boost -name '*.cmake'
    1256  ll
    1257  cd CMakeFiles/
    1258  ll
    1259  find . -type f -exec grep -Hn 'RSTUDIO_BOOST_NAMESPACE' {} \;
    1260  cd ..
    1261  find . -type f -exec grep -Hn 'RSTUDIO_BOOST_NAMESPACE' {} \;
    1262  find . -type f -exec grep -Hn 'DRSTUDIO_BOOST_NAMESPACE' {} \;
    1263  find . -type f -exec grep -Hn '-DRSTUDIO_BOOST_NAMESPACE' {} \;
    1264  find . -type f -exec grep -Hn -- '-DRSTUDIO_BOOST_NAMESPACE' {} \;
    1265  vi ./src/cpp/core/CMakeFiles/rstudio-core.dir/flags.make
    1266  vi ../src/CMakeLists.txt 
    1267  vi ../src/cpp/CMakeLists.txt 
    1268  cd ..
    1269  rm -rf build
    1270  mkdir build
    1271  cd build
    1272  echo 'modifying ../src/cpp/CMakeLists.txt so it points to another cmake'
    1273  vi ../src/cpp/CMakeLists.txt 
    1274  cat ../dependencies/linux/uppmax-directories.md 
    1275  vi ../src/cpp/CMakeLists.txt 
    1276  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_SYSTEM_PATHS=ON -DQT_QMAKE_EXECUTABLE=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/bin/qmake
    1277  make -j 4
    1278  cd ..
    1279  rm -rf build
    1280  mkdir build
    1281  cd build
    1282  module avail ant
    1283  module load ant
    1284  module unload ant
    1285  module load ant/1.8.1
    1286  module list
    1287  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_SYSTEM_PATHS=ON -DQT_QMAKE_EXECUTABLE=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/bin/qmake
    1288  make -j 4
    1289  whereis tools.jar
    1290  module list
    1291  module unload ant
    1292  module spider java
    1293  module load java/sun_jdk1.6.0_18
    1294  which javac
    1295  which ant
    1296  module load java/sun_jdk1.8.0_92
    1297  which ant
    1298  module avail ant
    1299  module load ant/1.10.0
    1300  ll
    1301  rm -rf *
    1302  ls -la
    1303  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_SYSTEM_PATHS=ON -DQT_QMAKE_EXECUTABLE=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/bin/qmake
    1304  make
    1305  ll
    1306  rm -rf *
    1307  module list
    1308  module spider java
    1309  module load java/sun_jdk1.6.0_18
    1310  ll
    1311  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_SYSTEM_PATHS=ON -DQT_QMAKE_EXECUTABLE=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/bin/qmake
    1312  make -j4
    1313  rm -rf *
    1314  module list
    1315  module spider ant
    1316  module load ant/1.8.1
    1317  module list
    1318  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_SYSTEM_PATHS=ON -DQT_QMAKE_EXECUTABLE=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/bin/qmake
    1319  make -j4
    1320  rm -rf *
    1321  module list
    1322  module spider java
    1323  module load java/sun_jdk1.6.0_18
    1324  echo $JAVA_HOME
    1325  find /sw/comp/java/x86_64/sun_jdk1.6.0_18 -name tools.jar
    1326  ll
    1327  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_SYSTEM_PATHS=ON -DQT_QMAKE_EXECUTABLE=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/bin/qmake
    1328  module list
    1329  vi ../src/cpp/CMakeLists.txt 
    1330  make -j4
    1331  view /pica/sw/apps/rstudio/1.1.233/src/rstudio-1.1.233/src/gwt/build.xml
    1332  view /pica/sw/apps/rstudio/1.1.233/src/rstudio-1.1.233/src/gwt/bin/org/rstudio/studio/client/common/filetypes/DataFrameType.class
    1333  ll /pica/sw/apps/rstudio/1.1.233/src/rstudio-1.1.233/src/gwt/bin/org/rstudio/studio/client/common/filetypes/DataFrameType.class
    1334  view /pica/sw/apps/rstudio/1.1.233/src/rstudio-1.1.233/src/gwt/bin/org/rstudio/studio/client/common/filetypes/DataFrameType.class
    1335  ll /pica/sw/apps/rstudio/1.1.233/src/rstudio-1.1.233/src/gwt/bin/org/rstudio/studio/client/common/filetypes/DataFrameType.class
    1336  ll /sw/apps/rstudio/1.1.233/src/rstudio-1.1.233/src/gwt/bin/org/rstudio/studio/client/common/filetypes
    1337  pushd .
    1338  cd ..
    1339  ll
    1340  cd src
    1341  ll
    1342  cd gwt/
    1343  ll
    1344  cd bin/org/
    1345  ll
    1346  cd rstudio/
    1347  ll
    1348  cd studio/
    1349  ll
    1350  cd client/
    1351  ll
    1352  cd common/file
    1353  ll
    1354  cd common/
    1355  ll
    1356  cd ../../..
    1357  cd ../..
    1358  cd ..
    1359  ll
    1360  rm -rf gwt
    1361  ll
    1362  rm -rf gwt
    1363  cd .snapshot
    1364  ll
    1365  cd 2017-05-16_1802+0200.Hourly
    1366  ll
    1367  cp -av gwt ../../
    1368  cd ../..
    1369  cd gwt/
    1370  ll
    1371  cd ../../build/
    1372  ll
    1373  cd ..
    1374  ll
    1375  cd dependencies/
    1376  ll
    1377  cd common/
    1378  ll
    1379  bash -x install-gwt
    1380  cd ../..
    1381  module list
    1382  cd build
    1383  ll
    1384  make
    1385  whereis gstreamer
    1386  echo 'https://bugreports.qt.io/browse/QTBUG-48353'
    1387  echo 'https://support.rstudio.com/hc/en-us/community/posts/207573587-Building-latest-on-RHEL6'
    1388  echo 'https://codereview.qt-project.org/#/c/127899/'
    1389  whereis gst
    1390  ll /sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/lib/libQt5WebKit.so.5.4.0
    1391  ldd /sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/lib/libQt5WebKit.so.5.4.0
    1392  echo $PFX
    1393  cd ../../rstudio-tools/
    1394  ll
    1395  cd gstreamer-0.11.3_install/
    1396  GSPFX=$PWD
    1397  cd ../gstreamer-0.11.3
    1398  module list
    1399  echo $GSPFX
    1400  ./configure --help
    1401  ./configure --prefix=$GSPFX
    1402  whereis glib
    1403  ll /usr/lib64/glib
    1404  ll /usr/lib64/glib/include/glibconfig.h 
    1405  view /usr/lib64/glib/include/glibconfig.h 
    1406  ./configure --prefix=$GSPFX
    1407  cd ..
    1408  ll
    1409  wget https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-0.10.31.tar.gz
    1410  tar xzf gstreamer-0.10.31.tar.gz 
    1411  ll
    1412  mkdir gstreamer-0.10.31_install
    1413  cd gstreamer-0.10.31_install/
    1414  ll
    1415  GSPFX=$PWD
    1416  cd ../gstreamer-0.10.31
    1417  ll
    1418  ./configure --prefix=$GSPFX
    1419  cd ..
    1420  ll
    1421  rm -rf gstreamer-0.11.3*
    1422  cd gstreamer-0.10.31
    1423  make -j 8
    1424  make install
    1425  cd /sw/libs
    1426  ll
    1427  mkdir -p gstreamer/0.10.31/milou
    1428  cd gstreamer/
    1429  ll
    1430  cd 0.10.31/
    1431  ll
    1432  mkdir src
    1433  cd src/
    1434  dirs
    1435  ll
    1436  mv /sw/apps/rstudio/1.1.233/src/rstudio-tools/gstreamer-0.10.31.tar.gz .
    1437  dirs
    1438  pushd .
    1439  cd /sw/apps/rstudio/1.1.233/src/rstudio-tools/
    1440  ll
    1441  rm -rf gstreamer-0.10.31*
    1442  dirs
    1443  swapd
    1444  ll
    1445  tar xzf gstreamer-0.10.31.tar.gz 
    1446  ll
    1447  echo $GSPFX
    1448  cd ../milou/
    1449  ll
    1450  GSPFX=$PWD
    1451  echo $GSPFX
    1452  cd ../src/
    1453  ll
    1454  cd gstreamer-0.10.31/
    1455  ll
    1456  ./configure --prefix=$GSPFX
    1457  make install
    1458  make
    1459  make install
    1460  cd ../../..
    1461  ll
    1462  mkdir mf
    1463  cd mf
    1464  cp ../../zlib/mf/1.2.11 0.10.31
    1465  ll
    1466  vi 0.10.31 
    1467  cd ..
    1468  ll
    1469  cd 0.10.31/
    1470  ll
    1471  cd milou/
    1472  ll
    1473  vi ../../mf/0.10.31 
    1474  ll bin/
    1475  ll
    1476  ll include/
    1477  ll lib
    1478  vi ../../mf/0.10.31 
    1479  ll
    1480  ll lib
    1481  ll lib/gstreamer-0.10/
    1482  ll lib/pkgconfig/
    1483  ll libexec/
    1484  ll libexec/gstreamer-0.10/
    1485  ll libexec/gstreamer-0.10/gst-plugin-scanner 
    1486  file libexec/gstreamer-0.10/gst-plugin-scanner 
    1487  libexec/gstreamer-0.10/gst-plugin-scanner 
    1488  ldd libexec/gstreamer-0.10/gst-plugin-scanner 
    1489  ll
    1490  ll share/
    1491  ll share/aclocal/
    1492  pushd .
    1493  cd
    1494  cd github-sync/local/install-methods/
    1495  ll
    1496  cd libs/
    1497  ll
    1498  grep M€ */*.md
    1499  grep M4 */*.md
    1500  ll Armadillo/
    1501  dirs
    1502  swapd
    1503  ll
    1504  ll share/
    1505  ll share/aclocal/
    1506  vi ../../mf/0.10.31 
    1507  ll share/aclocal/
    1508  ll share/
    1509  ll share/locale/
    1510  ll share/man/
    1511  ll share/man/man1/
    1512  vi ../../mf/0.10.31 
    1513  cd /sw/mf/common/libraries/
    1514  ll
    1515  mkdir gstreamer
    1516  cd gstreamer/
    1517  cp /sw/libs/gstreamer/mf/0.10.31 .
    1518  ll
    1519  cd /sw/mf/milou/libraries/
    1520  ll
    1521  mflink --libs gstreamer 0.10.31
    1522  module list
    1523  dirs
    1524  popd
    1525  ll
    1526  vi CMakeCache.txt 
    1527  ll
    1528  pushd .
    1529  cd /sw/libs/gstreamer/0.10.31
    1530  ll
    1531  cd src
    1532  ll
    1533  wget /sw/libs/gstreamer/0.10.31/milou
    1534  wget https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-0.10.31.tar.gz
    1535  ll
    1536  tar xzf gst-plugins-base-0.10.31.tar.gz 
    1537  ll
    1538  cd gst-plugins-base-0.10.31/
    1539  ll
    1540  ./configure --help
    1541  module spider gstreamer
    1542  module load gstreamer/0.10.31
    1543  echo $GSPFX
    1544  module load gstreamer/0.10.31
    1545  rm -rf ~/.lmod.d
    1546  module load gstreamer/0.10.31
    1547  echo $GSPFX
    1548  ll
    1549  ./configure --prefix=$GSPFX
    1550  make -j 8
    1551  make install
    1552  dirs
    1553  swapd
    1554  cmake .. -DRSTUDIO_TARGET=Desktop -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PFX -DBoost_NO_SYSTEM_PATHS=ON -DQT_QMAKE_EXECUTABLE=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/bin/qmake
    1555  ll
    1556  make install
    1557  dirs
    1558  pushd .
    1559  cd ../../../milou/
    1560  ll
    1561  cd bin/
    1562  ll
    1563  ldd rstudio
    1564  popd
    1565  ll
    1566  echo $LD_RUN_PATH
    1567  find . -name rstudio
    1568  ldd ./src/cpp/desktop/rstudio
    1569  echo $LD_LIBRARY_PATH
    1570  module load patchelf
    1571  patchelf --help
    1572  patchelf --print-rpath ./src/cpp/desktop/rstudio
    1573  patchelf --print-rpath ../../../milou/bin/rstudio
    1574  which rstudio
    1575  ll ./src/cpp/desktop/rstudio
    1576  ll ../../../milou/bin/rstudio
    1577  ldd ../../../milou/bin/rstudio
    1578  echo $LD_LIBRARY_PATH 
    1579  echo LLD=$LD_LIBRARY_PATH
    1580* cho /sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/lib/
    1581  LLD=$LD_LIBRARY_PATH
    1582  export LD_LIBRARY_PATH=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/lib:$LD_LIBRARY_PATH
    1583  ldd ../../../milou/bin/rstudio
    1584  ../../../milou/bin/rstudio
    1585  which qmake
    1586  find /sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0 -name plugins
    1587  export QT_PLUGIN_PATH=/sw/apps/rstudio/1.1.233/src/rstudio-tools/Qt5.4.0/5.4/gcc_64/plugins
    1588  ../../../milou/bin/rstudio
    1589  whereis libGL
    1590  xeyes
    1591  kill %+
    1592  cd ../../..
    1593  cd ..
    1594  ll
    1595  history > rstudio-1.1.233-install-README.md
