snpEff/4.2
==========

Basic installation
------------------

1. Fetch and unpack zip file directly to $version folder and rename to $Cluster
2. Make symbolic links to other clusters (it's just java)
3. Create "data" folder within $Cluster
4. Set group for $version to "sw", recursively (eg, "chgrp -R sw 4.1")
5. Fix jardir variable in $Cluster/scripts/snpEff as follows (see RT #109289):

    # jardir="$(cd "$(dirname "$0")" && pwd -P)"
    jardir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."


Databases
---------

Pre-compiled databases generally need to be installed by admin (AE), not end-users
This done in the data folder and can/should be before the module is defined

1. Get a list of currently available databases

    java -jar ../snpEff.jar databases > list

Can grep this list but some newer databases seem to be unavailable, despite being included in the list.

2. Download standard and requested databases (at least dog and human)

    java -jar ../snpEff.jar download -v GRCh38.78

3. Fix group ownership for new database files (as above)
