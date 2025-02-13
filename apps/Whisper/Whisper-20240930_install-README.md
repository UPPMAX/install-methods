Whisper/20240930
========================

<https://github.com/openai/whisper>

Used under license:

<https://github.com/openai/whisper?tab=MIT-1-ov-file#readme>

Structure creating script (makeroom_Whisper_20240930.sh) moved to /sw/apps/Whisper/makeroom_20240930.sh

LOG
---

    ```bash 

    /proj/staff/jayant/install-methods/makeroom.sh "-f" "-c" "apps" "-t" "Whisper" "-v" "20240930" "-w" "https://github.com/openai/whisper" "-d" "Whisper is a general-purpose speech recognition model. It is trained on a large dataset of diverse audio and is also a multitasking model that can perform multilingual speech recognition, speech translation, and language identification." "-L" "https://github.com/openai/whisper?tab=MIT-1-ov-file#readme" 

    ./makeroom_Whisper_20240930.sh 

    source /sw/apps/Whisper/SOURCEME_Whisper_20240930 && cd $TOOLDIR 

    source /sw/apps/Whisper/SOURCEME_Whisper_20240930 && cd $SRCDIR 

    wget https://github.com/openai/whisper/archive/refs/tags/v20240930.tar.gz

    tar xvf v20240930.tar.gz 

    module load python/3.11.4 

    PYTHONUSERBASE=$PREFIX pip3 install --user --upgrade setuptools pip wheel 


    # setting additional paths to avoid warnings during pip install 

    export PATH=$PREFIX/bin:$PATH 

    #for pip list -v 

    export PYTHONPATH=$PREFIX/lib/python3.11/site-packages 

    #installing stable version v20240930 

    PYTHONUSERBASE=$PREFIX pip3 install --user /sw/apps/Whisper/20240930/src/whisper-20240930 

    # edit sw/apps/Whisper/20240930/rackham/lib/whisper/_init_.py:
    # download_root = "/sw/apps/Whisper/0.5.1/rackham/models" 

    # lock it down 

    chmod -R -w $PREFIX 

    /sw/apps/Whisper/Whisper-20240930_post-install.sh 

``` 

Whisper/0.5.1
========================

<https://github.com/openai/whisper>

Used under license:



Structure creating script (makeroom_Whisper_0.5.1.sh) moved to /sw/apps/Whisper/makeroom_0.5.1.sh

LOG
---

    /home/matpiq/install-methods/makeroom.sh "-f" "-t" "Whisper" "-v" "0.5.1" "-c" "apps" "-w" "https://github.com/openai/whisper" "-d" "Whisper is a general-purpose speech recognition model. It is trained on a large dataset of diverse audio and is also a multitasking model that can perform multilingual speech recognition, speech translation, and language identification."
    ./makeroom_Whisper_0.5.1.sh
    cd $SRCDIR
    wget http://
    tar xvf 
    make

Addendum:

Add a symlink to /sw/apps/Whisper/zenity-whisper.sh in the bin dir, call it whisper-gui.sh
    ln -s /sw/apps/Whisper/zenity-whisper.sh /sw/apps/Whisper/0.5.1/bianca/bin/whisper-gui.sh
