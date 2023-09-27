kingfisher/0.3.0
========================

<https://github.com/wwood/kingfisher-download>

Used under license:
GPL v3


Structure creating script (makeroom_kingfisher_0.3.0.sh) moved to /sw/bioinfo/kingfisher/makeroom_0.3.0.sh

LOG
---

    makeroom.sh -t kingfisher -v 0.3.0 -c bioinfo -s misc -w https://github.com/wwood/kingfisher-download -l "GPL v3" -d "Easier download/extract of FASTA/Q read data and metadata from the ENA, NCBI, AWS or GCP."
    ./makeroom_kingfisher_0.3.0.sh 
    source /sw/bioinfo/kingfisher/SOURCEME_kingfisher_0.3.0

    cd $PREFIX

    ml python/3.11.4
    virtualenv venv
    source venv/bin/activate

    ml bioinfo-tools pigz/2.8 libcurl/7.85.0 sratools/3.0.7 aria2/1.36 sracat/20210916-b896745 awscli/1.29.52 GoogleCloudSDK/447.0.0 ascp/4.2.0.183804

    which pip

    pip install bird-tool-utils extern pandas requests pyarrow tqdm pytest pytest-timeout 
    pip install kingfisher==0.3.0

    mkdir $PREFIX/bin
    cd $PREFIX/bin
    ln -s $PREFIX/venv/bin/kingfisher .

Add $modroot/bin to PATH and load the above modules.

    cd $TOOLDIR/mf
    vi 0.3.0

Wrap up.

    cd $TOOLDIR
    ./kingfisher-0.3.0_post-install.sh 
