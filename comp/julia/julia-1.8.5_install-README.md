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
julia/1.7.2
========================

<https://julialang.org>

Used under license:
MIT


Structure creating script (makeroom_julia_1.7.2.sh) moved to /sw/comp/julia/makeroom_1.7.2.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "julia" "-v" "1.7.2" "-c" "comp" "-w" "https://julialang.org" "-d" "Julia is a high-level\, high-performance dynamic language for technical computing." -l "MIT" -f
    ./makeroom_julia_1.7.2.sh
    wget https://julialang-s3.julialang.org/bin/linux/x64/1.7/julia-$VERSION-linux-x86_64.tar.gz

    tar xvf julia-$VERSION-linux-x86_64.tar.gz -C $TOOLDIR/$VERSION/rackham --strip-components=1
   

# to install central packages
#inspired by: https://discourse.julialang.org/t/how-does-one-set-up-a-centralized-julia-installation/13922/22
    mkdir $PREFIX/lib/glob_pkg
#    start julia session
    empty!(DEPOT_PATH)
    using Pkg
    push!(DEPOT_PATH,"/sw/comp/julia/1.7.2/rackham/lib/glob_pkg") 
    Pkg.activate(DEPOT_PATH[1]*"/environments/v1.7");
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
  "MPI"			#requires ml gcc/10.3.0 openmpi/3.1.6
  "Distributed"
  "IJulia"
  "Plots"
#  "PyPlot"	#requires build with PyCall 
  "Gadfly"
  "DataFrames"
  "DistributedArrays"
  "PlotlyJS"	


