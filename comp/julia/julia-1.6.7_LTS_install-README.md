julia/1.6.7_LTS
========================

<https://julialang.org>

Used under license:
MIT


Structure creating script (makeroom_julia_1.6.7_LTS.sh) moved to /sw/comp/julia/makeroom_1.6.7_LTS.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "julia" "-v" "1.6.7_LTS" "-c" "comp" "-w" "https://julialang.org" "-d" "Julia is a high-level\, high-performance dynamic language for technical computing." "-l" "MIT" "-f"
    ./makeroom_julia_1.6.7_LTS.sh
    source /sw/comp/julia/SOURCEME_julia_1.6.7_LTS && cd $TOOLDIR
    tar xvf julia-1.6.7-linux-x86_64.tar.gz -C $TOOLDIR/$VERSION/rackham --strip-components=1
   

# to install central packages
#inspired by: https://discourse.julialang.org/t/how-does-one-set-up-a-centralized-julia-installation/13922/22
    mkdir $PREFIX/lib/glob_pkg
#    start julia session
    empty!(DEPOT_PATH)
    using Pkg
    push!(DEPOT_PATH,"/sw/comp/julia/1.6.7_LTS/rackham/lib/glob_pkg") 
    Pkg.activate(DEPOT_PATH[1]*"/environments/v1.6");
    #to get into Pkg mode
    ]
    add <package name>
#    control installed packages
    status
    <backspace>  # to get into Julia mode
    #Precompilation
  
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


