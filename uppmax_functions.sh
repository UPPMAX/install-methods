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
    [[ $# != 0 ]] || { cat <<_usage_
USAGE:  projvol project-name [ b | n ]

Report project disk volumes and usage on /pica, for both backup and nobackup areas.

When second option is provided and matches b or n' a single line is produced summarising
usage for backup (b) or nobackup (n) in 1 KiB blocks; primerily used by projvolpi
_usage_
    return; }
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
    [[ $# != 0 ]] || { cat <<_usage_
USAGE:  projvolpi pi-name

For a given PI, do 'projvol' for all projects where 'Principal:' lines in /sw/uppmax/etc/projects match
pi-name, and also summarise total allocation and usage for all projects, in GiB and TiB.

pi-name may match a substring of the PI name, but must match just one PI (minus PI ID number) within the projects file
_usage_
    return; }
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
function mfshow() {
    local SUBDIR
    local ALL
    local OPTIND
    while getopts ":ilacbpA" opt "$@"; do
        case $opt in
            i)  SUBDIR= ;;
            l)  SUBDIR=libraries ;;
            a)  SUBDIR=applications ;;
            c)  SUBDIR=compilers ;;
            b)  SUBDIR=build-tools ;;
            p)  SUBDIR=parallel ;;
            A)  ALL=yes ;;
            *)  echo "unknown option"; return ;;
        esac
    done
    shift $((OPTIND-1))
    [[ $# == 1 ]] || { cat <<_usage_
USAGE:  mfshow [ -i (default) | -l | -a | -c | -b | -p ] [ -A ] modulename

Full listing of all mf files for a given module under /sw/mf/...

Subtree options:   -i   bioinfo-tools (default)
                   -l   libraries
                   -a   applications
                   -c   comp
                   -b   build-tools
                   -p   parallel
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
function mflink() {
    local SUBDIR
    local FORCE
    local QUIET
    local OPTIND
    while getopts ":ilacbpfq" opt "$@"; do
        case $opt in
            i)  SUBDIR= ;;
            l)  SUBDIR=libraries ;;
            a)  SUBDIR=applications ;;
            c)  SUBDIR=compilers ;;
            b)  SUBDIR=build-tools ;;
            p)  SUBDIR=parallel ;;
            f)  FORCE=yes ;;
            q)  QUIET=yes ;;
            *)  echo "unknown option"; return ;;
        esac
    done
    shift $((OPTIND-1))
    [[ $# == 2 ]] || { cat <<_usage_
USAGE:  mflink [ -i (default) | -l | -a | -c | -b | -p ] [ -f ] modulename version

Create cluster-specific link to /sw/mf/common/... for an mf file, when positioned where
the modulename directories are (e.g., /sw/mf/milou/bioinfo-tools/misc).
NOTE: all_mflink is better for general use, and there is no position requirement.

Subtree options:   -i   bioinfo-tools (default)
                   -l   libraries
                   -a   applications
                   -c   comp
                   -b   build-tools
                   -p   parallel
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
function all_mflink() {
    local SUBDIR
    local FORCE
    local OPT
    local OPTIND
    while getopts ":ilacbpf" opt "$@"; do
        case $opt in
            i)  SUBDIR= ; OPT="-$opt" ;;
            l)  SUBDIR=libraries ; OPT="-$opt" ;;
            a)  SUBDIR=applications ; OPT="-$opt" ;;
            c)  SUBDIR=compilers ; OPT="-$opt" ;;
            b)  SUBDIR=build-tools ; OPT="-$opt" ;;
            p)  SUBDIR=parallel ; OPT="-$opt" ;;
            f)  FORCE=yes ;;
            *)  echo "unknown option" ; return ;;
        esac
    done
    shift $((OPTIND-1))
    [[ $# == 2 ]] || { cat <<_usage_
USAGE:  all_mflink [ -i (default) | -l | -a | -c | -b | -p ] [ -f ] modulename version

Create all cluster-specific links (/sw/mf/{$_CURRENT_CLUSTERS}/...) to /sw/mf/common/... for an mf file

Subtree options:   -i   bioinfo-tools (default)
                   -l   libraries
                   -a   applications
                   -c   comp
                   -b   build-tools
                   -p   parallel
Other options:     -f   force; basically required
_usage_
    return; }
    local M=$1
    local V=$2
    local C=
    if [[ $SUBDIR ]] ; then
        if [[ $FORCE ]] ; then
            for C in $_CURRENT_CLUSTERS ; do
                ( cd /sw/mf/$C/$SUBDIR/ && mflink $OPT -f -q $M $V ) || { echo "*** problem with $C/$SUBDIR/$M/$V"; }
            done
        else
            for C in $_CURRENT_CLUSTERS ; do
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
            for C in $_CURRENT_CLUSTERS ; do
                ( cd /sw/mf/$C/bioinfo-tools/$SUBDIR/ && mflink -f -q $M $V ) || { echo "*** problem with $C/bioinfo-tools/$SUBDIR/$M/$V"; }
            done
        else
            for C in $_CURRENT_CLUSTERS ; do
                ( cd /sw/mf/$C/bioinfo-tools/$SUBDIR/ && mflink -q $M $V ) || { echo "*** problem with $C/bioinfo-tools/$SUBDIR/$M/$V"; }
            done
        fi
        [[ $FORCE ]] && echo -e "\n*** FORCED"
        echo -e "\n*** Done"
        echo -e "\n*** mfshow $OPT $M\n"
        mfshow $OPT $M
    fi
}


