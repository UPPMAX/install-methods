# Various helper functions for UPPMAX

# Helpers for gathering info about SLURM jobs, no special privileges required

function jiu() { jobinfo -u ${1:-$USER} ; }
function scs() { scontrol show jobid=${1:-1} ; }
function scsv() { scontrol show --details --details jobid=${1:-1} ; }
function scu() { scontrol update jobid=${1:-1} ${2} ; }
function sj() { squeue -a -o"%.7i  %.8a %.9P %.8f  %50j  %.8u %.8T  %.10M  %.10l  %.10L  %.3D %.3C %.12R" -S j,-T,    i -u ${1:-$USER} ; }

# Remove a personal module cache, can be annoying when built on rackham but sitting on milou.
# No special privileges required
function purge-cache() { rm -rf $HOME/.lmod.d ; }

# Get real locations and disk usage of project backup and nobackup volumes
function projvol() {
    p=${1:?Must provide project name}
    B=/proj/$p;          [[ -L $B ]] || { echo "correct $B not found"; return; }
    N=/proj/$p/nobackup; [[ -L $N ]] || { echo "correct $N not found"; return; }
    B=$(readlink -f $B)
    N=$(readlink -f $N)
    VB=$(dirname $B)
    VN=$(dirname $N)
    [[ $B && $N && $VB && $VN ]] || { echo "Could not resolve symlinks"; return; }
    echo -e "\n$p backup    ---- $B"
    df -kh $VB
    echo -e "\n$p nobackup  ---- $N"
    df -kh $VN
}

#
# Appexpert functions for managing mf files.  Use no arguments to get brief help.
#

_CURRENT_CLUSTERS="bianca irma milou rackham"

# Show section of bioinfo-tools in which each module is found
function section() {
    [[ $# == 0 ]] && { echo "usage: section bioinfo-modulename [ bioinfo-modulename ... ]"; return; }
    args=("$@")
    for M in ${args[@]} ; do
        COMMONDIR=(/sw/mf/common/bioinfo-tools/*/$M)
        if [[ ! -d $COMMONDIR ]] ; then
            echo "*** $COMMONDIR doesn't exist"
        else
            SUBDIR=${COMMONDIR#/sw/mf/common/bioinfo-tools/}
            SUBDIR=${SUBDIR%/$M}
            echo -e "$M\t$SUBDIR\t$COMMONDIR"
        fi
    done
}

# Full listing of all mf files for a given module under /sw/mf
function mfshow() {
    [[ $# == 0 ]] && { echo -e "usage: mfshow [ --{libs,apps,comp,build,par,bioinfo} ] [ -c ] modulename\n    default is --bioinfo\n    -c : show only current clusters and common {common,${_CURRENT_CLUSTERS// /,}}"; return; }
    SUBDIR=
    case "$1" in
        --libs)	    SUBDIR=libraries; OPT="$1"; shift ;;
        --apps)	    SUBDIR=applications; OPT="$1"; shift ;;
        --comp)	    SUBDIR=compilers; OPT="$1"; shift ;;
        --build)    SUBDIR=build-tools; OPT="$1"; shift ;;
        --par)      SUBDIR=parallel; OPT="$1"; shift ;;
        --bioinfo)  SUBDIR=; OPT="$1"; shift ;;
    esac
    [[ "$1" = "-c" ]] && { CURRENT=yes; shift; } || CURRENT=
    M=$1
    if [[ ! -z "$SUBDIR" ]] ; then
        if [[ ! -z "$CURRENT" ]] ; then
            eval ls -la /sw/mf/{common,{${_CURRENT_CLUSTERS// /,}}}/$SUBDIR/$M/
        else
            ls -la /sw/mf/*/$SUBDIR/$M/
        fi
    else
        COMMONDIR=(/sw/mf/common/bioinfo-tools/*/$M)
        if [[ ! -d $COMMONDIR ]] ; then
            echo "*** $COMMONDIR doesn't exist"; return
        else
            SUBDIR=${COMMONDIR#/sw/mf/common/bioinfo-tools/}
            SUBDIR=${SUBDIR%/$M}
        fi
        if [[ ! -z "$CURRENT" ]] ; then
            eval ls -la /sw/mf/{common,{${_CURRENT_CLUSTERS// /,}}}/bioinfo-tools/$SUBDIR/$M/
        else
            ls -la /sw/mf/*/bioinfo-tools/$SUBDIR/$M/
        fi
    fi
}


# Create a cluster-specific symlink to /sw/mf/common/... for an mf file
function mflink() {
    [[ $# == 0 ]] && { echo "usage: mflink [ |--{libs,apps,comp,build,bioinfo} ] [ -f ] modulename version"; return; }
    SUBDIR=
    case "$1" in
        --libs)	    SUBDIR=libraries; shift ;;
        --apps)	    SUBDIR=applications; shift ;;
        --comp)	    SUBDIR=compilers; shift ;;
        --build)    SUBDIR=build-tools; shift ;;
        --par)      SUBDIR=parallel; shift ;;
        --bioinfo)  SUBDIR=; shift ;;
    esac
    if [[ ! -z "$SUBDIR" ]] ; then
        if [[ "$1" = "-f" ]] ; then
            shift
            mkdir -p $1 && cd $1 && ln -sf ../../../common/$SUBDIR/$1/$2 . && pwd && cd ..
        else
            mkdir $1 && cd $1 && ln -s ../../../common/$SUBDIR/$1/$2 . && pwd && cd ..
        fi
    else
        if [[ "$1" = "-f" ]] ; then
            shift
            mkdir -p $1 && cd $1 && ln -sf ../../../../common/bioinfo-tools/*/$1/$2 . && pwd && cd ..
        else
            mkdir $1 && cd $1 && ln -s ../../../../common/bioinfo-tools/*/$1/$2 . && test -e $2 && pwd && cd ..
        fi
    fi
    ls -la $1
    test -e $1/$2
}

