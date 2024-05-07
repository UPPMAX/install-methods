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
