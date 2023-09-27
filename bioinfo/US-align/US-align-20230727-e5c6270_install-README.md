US-align/20230727-e5c6270
=========================

<https://zhanggroup.org/US-align/>

Used under license:
Custom open source AS-IS
<https://raw.githubusercontent.com/pylelab/USalign/master/LICENSE>

Structure creating script (makeroom_US-align_20230727-e5c6270.sh) moved to /sw/bioinfo/US-align/makeroom_20230727-e5c6270.sh

LOG
---

    makeroom.sh -t US-align -v 20230727-e5c6270 -c bioinfo -s alignment -w https://zhanggroup.org/US-align/ -d "US-align (Universal Structural alignment) is a unified protocol to compare 3D structures of different macromolecules (proteins, RNAs and DNAs) in different forms (monomers, oligomers and heterocomplexes) for both pairwise and multiple structure alignments." -l "Custom open source AS-IS" -L https://raw.githubusercontent.com/pylelab/USalign/master/LICENSE 
    ./makeroom_US-align_20230727-e5c6270.sh 
    source /sw/bioinfo/US-align/SOURCEME_US-align_20230727-e5c6270
    cd $SRCDIR
    ml git/2.34.1 gcc/12.3.0
    git clone https://github.com/pylelab/USalign
    cd USalign/
    git reset --hard e5c6270
    make
    cp -av qTMclust USalign TMalign TMscore MMalign se pdb2xyz xyz_sfetch pdb2fasta pdb2ss NWalign HwRMSD cif2pdb pdbAtomName addChainID $PREFIX/
    ./USalign PDB1.pdb PDB2.pdb 

Copy over test data.

    cp -av *.pdb $PREFIX/

Double-check they can run without other modules loaded.

    cd $PREFIX
    ml purge
    ./USalign -h
    ./USalign PDB1.pdb PDB2.pdb
