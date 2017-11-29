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
    local p=${1:?Must provide project name}
    local k=${2}
    local B=/proj/$p;          [[ -L $B ]] || { echo "correct $B not found" >/dev/stderr; return; }
    local N=/proj/$p/nobackup; [[ -L $N ]] || { echo "correct $N not found" >/dev/stderr; return; }
    local B=$(readlink -f $B)
    local N=$(readlink -f $N)
    local VB=$(dirname $B)
    local VN=$(dirname $N)
    [[ $B && $N && $VB && $VN ]] || { echo "Could not resolve symlinks" >/dev/stderr; return; }
    if [[ $k == b ]] ; then
        df -k $B | tail -n 1
    elif [[ $k == n ]] ; then
        df -k $N | tail -n 1
    else
        echo -e "\n$p backup    ---- $B"
        df -kh $B
        echo -e "\n$p nobackup  ---- $N"
        df -kh $N
    fi
}

function projvolpi() {
    local pi=${1:?Must provide PI name}
    local grep=$(which --skip-alias --skip-functions grep)
    local projdb=/sw/uppmax/etc/projects
    local proj=
    $grep --quiet "^Principal: .*$pi" $projdb || { echo "PI '$pi' not found in $projdb"; return; }
    [[ $($grep "^Principal: .*$pi" $projdb | sed 's/\([^(]\+\) (.*$/\1/' | uniq | wc -l) == 1 ]] || { echo "More than one PI matched '$pi' in $projdb"; $grep "^Principal: .*$pi" $projdb | uniq; return; }
    local fullpi=$($grep -m 1 "^Principal: .*$pi" $projdb | sed 's/^Principal:  *\(.*\)$/\1/')
    echo "found fullpi $fullpi"
    proj=$($grep -B 6 "^Principal: .*$pi" $projdb | $grep '^Name: ' | $grep -v 'delivery' | awk '{print $2}')
    for pr in $proj ; do
        projvol $pr
    done 2>/dev/null
    echo -e "\nTotal space for PI '$pi', which matches '$fullpi', in both GiB and TiB:"
    local bsz=0; local nsz=0
    local n=
    for n in $(for pr in $proj ; do projvol $pr b | awk '{print $2}'; done) ; do
        (( bsz += n ))
    done 2>/dev/null
    for n in $(for pr in $proj ; do projvol $pr n | awk '{print $2}'; done) ; do
        (( nsz += n ))
    done 2>/dev/null
    local about=$(bc <<< "scale=0; $bsz / 1024^2"); about+=" GiB \t"; about+=$(bc <<< "scale=2; $bsz / 1024^3"); about+=" TiB"
    local anout=$(bc <<< "scale=0; $nsz / 1024^2"); anout+=" GiB \t"; anout+=$(bc <<< "scale=2; $nsz / 1024^3"); anout+=" TiB"
    echo -e "Allocation\tbackup  \t$about"
    echo -e "Allocation\tnobackup\t$anout"
    bsz=0; nsz=0
    for n in $(for pr in $proj ; do projvol $pr b | awk '{print $3}'; done) ; do
        (( bsz += n ))
    done 2>/dev/null
    for n in $(for pr in $proj ; do projvol $pr n | awk '{print $3}'; done) ; do
        (( nsz += n ))
    done 2>/dev/null
    local ubout=$(bc <<< "scale=0; $bsz / 1024^2"); ubout+=" GiB \t"; ubout+=$(bc <<< "scale=2; $bsz / 1024^3"); ubout+=" TiB"
    local unout=$(bc <<< "scale=0; $nsz / 1024^2"); unout+=" GiB \t"; unout+=$(bc <<< "scale=2; $nsz / 1024^3"); unout+=" TiB"
    echo -e "Space_InUse\tbackup  \t$ubout"
    echo -e "Space_InUse\tnobackup\t$unout"
}

#
# Appexpert functions for managing mf files.  Use no arguments to get brief help.
#

_CURRENT_CLUSTERS="bianca irma milou rackham"

