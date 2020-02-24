#!/usr/bin/env bash

INVOKE_UNFORMATTED="$(printf %q "$BASH_SOURCE")$((($#)) && printf ' %q' "$@")"
INVOKE=$(echo $INVOKE_UNFORMATTED'"' | sed 's/\ /\ \"/g' | sed 's/\"-/-/g' | sed 's/\ /\"\ /g' | sed 's/\"\ \"/\ \"/g' | sed 's/\\\ \"/\ /g' | sed 's/"//')
USAGE="$(basename "$0") [-h] -t TOOL -v VERSION [-s SECTION] [-w WEBSITE] [-c CATEGORY] [-m MODULENAME] [-l LICENSE] [-d description] [-u CLUSTERS] [-x MODE] [-f] --

    Makes some directories at places

    Makes stuff in /sw/$CATEGORY/\$TOOL/\$VERSION/ and
    a module file called /sw/$CATEGORY/\$TOOL/mf/\$VERSION

    Please modify the module file after running this

    Parameters:
        -t  name of the \$TOOL (REQUIRED)
        -v  version of the \$TOOL (REQUIRED)
        -s  section of the \$TOOL for use with category bioinfo and new software only.
        -w  website of the \$TOOL (no DEFAULT)
        -c  category of the \$TOOL (bioinfo, apps, comp, libs, build, data or parallel) DEFAULT is bioinfo.
        -m  name of the module file (DEFAULT is the same as the name of the tool)
        -l  license of the \$TOOL (no DEFAULT)
        -d  short description of the \$TOOL (no DEFAULT)
        -u  list of clusters to install to. Start with the main target. (DEFAULT is \"rackham irma bianca snowy\")
        -x  flag for mode, i.e. INSTALL, RESUME or REMOVE (DEFAULT is INSTALL, RESUME just sets the variables and exits.)
        -f  forcing the script to ignore warnings."

WEBSITE=http://
TOOL=''
VERSION=''
CATEGORY=bioinfo
MF_CATEGORY=bioinfo-tools
MODULENAME=''
LINKFLAG=-i
CLUSTERS=(rackham irma bianca snowy)
MODE=INSTALL
FORCED=0

[[ $# -eq 0 ]] && echo "$USAGE" >&2 && exit 1

while getopts "ht:v:s:w:c:m:l:d:u:x:f" option
do
    case $option in
        h) 
            echo "$USAGE" >&2
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
        m) MODULENAME="$OPTARG"
            ;;
        l) LICENSE="$OPTARG"
            ;;
        d) DESC="$OPTARG"
            ;;
        u) CLUSTERS=($OPTARG)
            ;;
        x) MODE="$OPTARG"
            ;;
        f) printf "\nForcing...\n\n" >&2
            FORCED=1
            ;;
        :) printf "missing argument for -%s\n" "$OPTARG" >&2
            echo "$USAGE" >&2
            exit 1
            ;;
        \?) printf "illegal option -%s\n" "$OPTARG" >&2
            echo "$USAGE" >&2
            exit 1
            ;;
    esac
done
shift $((OPTIND-1))

############### Module file name set #####################
if [ -z "$MODULENAME" ] ; then
    MODULENAME=$TOOL
fi

