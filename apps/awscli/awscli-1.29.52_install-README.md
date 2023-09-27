awscli/1.29.52
========================

<https://aws.amazon.com/cli>

Used under license:
Apache 2.0
<http://aws.amazon.com/apache2.0/>

Structure creating script (makeroom_awscli_1.29.52.sh) moved to /sw/apps/awscli/makeroom_1.29.52.sh

LOG
---

    makeroom.sh "-f" "-t" "awscli" "-v" "1.29.52" "-c" "apps" "-w" "https://aws.amazon.com/cli" "-d" "Amazon Web Services Command-Line Interface" "-l" "Apache 2.0" -L "http://aws.amazon.com/apache2.0/"

    ./makeroom_awscli_1.29.52.sh

    source /sw/apps/awscli/SOURCEME_awscli_1.29.52
    cd $PREFIX
    virtualenv venv
    source venv/bin/activate
    pip install awscli==1.29.52
    cd venv/bin

Seems to be only the `aws` executable that is needed.

    mkdir $PREFIX/bin
    cd $PREFIX/bin
    ln -s $PREFIX/venv/bin/aws .
    head aws

No need to laod any modules, just add $modroot/bin to PATH.

    vi $TOOLDIR/mf/$VERSION

Wrap up.


