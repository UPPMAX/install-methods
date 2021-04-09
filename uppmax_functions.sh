# Various helper functions for UPPMAX

#  unset or set to something other than "yes" to not export the install functions
#  these include section mfshow mflink all_mflink fixup
_EXPORT_UPPMAX_INSTALL_FUNCTIONS=yes

# currently active clusters

_CURRENT_CLUSTERS="bianca irma rackham snowy"


# "module avail" loading subgroupings before running
function mavail()
{
    [[ $# != 0 ]] || { cat <<_usage_
USAGE:  mavail module  or  mavail module/version

Perform 'module avail module/version' after loading bioinfo-tools and build-tools subgroupings in a subshell
_usage_
    return; }
    local M=${1:?module or module/version required}
    ( module load bioinfo-tools build-tools ; module avail "$M" )
}

# "module help" loading subgroupings before running
function mhelp()
{
    [[ $# != 0 ]] || { cat <<_usage_
USAGE:  mhelp module  or  mhelp module/version

Perform 'module help module/version' after loading bioinfo-tools and build-tools subgroupings in a subshell
_usage_
    return; }
    local M=${1:?module or module/version required}
    ( module load bioinfo-tools build-tools ; module help "$M" )
}

# "module show" loading subgroupings before running
function mshow()
{
    [[ $# != 0 ]] || { cat <<_usage_
USAGE:  mshow module  or  mshow module/version

Perform 'module show module/version' after loading bioinfo-tools and build-tools subgroupings in a subshell
_usage_
    return; }
    local M=${1:?module or module/version required}
    ( module load bioinfo-tools build-tools ; module show "$M" )
}

# "module spider" shortcut
function mspid()
{
    [[ $# != 0 ]] || { cat <<_usage_
USAGE:  mspid word [ word ... ]

Perform 'module spider' on the word or words provided
_usage_
    return; }
    local args=("$@")
    module spider ${args[@]}
}

# Starting in the current directory, find symlinks owned by a specific user then
# remove and recreate them, which switches ownership to the current user

function ownlinks()
{
    local U=${1:-wesleys}
    local LINKS=("$(find . -type l -user $U)")
    local L
    for L in ${LINKS[@]} ; do
        local D=$(dirname "$L")
        local N=$(basename "$L")
        local T=$(readlink "$L")
        local CMD="( cd \"$D\" ; ls -l \"$N\" ; rm -f \"$N\" ; ln -s \"$T\" \"$N\" ; ls -l \"$N\"; )"
        # echo "$CMD"
        echo "$L"
        eval "$CMD"
    done
}


# Helpers for gathering info about SLURM jobs, no special privileges required

function jiu() { jobinfo -u ${1:-$USER} ; }
function scs() { scontrol show jobid=${1:-1} ; }
function scsv() { scontrol show --details --details jobid=${1:-1} ; }
function scu() { scontrol update jobid=${1:-1} ${2} ; }
function sj() { squeue -a -o"%.7i  %.8a %.9P %.8f  %50j  %.8u %.8T  %.10M  %.10l  %.10L  %.3D %.3C %.12R" -S j,-T,i -u ${1:-$USER} ; }
function userproj() { 
    local U=${1:-$USER}
    sacctmgr -n list assoc where user=$U -P format=account | cat <(id -Gn $U | tr ' ' '\n') - | sort -Vu | grep -vP "($U|no_project)"
}

# Remove a personal module cache, can be annoying when built on rackham but sitting on another system.
# No special privileges required
function purge-cache() { rm -rf $HOME/.lmod.d ; }

#
# Appexpert functions for managing mf files.  Use no arguments to get brief help.
#

# Show section of bioinfo-tools in which each module is found
function section()
{
    [[ $# == 0 ]] && { echo "USAGE:  section bioinfo-modulename [ bioinfo-modulename ... ]"; return; }
    local args=("$@")
    local M=
    for M in ${args[@]} ; do
        local COMMONDIR=(/sw/mf/common/bioinfo-tools/*/$M)
        if [[ ! -d $COMMONDIR ]] ; then
            echo "*** $COMMONDIR doesn't exist"
        else
            local SUBDIR=${COMMONDIR#/sw/mf/common/bioinfo-tools/}
            SUBDIR=${SUBDIR%/$M}
            echo -e "$M\t$SUBDIR\t$COMMONDIR"
        fi
    done
}

# Full listing of all mf files for a given module under /sw/mf
function mfshow()
{
    local SUBDIR
    local ALL
    local OPTIND
    while getopts ":ilacbpdA" opt "$@"; do
        case $opt in
            i)  SUBDIR= ;;
            l)  SUBDIR=libraries ;;
            a)  SUBDIR=applications ;;
            c)  SUBDIR=compilers ;;
            b)  SUBDIR=build-tools ;;
            p)  SUBDIR=parallel ;;
            d)  SUBDIR=data ;;
            A)  ALL=yes ;;
            *)  echo "unknown option"; return ;;
        esac
    done
    shift $((OPTIND-1))
    [[ $# == 1 ]] || { cat <<_usage_
USAGE:  mfshow [ -i (default) | -l | -a | -c | -b | -p | -d ] [ -A ] modulename

Full listing of all mf files for a given module under /sw/mf/...

Subtree options:   -i   bioinfo-tools (default)
                   -l   libraries
                   -a   applications
                   -c   comp
                   -b   build-tools
                   -p   parallel
                   -d   data
Other options:     -A   show trees for all clusters, not just {common,${_CURRENT_CLUSTERS// /,}}
_usage_
    return; }
    local M=$1
    [[ $M ]] || return
    if [[ $SUBDIR ]] ; then
        if [[ ! $ALL ]] ; then
            eval ls -la /sw/mf/{common,{${_CURRENT_CLUSTERS// /,}}}/$SUBDIR/$M/
        else
            ls -la /sw/mf/*/$SUBDIR/$M/
        fi
    else
        local COMMONDIR=(/sw/mf/common/bioinfo-tools/*/$M)
        if [[ ! -d $COMMONDIR ]] ; then
            echo "*** $COMMONDIR doesn't exist"; return
        else
            SUBDIR=${COMMONDIR#/sw/mf/common/bioinfo-tools/}
            SUBDIR=${SUBDIR%/$M}
        fi
        if [[ ! $ALL ]] ; then
            eval ls -la /sw/mf/{common,{${_CURRENT_CLUSTERS// /,}}}/bioinfo-tools/$SUBDIR/$M/
        else
            ls -la /sw/mf/*/bioinfo-tools/$SUBDIR/$M/
        fi
    fi
}


# Create a cluster-specific symlink to /sw/mf/common/... for an mf file
function mflink()
{
    local SUBDIR
    local FORCE
    local QUIET
    local OPTIND
    while getopts ":ilacbpdfq" opt "$@"; do
        case $opt in
            i)  SUBDIR= ;;
            l)  SUBDIR=libraries ;;
            a)  SUBDIR=applications ;;
            c)  SUBDIR=compilers ;;
            b)  SUBDIR=build-tools ;;
            p)  SUBDIR=parallel ;;
            d)  SUBDIR=data ;;
            f)  FORCE=yes ;;
            q)  QUIET=yes ;;
            *)  echo "unknown option"; return ;;
        esac
    done
    shift $((OPTIND-1))
    [[ $# == 2 ]] || { cat <<_usage_
USAGE:  mflink [ -i (default) | -l | -a | -c | -b | -p | -d ] [ -f ] modulename version

Create cluster-specific link to /sw/mf/common/... for an mf file, when positioned where
the modulename directories are (e.g., /sw/mf/rackham/bioinfo-tools/misc).
NOTE: all_mflink is better for general use, and there is no position requirement.

Subtree options:   -i   bioinfo-tools (default)
                   -l   libraries
                   -a   applications
                   -c   comp
                   -b   build-tools
                   -p   parallel
                   -d   data
Other options:     -f   force creating the link and intervening directories
                   -q   work quietly
_usage_
    return; }
    M=$1
    V=$2
    if [[ $SUBDIR ]] ; then
        if [[ $FORCE ]] ; then
            mkdir -p $M && cd $M && ln -sf ../../../common/$SUBDIR/$M/$V . && [[ $QUIET ]] || pwd ; cd ..
        else
            mkdir $M && cd $M && ln -s ../../../common/$SUBDIR/$M/$V . && [[ $QUIET ]] || pwd ; cd ..
        fi
    else
        if [[ $FORCE ]] ; then
            mkdir -p $M && cd $M && ln -sf ../../../../common/bioinfo-tools/*/$M/$V . && [[ $QUIET ]] || pwd ; cd ..
        else
            mkdir $M && cd $M && ln -s ../../../../common/bioinfo-tools/*/$M/$V . && test -e $V && [[ $QUIET ]] || pwd ; cd ..
        fi
    fi
    [[ $QUIET ]] || ls -la $M
    test -e $M/$V
}

