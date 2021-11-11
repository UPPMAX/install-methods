julia/1.6.3
========================

<https://julialang.org>

Used under license:
MIT


Structure creating script (makeroom_julia_1.6.3.sh) moved to /sw/comp/julia/makeroom_1.6.3.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "julia" -v "1.6.3" -c "comp" -w "https://julialang.org" -d "Julia is a high-level\, high-performance dynamic language for technical computing." -l "MIT" -f"
    ./makeroom_julia_1.6.3.sh
julia/1.6.1
========================

<http://>

Used under license:



Structure creating script (makeroom_julia_1.6.1.sh) moved to /sw/comp/julia/makeroom_1.6.1.sh

LOG
---

    /home/pmitev/GIT/install-methods/makeroom.sh -t "julia" -v "1.6.1" -c "comp" -f
    ./makeroom_julia_1.6.1.sh

    source /sw/comp/julia/SOURCEME_julia_1.6.1 && cd $TOOLDIR/$VERSION/src
    wget https://julialang-s3.julialang.org/bin/linux/x64/1.6/julia-1.6.1-linux-x86_64.tar.gz

    tar xvf julia-1.6.1-linux-x86_64.tar.gz -C $TOOLDIR/$VERSION/rackham --strip-components=1
    
