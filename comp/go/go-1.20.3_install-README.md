go/1.20.3
========================

<https://go.dev/>

Used under license:
Go licence
<https://go.dev/LICENSE?m=text>

Structure creating script (makeroom_go_1.20.3.sh) moved to /sw/comp/go/makeroom_1.20.3.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-t" "go" "-v" "1.20.3" "-w" "https://go.dev/" "-d" "An open-source programming language supported by Google" "-l" "Go licence" "-L" "https://go.dev/LICENSE?m=text" "-c" "comp"
    ./makeroom_go_1.20.3.sh
go/1.11.5
=========

LOG
---

    TOOL=/sw/comp/go
    VERSION=1.11.5
    mkdir -p $TOOL/$VERSION/src_
    cd $TOOL/$VERSION/src_
    test -e *.tar.gz || wget https://dl.google.com/go/go$VERSION.linux-amd64.tar.gz
    tar xf go$VERSION.linux-amd64.tar.gz
    mv go/* ../
    rmdir go
