awscli/1.16.225
========================

Install amazon web services command line interface

<https://aws.amazon.com/cli>

Used under license:
Apache 2.0

Structure creating script (makeroom_awscli_1.16.225.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/apps/awscli/makeroom_1.16.225.sh


LOG
---


    makeroom.sh -f -t awscli -v 1.16.225 -c apps -w https://aws.amazon.com/cli -d "Amazon Web Services Command-Line Interface" -l "Apache 2.0"
    ./makeroom_awscli_1.16.225.sh
    cd /sw/apps/awscli
    source SOURCEME_awscli_1.16.225
    module load python/3.6.8
    PYTHONUSERBASE=$PREFIX pip install -I --user awscli


For the mf file, add `$PREFIX/bin` to `PATH` and `$PREFIX/lib/python3.7/site-packages` to `PYTHONPATH`.


