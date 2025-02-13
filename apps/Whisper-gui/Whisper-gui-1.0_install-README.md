Whisper-gui/1.0
========================

<https://github.com/UPPMAX/Whisper-sens>

Used under license:

<https://github.com/UPPMAX/Whisper-sens?tab=Apache-2.0-1-ov-file>

Structure creating script (makeroom_Whisper-gui_1.0.sh) moved to /sw/apps/Whisper-gui/makeroom_1.0.sh

LOG
---

    ```bash
    /proj/staff/jayant/install-methods/makeroom.sh "-f" "-c" "apps" "-t" "Whisper-gui" "-v" "1.0" "-d" "Graphical User Interface for Whispercpp and WhisperX on Uppmax systems" "-L" "https://github.com/UPPMAX/Whisper-sens?tab=Apache-2.0-1-ov-file" "-w" "https://github.com/UPPMAX/Whisper-sens"
    ./makeroom_Whisper-gui_1.0.sh

    ./makeroom_Whisper-gui_1.0.sh 
    source /sw/apps/Whisper-gui/SOURCEME_Whisper-gui_1.0 && cd $TOOLDIR
    source /sw/apps/Whisper-gui/SOURCEME_Whisper-gui_1.0 && cd $SRCDIR


    wget https://github.com/UPPMAX/Whisper-sens/archive/refs/tags/v1.0.tar.gz

    tar xvf v1.0.tar.gz

    PYTHONUSERBASE=$PREFIX pip3 install --user --upgrade setuptools pip wheel

    export PYTHONPATH=$PREFIX/lib/python3.12/site-packages

    # setting additional paths to avoid warnings during pip install
    export PATH=$PREFIX/bin:$PATH

    PYTHONUSERBASE=$PREFIX pip3 install --user -r /sw/apps/Whisper-gui/1.0/src/Whisper-sens-main/whisper_gui/requirements.txt

    /sw/apps/Whisper-gui/Whisper-gui-1.0_post-install.sh

    ```



Whisper-gui/0.3
========================

<http://>

Used under license:



Structure creating script (makeroom_Whisper-gui_0.3.sh) moved to /sw/apps/Whisper-gui/makeroom_0.3.sh

LOG
---

    ./install-methods/makeroom.sh "-c" "apps" "-f" "-t" "Whisper-gui" "-v" "0.3" "-d" "Graphical User Interface for Whisper and WhisperX on Uppmax systems"
    ./makeroom_Whisper-gui_0.3.sh
    chmod +x /sw/apps/Whisper-gui/0.3/rackham/whisper-gui.sh
    ./Whisper-gui-0.3_post-install.sh

Whisper-gui/0.2
========================

<http://>

Used under license:



Structure creating script (makeroom_Whisper-gui_0.2.sh) moved to /sw/apps/Whisper-gui/makeroom_0.2.sh

LOG
---

    ./install-methods/makeroom.sh "-c" "apps" "-f" "-t" "Whisper-gui" "-v" "0.2" "-d" "Graphical User Interface for Whisper and WhisperX on Uppmax systems"