# Show section of bioinfo-tools in which each module is found
function section() {
    [[ $# == 0 ]] && { echo "usage: section bioinfo-modulename [ bioinfo-modulename ... ]"; return; }
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
function mfshow() {
    [[ $# == 0 ]] && { echo -e "usage: mfshow [ --{libs,apps,comp,build,par,bioinfo} ] [ -c ] modulename\n    default is --bioinfo\n    -a : show all clusters, not just current and common {common,${_CURRENT_CLUSTERS// /,}}"; return; }
    local SUBDIR=
    local OPT=
    case "$1" in
        --libs)     SUBDIR=libraries; OPT="$1"; shift ;;
        --apps)     SUBDIR=applications; OPT="$1"; shift ;;
        --comp)     SUBDIR=compilers; OPT="$1"; shift ;;
        --build)    SUBDIR=build-tools; OPT="$1"; shift ;;
        --par)      SUBDIR=parallel; OPT="$1"; shift ;;
        --bioinfo)  SUBDIR=; OPT="$1"; shift ;;
    esac
    local ALL=
    [[ "$1" = "-a" ]] && { ALL=yes; shift; }
    local M=$1
    if [[ ! -z "$SUBDIR" ]] ; then
        if [[ -z "$ALL" ]] ; then
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
        if [[ -z "$ALL" ]] ; then
            eval ls -la /sw/mf/{common,{${_CURRENT_CLUSTERS// /,}}}/bioinfo-tools/$SUBDIR/$M/
        else
            ls -la /sw/mf/*/bioinfo-tools/$SUBDIR/$M/
        fi
    fi
}


# Create a cluster-specific symlink to /sw/mf/common/... for an mf file
function mflink() {
    [[ $# == 0 ]] && { echo "usage: mflink [ |--{libs,apps,comp,build,bioinfo} ] [ -f ] modulename version"; return; }
    local SUBDIR=
    case "$1" in
        --libs)     SUBDIR=libraries; shift ;;
        --apps)     SUBDIR=applications; shift ;;
        --comp)     SUBDIR=compilers; shift ;;
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
    local SUBDIR=
    local OPT=
    case "$1" in
        --libs)     SUBDIR=libraries; OPT="$1"; shift ;;
        --apps)     SUBDIR=applications; OPT="$1"; shift ;;
        --comp)     SUBDIR=compilers; OPT="$1"; shift ;;
        --build)    SUBDIR=build-tools; OPT="$1"; shift ;;
        --par)      SUBDIR=parallel; OPT="$1"; shift ;;
        --bioinfo)  SUBDIR=; OPT="$1"; shift ;;
    esac
    local FORCE=
    [[ "$1" = "-f" ]] && { FORCE=yes; shift; }
    local M=$1
    local V=$2
    local C=
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
        #ls -la /sw/mf/*/$SUBDIR/$M/
        mfshow $OPT $M
    else
        local COMMONDIR=(/sw/mf/common/bioinfo-tools/*/$M)
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
        #ls -la /sw/mf/*/bioinfo-tools/$SUBDIR/$M/
        mfshow $OPT $M
    fi
}


# Update mf files for a module while on rackham5. Requires /mnt/sw mount point
function rackham_mfupdate() {
    [[ $# == 0 ]] && { echo "usage: rackham_mfupdate [ |--{libs,apps,comp,build,bioinfo} ] [ -f ] modulename"; return; }
    local SUBDIR=
    local OPT=
    case "$1" in
        --libs)     SUBDIR=libraries; OPT="$1"; shift ;;
        --apps)     SUBDIR=applications; OPT="$1"; shift ;;
        --comp)     SUBDIR=compilers; OPT="$1"; shift ;;
        --build)    SUBDIR=build-tools; OPT="$1"; shift ;;
        --par)      SUBDIR=parallel; OPT="$1"; shift ;;
        --bioinfo)  SUBDIR=; OPT="$1"; shift ;;
    esac
    local FORCE=
    [[ "$1" = "-f" ]] && { FORCE=yes; shift; }
    local M=$1
    local C=
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
        mfshow $OPT $M
        [[ -z "$FORCE" ]] && echo -e "\n*** DRY RUN\n"
    else
        local MNTDIR=(/mnt/sw/mf/common/bioinfo-tools/*/$M)
        local SUFFDIR=
        local THISDIR=
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
        mfshow $OPT $M
        [[ -z "$FORCE" ]] && echo -e "\n*** DRY RUN\n"
    fi
}