# Update mf files for a module while on rackham5. Requires /mnt/sw mount point
function rackham_mfupdate() {
    local SUBDIR
    local FORCE
    local OPT
    local OPTIND
    while getopts ":ilacbpf" opt "$@"; do
        case $opt in
            i)  SUBDIR= ; OPT="-$opt" ;;
            l)  SUBDIR=libraries ; OPT="-$opt" ;;
            a)  SUBDIR=applications ; OPT="-$opt" ;;
            c)  SUBDIR=compilers ; OPT="-$opt" ;;
            b)  SUBDIR=build-tools ; OPT="-$opt" ;;
            p)  SUBDIR=parallel ; OPT="-$opt" ;;
            f)  FORCE=yes ;;
            *)  echo "unknown option" ; return ;;
        esac
    done
    shift $((OPTIND-1))
    [[ $# == 1 ]] || { cat <<_usage_
USAGE:  rackham_mfupdate [ -i (default) | -l | -a | -c | -b | -p ] [ -f ] modulename

**While on rackham**, rsync /sw/mf/... trees to rackham; may ask to authenticate

Subtree options:   -i   bioinfo-tools (default)
                   -l   libraries
                   -a   applications
                   -c   comp
                   -b   build-tools
                   -p   parallel
Other options:     -f   force; basically required
_usage_
    return; }
    local M=$1
    local C=
    if [[ $SUBDIR ]] ; then
        if [[ $FORCE ]] ; then
            for C in common $_CURRENT_CLUSTERS ; do
                ( cd /sw/mf/$C/$SUBDIR/ && pwd && rsync -Pa --del /mnt/$PWD/$M . )
            done
        else
            for C in common $_CURRENT_CLUSTERS ; do
                ( cd /sw/mf/$C/$SUBDIR/ && pwd && rsync --dry-run -Pa --del /mnt/$PWD/$M . )
            done
        fi
        [[ $FORCE ]] && echo -e "\n*** Done" || echo -e "\n*** DRY RUN"
        echo -e "\n*** mfshow $OPT $M\n"
        mfshow $OPT $M
    else
        local MNTDIR=(/mnt/sw/mf/common/bioinfo-tools/*/$M)
        local SUFFDIR=
        local THISDIR=
        [[ -d $MNTDIR ]] || { echo "*** $MNTDIR doesn't exist "; return; }
        SUFFDIR=${MNTDIR#/mnt/sw/mf/common}
        if [[ $FORCE ]] ; then
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
        [[ $FORCE ]] && echo -e "\n*** Done" || echo -e "\n*** DRY RUN"
        echo -e "\n*** mfshow $OPT $M\n"
        mfshow $OPT $M
    fi
}

