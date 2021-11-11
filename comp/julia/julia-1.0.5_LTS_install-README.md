julia/1.0.5_LTS
========================

<https://julialang.org>

Used under license:
MIT


Structure creating script (makeroom_julia_1.0.5_LTS.sh) moved to /sw/comp/julia/makeroom_1.0.5_LTS.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "julia" -v "1.0.5_LTS" -c "comp" -w "https://julialang.org" -d "Julia is a high-level\, high-performance dynamic language for technical computing." -l "MIT" -f
    ./makeroom_julia_1.0.5_LTS.sh
    source /sw/comp/julia/SOURCEME_julia_1.0.5_LTS && cd $TOOLDIR/$VERSION/src
    wget https://julialang-s3.julialang.org/bin/linux/x64/1.0/julia-1.0.5-linux-x86_64.tar.gz
    tar xvf julia-1.0.5-linux-x86_64.tar.gz -C $PREFIX --strip-components=1


    