# Create all cluster mf symlinks for a given module. The version file in
# /sw/mf/common/... must already exist.  Uses mflink function above
function all_mflink()
{
    local SUBDIR
    local FORCE
    local OPT
    local OPTIND
    local CLUSTS="$_CURRENT_CLUSTERS"
    while getopts ":ilacbpdfu:" opt "$@"; do
        case $opt in
            i)  SUBDIR= ; OPT="-$opt" ;;
            l)  SUBDIR=libraries ; OPT="-$opt" ;;
            a)  SUBDIR=applications ; OPT="-$opt" ;;
            c)  SUBDIR=compilers ; OPT="-$opt" ;;
            b)  SUBDIR=build-tools ; OPT="-$opt" ;;
            p)  SUBDIR=parallel ; OPT="-$opt" ;;
            d)  SUBDIR=data ; OPT="-$opt" ;;
            f)  FORCE=yes ;;
            u)  CLUSTS=${OPTARG} ;;
            *)  echo "unknown option" ; return ;;
        esac
    done
    shift $((OPTIND-1))
    [[ $# == 2 ]] || { cat <<_usage_
USAGE:  all_mflink [ -i (default) | -l | -a | -c | -b | -p | -d ] [ -u "cluster1 cluster2" ] [ -f ] modulename version

Create all cluster-specific links (/sw/mf/{$CLUSTS}/...) to /sw/mf/common/... for an mf file

Subtree options:   -i   bioinfo-tools (default)
                   -l   libraries
                   -a   applications
                   -c   comp
                   -b   build-tools
                   -p   parallel
                   -d   data
Other options:     -f   force; basically required
                   -u   string containing clusters to address; overrides \$_CURRENT_CLUSTERS
_usage_
    return; }
    local M=$1
    local V=$2
    local C=
    if [[ $SUBDIR ]] ; then
        if [[ $FORCE ]] ; then
            for C in $CLUSTS ; do
                ( cd /sw/mf/$C/$SUBDIR/ && mflink $OPT -f -q $M $V ) || { echo "*** problem with $C/$SUBDIR/$M/$V"; }
            done
        else
            for C in $CLUSTS ; do
                ( cd /sw/mf/$C/$SUBDIR/ && mflink $OPT -q $M $V ) || { echo "*** problem with $C/$SUBDIR/$M/$V"; }
            done
        fi
        [[ $FORCE ]] && echo -e "\n*** FORCED"
        echo -e "\n*** Done"
        echo -e "\n*** mfshow $OPT $M\n"
        mfshow $OPT $M
    else
        local COMMONDIR=(/sw/mf/common/bioinfo-tools/*/$M)
        [[ -d $COMMONDIR ]] || { echo "*** $COMMONDIR doesn't exist and it must, before running this"; return; }
        SUBDIR=${COMMONDIR#/sw/mf/common/bioinfo-tools/}
        SUBDIR=${SUBDIR%/$M}
        if [[ $FORCE ]] ; then
            for C in $CLUSTS ; do
                ( cd /sw/mf/$C/bioinfo-tools/$SUBDIR/ && mflink -f -q $M $V ) || { echo "*** problem with $C/bioinfo-tools/$SUBDIR/$M/$V"; }
            done
        else
            for C in $CLUSTS ; do
                ( cd /sw/mf/$C/bioinfo-tools/$SUBDIR/ && mflink -q $M $V ) || { echo "*** problem with $C/bioinfo-tools/$SUBDIR/$M/$V"; }
            done
        fi
        [[ $FORCE ]] && echo -e "\n*** FORCED"
        echo -e "\n*** Done"
        echo -e "\n*** mfshow $OPT $M\n"
        mfshow $OPT $M
    fi
}

# Fix up the permissions and group ownership of installation directories.  Sets
# group to 'sw' unless -G is given, setgid's directories unless -g is given, and
# makes all files group writable and other unwritable.
function fixup()
{
    # NOTE: Gnu xargs assumed, providing --no-run-if-empty

    local GROUP=sw
    local SETGID_DIRS=yes
    local HELP
    local OPTIND

    while getopts "gG:h" o; do
      case $o in
        g) unset SETGID_DIRS ;;
        G) GROUP=${OPTARG} ;;
        h) HELP=yes ;;
      esac
    done
    shift $((OPTIND-1))
    [[ $# == 0 || $HELP ]] && { echo "USAGE: $0 [ -g, to NOT setgid g+s on dirs ] [ -G group, default '$GROUP' ] [ -h, for help ] dir-or-file ..." ; return; }

    set -x

    args=("$@")
    for arg in ${args[@]} ; do
        chgrp -hR $GROUP "$arg"
        chmod -R u+rwX,g+rwX,o+rX-w "$arg"
        [[ $SETGID_DIRS ]] && find "$arg" -type d -print0 | xargs -0 --no-run-if-empty chmod g+s
    done

    set +x
}


if [[ "$_EXPORT_UPPMAX_INSTALL_FUNCTIONS" == "yes" ]] ; then
    export -f section mfshow mflink all_mflink fixup
fi