# Create all cluster mf symlinks for a given module. The version file in
# /sw/mf/common/... must already exist.  Uses mflink function above
function all_mflink() {
    [[ $# == 0 ]] && { echo -e "usage: all_mflink [ |--{libs,apps,comp,build,par,bioinfo} ] [ -f ] modulename version\n       default is --bioinfo"; return; }
    SUBDIR=
    case "$1" in
        --libs)	    SUBDIR=libraries; OPT="$1"; shift ;;
        --apps)	    SUBDIR=applications; OPT="$1"; shift ;;
        --comp)	    SUBDIR=compilers; OPT="$1"; shift ;;
        --build)    SUBDIR=build-tools; OPT="$1"; shift ;;
        --par)      SUBDIR=parallel; OPT="$1"; shift ;;
        --bioinfo)  SUBDIR=; OPT="$1"; shift ;;
    esac
    [[ "$1" = "-f" ]] && { FORCE=yes; shift; } || FORCE=
    M=$1
    V=$2
    if [[ ! -z "$SUBDIR" ]] ; then
        if [[ ! -z "$FORCE" ]] ; then
            shift
            for C in $_CURRENT_CLUSTERS ; do
                ( cd /sw/mf/$C/$SUBDIR/ && mflink $OPT -f $M $V ) || { echo "*** problem with $C/$SUBDIR/$M/$V"; }
            done
        else
            for C in $_CURRENT_CLUSTERS ; do
                ( cd /sw/mf/$C/$SUBDIR/ && mflink $OPT $M $V ) || { echo "*** problem with $C/$SUBDIR/$M/$V"; }
            done
        fi
        echo -e "\n*** End result: ls -la /sw/mf/*/$SUBDIR/$M/ \n"
        [[ ! -z "$FORCE" ]] && echo -e "\n*** FORCED\n"
        ls -la /sw/mf/*/$SUBDIR/$M/
    else
        COMMONDIR=(/sw/mf/common/bioinfo-tools/*/$M)
        if [[ ! -d $COMMONDIR ]] ; then
            echo "*** $COMMONDIR doesn't exist and it must, before running this"; return
        else
            SUBDIR=${COMMONDIR#/sw/mf/common/bioinfo-tools/}
            SUBDIR=${SUBDIR%/$M}
        fi
        if [[ ! -z "$FORCE" ]] ; then
            shift
            for C in $_CURRENT_CLUSTERS ; do
                ( cd /sw/mf/$C/bioinfo-tools/$SUBDIR/ && mflink -f $M $V ) || { echo "*** problem with $C/bioinfo-tools/$SUBDIR/$M/$V"; }
            done
        else
            for C in $_CURRENT_CLUSTERS ; do
                ( cd /sw/mf/$C/bioinfo-tools/$SUBDIR/ && mflink $M $V ) || { echo "*** problem with $C/bioinfo-tools/$SUBDIR/$M/$V"; }
            done
        fi
        echo -e "\n*** End result: ls -la /sw/mf/*/bioinfo-tools/$SUBDIR/$M/ \n"
        [[ ! -z "$FORCE" ]] && echo -e "\n*** FORCED\n"
        ls -la /sw/mf/*/bioinfo-tools/$SUBDIR/$M/
    fi
}


# Update mf files for a module while on rackham5. Requires /mnt/sw mount point
function rackham_mfupdate() {
    [[ $# == 0 ]] && { echo "usage: rackham_mfupdate [ |--{libs,apps,comp,build,bioinfo} ] [ -f ] modulename"; return; }
    SUBDIR=
    case "$1" in
        --libs)	    SUBDIR=libraries; shift ;;
        --apps)	    SUBDIR=applications; shift ;;
        --comp)	    SUBDIR=compilers; shift ;;
        --build)    SUBDIR=build-tools; shift ;;
        --bioinfo)  SUBDIR=; shift ;;
    esac
    [[ "$1" = "-f" ]] && { FORCE=yes; shift; } || FORCE=
    M=$1
    if [[ ! -z "$SUBDIR" ]] ; then
        if [[ ! -z "$FORCE" ]] ; then
            shift
            for C in common $_CURRENT_CLUSTERS ; do
                ( cd /sw/mf/$C/$SUBDIR/ && pwd && rsync -Pa --del /mnt/$PWD/$M . )
            done
        else
            for C in common $_CURRENT_CLUSTERS ; do
                ( cd /sw/mf/$C/$SUBDIR/ && pwd && rsync --dry-run -Pa --del /mnt/$PWD/$M . )
            done
        fi
        echo -e "\n*** End result: ls -la /sw/mf/*/$SUBDIR/$M/ \n"
        ls -la /sw/mf/*/$SUBDIR/$M/
        [[ -z "$FORCE" ]] && echo -e "\n*** DRY RUN\n"
    else
        MNTDIR=(/mnt/sw/mf/common/bioinfo-tools/*/$M)
        if [[ ! -d $MNTDIR ]] ; then
            echo "*** $MNTDIR doesn't exist "; return
        else
            SUFFDIR=${MNTDIR#/mnt/sw/mf/common}
        fi
        if [[ ! -z "$FORCE" ]] ; then
            shift
            for C in common $_CURRENT_CLUSTERS ; do
                THISDIR=/sw/mf/$C/$SUFFDIR
                [[ -d $THISDIR ]] || mkdir -p $THISDIR
                ( cd $THISDIR/ && cd .. && pwd && rsync -Pa --del /mnt/$PWD/$M . )
            done
        else
            for C in common $_CURRENT_CLUSTERS ; do
                THISDIR=/sw/mf/$C/$SUFFDIR
                [[ -d $THISDIR ]] || mkdir -p $THISDIR
                ( cd $THISDIR/ && cd .. && pwd && rsync --dry-run -Pa --del /mnt/$PWD/$M . )
            done
        fi
        echo -e "\n*** End result: ls -la /sw/mf/*/bioinfo-tools/*/$M/ \n"
        ls -la /sw/mf/*/bioinfo-tools/*/$M/
        [[ -z "$FORCE" ]] && echo -e "\n*** DRY RUN\n"
    fi
}

