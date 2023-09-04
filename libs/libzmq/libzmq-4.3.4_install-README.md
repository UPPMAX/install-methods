libzmq/4.3.4
========================

<https://github.com/zeromq/libzmq>

Used under license:
GPL v3


Structure creating script (makeroom_libzmq_4.3.4.sh) moved to /sw/libs/libzmq/makeroom_4.3.4.sh

LOG
---


    makeroom.sh -f -t "libzmq" -v "4.3.4" -c "libs" -w "https://github.com/zeromq/libzmq" -d "The ZeroMQ lightweight messaging kernel is a library which extends the standard socket interfaces with features traditionally provided by specialised messaging middleware products. ZeroMQ sockets provide an abstraction of asynchronous message queues, multiple messaging patterns, message filtering (subscriptions), seamless access to multiple transport protocols and more." -l "GPL v3"
    ./makeroom_libzmq_4.3.4.sh
    source /sw/libs/libzmq/SOURCEME_libzmq_4.3.4
    cd $SRCDIR
    wget https://github.com/zeromq/libzmq/releases/download/v4.3.4/zeromq-4.3.4.tar.gz
    tar xf zeromq-4.3.4.tar.gz

Have since lost track of the build procedure used but this seems to be an autotools build.
