PyInstaller/6.12.0
========================

<https://pyinstaller.org/en/stable/index.html>

Used under license:
GPL 2.0


Structure creating script (makeroom_PyInstaller_6.12.0.sh) moved to /sw/apps/PyInstaller/makeroom_6.12.0.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-f" "-t" "PyInstaller" "-v" "6.12.0" "-c" "apps" "-d" "bundles a Python application and all its dependencies into a single package" "-w" "https://pyinstaller.org/en/stable/index.html" "-l" "GPL 2.0"
    ./makeroom_PyInstaller_6.12.0.sh
    source /sw/apps/PyInstaller/SOURCEME_PyInstaller_6.12.0 && cd $TOOLDIR
    python -m venv $PREFIX/venv2
    . venv2/bin/activate
    pip install pyinstaller
    deactivate
    ln -sf venv2/bin/ bin

