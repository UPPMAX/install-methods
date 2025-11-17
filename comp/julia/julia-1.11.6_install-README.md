julia/1.11.6
========================

<https://julialang.org>

Used under license:
MIT


Structure creating script (makeroom_julia_1.11.6.sh) moved to /sw/comp/julia/makeroom_1.11.6.sh

LOG
---

    VERSION=1.11.6

    makeroom.sh "-t" "julia" "-v" $VERSION "-c" "comp" "-w" "https://julialang.org" "-d" "Julia is a high-level\, high-performance dynamic language for technical computing." "-l" "MIT" "-f"

    ./makeroom_julia_1.11.6.sh
    source /sw/comp/julia/SOURCEME_julia_1.11.6 && cd $SRCDIR
    wget https://julialang-s3.julialang.org/bin/linux/x64/1.11/julia-1.11.6-linux-x86_64.tar.gz
    tar xzf julia-1.11.6-linux-x86_64.tar.gz -C $PREFIX --strip-components=1
   
# to install central packages
#inspired by: https://discourse.julialang.org/t/how-does-one-set-up-a-centralized-julia-installation/13922/22
    mkdir $PREFIX/lib/glob_pkg

# Fix mf file to correct versions
    prepend-path    JULIA_LOAD_PATH     $modroot/lib/glob_pkg/environments/v1.11
    setenv    JULIA_PROJECT       $userhome/.julia/environments/v1.11


#    start julia session from module
    empty!(DEPOT_PATH)
    using Pkg
    push!(DEPOT_PATH,"/sw/comp/julia/1.11.6/rackham/lib/glob_pkg") 
    Pkg.activate(DEPOT_PATH[1]*"/environments/v1.11");
    #to get into Pkg mode
    ]
    add <package name>
#    control installed packages
    status
    <backspace>  # to get into Julia mode
    #Precompilation
    using CSV, IJulia, Plots, PyPlot, PlotlyJS, Gadfly, DataFrames, DistributedArrays, BenchmarkTools, MPI
    Pkg.build("....") # may be required for some

    exit()

#LIST OF INSTALLED PACKAGES
  "BenchmarkTools"
  "CSV"
  "CUDA"
  "MPI"	  build		#requires ml gcc/13.3.0 openmpi/5.0.3
  "Distributed"
  "IJulia"   build
  "Plots"
  "PyPlot"	#requires build with PyCall # python/3.12.7
  "Gadfly"
  "DataFrames"
  "DistributedArrays"
  "PlotlyJS"	

