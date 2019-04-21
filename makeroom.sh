#!/usr/bin/env bash

usage="$(basename "$0") [-h] -t TOOL -v VERSION [-s SECTION] [-w WEBSITE] [-c CATEGORY] [-x MODE] --

    Makes some directories at places

    Makes stuff in /sw/$CATEGORY/\$TOOL/\$VERSION/ and
    a module file called /sw/$CATEGORY/\$TOOL/mf/\$VERSION

    Please modify the module file after running this

    Parameters:
        -t  name of the \$TOOL (REQUIRED)
        -v  version of the \$TOOL (REQUIRED)
        -s  section of the \$TOOL for use with category bioinfo and new software only.
        -w  website of the \$TOOL (no DEFAULT)
        -c  category of the \$TOOL (bioinfo, apps, comp or libs) DEFAULT is bioinfo.
        -l  license of the \$TOOL (no DEFAULT)
        -x  flag for mode, i.e. INSTALL or REMOVE"

WEBSITE=http://
CATEGORY=bioinfo
MF_CATEGORY=bioinfo-tools
MODE=INSTALL
forced=0

[[ $# -eq 0 ]] && echo "$usage" >&2 && exit 1

while getopts "ht:v:s:w:c:l:x:f" option
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
        w) WEBSITE="$OPTARG"
            ;;
        c) CATEGORY="$OPTARG"
            ;;
        l) LICENSE="$OPTARG"
            ;;
        x) MODE="$OPTARG"
            ;;
        f) echo "Forcing..."
            forced=1
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

PREV_INSTALL=$(module -t --redirect spider | grep --ignore-case -e "^$TOOL/$" | rev | cut -c 2- | rev)
if [ ! -z $PREV_INSTALL ] && [ $PREV_INSTALL != $TOOL ]
then
    echo "Possibly matching software already installed under name $PREV_INSTALL"
    if [ forced == 0 ]
    then
        echo "You can force install by using -f"
        exit 1
    fi
fi

if [ ! -z $PREV_INSTALL ] && [ $PREV_INSTALL == $TOOL ]
then
    echo "Exactly matching software already installed under name $PREV_INSTALL"
    if [ forced == 0 ]
    then
        echo "Make sure it really IS the same software and use -f"
        exit 1
    fi
fi

if [ -z "${TOOL+x}" ]
then printf "%s\n\nEmply value for -s\n" "$usage" >&2; exit 1
fi
if [ $TOOL contains spaces or *] && [ $forced == 0 ]; then
    echo "Are you sure about the name $TOOL?"
    echo "It might cause problems in the file tree."
    echo "If you are sure, use -f to force it."
    exit 1
fi
if [ -z "${VERSION+x}" ]
then printf "%s\n\nEmply value for -v\n" "$usage" >&2; exit 1
fi

case $CATEGORY in
    bioinfo) MF_CATEGORY=bioinfo-tools
        ;;
    apps) MF_CATEGORY=applications
        ;;
    comp) MF_CATEGORY=compilers
        ;;
    libs) MF_CATEGORY=libraries
        ;;
    \?) printf "No such category, -%s\n" "$CATEGORY" >&2
        echo "$usage" >&2
        exit 1
        ;;
esac


COMMONDIR=(/sw/mf/common/$MF_CATEGORY/$TOOL)

