github-cli/2.63.2
=================

<https://cli.github.com/>

Used under license:
MIT


Structure creating script (makeroom_github-cli_2.63.2.sh) moved to /sw/comp/github-cli/makeroom_2.63.2.sh

LOG
---

    makeroom.sh "-t" "github-cli" "-v" "2.63.2" "-w" "https://cli.github.com/" "-c" "comp" "-l" "MIT" "-d" "GitHub's official command line tool"
    ./makeroom_github-cli_2.63.2.sh
    ./makeroom_github-cli_2.63.2.sh 
    source /sw/comp/github-cli/SOURCEME_github-cli_2.63.2 && cd $SRCDIR
    wget https://github.com/cli/cli/releases/download/v2.63.2/gh_2.63.2_linux_amd64.tar.gz
    tar xvf gh_2.63.2_linux_amd64.tar.gz 
    rmdir $PREFIX
    mv gh_2.63.2_linux_amd64 $PREFIX
    cd ../../mf
    vi 2.63.2 

Add bin to PATH and share/man to MANPATH.

    ./github-cli-2.63.2_post-install.sh

    cd ..
    history >> github-cli-2.63.2_install-README.md
    vi github-cli-2.63.2_install-README.md
