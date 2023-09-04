chain_files/20230825
========================

<http://>

Used under license:
Open access


Structure creating script (makeroom_chain_files_20230825.sh) moved to /sw/data/chain_files/makeroom_20230825.sh

LOG
---

    /home/douglas/bin/makeroom.sh "-f" "-t" "chain_files" "-v" "20230825" "-c" "data" "-l" "Open access" "-d" "Chain files for use with liftover tools, downloaded as of 2023-08-25. See module help for more"
        ./makeroom_chain_files_20230825.sh
            cd $SRCDIR
                wget http://
                    tar xvf
                        make


CrossMap's documentation (<https://crossmap.sourceforge.net/#chain-file>)
reported some chain files at UCSC and Ensemble. We get all of Ensemble but
there are several others available at UCSC that it does not report.  Find out
about those.

### UCSC chain files


From <https://crossmap.sourceforge.net/#chain-file>, there are hs1, hg39, hg19
and mm10.  We find by visiting ftp://hgdownload.soe.ucsc.edu:/goldenPath that
there are many. Get the full contents of each liftOver subdirectory, check the md5s,
and lift the contents. There are symlinks, not sure how they will be handled.

Get the list of liftOver/ subdirectories. These will be the only directories
with contents that we download. Note that cut-and-paste won't work with the
following since LiftOver needs to appear at the start of the line, not with
leading spaces.

    cat <<LiftOver | lftp
    open ftp://hgdownload.soe.ucsc.edu/goldenPath
    ls -ld */liftOver > goldenPath_liftOver_directories.txt
    LiftOver

