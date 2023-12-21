zig/0.9.1
==========

<https://ziglang.org>

Used under license:
MIT
<https://raw.githubusercontent.com/ziglang/zig/master/LICENSE>

Structure creating script (makeroom_zig_0.9.1.sh) moved to /sw/comp/zig/makeroom_0.9.1.sh

LOG
---

    makeroom.sh -c comp -t zig -v 0.9.1 -w https://ziglang.org -l MIT -L https://raw.githubusercontent.com/ziglang/zig/master/LICENSE -d "Zig is a general-purpose programming language and toolchain for maintaining robust, optimal and reusable software."
    ./makeroom_zig_0.9.1.sh 
    source /sw/comp/zig/SOURCEME_zig_0.9.1
    cd $SRCDIR
    wget https://ziglang.org/download/0.9.1/zig-linux-x86_64-0.9.1.tar.xz
    tar xf zig-linux-x86_64-0.9.1.tar.xz 
    rmdir $PREFIX
    mv zig-linux-x86_64-0.9.1 $PREFIX

    cd $TOOLDIR
    ./zig-0.9.1_post-install.sh 

