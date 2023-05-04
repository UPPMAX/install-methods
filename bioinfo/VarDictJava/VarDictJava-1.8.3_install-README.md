VarDictJava/1.8.3
========================

<https://github.com/AstraZeneca-NGS/VarDictJava>

Used under license:
MIT



Structure creating script (makeroom_VarDictJava_1.8.3.sh) moved to /sw/bioinfo/VarDictJava/makeroom_1.8.3.sh

LOG
---

    makeroom.sh -f -t VarDictJava -v 1.8.3 -l MIT -w https://github.com/AstraZeneca-NGS/VarDictJava -d "a variant discovery program written in Java and Perl, a Java port of VarDict variant caller" -s misc
    ./makeroom_VarDictJava_1.8.3.sh 
    source /sw/bioinfo/VarDictJava/SOURCEME_VarDictJava_1.8.3 && cd $SRCDIR
    wget https://github.com/AstraZeneca-NGS/VarDictJava/releases/download/v1.8.3/VarDict-1.8.3.tar
    tar xf VarDict-1.8.3.tar 
    cd VarDict-1.8.3
    ls -lR
    cd bin

The repository says it uses usr/bin/env, just want to make sure.

    head -n 1 *
    cd ..

Sync over the distribution package tree to PREFIX.

    rsync -Pa * $PREFIX/

Change the -Xmx option used for java to specify 5g.

    cd $PREFIX/bin

We see that the script recognises JAVA_OPTS and VAR_DICT_OPTS as variables that can be used to specify additional memory or other java options, tell the user about that in the mf file.

    vi VarDict

See if there is anything in the R or perl scripts that requires us to load R_packages or perl_modules.

    grep library *.R
    grep use *.pl

Nope!
