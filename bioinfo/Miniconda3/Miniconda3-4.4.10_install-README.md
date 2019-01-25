Miniconda3/4.4.10
========================

<http://>

LOG
---

I did..

    TOOL=Miniconda3
    VERSION=4.4.10
    CLUSTER=milou
    /home/jonass/uppmax/bin/makeroom.sh
    ./makeroom_Miniconda3_4.4.10.sh
    cd /sw/apps/bioinfo/$TOOL/$VERSION/src
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
    Do you accept the license terms? [yes|no]
    >>> yes

    Miniconda3 will now be installed into this location:
    /home/jonass/miniconda3

      - Press ENTER to confirm the location
      -   - Press CTRL-C to abort the installation
      -     - Or specify a different location below
      -
      -     [/home/jonass/miniconda3] >>> /sw/apps/bioinfo/Miniconda3/4.4.10/milou
    Do you wish the installer to prepend the Miniconda3 install location
    to PATH in your /home/jonass/.bashrc ? [yes|no]
    [no] >>> no
    export PATH=/sw/apps/bioinfo/Miniconda3/4.4.10/milou/bin:$PATH
