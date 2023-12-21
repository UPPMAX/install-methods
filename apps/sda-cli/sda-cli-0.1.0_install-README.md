sda-cli/0.1.0
========================

<https://github.com/NBISweden/sda-cli>

Used under license:
AGPL-3.0
<https://github.com/NBISweden/sda-cli/blob/main/LICENSE>

Structure creating script (makeroom_sda-cli_0.1.0.sh) moved to /sw/apps/sda-cli/makeroom_0.1.0.sh

LOG
---

    ./makeroom.sh "-t" "sda-cli" "-v" "0.1.0" "-c" "apps" "-w" "https://github.com/NBISweden/sda-cli" "-l" "AGPL-3.0" "-L" "https://github.com/NBISweden/sda-cli/blob/main/LICENSE" "-d" "This is the Sensitive Data Archive (SDA) Command Line Interface (sda-cli)."
    ./makeroom_sda-cli_0.1.0.sh
    cd $SRCDIR
    wget http://
    tar xvf 
    make

FEGA Sweden - Install the sda-cli tool
------------
Instructions from the official documentation on 2023-12-04.
Documentation is found at [Uploading Data](https://fega.nbis.se/submission/uploading-data.html).

```sh
# Download the sda-cli executable that matches your system from the GitHub repository.
wget https://github.com/NBISweden/sda-cli/releases/download/v0.1.0/sda-cli_.0.1.0_Linux_x86_64.tar.gz

# Extract the binary by using the tar command:
tar -xvzf sda-cli_.0.1.0_Linux_x86_64.tar.gz

# Download the encryption key
wget https://raw.githubusercontent.com/NBISweden/EGA-SE-user-docs/main/crypt4gh_key.pub
```
