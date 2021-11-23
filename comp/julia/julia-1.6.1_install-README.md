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
    mkdir $PREFIX/lib/glob_pkg
#    start julia session
    
    empty!(DEPOT_PATH)
    push!(DEPOT_PATH,"/sw/comp/julia/1.6.1/rackham/lib/glob_pkg") 
    using Pkg
    ]		#to get into Pkg mode
    add <package name>
    <backspace>  # to get into Julia mode
    using <package name>    #Precompiles. Do this. Otherwise users may get problems with permission.
#    control installed packages
    keys(Pkg.project().dependencies)

    exit()

#LIST OF INSTALLED PACKAGES
  "CSV"
  "CUDA"
  "MPI"
  "Distributed"
  "IJulia"
  "Plots"
  "PyPlot"
  "Gadfly"
  "DataFrames"
  "DistributedArrays"
  "PlotlyJS"


