julia/1.8.5
========================

<https://julialang.org>

Used under license:
MIT


Structure creating script (makeroom_julia_1.8.5.sh) moved to /sw/comp/julia/makeroom_1.8.5.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "julia" "-v" "1.8.5" "-c" "comp" "-w" "https://julialang.org" "-d" "Julia is a high-level\, high-performance dynamic language for technical computing." "-l" "MIT" "-f"
    ./makeroom_julia_1.8.5.sh
    wget https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-$VERSION-linux-x86_64.tar.gz
    tar xvf julia-$VERSION-linux-x86_64.tar.gz -C $TOOLDIR/$VERSION/rackham --strip-components=1
   

# to install central packages
#inspired by: https://discourse.julialang.org/t/how-does-one-set-up-a-centralized-julia-installation/13922/22
    mkdir $PREFIX/lib/glob_pkg
#    start julia session
    empty!(DEPOT_PATH)
    using Pkg
    push!(DEPOT_PATH,"/sw/comp/julia/1.8.5/rackham/lib/glob_pkg") 
    Pkg.activate(DEPOT_PATH[1]*"/environments/v1.8");
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
  "MPI"	  build		#requires ml gcc/11.3.0 openmpi/4.1.3
  "Distributed"
  "IJulia"   build
  "Plots"
#  "PyPlot"	#requires build with PyCall # python/3.10.8
  "Gadfly"
  "DataFrames"
  "DistributedArrays"
  "PlotlyJS"	

