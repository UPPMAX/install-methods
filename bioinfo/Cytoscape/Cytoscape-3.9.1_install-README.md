Cytoscape/3.9.1
========================

<https://cytoscape.org/index.html>

Used under license:
LGPL 2.1


Structure creating script (makeroom_Cytoscape_3.9.1.sh) moved to /sw/bioinfo/Cytoscape/makeroom_3.9.1.sh

LOG
---

    /home/bjornc/UPPMAX-tools/install-methods/makeroom.sh "-t" "Cytoscape" "-s" "misc" "-v" "3.9.1" "-w" "https://cytoscape.org/index.html" "-d" "A software platform for visualizing complex networks and integrating these with any type of attribute data." "-l" "LGPL 2.1"
    ./makeroom_Cytoscape_3.9.1.sh
    source /sw/bioinfo/Cytoscape/SOURCEME_Cytoscape_3.9.1 && cd $TOOLDIR
    cd $SRCDIR
    wget https://github.com/cytoscape/cytoscape/releases/download/3.9.1/cytoscape-unix-3.9.1.tar.gz
    tar zxvf cytoscape-unix-3.9.1.tar.gz
    rmdir $PREFIX
    mv cytoscape-unix-3.9.1 $PREFIX
    cd $PREFIX
### test
    ml java/OracleJDK_11.0.9
    ./cytoscape.sh

### mf file
    depends-on java/OracleJDK_11.0.9
    prepend-path    PATH                $modroot
    if [module-info mode load] {
        puts stderr "\nUsage: Start with cytoscape.sh"
    }

### Comments

    The warnings in the terminal can be ignored:

        Unable to update instance pid: /sw/bioinfo/Cytoscape/3.9.1/rackham/framework/instances/instance.properties (Permission denied)

    And you may have to start the program twice to get rid of the pop-up warning about cyrest (I believe)



