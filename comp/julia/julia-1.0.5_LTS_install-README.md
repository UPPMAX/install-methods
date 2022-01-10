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

# to install central packages
#inspired by: https://discourse.julialang.org/t/how-does-one-set-up-a-centralized-julia-installation/13922/22
#    mkdir $PREFIX/lib/glob_pkg
#    start julia session

    empty!(DEPOT_PATH)
    push!(DEPOT_PATH,"/sw/comp/julia/1.0.5_LTS/rackham/lib/glob_pkg") 
    Pkg.activate(DEPOT_PATH[1]*"/environments/v1.0");
    using Pkg
    ]           #to get into Pkg mode
    add <package name>
#    control installed packages
    status
    <backspace>  # to get into Julia mode
    #Precompilation
    using CSV, IJulia, Plots, PyPlot, PlotlyJS, Gadfly, DataFrames, DistributedArrays, BenchmarkTools
    Pkg.build("....") # may be required for some
    #This does not necessarily help...
    exit()

#LIST OF INSTALLED PACKAGES
  "BenchmarkTools"
  "CSV"
  "CUDA"
#  "MPI"   #did not get working for 1.0.5
  "Distributed"
  "IJulia"
  "Plots"
  "PyPlot"      #requires build with PyCall
  "Gadfly"
  "DataFrames"
  "DistributedArrays"
  "PlotlyJS"

