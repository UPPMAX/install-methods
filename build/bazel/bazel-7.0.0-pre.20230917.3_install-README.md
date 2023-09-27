bazel/7.0.0-pre.20230917.3
========================

<https://bazel.build/>

Used under license:



Structure creating script (makeroom_bazel_7.0.0-pre.20230917.3.sh) moved to /sw/build/bazel/makeroom_7.0.0-pre.20230917.3.sh

LOG
---

This failed with a /usr/bin/ld.gold option error trying to build using the package. See if it works better using the installer.


    makeroom.sh -t bazel -v 7.0.0-pre.20230917.3 -c build -w https://bazel.build/ -d "Bazel build system"
    ./makeroom_bazel_7.0.0-pre.20230917.3.sh 
    source /sw/build/bazel/SOURCEME_bazel_7.0.0-pre.20230917.3
    cd $SRCDIR
    wget https://github.com/bazelbuild/bazel/releases/download/7.0.0-pre.20230917.3/bazel-7.0.0-pre.20230917.3-linux-x86_64
    wget https://github.com/bazelbuild/bazel/releases/download/7.0.0-pre.20230917.3/bazel-7.0.0-pre.20230917.3-linux-x86_64.sha256
    sha256sum -c bazel-7.0.0-pre.20230917.3-linux-x86_64.sha256 

    wget https://github.com/bazelbuild/bazel/releases/download/7.0.0-pre.20230917.3/bazel-7.0.0-pre.20230917.3-installer-linux-x86_64.sh
    sh bazel-7.0.0-pre.20230917.3-installer-linux-x86_64.sh --prefix=$PREFIX

