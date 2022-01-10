#!/bin/bash

# Install new blast dbs in these directories to /sw/data/blast_databases:
#
# * /sw/data/blast_tmp/blastdb/
# * /sw/data/blast_tmp/uniprot/blastdb/
#
# These could be a partial list of the dbs we make available, if there were no
# updates in this round of downloads.
#
# 1. create _new directory
# 2. populate _new with hard links from the existing install directory
# 3. for each db with a .timestamp file in the staged directories
#   a. remove all its same-prefix hardlinks from _new
#   b. mv its same-prefix files from the staged directory to _new
#   c. make sure issues that might arise when a multipart db shrinks are avoided
# 4. mv install directory to _old
# 5. mv _new to install directory
#
# This script will remove the directory of old inactive databases if it exists,
# before moving the current to the old.  But it should already be removed by a cron
# job which runs 24 hours after this one.

#set -x
set -e

shopt -s nullglob  # this will make STAGED_DBS_TIMESTAMPS and STAGED_DBS_JSON be empty if the globs match nothing

now=$(date +%FT%T)

#EMAIL="lars.eklund@uppmax.uu.se"
EMAIL="douglas.scofield@uppmax.uu.se"

STAGED_DBS_TIMESTAMPS=( /sw/data/blast_tmp/blastdb/*.timestamp /sw/data/blast_tmp/uniprot/blastdb/*.timestamp )
STAGED_DBS_JSONS=( /sw/data/blast_tmp/blastdb/*.json )

checkdbs=yes

module load gnuparallel
module load bioinfo-tools blast/2.12.0+
# the databases fetched from NCBI's mirror, must match that in update_blastdb.sh
# these are individually checked by blastdbcheck after installation
dbs=(
    16S_ribosomal_RNA
    18S_fungal_sequences
    28S_fungal_sequences
    Betacoronavirus
    cdd_delta
    env_nr
    env_nt
    human_genome
    ITS_eukaryote_sequences
    ITS_RefSeq_Fungi
    landmark
    LSU_eukaryote_rRNA
    LSU_prokaryote_rRNA
    mito
    mouse_genome
    nr
    nt
    pataa
    patnt
    pdbaa
    pdbnt
    ref_euk_rep_genomes
    ref_prok_rep_genomes
    ref_viroid_rep_genomes
    ref_viruses_rep_genomes
    refseq_protein
    refseq_rna
    refseq_select_prot
    refseq_select_rna
    SSU_eukaryote_rRNA
    swissprot
    taxdb
    tsa_nr
    tsa_nt
)


INSTALL=/sw/data/blast_databases
OLD=${INSTALL}_old
NEW=${INSTALL}_new

[[ -e $INSTALL ]] || { echo "$0: something wrong, $INSTALL does not exist"; exit 1; }

[[ ! -e $NEW ]] || { echo "$0: $NEW already exists"; exit 1; }
mkdir $NEW
chgrp sw $NEW
chmod u+rwX,g+rwsX,o+rX-w $NEW

# populate _new, and fill with hard links to dbs in install
cd $NEW
echo -e "$NEW: creating hardlinks to existing dbs ..."
ln $INSTALL/* .

for S in ${STAGED_DBS_TIMESTAMPS[@]} ; do
    SS=${S%.timestamp}
    DB=${SS##*/}
    echo -e "\n$S found staged"
    ALL_SS=(${SS}.*)
    if [[ ${#ALL_SS[@]} == 1 ]] ; then
        echo "Only the timestamp file was found; will only remove the old timestamp and link the new timestamp"
        rm -f ${DB}.timestamp
        echo "Existing database files not touched: " ${DB}.*
        ln ${SS}.timestamp .
        continue
    fi
    echo -ne "    $DB:$NEW: removing hardlinks to existing ... "
    rm -f ${DB}.*
    [[ $DB == UniVec || $DB == UniVec_Core ]] && rm -f ${DB}
    echo -e "creating hardlinks to staged... "
    ln ${SS}.* . || { echo -e "$0: Failed to hardlink '${SS}.*'\n" | mailx -s "blast database installation error" "$EMAIL"; exit 1; }
    [[ $DB == UniVec || $DB == UniVec_Core ]] && ln ${SS} .
done

for J in ${STAGED_DBS_JSONS[@]} ; do
    JJ=${J##*/}
    echo -e "\n$J found staged"
    echo -ne "    $JJ:$NEW: removing hardlinks to existing ... "
    rm -f ${JJ}
    echo -e "creating hardlinks to staged... "
    ln ${J} . || { echo -e "$0: Failed to hardlink '${J}'\n" | mailx -s "blast database JSON installation error" "$EMAIL"; exit 1; }
done

[[ -e $OLD ]] && { echo -e "\nremoving $OLD ..."; rm -vrf $OLD; }

echo -e "$0: $INSTALL to $OLD and $NEW to $INSTALL"
mv -v $INSTALL $OLD
mv -v $NEW $INSTALL

if [[ $checkdbs ]] ; then
    # Now to check the NCBI databases
    LOG="install_NCBI_blastdbcheck_${now}.log"
    parallel -j 4 --verbose blastdbcheck -db ::: "${dbs[@]}" > "$LOG" 2>&1
    gzip -f --best "$LOG"
    echo -e "$0: Installed blast databases to $INSTALL\n$0: old databases in $OLD\n$0: attached is blastdbcheck for all NCBI databases" | mailx -s "blast databases installed" "$EMAIL" -a "$LOG.gz"
else
    echo -e "$0: Installed blast databases to $INSTALL\n$0: old databases in $OLD" | mailx -s "blast databases installed" "$EMAIL"
fi


