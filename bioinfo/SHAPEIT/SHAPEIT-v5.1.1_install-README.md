SHAPEIT/v5.1.1
========================

<http://>

Used under license:



Structure creating script (makeroom_SHAPEIT_v5.1.1.sh) moved to /sw/bioinfo/SHAPEIT/makeroom_v5.1.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "SHAPEIT" "-v" "v5.1.1" "-f"
    ./makeroom_SHAPEIT_v5.1.1.sh

    cd $SRCDIR

These are all directly downloaded, statically compiled binaries.
The tarballs under the release tag are all images, it appears.

    wget https://github.com/odelaneau/shapeit5/releases/download/v5.1.1/ligate_static
    wget https://github.com/odelaneau/shapeit5/releases/download/v5.1.1/phase_common_static
    wget https://github.com/odelaneau/shapeit5/releases/download/v5.1.1/phase_rare_static
    wget https://github.com/odelaneau/shapeit5/releases/download/v5.1.1/switch_static

Check each, then copy to the PREFIX and create symlinks without the '_static' suffix.

    file *
    chmod +x *

    ./ligate_static
    ./phase_common_static
    ./phase_rare_static
    ./switch_static

    cp -av * $PREFIX
    cd $PREFIX

    for F in *_static; do
        ln -s $F ${F%_static}
    done
