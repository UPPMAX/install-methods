#!/usr/bin/env bash

usage="$(basename "$0") [-h] -t TOOL -v VERSION -s SECTION --

    Makes some directories at places

    Makes stuff in /sw/apps/bioinfo/\$TOOL/\$VERSION/ and
    a module file called /sw/apps/bioinfo/\$TOOL/mf/\$VERSION

    Please modify the module file after running this

    Parameters:
        -t  name of the \$TOOL
        -v  version of the \$TOOL
        -s  section of the \$TOOL"

while getopts "ht:v:s:" option
    do
        case $option in
            h) echo "$usage"
            exit 0
                ;;
            t) TOOL="$OPTARG"
                ;;
            v) VERSION="$OPTARG"
                ;;
            s) SECTION="$OPTARG"
                ;;
            :) printf "missing argument for -%s\n" "$OPTARG" >&2
            echo "$usage" >&2
            exit 1
                ;;
            \?) printf "illegal option -%s\n" "$OPTARG" >&2
            echo "$usage" >&2
            exit 1
                ;;
        esac
    done
shift $((OPTIND-1))

if [ -z "${TOOL+x}" ]
    then printf "%s\n\nEmply value for -s\n" "$usage" >&2; exit 1
fi
if [ -z "${VERSION+x}" ]
    then printf "%s\n\nEmply value for -v\n" "$usage" >&2; exit 1
fi

COMMONDIR=(/sw/mf/common/bioinfo-tools/*/$TOOL)

if [ -z "$SECTION" ] ; then
    if [[ ! -d $COMMONDIR ]] ; then
        echo "### $TOOL is a new software. You need to provide a SECTION with -s"
        exit 1
    else
        SUBDIR=${COMMONDIR#/sw/mf/common/bioinfo-tools/}
        SUBDIR=${SUBDIR%/$TOOL}
        SECTION=$SUBDIR
    fi
fi

module_directory="/sw/apps/bioinfo/${TOOL}/mf"
src_directory="/sw/apps/bioinfo/${TOOL}/${VERSION}/src"
cluster_directory="/sw/apps/bioinfo/${TOOL}/${VERSION}/${CLUSTER}"
module_file="${module_directory}/${VERSION}"
TOOL_dir="/sw/apps/bioinfo/${TOOL}/${VERSION}"
readme_file=/sw/apps/bioinfo/${TOOL}/${TOOL}-${VERSION}_install-README.md
SCRIPTFILE=makeroom_${TOOL}_${VERSION}.sh

cat > $SCRIPTFILE <<TMP
umask 0002
if [ ! -d "$TOOL_dir" ]; then
	mkdir -p "${TOOL_dir}"
fi
if [ ! -d "$module_directory" ]; then
	mkdir -p "${module_directory}"
else
    unset -v latest
    cd $module_directory
    for file in *; do
          [[ \$file -nt \$latest ]] && latest=\$file
    done
fi
if [ ! -d "$src_directory" ]; then
	mkdir -p "${src_directory}"
fi
if [ ! -d "$cluster_directory" ]; then
	mkdir -p "${cluster_directory}"
fi
fixup /sw/apps/bioinfo/${TOOL}/${VERSION}

if [ -z "\$latest" ]; then
    cat > "$module_file" <<EOF
#%Module1.0#####################################################################
##
## $TOOL modulefile
##

source /sw/mf/common/includes/functions.tcl
getCluster

set components [ file split [ module-info name ] ]
set version [ lindex $components 1 ]

set     modroot         /sw/apps/bioinfo/$TOOL/\\\$version/\\\$Cluster

proc ModulesHelp { } {
global version modroot
    
    puts stderr "$TOOL - use $TOOL \$version"
    puts stderr "\nDescription"
    puts stderr "\nVersion \\\$version"
    puts stderr "\nhttp://"
    puts stderr "\nUsage:"
}

module-whatis   "Loads $TOOL module environment, version \$version"

# Only one version at a time
conflict $TOOL

#Log loading to syslog
logToSyslog

#Needed modules

# Directories for the program:
#

module load

prepend-path    PATH            /sw/apps/bioinfo/${TOOL}/${VERSION}/\\\$Cluster
prepend-path    PATH            /sw/apps/bioinfo/${TOOL}/${VERSION}/\\\$Cluster/bin

prepend-path    LD_LIBRARY_PATH /sw/apps/bioinfo/${TOOL}/${VERSION}/\\\$Cluster/lib
prepend-path    PYTHONPATH      /sw/apps/bioinfo/${TOOL}/${VERSION}/\\\$Cluster/lib/python3.6/site-packages

prepend-path    MANPATH         /sw/apps/bioinfo/${TOOL}/${VERSION}/\\\$Cluster/share/man
setenv          ${TOOL}_ROOT    /sw/apps/bioinfo/$TOOL/\\\$version/\\\$Cluster

EOF
else
    cd $module_directory
    ln -s \$latest $module_file
fi

cat > "$readme_file" <<EOF2
${TOOL}/${VERSION}
========================

<http://>

LOG
---

I did..

    TOOL=$TOOL
    VERSION=$VERSION
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    ${0}
    ./$SCRIPTFILE
    cd /sw/apps/bioinfo/\\\$TOOL/\\\$VERSION/src
    wget http://
    tar xvf 
    make

EOF2
    
echo -e "\nPlease modify ${module_file} if needed."
echo "If new, it contains some examples that will most likely need to be changed"
echo "Then copy it to /sw/mf/common/bioinfo-tools/$SECTION/$TOOL/$VERSION"
echo -e "\nAlso, please modify ${readme_file}\n"

umask 0022

mv $PWD/$SCRIPTFILE /sw/apps/bioinfo/${TOOL}/
TMP

echo "TOOL=$TOOL VERSION=$VERSION"
chmod +x $SCRIPTFILE
