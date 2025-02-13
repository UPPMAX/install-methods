Whispercpp/1.7.3
========================

<https://github.com/ggerganov/whisper.cpp>

Used under license:



Structure creating script (makeroom_Whispercpp_1.7.3.sh) moved to /sw/apps/Whispercpp/makeroom_1.7.3.sh

LOG
---

```sh
    /proj/staff/jayant/install-methods/makeroom.sh "-c" "apps" "-f" "-t" "Whispercpp" "-v" "1.7.3" "-d" "Whisper.cpp is a high performance infernce of OpenAI's Whisper ASR model"
    /proj/staff/jayant/makeroom_Whispercpp_1.7.3.sh
    mkdir /sw/apps/Whispercpp/1.7.3/rackham/bin
```
Create `Whispercpp` shell script with following conent:  

```sh
#!/bin/bash
apptainer exec $WHISPERCPP_ROOT/Whispercpp.sif Whispercpp "$@"
```  

make this file executable:  
```sh
chmod +x Whispercpp
```