if [ $CATEGORY == "bioinfo" ] ; then
    COMMONDIR=(/sw/mf/common/$MF_CATEGORY/*/$TOOL)
    if [ -z "$SECTION" ] ; then
        if [[ ! -d $COMMONDIR ]] ; then
            echo "### $TOOL is a new software. You need to provide a SECTION with -s"
            exit 1
        else
            SUBDIR=${COMMONDIR#/sw/mf/common/$MF_CATEGORY/}
            SUBDIR=${SUBDIR%/$TOOL}
            SECTION=$SUBDIR
        fi
    fi
    COMMONDIR=/sw/mf/common/$MF_CATEGORY/$SECTION/$TOOL
fi

module_directory="/sw/$CATEGORY/${TOOL}/mf"
src_directory="/sw/$CATEGORY/${TOOL}/${VERSION}/src"
cluster_directory="/sw/$CATEGORY/${TOOL}/${VERSION}/${CLUSTER}"
module_file="${module_directory}/${VERSION}"
version_directory="/sw/$CATEGORY/${TOOL}/${VERSION}"
tool_directory="/sw/$CATEGORY/${TOOL}"
readme_file=/sw/$CATEGORY/${TOOL}/${TOOL}-${VERSION}_install-README.md
SCRIPTFILE=makeroom_${TOOL}_${VERSION}.sh
REMOVEFILE=makeroom_REMOVE_${TOOL}_${VERSION}.sh
YAMLFILE=/sw/$CATEGORY/${TOOL}/$TOOL-$VERSION.yaml

####################### NEWS ##############################################
if [ $CATEGORY == "bioinfo" ] ; then
    NEWSCAT="bio"
else
    NEWSCAT=$CATEGORY
fi
NEWS="[$NEWSCAT] $TOOL version $VERSION installed on all systems
$TOOL version $VERSION installed on all systems as module $TOOL/$VERSION.
$WEBSITE
Rackham, Irma, Bianca, Snowy
$VERSION
$LICENSE"

####################### REMOVE ############################################

if [ $MODE == "REMOVE" ] ; then
    cat > $REMOVEFILE <<RMVTMP
    PREUMASK=\$(umask)
    umask 0002
    rm -f $module_file
    rm -rf $version_directory
    rm -f $readme_file
    rm -f $tool_directory/$SCRIPTFILE
    if [ -d "$module_directory" ]; then
        if [ -z "\$(ls -A $module_directory)" ]; then
            rm -rf $module_directory
        fi
    fi
    if [ -d "$tool_directory" ]; then
        if [ -z "\$(ls -A $tool_directory)" ]; then
            rm -rf $tool_directory
        fi
    fi
    if [ -d "$COMMONDIR" ]; then
        if [ -z "\$(ls -A $COMMONDIR)" ]; then
            rm -rf ${COMMONDIR}
        fi
    fi
    umask \$PREUMASK
    rm $REMOVEFILE
RMVTMP
###### DRYRUN ######
    echo "These files will be removed:" 1>&2
    echo "      $module_file" 1>&2
    echo "      $version_directory" 1>&2
    echo "      $readme_file" 1>&2
    echo "      $tool_directory/$SCRIPTFILE" 1>&2
    if [ -d "$module_directory" ]; then
        if [ -z "\$(ls -A $module_directory)" ]; then
            echo "      $module_directory" 1>&2
        fi
    fi
    if [ -d "$tool_directory" ]; then
        if [ -z "\$(ls -A $tool_directory)" ]; then
            echo "      $tool_directory" 1>&2
        fi
    fi
    if [ -d "$COMMONDIR" ]; then
        if [ -z "\$(ls -A $COMMONDIR)" ]; then
            echo "      ${COMMONDIR}" 1>&2
        fi
    fi
##### DRYRUN END ######
    echo "TOOL='' VERSION='' VERSIONDIR='' PREFIX='' COMMONDIR='' NEW=''"
    chmod +x $REMOVEFILE
    exit 0;
fi

############################### INSTALL ########################################

cat > $SCRIPTFILE <<TMP
PREUMASK=\$(umask)
umask 0002
if [ ! -d "$version_directory" ]; then
	mkdir -p "${version_directory}"
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
if [ ! -d "$COMMONDIR" ]; then
	mkdir -p "${COMMONDIR}"
fi
if [ ! -d "$src_directory" ]; then
	mkdir -p "${src_directory}"
fi
if [ ! -d "$cluster_directory" ]; then
	mkdir -p "${cluster_directory}"
fi
cd $version_directory
for C in irma bianca snowy; do 
    ln -s rackham \$C 
done
cd -
fixup /sw/$CATEGORY/${TOOL}/${VERSION}

if [ -z "\$latest" ]; then
    cat > "$module_file" <<EOF
#%Module1.0#####################################################################
##
## $TOOL modulefile
##

source /sw/mf/common/includes/functions.tcl
getCluster

set components [ file split [ module-info name ] ]
set version [ lindex \\\$components 1 ]

set     modroot         /sw/$CATEGORY/$TOOL/\\\$version/\\\$Cluster

proc ModulesHelp { } {
global version modroot
    
    puts stderr "$TOOL - use $TOOL \$version"
    puts stderr "\nDescription"
    puts stderr "\nVersion \\\$version"
    puts stderr "\n$WEBSITE"
    puts stderr "\nUsage:"
}

module-whatis   "Loads $TOOL module environment, version \\\$version"

# Only one version at a time
conflict $TOOL

#Log loading to syslog
logToSyslog

#Needed modules

module load uppmax

# Directories for the program:
#

prepend-path    PATH            \\\$modroot
prepend-path    PATH            \\\$modroot/bin
prepend-path    PERL5LIB        \\\$modroot/perl-packages/lib/perl5
prepend-path    LD_LIBRARY_PATH \\\$modroot/lib
prepend-path    PYTHONPATH      \\\$modroot/lib/python3.6/site-packages
prepend-path    PYTHONPATH      \\\$modroot/lib/python2.7/site-packages

set-alias       $TOOL "singularity exec \\\$modroot/$TOOL.img $TOOL"

prepend-path    MANPATH         \\\$modroot/share/man
setenv          ${TOOL}_ROOT    \\\$modroot

EOF
else
    cd $module_directory
## Not linking, but copying now
cp -av \$latest $module_file
fi

cat > "$readme_file" <<EOF2
${TOOL}/${VERSION}
========================

<$WEBSITE>

Used under license:
$LICENSE

LOG
---

    TOOL=$TOOL
    VERSION=$VERSION
    CLUSTER=${CLUSTER:?CLUSTER must be set}
    VERSIONDIR=/sw/$CATEGORY/\\\$TOOL/\\\$VERSION
    PREFIX=/sw/$CATEGORY/\\\$TOOL/\\\$VERSION/\\\$CLUSTER

    ${0}

NOTE: I use my own script which is located at /sw/$CATEGORY/$TOOL/makeroom_$TOOL_$VERSION.sh
    ./$SCRIPTFILE
    cd /sw/$CATEGORY/\\\$TOOL/\\\$VERSION/src
    wget http://
    tar xvf 
    make

EOF2

cat > "$YAMLFILE" <<EOF3
- TOOL:$TOOL
- VERSION:$VERSION
- CLUSTER:
    - rackham
    - bianca
    - irma
    - snowy
- LICENSE:$LICENSE
- WEBSITE:$WEBSITE
- MODULEFILE:
    - LOCAL:$module_file
    - COMMON:/sw/mf/common/$MF_CATEGORY/$SECTION/$TOOL/$VERSION
EOF3

echo -e "\nPlease modify ${module_file} if needed."
echo "If new, it contains some examples that will most likely need to be changed"
echo "Then copy it to /sw/mf/common/$MF_CATEGORY/$SECTION/$TOOL/$VERSION"
echo -e "\nAlso, please modify ${readme_file}\n"
echo -e "\nThis might help too:\n"
echo "$NEWS"

umask \$PREUMASK

mv $PWD/$SCRIPTFILE /sw/$CATEGORY/${TOOL}/
TMP

echo "TOOL=$TOOL VERSION=$VERSION VERSIONDIR=$version_directory PREFIX=/sw/$CATEGORY/$TOOL/$VERSION/$CLUSTER COMMONDIR=$COMMONDIR"
chmod +x $SCRIPTFILE