################### If resuming, skip constructing and just set the variables #####################
if [ $MODE != "RESUME" ] ; then
    ################### Checking previous versions #####################
    PREV_INSTALL=$(module -t --redirect spider | grep --ignore-case -e "^$TOOL/$" | rev | cut -c 2- | rev)
    PREV_VERSIONS=$(module -t --redirect spider | grep --ignore-case -e "^$TOOL/.*" | cut -d "/" -f 2)
    PREV_INSTALL_ALT=$(module -t --redirect spider | grep --ignore-case -e "^$MODULENAME/$" | rev | cut -c 2- | rev)
    PREV_VERSIONS_ALT=$(module -t --redirect spider | grep --ignore-case -e "^$MODULENAME/.*" | cut -d "/" -f 2)
    if [ ! -z "$PREV_INSTALL" ] && [ "$PREV_INSTALL" != "$TOOL" ]
    then
        printf "\n%s\n" "Possibly matching software already installed under name $PREV_INSTALL" >&2
        printf "\n%s\n" "These versions are installed (according to the module system):" >&2
        for i in ${PREV_VERSIONS[@]}
        do
            printf "%s\n" "$i" >&2
        done
        if [[ $FORCED == 0 ]]
        then
            printf "%s\n" "You can force install by using -f" >&2
            exit 1
        else
            printf "\nForcing override using TOOL = %s and VERSION = %s\n\n" "$TOOL" "$VERSION"  >&2
        fi
    fi
    ################# Same thing for the alternate module name #############################    
    if [ ! -z "$PREV_INSTALL_ALT" ] && [ "$PREV_INSTALL_ALT" != "$MODULENAME" ]
    then
        printf "\n%s\n" "Possibly matching software already installed under name $PREV_INSTALL_ALT" >&2
        printf "\n%s\n" "These versions are installed (according to the module system):" >&2
        for i in ${PREV_VERSIONS_ALT[@]}
        do
            printf "%s\n" "$i" >&2
        done
        if [[ $FORCED == 0 ]]
        then
            printf "%s\n" "You can force install by using -f" >&2
            exit 1
        else
            printf "\nForcing override using TOOL = %s, MODULENAME = %s and VERSION = %s\n\n" "$TOOL" "$MODULENAME" "$VERSION"  >&2
        fi
    fi
    ###################### Checking for exact match #################################################
    if [ ! -z "$PREV_INSTALL" ] && [ "$PREV_INSTALL" == "$TOOL" ]
    then
        printf "\n%s\n" "Exactly matching software already installed under name $PREV_INSTALL" >&2
        printf "\n%s\n" "These versions are installed (according to the module system):" >&2
        for i in ${PREV_VERSIONS[@]}
        do
            printf "%s\n" "$i" >&2
        done
        if [[ $FORCED == 0 ]]
        then
            printf "%s\n" "Make sure it really IS the same software and use -f" >&2
            exit 1
        else
            printf "\nForcing override using TOOL = %s and VERSION = %s\n\n" "$TOOL" "$VERSION"  >&2
        fi
    fi
    ###################### And again for the alternative module name #################################################
    if [ ! -z "$PREV_INSTALL_ALT" ] && [ "$PREV_INSTALL_ALT" == "$MODULENAME" ]
    then
        printf "\n%s\n" "Exactly matching software already installed under name $PREV_INSTALL_ALT" >&2
        printf "\n%s\n" "These versions are installed (according to the module system):" >&2
        for i in ${PREV_VERSIONS_ALT[@]}
        do
            printf "%s\n" "$i" >&2
        done
        if [[ $FORCED == 0 ]]
        then
            printf "%s\n" "Make sure it really IS the same software and use -f" >&2
            exit 1
        else
            printf "\nForcing override using TOOL = %s, MODULENAME = %s and VERSION = %s\n\n" "$TOOL" "$MODULENAME" "$VERSION"  >&2
        fi
    fi
    ##################### Make a cluster list in YAML format ####################
    YAMLLIST=$(echo " "${CLUSTERS[@]} | sed "s/ /\n    - /g")
    ######## Check input #################
    if [ -z "${TOOL}" ]
    then printf "%s\n\nEmply value for -t\n" "$USAGE" >&2; exit 1
    fi

    if [[ $TOOL == *['!'@#\$%^\&*()_+\ ]* ]] && [[ $FORCED == 0 ]]; then
        printf "Are you sure about the name '%s'?\n" "$TOOL" >&2
        printf "It might cause problems in the file tree.\n" >&2
        printf "If you are sure, use -f to force it.\n" >&2
        exit 1
    fi
    ################### End of RESUME skipping ###################
fi

if [ -z "${VERSION}" ]
then printf "%s\n\nEmply value for -v\n" "$USAGE" >&2; exit 1
fi
################## Check the cluster names ############################
redo=0
for clu in "${CLUSTERS[@]}"
do
    if ! [[ $clu =~ ^(rackham|irma|bianca|snowy)$ ]] && [[ $FORCED == 0 ]]; then
        printf "Are you sure about the cluster '%s'?\n" "$clu" >&2
        printf "It might cause problems in the file tree.\n" >&2
        printf "If you are sure you want to install there, use -f to force it.\n" >&2
        redo=1
    fi
done
if [[ $redo == 1 ]]; then
    exit 1
fi

INSTALLCLUSTER=${CLUSTERS[0]}

for i in ${CLUSTERS[@]}
do 
    if [ $i == $CLUSTER ] ; then
        INSTALLCLUSTER=$CLUSTER
        break
    fi
done

##################################

case $CATEGORY in
    bioinfo) MF_CATEGORY=bioinfo-tools
        LINKFLAG=-i
        ;;
    apps) MF_CATEGORY=applications
        LINKFLAG=-a
        ;;
    comp) MF_CATEGORY=compilers
        LINKFLAG=-c
        ;;
    libs) MF_CATEGORY=libraries
        LINKFLAG=-l
        ;;
    build) MF_CATEGORY=build-tools
        LINKFLAG=-b
        ;;
    data) MF_CATEGORY=data
        LINKFLAG=-d
        ;;
    prarallel) MF_CATEGORY=parallel
        LINKFLAG=-p
        ;;
    \?) printf "No such category, -%s\n" "$CATEGORY" >&2
        echo "$USAGE" >&2
        exit 1
        ;;
