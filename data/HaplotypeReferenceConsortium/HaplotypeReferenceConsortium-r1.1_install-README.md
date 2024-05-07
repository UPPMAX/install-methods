HaplotypeReferenceConsortium/r1.1
========================

<http://www.haplotype-reference-consortium.org/>

Used under license:


Structure creating script (makeroom_HaplotypeReferenceConsortium_r1.1.sh) moved to /sw/data/HaplotypeReferenceConsortium/makeroom_r1.1.sh

LOG
---

    TOOL=HaplotypeReferenceConsortium
    VERSION=r1.1
    cd /sw/data/
    makeroom.sh -t "HaplotypeReferenceConsortium" -v "r1.1" -c "data" -w "http://www.haplotype-reference-consortium.org/" -d "The Haplotype Reference Consortium \(HRC\) will create a large reference panel of human haplotypes by combining together sequencing data from multiple cohorts"
    ./makeroom_HaplotypeReferenceConsortium_r1.1.sh
    cd $TOOL
    source SOURCEME_HaplotypeReferenceConsortium_r1.1
    cd $PREFIX
    wget -O README.md ftp://ngs.sanger.ac.uk/production/hrc/HRC.r1-1/README
    wget ftp://ngs.sanger.ac.uk/production/hrc/HRC.r1-1/HRC.r1-1.GRCh37.wgs.mac5.sites.tab.gz
    wget ftp://ngs.sanger.ac.uk/production/hrc/HRC.r1-1/HRC.r1-1.GRCh37.wgs.mac5.sites.tab.gz.md5
    wget ftp://ngs.sanger.ac.uk/production/hrc/HRC.r1-1/HRC.r1-1.GRCh37.wgs.mac5.sites.tab.gz.tbi
    wget ftp://ngs.sanger.ac.uk/production/hrc/HRC.r1-1/HRC.r1-1.GRCh37.wgs.mac5.sites.tab.gz.tbi.md5
    wget ftp://ngs.sanger.ac.uk/production/hrc/HRC.r1-1/HRC.r1-1.GRCh37.wgs.mac5.sites.vcf.gz
    wget ftp://ngs.sanger.ac.uk/production/hrc/HRC.r1-1/HRC.r1-1.GRCh37.wgs.mac5.sites.vcf.gz.md5
    wget ftp://ngs.sanger.ac.uk/production/hrc/HRC.r1-1/HRC.r1-1.GRCh37.wgs.mac5.sites.vcf.gz.tbi
    wget ftp://ngs.sanger.ac.uk/production/hrc/HRC.r1-1/HRC.r1-1.GRCh37.wgs.mac5.sites.vcf.gz.tbi.md5

