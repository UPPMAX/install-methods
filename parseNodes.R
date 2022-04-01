#
# parseNodes(nds=Sys.getenv("SLURM_NODELIST"))
#
# An R function to return a vector of node names, where the list of node names
# is found within the nds argument, by default taken from the specified
# environment variable. Individual node names are expected to be a single
# prefix character (in the examples below, this is 'm') followed by digits that
# together form a list of consecutive nodes: say m0 through m200, with all
# intervening names (m6, m14, m198) specifying nodes that exist.
#
# The list of node names is formatted one of two ways
#
# format 1:
#   nodes=                                # nodes=m80
#   nodes=m[26,74-75,77-78,81-84,88-89]   # nodes=m[100-101,103-104]
#   nodes=m[57,135-137]                   # nodes=m[135-136]
#
# format 2:
#   nodes=m2,m3,m4,m5
#
# Nonsensical results may be expected if formats are mixed or contents don't
# match either of the above formats

parseNodes = function(nds=Sys.getenv("SLURM_NODELIST")) {
    if (length(nds) != 1 || nchar(nds) == 0) # nds contents incorrect somehow
        return(character(0))
    if (! grepl('[', nds, fixed=TRUE))  # matched if single node or format 2
        return(strsplit(nds, ',')[[1]])
    prefix_char = substring(nds, 1, 1)
    nds = gsub("\\[|\\]", "", substring(nds, 2))  # number string, stripping off [ ]
    node_nums = unlist(lapply(strsplit(nds, ',')[[1]],   # break up number string at ,
                              function(.x) {
                                  .l = strsplit(.x, '-')[[1]]; # split each element at -
                                  switch(length(.l),
                                         "1" = .l,             # if no split, just the element
                                         "2" = seq(.l[1], .l[2]),  # if split, it's a sequence
                                         NULL)                 # minimal bit of error handling
                              }))
    return(paste0(prefix_char, node_nums))  # add the prefix character to each node number
}