Make sure we have only directories, and produce the fetch file for rsync. This means
every directory ends with '/***' (<https://stackoverflow.com/questions/15687755/how-to-use-rsync-to-copy-only-specific-subdirectories-same-names-in-several-dir>)

    grep '^dr' goldenPath_liftOver_directories.txt | awk '{ print $9 "/***" }' | head











Script this up with:

    source /sw/bioinfo/CrossMap/SOURCEME_CrossMap_0.6.6
    cd $TOOLDIR
    mkdir external-chain-files
    cd external-chain-files

    # UCSC chain files

    mkdir -p UCSC
    cd UCSC

    BASEURL=rsync://hgdownload.soe.ucsc.edu/goldenPath



    for V in {hs1,hg38,hg19,mm10} ; do

        mkdir -p $V
        URL=$BASEURL/$V/liftOver
        ( cd $V && rsync -avzlP $URL . && md5sum -c md5sum.txt | tee md5sum.check )

    done

This leaves off the intervening `liftOver/` subdirectory out of the local path.
This also checks the checksums as each directory is completed and saves the
result in `md5sum.check`.

#### UCSC/hs1/

The `.../hs1/md5sum.txt` only contains checksums for four of the files:

    hs1ToHg38.over.chain.gz: OK
    hs1ToMm10.over.chain.gz: OK
    hs1ToMm39.over.chain.gz: OK
    hs1ToHg19.over.chain.gz: OK

#### UCSC/hg38/

The `.../hg38/md5sum.txt` includes too many:

    hg38ToEulFla1.over.chain.gz: OK
    hg38ToTakFla1.over.chain.gz: OK
    hg38ToJacJac1.over.chain.gz: OK
    hg38ToXenTro9.over.chain.gz: OK
    hg38ToGCF_024166365.1.over.chain.gz: OK
    hg38ToPetMar3.over.chain.gz: OK
    md5sum: hg38ToGCA_018472605.1.over.chain.gz: No such file or directory
    hg38ToGCA_018472605.1.over.chain.gz: FAILED open or read
    hg38ToMyoLuc2.over.chain.gz: OK
    hg38ToFukDam1.over.chain.gz: OK
    hg38ToTetNig2.over.chain.gz: OK
    md5sum: hg38ToGCA_018471075.1.over.chain.gz: No such file or directory
    hg38ToGCA_018471075.1.over.chain.gz: FAILED open or read
    hg38ToPonAbe3.over.chain.gz: OK
    hg38ToTupChi1.over.chain.gz: OK
    hg38ToOctDeg1.over.chain.gz: OK
    hg38ToCanFam5.over.chain.gz: OK
    hg38ToGCF_003121395.1.over.chain.gz: OK
    hg38ToNeoSch1.over.chain.gz: OK
    hg38ToDipOrd2.over.chain.gz: OK
    hg38ToMelGal5.over.chain.gz: OK
    hg38ToMusFur1.over.chain.gz: OK
    hg38ToCriGriChoV1.over.chain.gz: OK
    hg38ToGorGor6.over.chain.gz: OK
    hg38ToAptMan1.over.chain.gz: OK
    hg38ToLepWed1.over.chain.gz: OK
    hg38ToTriMan1.over.chain.gz: OK
    hg38ToCe11.over.chain.gz: OK
    hg38ToDanRer11.over.chain.gz: FAILED
    hg38ToMacFas5.over.chain.gz: OK
    hg38ToPapAnu3.over.chain.gz: OK
    md5sum: hg38ToGCA_018471105.1.over.chain.gz: No such file or directory
    hg38ToGCA_018471105.1.over.chain.gz: FAILED open or read
    hg38ToOrnAna2.over.chain.gz: OK
    hg38ToEquCab3.over.chain.gz: OK
    hg38ToGorGor5.over.chain.gz: OK
    md5sum: hg38ToGCA_018472715.1.over.chain.gz: No such file or directory
    hg38ToGCA_018472715.1.over.chain.gz: FAILED open or read
    hg38ToMelGal1.over.chain.gz: OK
    hg38ToOryCun2.over.chain.gz: OK
    hg38ToPapAnu2.over.chain.gz: OK
    hg38ToTaeGut2.over.chain.gz: OK
    hg38ToPseHum1.over.chain.gz: OK
    hg38ToTarSyr2.over.chain.gz: OK
    md5sum: hg38ToGCA_018472565.1.over.chain.gz: No such file or directory
    hg38ToGCA_018472565.1.over.chain.gz: FAILED open or read
    hg38ToOryAfe1.over.chain.gz: OK
    hg38ToRheMac10.over.chain.gz: OK
    hg38ToProCoq1.over.chain.gz: OK
    hg38ToApaSpi1.over.chain.gz: OK
    hg38ToMyoDav1.over.chain.gz: OK
    hg38ToCavApe1.over.chain.gz: OK
    md5sum: hg38ToGCA_018504045.1.over.chain.gz: No such file or directory
    hg38ToGCA_018504045.1.over.chain.gz: FAILED open or read
    hg38ToRegenRn0.over.chain.gz: OK
    hg38ToOviAri3.over.chain.gz: OK
    hg38ToRhiRox1.over.chain.gz: OK
    hg38ToRegenRn1.over.chain.gz: OK
    hg38ToLepOcu1.over.chain.gz: OK
    hg38ToPteAle1.over.chain.gz: OK
    hg38ToAotNan1.over.chain.gz: OK
    md5sum: hg38ToGCA_018472595.1.over.chain.gz: No such file or directory
    hg38ToGCA_018472595.1.over.chain.gz: FAILED open or read
    hg38ToCapHir1.over.chain.gz: OK
    md5sum: hg38ToGCA_018506975.1.over.chain.gz: No such file or directory
    hg38ToGCA_018506975.1.over.chain.gz: FAILED open or read
    hg38ToHapBur1.over.chain.gz: OK
    hg38ToCasCan1.over.chain.gz: OK
    md5sum: hg38ToGCA_018469705.1.over.chain.gz: No such file or directory
    hg38ToGCA_018469705.1.over.chain.gz: FAILED open or read
    hg38ToOreNil2.over.chain.gz: OK
    hg38ToMesAur1.over.chain.gz: OK
    hg38ToRegenCho1.over.chain.gz: OK
    md5sum: hg38ToGCA_018504365.1.over.chain.gz: No such file or directory
    hg38ToGCA_018504365.1.over.chain.gz: FAILED open or read
    hg38ToAmbMex1.over.chain.gz: OK
    hg38ToEptFus1.over.chain.gz: OK
    hg38ToLoxAfr3.over.chain.gz: OK
    md5sum: hg38ToGCA_018471095.1.over.chain.gz: No such file or directory
    hg38ToGCA_018471095.1.over.chain.gz: FAILED open or read
    hg38ToHetGla2.over.chain.gz: OK
    hg38ToRn7.over.chain.gz: OK
    hg38ToAnoCar2.over.chain.gz: OK
    hg38ToSpeTri2.over.chain.gz: OK
    hg38ToMm10.over.chain.gz: OK
    hg38ToPanPan3.over.chain.gz: OK
    hg38ToPelSin1.over.chain.gz: OK
    hg38ToGCA_021950905.1.over.chain.gz: OK
    md5sum: hg38ToGCA_018469965.1.over.chain.gz: No such file or directory
    hg38ToGCA_018469965.1.over.chain.gz: FAILED open or read
    hg38ToAnaPla1.over.chain.gz: OK
    hg38ToAraMac1.over.chain.gz: OK
    md5sum: hg38ToGCA_018469865.1.over.chain.gz: No such file or directory
    hg38ToGCA_018469865.1.over.chain.gz: FAILED open or read
    md5sum: hg38ToGCA_018472575.1.over.chain.gz: No such file or directory
    hg38ToGCA_018472575.1.over.chain.gz: FAILED open or read
    hg38ToGCF_006542625.1.over.chain.gz: OK
    md5sum: hg38ToGCA_018469685.1.over.chain.gz: No such file or directory
    hg38ToGCA_018469685.1.over.chain.gz: FAILED open or read
    hg38ToMm39.over.chain.gz: OK
    hg38ToAmaVit1.over.chain.gz: OK
    hg38ToHs1.over.chain.gz: OK
    hg38ToSusScr3.over.chain.gz: OK
    md5sum: hg38ToGCA_018469405.1.over.chain.gz: No such file or directory
    hg38ToGCA_018469405.1.over.chain.gz: FAILED open or read
    hg38ToRn5.over.chain.gz: OK
    hg38ToPanTro6.over.chain.gz: OK
    hg38ToFelCat8.over.chain.gz: OK
    md5sum: hg38ToGCA_018472585.1.over.chain.gz: No such file or directory
    hg38ToGCA_018472585.1.over.chain.gz: FAILED open or read
    hg38ToCerAty1.over.chain.gz: OK
    hg38ToGalVar1.over.chain.gz: OK
    hg38ToCanFam3.over.chain.gz: OK
    hg38ToMicMur1.over.chain.gz: OK
    hg38ToPanPan2.over.chain.gz: OK
    hg38ToEulMac1.over.chain.gz: OK
    hg38ToEchTel2.over.chain.gz: OK
    hg38ToEnhLutNer1.over.chain.gz: OK
    hg38ToDanRer10.over.chain.gz: OK
    hg38ToDasNov3.over.chain.gz: OK
    hg38ToMayZeb1.over.chain.gz: OK
    hg38ToMelUnd1.over.chain.gz: OK
    hg38ToDm6.over.chain.gz: OK
    hg38ToPunNye1.over.chain.gz: OK
    hg38ToRheMac8.over.chain.gz: OK
    hg38ToGCF_001704415.1.over.chain.gz: OK
    hg38ToCanFam6.over.chain.gz: OK
    hg38ToBisBis1.over.chain.gz: OK
    hg38ToSusScr11.over.chain.gz: OK
    hg38ToAllMis1.over.chain.gz: OK
    hg38ToCebCap1.over.chain.gz: OK
    hg38ToRheMac3.over.chain.gz: OK
    hg38ToGCF_018350175.1.over.chain.gz: OK
    hg38ToMicOch1.over.chain.gz: OK
    hg38ToPanTro3.over.chain.gz: OK
    hg38ToRn6.over.chain.gz: OK
    hg38ToAilMel1.over.chain.gz: OK
    hg38ToChiLan1.over.chain.gz: OK
    hg38ToOrnAna1.over.chain.gz: OK
    hg38ToGadMor1.over.chain.gz: OK
    hg38ToVicPac2.over.chain.gz: OK
    hg38ToCriGri1.over.chain.gz: OK
    hg38ToEleEdw1.over.chain.gz: OK
    hg38ToManLeu1.over.chain.gz: OK
    hg38ToChrPic2.over.chain.gz: OK
    hg38ToLipVex1.over.chain.gz: OK
    hg38ToTurTru2.over.chain.gz: OK
    hg38ToThaSir1.over.chain.gz: OK
    hg38ToXenTro10.over.chain.gz: OK
    hg38ToPteVam1.over.chain.gz: OK
    md5sum: hg38ToGCA_018504375.1.over.chain.gz: No such file or directory
    hg38ToGCA_018504375.1.over.chain.gz: FAILED open or read
    hg38ToGalGal4.over.chain.gz: OK
    hg38ToCotJap2.over.chain.gz: OK
    md5sum: hg38ToGCA_018467155.1.over.chain.gz: No such file or directory
    hg38ToGCA_018467155.1.over.chain.gz: FAILED open or read
    md5sum: hg38ToGCA_018471065.1.over.chain.gz: No such file or directory
    hg38ToGCA_018471065.1.over.chain.gz: FAILED open or read
    hg38ToBosTau8.over.chain.gz: OK
    hg38ToBosTau9.over.chain.gz: OK
    hg38ToGalGal5.over.chain.gz: OK
    hg38ToNasLar1.over.chain.gz: OK
    hg38ToZonAlb1.over.chain.gz: OK
    hg38ToAquChr2.over.chain.gz: OK
    hg38ToGCF_000349665.1.over.chain.gz: OK
    hg38ToGeoFor1.over.chain.gz: OK
    hg38ToCavPor3.over.chain.gz: OK
    hg38ToMicMur3.over.chain.gz: OK
    hg38ToGasAcu1.over.chain.gz: OK
    hg38ToFalPer1.over.chain.gz: OK
    md5sum: hg38ToGCA_018469695.1.over.chain.gz: No such file or directory
    hg38ToGCA_018469695.1.over.chain.gz: FAILED open or read
    hg38ToFicAlb1.over.chain.gz: OK
    hg38ToMacEug2.over.chain.gz: OK
    hg38ToPhyCat1.over.chain.gz: OK
    md5sum: hg38ToGCA_018469675.1.over.chain.gz: No such file or directory
    hg38ToGCA_018469675.1.over.chain.gz: FAILED open or read
    hg38ToMicMur2.over.chain.gz: OK
    hg38ToGRCm38B.over.chain.gz: OK
    hg38ToSarHar1.over.chain.gz: OK
    hg38ToEriEur2.over.chain.gz: OK
    hg38ToXenLae2.over.chain.gz: OK
    hg38ToCerSim1.over.chain.gz: OK
    hg38ToPonAbe2.over.chain.gz: OK
    hg38ToPanPan1.over.chain.gz: OK
    hg38ToFr3.over.chain.gz: OK
    hg38ToRhiBie1.over.chain.gz: OK
    hg38ToOviAri4.over.chain.gz: OK
    hg38ToSaiBol1.over.chain.gz: OK
    hg38ToGalGal6.over.chain.gz: OK
    hg38ToCamFer1.over.chain.gz: OK
    hg38ToConCri1.over.chain.gz: OK
    md5sum: hg38ToGCA_018503255.1.over.chain.gz: No such file or directory
    hg38ToGCA_018503255.1.over.chain.gz: FAILED open or read
    hg38ToPetMar2.over.chain.gz: OK
    hg38ToGCA_013030995.1.over.chain.gz: OK
    hg38ToOreNil3.over.chain.gz: OK
    hg38ToAstMex1.over.chain.gz: OK
    md5sum: hg38ToGCA_018504645.1.over.chain.gz: No such file or directory
    hg38ToGCA_018504645.1.over.chain.gz: FAILED open or read
    hg38ToPanTro4.over.chain.gz: OK
    hg38ToFelCat9.over.chain.gz: OK
    hg38ToGCA_009914755.4.over.chain.gz: OK
    hg38ToFicAlb2.over.chain.gz: OK
    hg38ToManPen1.over.chain.gz: OK
    hg38ToGCF_012559485.2.over.chain.gz: OK
    hg38ToTupBel1.over.chain.gz: OK
    md5sum: hg38ToGCA_018471345.1.over.chain.gz: No such file or directory
    hg38ToGCA_018471345.1.over.chain.gz: FAILED open or read
    hg38ToGCA_021951015.1.over.chain.gz: OK
    hg38ToCanFam4.over.chain.gz: OK
    hg38ToColLiv1.over.chain.gz: OK
    hg38ToCalJac4.over.chain.gz: OK
    hg38ToOryLat2.over.chain.gz: OK
    md5sum: hg38ToGCA_018472765.1.over.chain.gz: No such file or directory
    hg38ToGCA_018472765.1.over.chain.gz: FAILED open or read
    hg38ToOdoRosDiv1.over.chain.gz: OK
    hg38ToGorGor4.over.chain.gz: OK
    hg38ToGCF_004115215.2.over.chain.gz: OK
    hg38ToChrAsi1.over.chain.gz: OK
    hg38ToSorAra2.over.chain.gz: OK
    md5sum: hg38ToGCA_018471515.1.over.chain.gz: No such file or directory
    hg38ToGCA_018471515.1.over.chain.gz: FAILED open or read
    hg38ToCriGriChoV2.over.chain.gz: OK
    hg38ToGCA_011100615.1.over.chain.gz: OK
    hg38ToPanTro5.over.chain.gz: OK
    hg38ToEquCab2.over.chain.gz: OK
    md5sum: hg38ToGCA_018469665.1.over.chain.gz: No such file or directory
    hg38ToGCA_018469665.1.over.chain.gz: FAILED open or read
    hg38ToGorGor3.over.chain.gz: OK
    hg38ToCheMyd1.over.chain.gz: OK
    hg38ToPanHod1.over.chain.gz: OK
    hg38ToXenTro7.over.chain.gz: OK
    md5sum: hg38ToGCA_018471085.1.over.chain.gz: No such file or directory
    hg38ToGCA_018471085.1.over.chain.gz: FAILED open or read
    md5sum: hg38ToGCA_018506955.1.over.chain.gz: No such file or directory
    hg38ToGCA_018506955.1.over.chain.gz: FAILED open or read
    hg38ToGCF_016699485.2.over.chain.gz: OK
    hg38ToNomLeu3.over.chain.gz: OK
    hg38ToOtoGar3.over.chain.gz: OK
    md5sum: hg38ToGCA_018472685.1.over.chain.gz: No such file or directory
    hg38ToGCA_018472685.1.over.chain.gz: FAILED open or read
    hg38ToBalAcu1.over.chain.gz: OK
    md5sum: hg38ToGCA_018472725.1.over.chain.gz: No such file or directory
    hg38ToGCA_018472725.1.over.chain.gz: FAILED open or read
    hg38ToCalJac3.over.chain.gz: OK
    hg38ToPapAnu4.over.chain.gz: OK
    hg38ToMacNem1.over.chain.gz: OK
    hg38ToMonDom5.over.chain.gz: OK
    hg38ToOrcOrc1.over.chain.gz: OK
    hg38ToLatCha1.over.chain.gz: OK
    hg38ToGCF_002742125.1.over.chain.gz: OK
    hg38ToXipMac1.over.chain.gz: OK
    hg38ToFalChe1.over.chain.gz: OK
    hg38ToNeoBri1.over.chain.gz: OK
    hg38ToColAng1.over.chain.gz: OK
    hg38ToOchPri3.over.chain.gz: OK
    hg38ToHg19.over.chain.gz: OK
    md5sum: WARNING: 32 listed files could not be read
    md5sum: WARNING: 1 computed checksum did NOT match

The failure: hg38ToDanRer11.over.chain.gz: FAILED
This file can be gunzipped without error.

    for F in hg38ToDanRer11.over.chain.gz ; do 
        gunzip -c $F > /dev/null && echo "$F gunzip is clean" || echo ">>>>> $F gunzip had errors <<<<<"
    done

#### UCSC/hg19/

The `.../hg19/md5sum.txt` includes too many:

    md5sum: hg19ToAraMac1.over.chain.gz: No such file or directory
    hg19ToAraMac1.over.chain.gz: FAILED open or read
    md5sum: hg19ToTakFla1.over.chain.gz: No such file or directory
    hg19ToTakFla1.over.chain.gz: FAILED open or read
    hg19ToGalGal4.over.chain.gz: OK
    md5sum: hg19ToTurTru2.over.chain.gz: No such file or directory
    hg19ToTurTru2.over.chain.gz: FAILED open or read
    hg19ToGCF_014441545.1.over.chain.gz: OK
    hg19ToFelCat5.over.chain.gz: OK
    hg19ToMm10.over.chain.gz: OK
    md5sum: hg19ToEptFus1.over.chain.gz: No such file or directory
    hg19ToEptFus1.over.chain.gz: FAILED open or read
    md5sum: hg19ToTarSyr2.over.chain.gz: No such file or directory
    hg19ToTarSyr2.over.chain.gz: FAILED open or read
    md5sum: hg19ToOdoRosDiv1.over.chain.gz: No such file or directory
    hg19ToOdoRosDiv1.over.chain.gz: FAILED open or read
    hg19ToGeoFor1.over.chain.gz: OK
    hg19ToDanRer10.over.chain.gz: OK
    hg19ToBosTau9.over.chain.gz: OK
    md5sum: hg19ToOtoGar3.over.chain.gz: No such file or directory
    hg19ToOtoGar3.over.chain.gz: FAILED open or read
    md5sum: hg19ToLetCam1.over.chain.gz: No such file or directory
    hg19ToLetCam1.over.chain.gz: FAILED open or read
    md5sum: hg19ToJacJac1.over.chain.gz: No such file or directory
    hg19ToJacJac1.over.chain.gz: FAILED open or read
    md5sum: hg19ToEleEdw1.over.chain.gz: No such file or directory
    hg19ToEleEdw1.over.chain.gz: FAILED open or read
    hg19ToGorGor3.over.chain.gz: OK
    hg19ToLoxAfr3.over.chain.gz: OK
    hg19ToPanTro4.over.chain.gz: OK
    md5sum: hg19ToPseHum1.over.chain.gz: No such file or directory
    hg19ToPseHum1.over.chain.gz: FAILED open or read
    md5sum: hg19ToGCA_021951015.1.over.chain.gz: No such file or directory
    hg19ToGCA_021951015.1.over.chain.gz: FAILED open or read
    hg19ToOviAri3.over.chain.gz: OK
    hg19ToSpeTri2.over.chain.gz: OK
    hg19ToDasNov3.over.chain.gz: OK
    md5sum: hg19ToAstMex1.over.chain.gz: No such file or directory
    hg19ToAstMex1.over.chain.gz: FAILED open or read
    hg19ToEriEur2.over.chain.gz: OK
    md5sum: hg19ToAllSin1.over.chain.gz: No such file or directory
    hg19ToAllSin1.over.chain.gz: FAILED open or read
    hg19ToRheMac8.over.chain.gz: OK
    hg19ToOchPri3.over.chain.gz: OK
    md5sum: hg19ToOctDeg1.over.chain.gz: No such file or directory
    hg19ToOctDeg1.over.chain.gz: FAILED open or read
    md5sum: hg19ToChrAsi1.over.chain.gz: No such file or directory
    hg19ToChrAsi1.over.chain.gz: FAILED open or read
    md5sum: hg19ToPhyCat1.over.chain.gz: No such file or directory
    hg19ToPhyCat1.over.chain.gz: FAILED open or read
    md5sum: hg19ToXenTro7.over.chain.gz: No such file or directory
    hg19ToXenTro7.over.chain.gz: FAILED open or read
    hg19ToCalJac1.over.chain.gz: OK
    md5sum: hg19ToTupChi1.over.chain.gz: No such file or directory
    hg19ToTupChi1.over.chain.gz: FAILED open or read
    hg19ToHg38.over.chain.gz: OK
    hg19ToMicMur1.over.chain.gz: OK
    md5sum: hg19ToCheMyd1.over.chain.gz: No such file or directory
    hg19ToCheMyd1.over.chain.gz: FAILED open or read
    hg19ToCerSim1.over.chain.gz: OK
    md5sum: hg19ToPteAle1.over.chain.gz: No such file or directory
    hg19ToPteAle1.over.chain.gz: FAILED open or read
    md5sum: hg19ToPanTig1.over.chain.gz: No such file or directory
    hg19ToPanTig1.over.chain.gz: FAILED open or read
    hg19ToTetNig2.over.chain.gz: OK
    hg19ToMacFas5.over.chain.gz: OK
    hg19ToSusScr2.over.chain.gz: OK
    md5sum: hg19ToGorGor6.over.chain.gz: No such file or directory
    hg19ToGorGor6.over.chain.gz: FAILED open or read
    md5sum: hg19ToMusFur1.over.chain.gz: No such file or directory
    hg19ToMusFur1.over.chain.gz: FAILED open or read
    md5sum: hg19ToMesAur1.over.chain.gz: No such file or directory
    hg19ToMesAur1.over.chain.gz: FAILED open or read
    md5sum: hg19ToVicPac2.over.chain.gz: No such file or directory
    hg19ToVicPac2.over.chain.gz: FAILED open or read
    md5sum: hg19ToColLiv1.over.chain.gz: No such file or directory
    hg19ToColLiv1.over.chain.gz: FAILED open or read
    hg19ToMelGal1.over.chain.gz: OK
    md5sum: hg19ToMm39.over.chain.gz: No such file or directory
    hg19ToMm39.over.chain.gz: FAILED open or read
    md5sum: hg19ToHs1.over.chain.gz: No such file or directory
    hg19ToHs1.over.chain.gz: FAILED open or read
    md5sum: hg19ToAmaVit1.over.chain.gz: No such file or directory
    hg19ToAmaVit1.over.chain.gz: FAILED open or read
    hg19ToRheMac10.over.chain.gz: OK
    md5sum: hg19ToApaSpi1.over.chain.gz: No such file or directory
    hg19ToApaSpi1.over.chain.gz: FAILED open or read
    hg19ToNomLeu1.over.chain.gz: OK
    hg19ToEchTel1.over.chain.gz: OK
    hg19ToAnoCar2.over.chain.gz: OK
    md5sum: hg19ToXipMac1.over.chain.gz: No such file or directory
    hg19ToXipMac1.over.chain.gz: FAILED open or read
    md5sum: hg19ToLepOcu1.over.chain.gz: No such file or directory
    hg19ToLepOcu1.over.chain.gz: FAILED open or read
    md5sum: hg19ToFr3.over.chain.gz: No such file or directory
    hg19ToFr3.over.chain.gz: FAILED open or read
    md5sum: hg19ToTriMan1.over.chain.gz: No such file or directory
    hg19ToTriMan1.over.chain.gz: FAILED open or read
    hg19ToPanTro5.over.chain.gz: OK
    md5sum: hg19ToAllMis0.over.chain.gz: No such file or directory
    hg19ToAllMis0.over.chain.gz: FAILED open or read
    md5sum: hg19ToHapBur1.over.chain.gz: No such file or directory
    hg19ToHapBur1.over.chain.gz: FAILED open or read
    md5sum: hg19ToPunNye1.over.chain.gz: No such file or directory
    hg19ToPunNye1.over.chain.gz: FAILED open or read
    md5sum: hg19ToConCri1.over.chain.gz: No such file or directory
    hg19ToConCri1.over.chain.gz: FAILED open or read
    hg19ToPanTro6.over.chain.gz: OK
    hg19ToRheMac3.over.chain.gz: FAILED
    hg19ToDanRer6.over.chain.gz: OK
    md5sum: hg19ToHetGla2.over.chain.gz: No such file or directory
    hg19ToHetGla2.over.chain.gz: FAILED open or read
    hg19ToPanTro3.over.chain.gz: OK
    hg19ToPanTro3.over.chain.gz: OK
    md5sum: hg19ToCamFer1.over.chain.gz: No such file or directory
    hg19ToCamFer1.over.chain.gz: FAILED open or read
    md5sum: hg19ToAnaPla1.over.chain.gz: No such file or directory
    hg19ToAnaPla1.over.chain.gz: FAILED open or read
    md5sum: hg19ToOrcOrc1.over.chain.gz: No such file or directory
    hg19ToOrcOrc1.over.chain.gz: FAILED open or read
    md5sum: hg19ToFicAlb2.over.chain.gz: No such file or directory
    hg19ToFicAlb2.over.chain.gz: FAILED open or read
    md5sum: hg19ToPanHod1.over.chain.gz: No such file or directory
    hg19ToPanHod1.over.chain.gz: FAILED open or read
    hg19ToGorGor5.over.chain.gz: OK
    hg19ToXenTro3.over.chain.gz: OK
    md5sum: hg19ToLepWed1.over.chain.gz: No such file or directory
    hg19ToLepWed1.over.chain.gz: FAILED open or read
    hg19ToRn6.over.chain.gz: OK
    hg19ToAllMis1.over.chain.gz: OK
    hg19ToAilMel1.over.chain.gz: OK
    hg19ToChlSab1.over.chain.gz: OK
    hg19ToBosTau6.over.chain.gz: OK
    hg19ToPanPan2.over.chain.gz: OK
    hg19ToPonAbe2.over.chain.gz: OK
    md5sum: hg19ToFalPer1.over.chain.gz: No such file or directory
    hg19ToFalPer1.over.chain.gz: FAILED open or read
    md5sum: hg19ToCapHir1.over.chain.gz: No such file or directory
    hg19ToCapHir1.over.chain.gz: FAILED open or read
    hg19ToPanTro2.over.chain.gz: OK
    hg19ToOryCun2.over.chain.gz: OK
    hg19ToEchTel2.over.chain.gz: OK
    hg19ToPetMar2.over.chain.gz: OK
    hg19ToSarHar1.over.chain.gz: OK
    md5sum: hg19ToMacEug2.over.chain.gz: No such file or directory
    hg19ToMacEug2.over.chain.gz: FAILED open or read
    hg19ToCriGri1.over.chain.gz: OK
    hg19ToDanRer7.over.chain.gz: OK
    md5sum: hg19ToGalGal6.over.chain.gz: No such file or directory
    hg19ToGalGal6.over.chain.gz: FAILED open or read
    hg19ToTarSyr1.over.chain.gz: OK
    md5sum: hg19ToMelUnd1.over.chain.gz: No such file or directory
    hg19ToMelUnd1.over.chain.gz: FAILED open or read
    hg19ToGorGor1.over.chain.gz: OK
    hg19ToMyoLuc2.over.chain.gz: OK
    md5sum: hg19ToGCA_021950905.1.over.chain.gz: No such file or directory
    hg19ToGCA_021950905.1.over.chain.gz: FAILED open or read
    hg19ToHg18.over.chain.gz: OK
    hg19ToSusScr11.over.chain.gz: OK
    md5sum: hg19ToChiLan1.over.chain.gz: No such file or directory
    hg19ToChiLan1.over.chain.gz: FAILED open or read
    md5sum: hg19ToLipVex1.over.chain.gz: No such file or directory
    hg19ToLipVex1.over.chain.gz: FAILED open or read
    hg19ToNomLeu3.over.chain.gz: OK
    hg19ToRn5.over.chain.gz: OK
    md5sum: hg19ToAplCal1.over.chain.gz: No such file or directory
    hg19ToAplCal1.over.chain.gz: FAILED open or read
    hg19ToOviAri1.over.chain.gz: OK
    md5sum: hg19ToFalChe1.over.chain.gz: No such file or directory
    hg19ToFalChe1.over.chain.gz: FAILED open or read
    md5sum: hg19ToPanPan1.over.chain.gz: No such file or directory
    hg19ToPanPan1.over.chain.gz: FAILED open or read
    hg19ToGCF_002742125.1.over.chain.gz: OK
    hg19ToGCF_017639785.1.over.chain.gz: OK
    md5sum: hg19ToChrPic1.over.chain.gz: No such file or directory
    hg19ToChrPic1.over.chain.gz: FAILED open or read
    md5sum: hg19ToLatCha1.over.chain.gz: No such file or directory
    hg19ToLatCha1.over.chain.gz: FAILED open or read
    hg19ToRheMac2.over.chain.gz: OK
    md5sum: hg19ToMicOch1.over.chain.gz: No such file or directory
    hg19ToMicOch1.over.chain.gz: FAILED open or read
    hg19ToBalAcu1.over.chain.gz: OK
    hg19ToBosTau8.over.chain.gz: OK
    hg19ToPapAnu2.over.chain.gz: OK
    md5sum: hg19ToOryAfe1.over.chain.gz: No such file or directory
    hg19ToOryAfe1.over.chain.gz: FAILED open or read
    md5sum: hg19ToGadMor1.over.chain.gz: No such file or directory
    hg19ToGadMor1.over.chain.gz: FAILED open or read
    hg19ToFelCat4.over.chain.gz: OK
    hg19ToPapHam1.over.chain.gz: OK
    hg19ToOtoGar1.over.chain.gz: OK
    md5sum: hg19ToMyoDav1.over.chain.gz: No such file or directory
    hg19ToMyoDav1.over.chain.gz: FAILED open or read
    md5sum: hg19ToSusScr1.over.chain.gz: No such file or directory
    hg19ToSusScr1.over.chain.gz: FAILED open or read
    md5sum: hg19ToOreNil2.over.chain.gz: No such file or directory
    hg19ToOreNil2.over.chain.gz: FAILED open or read
    hg19ToCanFam3.over.chain.gz: OK
    md5sum: hg19ToPelSin1.over.chain.gz: No such file or directory
    hg19ToPelSin1.over.chain.gz: FAILED open or read
    hg19ToPonAbe3.over.chain.gz: OK
    hg19ToSorAra2.over.chain.gz: OK
    hg19ToSaiBol1.over.chain.gz: OK
    md5sum: hg19ToGCA_009914755.4.over.chain.gz: No such file or directory
    hg19ToGCA_009914755.4.over.chain.gz: FAILED open or read
    hg19ToCalJac3.over.chain.gz: OK
    md5sum: hg19ToMayZeb1.over.chain.gz: No such file or directory
    hg19ToMayZeb1.over.chain.gz: FAILED open or read
    hg19ToBosTau7.over.chain.gz: OK
    hg19ToSusScr3.over.chain.gz: OK
    md5sum: hg19ToNeoBri1.over.chain.gz: No such file or directory
    hg19ToNeoBri1.over.chain.gz: FAILED open or read
    md5sum: hg19ToZonAlb1.over.chain.gz: No such file or directory
    hg19ToZonAlb1.over.chain.gz: FAILED open or read
    hg19ToTaeGut2.over.chain.gz: OK
    md5sum: WARNING: 70 listed files could not be read
    md5sum: WARNING: 1 computed checksum did NOT match

The file that did not match: hg19ToRheMac3.over.chain.gz: FAILED
This file can be gunzipped without error.

    for F in hg19ToRheMac3.over.chain.gz ; do 
        gunzip -c $F > /dev/null && echo "$F gunzip is clean" || echo ">>>>> $F gunzip had errors <<<<<"
    done


#### UCSC/mm10/

The `.../mm10/md5sum.txt` includes too many:

    mm10ToOrnAna1.over.chain.gz: OK
    mm10ToGadMor1.over.chain.gz: OK
    mm10ToPonAbe3.over.chain.gz: OK
    mm10ToNeoSch1.over.chain.gz: OK
    mm10ToPonAbe2.over.chain.gz: OK
    mm10ToOtoGar3.over.chain.gz: OK
    mm10ToXenLae2.over.chain.gz: OK
    md5sum: mm10ToAmbMex1.over.chain.gz: No such file or directory
    mm10ToAmbMex1.over.chain.gz: FAILED open or read
    mm10ToBosTau8.over.chain.gz: OK
    mm10ToEquCab3.over.chain.gz: OK
    mm10ToCavApe1.over.chain.gz: OK
    mm10ToSorAra1.over.chain.gz: OK
    mm10ToLoxAfr3.over.chain.gz: OK
    mm10ToTupBel1.over.chain.gz: OK
    mm10ToBosTau9.over.chain.gz: OK
    mm10ToCanFam6.over.chain.gz: OK
    mm10ToFr3.over.chain.gz: OK
    mm10ToSarHar1.over.chain.gz: OK
    mm10ToXenTro10.over.chain.gz: OK
    mm10ToSusScr3.over.chain.gz: OK
    mm10ToTriMan1.over.chain.gz: OK
    mm10ToTetNig2.over.chain.gz: OK
    mm10ToPanTro3.over.chain.gz: OK
    mm10ToSaiBol1.over.chain.gz: OK
    md5sum: mm10ToRegenCho1.over.chain.gz: No such file or directory
    mm10ToRegenCho1.over.chain.gz: FAILED open or read
    mm10ToTurTru2.over.chain.gz: OK
    mm10ToOviAri1.over.chain.gz: OK
    mm10ToPanTro6.over.chain.gz: OK
    mm10ToFelCat9.over.chain.gz: OK
    mm10ToMelGal5.over.chain.gz: OK
    mm10ToCanFam5.over.chain.gz: OK
    mm10ToEulMac1.over.chain.gz: OK
    mm10ToManPen1.over.chain.gz: OK
    mm10ToGCF_011764305.1.over.chain.gz: OK
    mm10ToPapAnu4.over.chain.gz: OK
    mm10ToOreNil1.over.chain.gz: OK
    mm10ToCanFam4.over.chain.gz: OK
    mm10ToEchTel1.over.chain.gz: OK
    mm10ToEulFla1.over.chain.gz: OK
    mm10ToCerAty1.over.chain.gz: OK
    mm10ToNomLeu2.over.chain.gz: OK
    mm10ToXenTro3.over.chain.gz: OK
    mm10ToEquCab2.over.chain.gz: OK
    mm10ToThaSir1.over.chain.gz: OK
    mm10ToBisBis1.over.chain.gz: OK
    mm10ToPteVam1.over.chain.gz: OK
    mm10ToCasCan1.over.chain.gz: OK
    mm10ToProCap1.over.chain.gz: OK
    mm10ToOryLat2.over.chain.gz: OK
    mm10ToPetMar1.over.chain.gz: OK
    mm10ToCalJac4.over.chain.gz: OK
    mm10ToGCA_001624865.1_SPRET_EiJ_v1.over.chain.gz: OK
    mm10ToGCA_001624675.1.over.chain.gz: OK
    mm10ToRn5.over.chain.gz: OK
    mm10ToMicMur1.over.chain.gz: OK
    mm10ToDanRer11.over.chain.gz: OK
    mm10ToMicOch1.over.chain.gz: OK
    mm10ToXenTro9.over.chain.gz: OK
    mm10ToRheMac3.over.chain.gz: OK
    mm10ToPapAnu3.over.chain.gz: OK
    mm10ToMicMur3.over.chain.gz: OK
    mm10ToPelSin1.over.chain.gz: OK
    mm10ToOchPri2.over.chain.gz: OK
    mm10ToBalAcu1.over.chain.gz: OK
    mm10ToPetMar2.over.chain.gz: OK
    mm10ToMelGal1.over.chain.gz: OK
    mm10ToFukDam1.over.chain.gz: OK
    mm10ToGCA_001632575.1.over.chain.gz: OK
    mm10ToDasNov2.over.chain.gz: OK
    mm10ToGCF_028885655.1.over.chain.gz: OK
    mm10ToHetGla2.over.chain.gz: OK
    mm10ToMacNem1.over.chain.gz: OK
    mm10ToGCF_900094665.1.over.chain.gz: OK
    mm10ToRheMac2.over.chain.gz: OK
    mm10ToGorGor6.over.chain.gz: OK
    mm10ToFelCat5.over.chain.gz: OK
    mm10ToMyoLuc2.over.chain.gz: OK
    mm10ToChrPic1.over.chain.gz: OK
    md5sum: mm10ToOrnAna2.over.chain.gz: No such file or directory
    mm10ToOrnAna2.over.chain.gz: FAILED open or read
    mm10ToGCF_000349665.1.over.chain.gz: OK
    mm10ToGalVar1.over.chain.gz: OK
    mm10ToSorAra2.over.chain.gz: OK
    md5sum: mm10ToCotJap2.over.chain.gz: No such file or directory
    mm10ToCotJap2.over.chain.gz: FAILED open or read
    mm10ToGeoFor1.over.chain.gz: OK
    mm10ToGCF_028858775.1.over.chain.gz: OK
    mm10ToCriGriChoV1.over.chain.gz: OK
    mm10ToGorGor3.over.chain.gz: OK
    mm10ToCanFam3.over.chain.gz: OK
    mm10ToBosTau7.over.chain.gz: OK
    mm10ToOrcOrc1.over.chain.gz: OK
    md5sum: mm10ToRegenRn0.over.chain.gz: No such file or directory
    mm10ToRegenRn0.over.chain.gz: FAILED open or read
    mm10ToHg19.over.chain.gz: OK
    mm10ToDipOrd2.over.chain.gz: OK
    md5sum: mm10ToRegenRn1.over.chain.gz: No such file or directory
    mm10ToRegenRn1.over.chain.gz: FAILED open or read
    mm10ToRheMac8.over.chain.gz: OK
    mm10ToTurTru1.over.chain.gz: OK
    mm10ToEchTel2.over.chain.gz: OK
    mm10ToTarSyr2.over.chain.gz: OK
    mm10ToPetMar3.over.chain.gz: OK
    mm10ToOviAri4.over.chain.gz: OK
    mm10ToGCF_002742125.1.over.chain.gz: OK
    mm10ToDanRer7.over.chain.gz: OK
    mm10ToChoHof1.over.chain.gz: OK
    mm10ToEriEur1.over.chain.gz: OK
    mm10ToGorGor5.over.chain.gz: OK
    mm10ToHg38.over.chain.gz: OK
    mm10ToMelUnd1.over.chain.gz: OK
    mm10ToRn6.over.chain.gz: OK
    mm10ToDipOrd1.over.chain.gz: OK
    mm10ToLatCha1.over.chain.gz: OK
    mm10ToSpeTri2.over.chain.gz: OK
    mm10ToPanPan3.over.chain.gz: OK
    mm10ToTupChi1.over.chain.gz: OK
    mm10ToAilMel1.over.chain.gz: OK
    mm10ToFelCat4.over.chain.gz: OK
    mm10ToGCA_001624535.1.over.chain.gz: OK
    mm10ToGCF_029281585.1.over.chain.gz: OK
    mm10ToCalJac3.over.chain.gz: OK
    mm10ToRheMac10.over.chain.gz: OK
    mm10ToPanPan2.over.chain.gz: OK
    mm10ToGalGal6.over.chain.gz: OK
    mm10ToPanTro4.over.chain.gz: OK
    mm10ToVicPac1.over.chain.gz: OK
    mm10ToAquChr2.over.chain.gz: OK
    mm10ToCriGriChoV2.over.chain.gz: OK
    mm10ToEnhLutNer1.over.chain.gz: OK
    mm10ToColAng1.over.chain.gz: OK
    mm10ToManLeu1.over.chain.gz: OK
    mm10ToDanRer10.over.chain.gz: OK
    mm10ToGalGal4.over.chain.gz: OK
    mm10ToGCF_900095145.1.over.chain.gz: OK
    mm10ToVicPac2.over.chain.gz: OK
    mm10ToTaeGut1.over.chain.gz: OK
    mm10ToMm9.over.chain.gz: OK
    mm10ToGCA_001624445.1.over.chain.gz: OK
    mm10ToProCoq1.over.chain.gz: OK
    mm10ToGCF_016699485.2.over.chain.gz: OK
    mm10ToFicAlb1.over.chain.gz: OK
    mm10ToBosTau6.over.chain.gz: OK
    mm10ToGCA_001624185.1.over.chain.gz: OK
    mm10ToOreNil2.over.chain.gz: OK
    mm10ToHetGla1.over.chain.gz: OK
    mm10ToRn7.over.chain.gz: OK
    mm10ToAotNan1.over.chain.gz: OK
    mm10ToOreNil3.over.chain.gz: OK
    mm10ToSusScr11.over.chain.gz: OK
    mm10ToPanTro5.over.chain.gz: OK
    mm10ToMonDom5.over.chain.gz: OK
    mm10ToTarSyr1.over.chain.gz: OK
    mm10ToPapHam1.over.chain.gz: OK
    mm10ToCerSim1.over.chain.gz: OK
    mm10ToChrPic2.over.chain.gz: OK
    mm10ToNomLeu1.over.chain.gz: OK
    mm10ToCriGri1.over.chain.gz: OK
    mm10ToGalGal5.over.chain.gz: OK
    mm10ToMacEug2.over.chain.gz: OK
    mm10ToAnoCar2.over.chain.gz: OK
    mm10ToRn4.over.chain.gz: OK
    mm10ToGCA_901343595v1_MONAX5.over.chain.gz: OK
    md5sum: mm10ToHs1.over.chain.gz: No such file or directory
    mm10ToHs1.over.chain.gz: FAILED open or read
    mm10ToDasNov3.over.chain.gz: OK
    mm10ToGCF_017639785.1.over.chain.gz: OK
    mm10ToOviAri3.over.chain.gz: OK
    mm10ToSusScr2.over.chain.gz: OK
    md5sum: mm10ToPteAle1.over.chain.gz: No such file or directory
    mm10ToPteAle1.over.chain.gz: FAILED open or read
    mm10ToOryCun2.over.chain.gz: OK
    mm10ToCebCap1.over.chain.gz: OK
    mm10ToGasAcu1.over.chain.gz: OK
    mm10ToCavPor3.over.chain.gz: OK
    md5sum: WARNING: 8 listed files could not be read

But, fortunately, all matched.

### Ensembl chain files

<pre>
Ensembl chain files

Human to Human: ftp://ftp.ensembl.org/pub/assembly_mapping/homo_sapiens/

Mouse to Mouse: ftp://ftp.ensembl.org/pub/assembly_mapping/mus_musculus/

Other organisms: ftp://ftp.ensembl.org/pub/assembly_mapping/
</pre>

The human and mouse chain files are just subdirectories, so slurm up the whole base directory.

Script this up with:

    source /sw/bioinfo/CrossMap/SOURCEME_CrossMap_0.6.6
    cd $TOOLDIR
    mkdir external-chain-files
    cd external-chain-files

    # Ensembl chain files

    mkdir -p Ensembl
    cd Ensembl

    BASEURL=ftp://ftp.ensembl.org/pub/assembly_mapping

    echo "mirror -P 2 $BASEURL ." | lftp

This leaves off the intervening `assembly_mapping/` subdirectory. Also, all
files are downloaded with execute permission, none need it so remove.

    find . -type f -exec chmod -x {} \;


From the README, 

    "**This data was last dumped for release 76 (August 2014)**"

and

    - Cow
      - Btau4.0 -> UMD3.1
      - UMD3.1 -> Btau4.0
    - Dog
      - BROADD2 -> CanFam3.1
      - CanFam3.1 -> BROADD2
    - Human
      - NCBI34 -> GRCh37, GRCh38
      - NCBI35 -> GRCh37, GRCh38
      - NCBI36 -> GRCh37, GRCh38
      - GRCh37 -> NCBI34, NCBI35, NCBI36, GRCh38
      - GRCh38 -> NCBI34, NCBI35, NCBI36, GRCh37
    - Mouse
      - NCBIM36 -> GRCm38
      - NCBIM37 -> GRCm38
      - GRCm38 -> NCBIM36, NCBIM37
    - Pig
      - Sscrofa9 -> Sscrofa10.2
      - Sscrofa10.2 -> Sscrofa9
    - Rat
      - RGSC3.4 -> Rnor5.0
      - Rnor5.0 -> RGSC3.4
    - Yeast
      - EF1 -> R64-1-1
      - EF2 -> R64-1-1
      - EF3 -> R64-1-1
      - R64-1-1 -> EF1, EF2, EF3

Check checksums, save result in `CHECKSUMS.check`.

    for D in * ; do
        ( cd $D && md5sum -c CHECKSUMS | tee CHECKSUMS.check )
    done

All checksums OK:

    Btau_4.0_to_UMD3.1.chain.gz: OK
    UMD3.1_to_Btau_4.0.chain.gz: OK
    BROADD2_to_CanFam3.1.chain.gz: OK
    CanFam3.1_to_BROADD2.chain.gz: OK
    GRCh37_to_GRCh38.chain.gz: OK
    GRCh37_to_NCBI34.chain.gz: OK
    GRCh37_to_NCBI35.chain.gz: OK
    GRCh37_to_NCBI36.chain.gz: OK
    GRCh38_to_GRCh37.chain.gz: OK
    GRCh38_to_NCBI34.chain.gz: OK
    GRCh38_to_NCBI35.chain.gz: OK
    GRCh38_to_NCBI36.chain.gz: OK
    NCBI34_to_GRCh37.chain.gz: OK
    NCBI34_to_GRCh38.chain.gz: OK
    NCBI35_to_GRCh37.chain.gz: OK
    NCBI35_to_GRCh38.chain.gz: OK
    NCBI36_to_GRCh37.chain.gz: OK
    NCBI36_to_GRCh38.chain.gz: OK
    GRCm38_to_NCBIM36.chain.gz: OK
    GRCm38_to_NCBIM37.chain.gz: OK
    NCBIM36_to_GRCm38.chain.gz: OK
    NCBIM37_to_GRCm38.chain.gz: OK
    RGSC3.4_to_Rnor_5.0.chain.gz: OK
    Rnor_5.0_to_RGSC3.4.chain.gz: OK
    EF1_to_R64-1-1.chain.gz: OK
    EF2_to_R64-1-1.chain.gz: OK
    EF3_to_R64-1-1.chain.gz: OK
    R64-1-1_to_EF1.chain.gz: OK
    R64-1-1_to_EF2.chain.gz: OK
    R64-1-1_to_EF3.chain.gz: OK
    Sscrofa10.2_to_Sscrofa9.chain.gz: OK
    Sscrofa9_to_Sscrofa10.2.chain.gz: OK
