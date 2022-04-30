julia/1.6.3
========================

<https://julialang.org>

Used under license:
MIT


Structure creating script (makeroom_julia_1.6.3.sh) moved to /sw/comp/julia/makeroom_1.6.3.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh -t "julia" -v "1.6.3" -c "comp" -w "https://julialang.org" -d "Julia is a high-level\, high-performance dynamic language for technical computing." -l "MIT" -f
    ./makeroom_julia_1.6.3.sh

    source /sw/comp/julia/SOURCEME_julia_1.6.3 && cd $TOOLDIR/$VERSION/src
    wget https://julialang-s3.julialang.org/bin/linux/x64/1.6/julia-1.6.3-linux-x86_64.tar.gz

    tar xvf julia-1.6.3-linux-x86_64.tar.gz -C $TOOLDIR/$VERSION/rackham --strip-components=1
# make module   
# to install central packages
#inspired by: https://discourse.julialang.org/t/how-does-one-set-up-a-centralized-julia-installation/13922/22
    mkdir $PREFIX/lib/glob_pkg
#    start julia session
    empty!(DEPOT_PATH)
    using Pkg
    push!(DEPOT_PATH,"/sw/comp/julia/1.6.3/rackham/lib/glob_pkg")
    Pkg.activate(DEPOT_PATH[1]*"/environments/v1.6");
    ]           #to get into Pkg mode
    add <package name>
#    control installed packages
    status
    <backspace>  # to get into Julia mode
    #Precompilation
    using CSV, IJulia, Plots, PyPlot, PlotlyJS, Gadfly, DataFrames, DistributedArrays, BenchmarkTools, MPI
    Pkg.build("....") # may be required for some
    #does not necessarily help though
    exit()

#LIST OF INSTALLED PACKAGES
  "BenchmarkTools"
  "CSV"
  "CUDA"
  "MPI"                 #requires ml gcc/9.3.0 openmpi/3.1.5
  "Distributed"
  "IJulia"
  "Plots"
  "PyPlot"      #requires build with PyCall
  "Gadfly"
  "DataFrames"
  "DistributedArrays"
  "PlotlyJS"
 
# add paths and setenv to mf file
prepend-path    PATH                $modroot/bin
prepend-path    JULIA_DEPOT_PATH    $modroot/lib/glob_pkg
set             userhome            $::env(HOME)
prepend-path    JULIA_DEPOT_PATH    $userhome/.julia
prepend-path    JULIA_LOAD_PATH     $modroot/lib/glob_pkg/environments/v1.6
prepend-path    JULIA_LOAD_PATH     @stdlib
prepend-path    JULIA_LOAD_PATH     @v#.#
prepend-path    JULIA_LOAD_PATH     @
setenv    JULIA_PROJECT       $userhome/.julia/environments/v1.6
#prepend-path    JULIA_DEPOT_PATH    $modroot/lib/glob_pack
setenv          JULIA_ROOT          $modroot

