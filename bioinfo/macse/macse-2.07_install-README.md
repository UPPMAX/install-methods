macse/2.07
========================

<https://www.agap-ge2pop.org/macsee-pipelines/>

Used under license:



Structure creating script (makeroom_macse_2.07.sh) moved to /sw/bioinfo/macse/makeroom_2.07.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "macse" "-v" "2.07" "-w" "https://www.agap-ge2pop.org/macsee-pipelines/" "-d" "Multiple Alignment of Coding Sequences Accounting for Frameshifts and Stop Codons." "-s" "annotation"
    ./makeroom_macse_2.07.sh

    module load java/OpenJDK_17+35

    # Download jar
    mkdir $PREFIX/bin
    cd $PREFIX/bin
    wget https://www.agap-ge2pop.org/wp-content/uploads/macse/releases/macse_v${VERSION}.jar

    # Create wrapper script
    printf '#\!/bin/bash \nexec java -jar ${MACSE_ROOT}/bin/macse_v2.07.jar "$@"\n' > macse
    chmod 775 macse 
    
    # Test
    wget https://www.agap-ge2pop.org/wp-content/uploads/macse/doc/LOC_48720_NT.fasta
    java -jar macse_v2.07.jar -prog alignSequences -seq LOC_48720_NT.fasta
    ./macse -prog alignSequences -seq LOC_48720_NT.fasta



