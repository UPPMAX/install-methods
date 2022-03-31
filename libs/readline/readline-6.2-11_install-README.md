readline/6.2-11
===============

<https://tiswww.case.edu/php/chet/readline/rltop.html>

Used under license:
GPL v3


Structure creating script (makeroom_readline_6.2-11.sh) moved to /sw/libs/readline/makeroom_6.2-11.sh

LOG
---

There are no legacy libraries provided for readline on el8. So, our attempt to
provide these for R (as a start) is here.

Download and extract the CentOS7 packages that are currently installed on
rackham: readline-6.2-11.el.x86.64 and readline-devel-6.2-11.el.x86.64.

    makeroom.sh -t readline -v 6.2-11 -c libs -w "https://tiswww.case.edu/php/chet/readline/rltop.html" -l "GPL v3" -d "Provides a set of functions for use by applications that allow users to edit command lines as they are typed in. This module contains the contents of readline.x86_64 and readline-devel.x86_64 from centos7 for use by executables running on an el8 system"
    ./makeroom_readline_6.2-11.sh 
    source /sw/libs/readline/SOURCEME_readline_6.2-11 && cd $SRCDIR
    wget http://mirror.centos.org/centos/7/os/x86_64/Packages/readline-6.2-11.el7.x86_64.rpm
    wget http://mirror.centos.org/centos/7/os/x86_64/Packages/readline-devel-6.2-11.el7.x86_64.rpm
    cd $PREFIX
    rpm2cpio $SRCDIR/readline-6.2-11.el7.x86_64.rpm | cpio -idm
    rpm2cpio $SRCDIR/readline-devel-6.2-11.el7.x86_64.rpm | cpio -idm

Provide a full development mf.  Note that there are both `lib64/` and `usr/` trees, so use paths in mf accordingly.