esac

############## Set COMMONDIR #######################

COMMONDIR=(/sw/mf/common/$MF_CATEGORY/$MODULENAME)

if [ $CATEGORY == "bioinfo" ] ; then
    COMMONDIR=(/sw/mf/common/$MF_CATEGORY/*/$MODULENAME)
    if [ -z "$SECTION" ] ; then
        if [[ ! -d $COMMONDIR ]] ; then
            dirlist=("$(ls /sw/mf/common/$MF_CATEGORY/)")
            printf "\n%s\n%s\n%s\n" "### $TOOL is a new software. You need to provide a SECTION with -s" "Choose from the following:" "$dirlist" >&2
            exit 1
        else
            SUBDIR=${COMMONDIR#/sw/mf/common/$MF_CATEGORY/}
            SUBDIR=${SUBDIR%/$MODULENAME}
            SECTION=$SUBDIR
        fi
    else
############ Check for weird section names here ################
        dirlist=("$(ls /sw/mf/common/$MF_CATEGORY/)")
        for i in ${dirlist[@]}
        do
            if [ $i == $SECTION ] ; then
                sectiontest=passed
                break
            else
                sectiontest=failed
            fi
        done
        if [ $sectiontest == "failed" ] ; then
            printf "\n%s\n%s\n" "ERROR: $SECTION is not a valid SECTION. Choose from the following:" "$dirlist" >&2
            exit 1
        fi
    fi
    
    COMMONDIR=/sw/mf/common/$MF_CATEGORY/$SECTION/$MODULENAME
fi

MODULE_DIRECTORY="/sw/$CATEGORY/${TOOL}/mf"
SRC_DIRECTORY="/sw/$CATEGORY/${TOOL}/${VERSION}/src"
CLUSTER_DIRECTORY="/sw/$CATEGORY/${TOOL}/${VERSION}/${INSTALLCLUSTER}"
MODULE_FILE="${MODULE_DIRECTORY}/${VERSION}"
VERSION_DIRECTORY="/sw/$CATEGORY/${TOOL}/${VERSION}"
TOOL_DIRECTORY="/sw/$CATEGORY/${TOOL}"
README_FILE=/sw/$CATEGORY/${TOOL}/${TOOL}-${VERSION}_install-README.md
SCRIPTFILE=makeroom_${TOOL}_${VERSION}.sh
REMOVEFILE=makeroom_REMOVE_${TOOL}_${VERSION}.sh
YAMLFILE=/sw/$CATEGORY/${TOOL}/$TOOL-$VERSION.yaml
POSTFILE=/sw/$CATEGORY/${TOOL}/${TOOL}-${VERSION}_post-install.sh
SOURCEMEFILE=/sw/$CATEGORY/${TOOL}/SOURCEME_${TOOL}_$VERSION
TMPFILE=/scratch/TMPFILE_${TOOL}_$VERSION

####################### NEWS ##############################################
if [ $CATEGORY == "bioinfo" ] ; then
    NEWSCAT="bio"
else
    NEWSCAT=$CATEGORY
fi
if [ -z "$DESC" ] ; then
    NEWSDESC="version"
else
    NEWSDESC="($DESC) version"
fi
NEWS1="[$NEWSCAT] $TOOL version $VERSION installed on all systems"
NEWS2="$TOOL $NEWSDESC $VERSION installed on all systems as module $TOOL/$VERSION."
NEWS3="$WEBSITE"
NEWS4=$(echo ${CLUSTERS[@]} | sed "s/ /, /g") 
NEWS5="$VERSION"
NEWS6="$LICENSE"

################### If resuming, now we exit #####################
if [ $MODE == "RESUME" ] ; then
    printf "export TOOL=%s VERSION=%s TOOLDIR=%s VERSIONDIR=%s PREFIX=%s COMMONDIR=%s \nexport NEWS=\"%s\n%s\n%s\n%s\n%s\n%s\"" "$TOOL" "$VERSION" "$TOOL_DIRECTORY" "$VERSION_DIRECTORY" "/sw/$CATEGORY/$TOOL/$VERSION/$INSTALLCLUSTER" "$COMMONDIR" "${NEWS1}" "${NEWS2}" "${NEWS3}" "${NEWS4}" "${NEWS5}" "${NEWS6}" > $TMPFILE
    echo $TMPFILE
    exit 0
fi
####################### REMOVE ############################################

if [ $MODE == "REMOVE" ] ; then
    cat > $REMOVEFILE <<RMVTMP
    PREUMASK=\$(umask)
    umask 0002
    rm -f $MODULE_FILE
    rm -f $YAMLFILE
    rm -f $POSTFILE
    rm -f $SOURCEMEFILE
    rm -rf $VERSION_DIRECTORY
    rm -f $README_FILE
    rm -f $TOOL_DIRECTORY/$SCRIPTFILE
    if [ -d "$MODULE_DIRECTORY" ]; then
        if [ -z "\$(ls -A $MODULE_DIRECTORY)" ]; then
            rm -rf $MODULE_DIRECTORY
        fi
    fi
    if [ -d "$TOOL_DIRECTORY" ]; then
        if [ -z "\$(ls -A $TOOL_DIRECTORY)" ]; then
            rm -rf $TOOL_DIRECTORY
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
    printf "%s\n" "These files will be removed:" 1>&2
    if [ -f $MODULE_FILE ]; then
        printf "%s\n" "      $MODULE_FILE" 1>&2
    fi
    if [ -f $YAMLFILE ]; then
        printf "%s\n" "      $YAMLFILE" 1>&2
    fi
    if [ -f $POSTFILE ]; then
        printf "%s\n" "      $POSTFILE" 1>&2
    fi
    if [ -f $SOURCEMEFILE ]; then
        printf "%s\n" "      $SOURCEMEFILE" 1>&2
    fi
    if [ -d $VERSION_DIRECTORY ]; then
        printf "%s\n" "      $VERSION_DIRECTORY" 1>&2
    fi
    if [ -f $README_FILE ]; then
        printf "%s\n" "      $README_FILE" 1>&2
    fi
    if [ -f $TOOL_DIRECTORY/$SCRIPTFILE ]; then
        printf "%s\n" "      $TOOL_DIRECTORY/$SCRIPTFILE" 1>&2
    fi
    if [ -d "$MODULE_DIRECTORY" ]; then
        if [ -z "$(ls -A $MODULE_DIRECTORY)" ]; then
            printf "%s\n" "      $MODULE_DIRECTORY" 1>&2
        fi
    fi
    if [ -d "$TOOL_DIRECTORY" ]; then
        if [ -z "$(ls -A $TOOL_DIRECTORY)" ]; then
            printf "%s\n" "      $TOOL_DIRECTORY" 1>&2
        fi
    fi
    if [ -d "$COMMONDIR" ]; then
        if [ -z "$(ls -A $COMMONDIR)" ]; then
            printf "%s\n" "      ${COMMONDIR}" 1>&2
        fi
    fi
##### DRYRUN END ######
    printf "export TOOL='' VERSION='' TOOLDIR='' VERSIONDIR='' PREFIX='' COMMONDIR='' NEWS=''" > $TMPFILE
    chmod +x $TMPFILE
    printf "%s\n" $TMPFILE
    chmod +x $REMOVEFILE
    exit 0;
fi

############################### INSTALL ########################################

cat > $SCRIPTFILE <<TMP
## Invoked with $INVOKE
PREUMASK=\$(umask)
umask 0002
if [ ! -d "$VERSION_DIRECTORY" ]; then
	mkdir -p "${VERSION_DIRECTORY}"
fi
if [ ! -d "$MODULE_DIRECTORY" ]; then
	mkdir -p "${MODULE_DIRECTORY}"
    printf "\n%s\n" "No previous module file found" 1>&2
else
######### Sort by version to a list and print that with what was chosen ############
    unset -v LATEST
    cd $MODULE_DIRECTORY
    PREV_MF=\$(ls * | sort -Vr)
    LATEST=\$(echo "\$PREV_MF" | head -1)
    printf "\n%s" "Found following module files:" 1>&2
    printf "\n%s" "\$PREV_MF" 1>&2
    printf "\n%s\n" ""\$LATEST" looks like the best file on which to base a new module file" 1>&2
#    for FILE in *; do
#        [[ \$FILE -nt \$LATEST ]] && LATEST=\$FILE
#    done
fi
######### Checking for readme files
unset -v LATEST_README
cd $TOOL_DIRECTORY
for FILE in *README.md; do
    [[ \$FILE -nt \$LATEST_README ]] && LATEST_README=\$FILE
done
######### Making all dirs and links
if [ ! -d "$COMMONDIR" ]; then
	mkdir -p "${COMMONDIR}"
fi
if [ ! -d "$SRC_DIRECTORY" ]; then
	mkdir -p "${SRC_DIRECTORY}"
fi
if [ ! -d "$CLUSTER_DIRECTORY" ]; then
	mkdir -p "${CLUSTER_DIRECTORY}"
fi
cd $VERSION_DIRECTORY
for C in ${CLUSTERS[@]}; do
    if [ \$C != $INSTALLCLUSTER ]; then
        ln -s $INSTALLCLUSTER \$C
    fi
done
cd -
fixup /sw/$CATEGORY/${TOOL}/${VERSION}
fixup $COMMONDIR

######################## Using the module file template ############################

if [ -z "\$LATEST" ] || [ "\$LATEST" = \$(basename $MODULE_FILE) ]; then
    printf "\n%s\n" "Making a new module file $MODULE_FILE" 1>&2
    cat >> "$MODULE_FILE" <<EOF
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
    puts stderr "\n$DESC"
    puts stderr "\nVersion \\\$version"
    puts stderr "\n$WEBSITE"
    puts stderr "\nUsage:"
}

module-whatis   "Loads $TOOL module environment, version \\\$version"

# Only one version at a time
conflict $MODULENAME

#Log loading to syslog
logToSyslog

#Needed modules

module load uppmax

#What happens on load and unload

if [module-info mode remove] {
#    puts stderr ""
}

if [module-info mode load] {
#    puts stderr ""
}

# Directories for the program:
#

prepend-path    PATH            \\\$modroot
prepend-path    PATH            \\\$modroot/bin
prepend-path    PERL5LIB        \\\$modroot/perl-packages/lib/perl5
prepend-path    LD_LIBRARY_PATH \\\$modroot/lib
prepend-path    PYTHONPATH      \\\$modroot/lib/python3.6/site-packages
prepend-path    PYTHONPATH      \\\$modroot/lib/python2.7/site-packages
prepend-path    MANPATH         \\\$modroot/share/man
setenv          ${TOOL}_ROOT    \\\$modroot

EOF
else
    cd $MODULE_DIRECTORY
    printf "\n%s\n" "Copying \$LATEST as the module file $MODULE_FILE" 1>&2
## Not linking, but copying now
    cp -av \$LATEST $MODULE_FILE
fi

###################### README creation/addition #########################
cd $TOOL_DIRECTORY
if [ "\$LATEST_README" = \$(basename $README_FILE) ]; then
    printf "\n%s\n" "WARNING! Already existing readme file $README_FILE for this exact version ($VERSION). Adding stuff at the bottom. Remove stuff you don't use from it." 1>&2
fi

cat >> "$README_FILE" <<EOF2
${TOOL}/${VERSION}
========================

<$WEBSITE>

Used under license:
$LICENSE

Structure creating script ($SCRIPTFILE) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/$CATEGORY/$TOOL/makeroom_$TOOL_$VERSION.sh

EOF2

if [ -z "\$LATEST_README" ]; then
    printf "\n%s\n" "Making a new readme file $README_FILE" 1>&2
    cat >> "$README_FILE" <<EOF3
LOG
---

    TOOL=$TOOL
    VERSION=$VERSION
    CLUSTER=${INSTALLCLUSTER:?CLUSTER must be set}
    TOOLDIR=/sw/$CATEGORY/\\\$TOOL
    VERSIONDIR=/sw/$CATEGORY/\\\$TOOL/\\\$VERSION
    PREFIX=/sw/$CATEGORY/\\\$TOOL/\\\$VERSION/\\\$CLUSTER
    ./$SCRIPTFILE
    cd /sw/$CATEGORY/\\\$TOOL/\\\$VERSION/src
    wget http://
    tar xvf 
    make

EOF3

else
    printf "\n%s\n" "Adding the old readme file \$LATEST_README to the new readme file $README_FILE" 1>&2
    cat "\$LATEST_README" >> "$README_FILE"
fi

##################### YAML #############################

cat > "$YAMLFILE" <<EOF4
- TOOL:$TOOL
- VERSION:$VERSION
- CLUSTER:$YAMLLIST
- LICENSE:$LICENSE
- WEBSITE:$WEBSITE
- LOCAL:$MODULE_FILE
- COMMON:/sw/mf/common/$MF_CATEGORY/$SECTION/$TOOL/$VERSION
EOF4

################ Create a post-installation file ##########################
cat > "$POSTFILE" <<EOF5
. uppmax_functions.sh
cp -av ${MODULE_FILE} /sw/mf/common/$MF_CATEGORY/$SECTION/$TOOL/$VERSION
all_mflink -f $LINKFLAG $TOOL $VERSION
fixup $TOOLDIR
echo "News:"
echo "$NEWS1" 1>&2
echo "$NEWS2" 1>&2
echo "$NEWS3" 1>&2
echo "$NEWS4" 1>&2
echo "$NEWS5" 1>&2
echo "$NEWS6" 1>&2
EOF5
chmod +x $POSTFILE

################ Ending messages ###########################

echo -e "\nMODULE: To get a funcioning module, first, please modify ${MODULE_FILE} if needed." 1>&2
echo -e "\tIf new, it contains some examples that will most likely need to be changed" 1>&2
echo -e "\n\tAfter you are finished withe the module file, run ${POSTFILE} to copy it and invoke all_mflink correctly." 1>&2
echo -e "\n\nAlso, please modify ${README_FILE}\n" 1>&2
echo -e "\n\nFor Singularity, make a bash file in a directory you include in the module file, like this:\n" 1>&2
echo -e "echo '#!/bin/bash' > /sw/$CATEGORY/$TOOL/$VERSION/$INSTALLCLUSTER/bin/$TOOL"
echo -e "echo 'singularity exec $TOOL_ROOT/$TOOL.sif $TOOL \""\\$"@\"' >> /sw/$CATEGORY/$TOOL/$VERSION/$INSTALLCLUSTER/bin/$TOOL"
echo -e "\n\nThis might help too:\n" 1>&2
echo "$NEWS1" 1>&2
echo "$NEWS2" 1>&2
echo "$NEWS3" 1>&2
echo "$NEWS4" 1>&2
echo "$NEWS5" 1>&2
echo "$NEWS6" 1>&2

umask \$PREUMASK

mv $PWD/$SCRIPTFILE /sw/$CATEGORY/${TOOL}/
printf "export TOOL=%s VERSION=%s TOOLDIR=%s VERSIONDIR=%s PREFIX=%s COMMONDIR=%s \nexport NEWS=\"%s\n%s\n%s\n%s\n%s\n%s\"" "$TOOL" "$VERSION" "$TOOL_DIRECTORY" "$VERSION_DIRECTORY" "/sw/$CATEGORY/$TOOL/$VERSION/\\\$CLUSTER" "$COMMONDIR" "${NEWS1}" "${NEWS2}" "${NEWS3}" "${NEWS4}" "${NEWS5}" "${NEWS6}" > $SOURCEMEFILE
TMP

################# End of installation makeroom script #########################

printf "export TOOL=%s VERSION=%s TOOLDIR=%s VERSIONDIR=%s PREFIX=%s COMMONDIR=%s \nexport NEWS=\"%s\n%s\n%s\n%s\n%s\n%s\"" "$TOOL" "$VERSION" "$TOOL_DIRECTORY" "$VERSION_DIRECTORY" "/sw/$CATEGORY/$TOOL/$VERSION/$INSTALLCLUSTER" "$COMMONDIR" "${NEWS1}" "${NEWS2}" "${NEWS3}" "${NEWS4}" "${NEWS5}" "${NEWS6}" > $TMPFILE
echo $TMPFILE
chmod +x $SCRIPTFILE
