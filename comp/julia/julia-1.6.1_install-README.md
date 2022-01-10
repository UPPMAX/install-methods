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
   

# to install central packages
#inspired by: https://discourse.julialang.org/t/how-does-one-set-up-a-centralized-julia-installation/13922/22
    mkdir $PREFIX/lib/glob_pkg
#    start julia session
    empty!(DEPOT_PATH)
    push!(DEPOT_PATH,"/sw/comp/julia/1.6.1/rackham/lib/glob_pkg") 
    Pkg.activate(DEPOT_PATH[1]*"/environments/v1.6");
    using Pkg
    ]		#to get into Pkg mode
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
  "MPI"			#requires ml gcc/9.3.0 openmpi/3.1.5
  "Distributed"
  "IJulia"
  "Plots"
  "PyPlot"	#requires build with PyCall 
  "Gadfly"
  "DataFrames"
  "DistributedArrays"
  "PlotlyJS"	


