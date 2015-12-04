    Newbler-install-README, douglas.scofield@ebc.uu.se

TITLE
=====

Newbler 2.9

DESCRIPTION
-----------

Assembly and analysis software by Roche for 454 data

WEBSITE
-------

    http://454.com/contact-us/software-request.asp

The request took 2 weeks to fill, and included a download site address with required
username and password.  In addition, a brief description of the files provided
was given:

> The package of 454 sequencing data analysis tools are currently developed to
> run on RedHat Linux version 4 or 5 and platforms running on 32-bit or 64-bit
> x86 architecture. Alternative Linux flavors may run but have not been tested
> and no guidance on installation can be provided.
>
> Files provided:
>
> DataAnalysis_2.9_All_20130530_1559.tgz
>
> 32 bit and 64 bit installer for GS Reference Mapper, GS De Novo Assembler, GS
> Amplicon Variant Analyzer, and SFFtools.
>
> USM-00058.09_454SeqSys_SWManual-v2.9_Overview.pdf
> USM-00058.09_454SeqSys_SWManual-v2.9_PartB.pdf
> USM-00058.09_454SeqSys_SWManual-v2.9_PartC.pdf
> USM-00058.09_454SeqSys_SWManual-v2.9_PartD.pdf
>
> Please note that the Data Analysis tools are provided at no charge via FTP
> and as such do not include any technical support. Please refer to the
> included documentation for all usage information and an extensive discussion
> of the methods employed by the software.

The documentation is available in the doc/ directory.

MODULE REQUIREMENTS
-------------------

Simply add /sw/apps/bioinfo/roche/DataAnalysis/2.9/bin to the user's PATH.

LOG
---

The package has its own setup.sh which wanted to use X11; I provided the
--nox11 option, but a subprocess wanted X and ignored my request.

The X libraries it wanted (GTK and/or Pango, looks like, though it's been years
since I was familiar with X) were not available on kalkyl, so I unpacked it on
another linux machine I have root access on, guided the install GUI through its
steps giving an install directory identical in name to the install directory on
Uppmax, to try to ensure that any embedded paths etc. would still work after
moving everything to kalkyl.  The binaries are generic x86_64 so worked on
either machine and should work on milou as well.

Uppmax users are probably going to want the command-line interface, not the X versions
of the tools, but there was no way to get CLI without X.

The installation produced the following log file:

    cat /tmp/Install_DataAnalysis_2.9_11_Nov_2013_1714.log

~~~~
Installation started at 11/11/13 17:14:24

User: uid=1034(doug) gid=1011(doug) groups=1011(doug),4(adm),114(admin),117(sambashare),1013(datashare),1027(scilife),1028(aspseq)

Hostname: aspseq.fysbot.umu.se

=============================
[17:14:24] cd /home/doug/DataAnalysis_2.9_All; md5sum -c checksum_inst

./setup.sh: OK
./README: OK
./packages/gsNewbler-2.9-1.x86_64.rpm: OK
./packages/amplicons_CLI_2.9.i686.tgz: OK
./packages/jre-linux-i586-oracle-2.9-1.i386.rpm: OK
./packages/gsNewbler-2.9-1.i686.rpm: OK
./packages/gsAssembler-2.9-1.noarch.rpm: OK
./packages/gsSeqTools-2.9-1.x86_64.rpm: OK
./packages/gsAmplicons-2.9-1.noarch.rpm: OK
./packages/gsSeqTools-2.9-1.i686.rpm: OK
./packages/gsMapper-2.9-1.noarch.rpm: OK
=============================

=============================
[17:14:24] installRpm.sh /home/doug/DataAnalysis_2.9_All/packages/jre-linux-i586-oracle-2.9-1.i386.rpm  /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/jre /sw/apps/bioinfo/roche/DataAnalysis/2.9 other   --force  --relocate /opt/454/apps/jre/jre1.6.0_30=/

installRpm.sh: Installing: (/home/doug/DataAnalysis_2.9_All/packages/jre-linux-i586-oracle-2.9-1.i386.rpm) to: (/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/jre) as: (doug).
/tmp/selfgz1182812353/files_extra/star.x86_64: 5684 blocks + 0 bytes (total of 58204160 bytes = 56840.00k).
installRpm.sh: Relocating ./opt/454/apps/jre/jre1.6.0_30 to ./ in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/jre
installRpm.sh: ./opt/454/apps/jre/jre1.6.0_30 --> ./
`./opt/454/apps/jre/jre1.6.0_30' -> `./jre1.6.0_30'
down to current, done.
=============================

=============================
[17:14:54] installRpm.sh /home/doug/DataAnalysis_2.9_All/packages/gsSeqTools-2.9-1.x86_64.rpm  /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools /sw/apps/bioinfo/roche/DataAnalysis/2.9 other   --force  --relocate /opt/454/apps/gsSeqTools/bin=/bin --relocate /opt/454/apps/gsSeqTools/config=/config

installRpm.sh: Installing: (/home/doug/DataAnalysis_2.9_All/packages/gsSeqTools-2.9-1.x86_64.rpm) to: (/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools) as: (doug).
/tmp/selfgz1182812353/files_extra/star.x86_64: 3846 blocks + 3584 bytes (total of 39386624 bytes = 38463.50k).
installRpm.sh: Relocating ./opt/454/apps/gsSeqTools/bin to ./bin in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools
installRpm.sh: ./opt/454/apps/gsSeqTools/bin --> ./bin
`./opt/454/apps/gsSeqTools/bin' -> `./bin'
installRpm.sh: Relocating ./opt/454/apps/gsSeqTools/config to ./config in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools
installRpm.sh: ./opt/454/apps/gsSeqTools/config --> ./config
`./opt/454/apps/gsSeqTools/config' -> `./config'
down to current, done.
`./fnafile' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/bin/fnafile'
`./gsReadCluster' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/bin/gsReadCluster'
`./sff2scf' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/bin/sff2scf'
`./sfffile' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/bin/sfffile'
`./sffinfo' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/bin/sffinfo'
`./sffrescore' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/bin/sffrescore'
=============================

=============================
[17:14:55] installRpm.sh /home/doug/DataAnalysis_2.9_All/packages/gsAssembler-2.9-1.noarch.rpm  /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsAssembler /sw/apps/bioinfo/roche/DataAnalysis/2.9 other   --force  --relocate /opt/454/apps/assembly/bin=/bin   --relocate /opt/454/apps/assembly/config=/config   --relocate /opt/454/apps/assembly/lib=/lib   --relocate /opt/454/apps/assembly/libexec=/libexec    --relocate /opt/454/apps/assembly/share=/share

installRpm.sh: Installing: (/home/doug/DataAnalysis_2.9_All/packages/gsAssembler-2.9-1.noarch.rpm) to: (/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsAssembler) as: (doug).
/tmp/selfgz1182812353/files_extra/star.x86_64: 663 blocks + 9216 bytes (total of 6798336 bytes = 6639.00k).
installRpm.sh: Relocating ./opt/454/apps/assembly/bin to ./bin in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsAssembler
installRpm.sh: ./opt/454/apps/assembly/bin --> ./bin
`./opt/454/apps/assembly/bin' -> `./bin'
installRpm.sh: Relocating ./opt/454/apps/assembly/config to ./config in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsAssembler
installRpm.sh: ./opt/454/apps/assembly/config --> ./config
`./opt/454/apps/assembly/config' -> `./config'
installRpm.sh: Relocating ./opt/454/apps/assembly/lib to ./lib in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsAssembler
installRpm.sh: ./opt/454/apps/assembly/lib --> ./lib
`./opt/454/apps/assembly/lib' -> `./lib'
installRpm.sh: Relocating ./opt/454/apps/assembly/libexec to ./libexec in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsAssembler
installRpm.sh: ./opt/454/apps/assembly/libexec --> ./libexec
`./opt/454/apps/assembly/libexec' -> `./libexec'
installRpm.sh: Relocating ./opt/454/apps/assembly/share to ./share in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsAssembler
installRpm.sh: ./opt/454/apps/assembly/share --> ./share
`./opt/454/apps/assembly/share' -> `./share'
down to current, done.
installRpm.sh: Relocating directory: gsAssembler -> assembly
mkdir: created directory `assembly'
mkdir: created directory `assembly/config'
`gsAssembler/bin' -> `assembly/bin'
`gsAssembler/bin/gsAssembler' -> `assembly/bin/gsAssembler'
`gsAssembler/config/gsAssembler.vmoptions' -> `assembly/config/gsAssembler.vmoptions'
`gsAssembler/config/gsAssembler.log4j.properties' -> `assembly/config/gsAssembler.log4j.properties'
`gsAssembler/lib' -> `assembly/lib'
`gsAssembler/lib/assembly-2.9.one-jar.jar' -> `assembly/lib/assembly-2.9.one-jar.jar'
`gsAssembler/libexec' -> `assembly/libexec'
`gsAssembler/libexec/getVersions' -> `assembly/libexec/getVersions'
`gsAssembler/share' -> `assembly/share'
`gsAssembler/share/apps' -> `assembly/share/apps'
`gsAssembler/share/apps/gsAssembler' -> `assembly/share/apps/gsAssembler'
`gsAssembler/share/apps/gsAssembler/fourfivefour-roche.png' -> `assembly/share/apps/gsAssembler/fourfivefour-roche.png'
`gsAssembler/share/apps/gsAssembler/fourfivefour-apps.directory' -> `assembly/share/apps/gsAssembler/fourfivefour-apps.directory'
`gsAssembler/share/apps/gsAssembler/icons' -> `assembly/share/apps/gsAssembler/icons'
`gsAssembler/share/apps/gsAssembler/icons/64x64' -> `assembly/share/apps/gsAssembler/icons/64x64'
`gsAssembler/share/apps/gsAssembler/icons/64x64/fourfivefour-assembler.png' -> `assembly/share/apps/gsAssembler/icons/64x64/fourfivefour-assembler.png'
`gsAssembler/share/apps/gsAssembler/icons/32x32' -> `assembly/share/apps/gsAssembler/icons/32x32'
`gsAssembler/share/apps/gsAssembler/icons/32x32/fourfivefour-assembler.png' -> `assembly/share/apps/gsAssembler/icons/32x32/fourfivefour-assembler.png'
`gsAssembler/share/apps/gsAssembler/icons/128x128' -> `assembly/share/apps/gsAssembler/icons/128x128'
`gsAssembler/share/apps/gsAssembler/icons/128x128/fourfivefour-assembler.png' -> `assembly/share/apps/gsAssembler/icons/128x128/fourfivefour-assembler.png'
`gsAssembler/share/apps/gsAssembler/icons/48x48' -> `assembly/share/apps/gsAssembler/icons/48x48'
`gsAssembler/share/apps/gsAssembler/icons/48x48/fourfivefour-assembler.png' -> `assembly/share/apps/gsAssembler/icons/48x48/fourfivefour-assembler.png'
`gsAssembler/share/apps/gsAssembler/icons/24x24' -> `assembly/share/apps/gsAssembler/icons/24x24'
`gsAssembler/share/apps/gsAssembler/icons/24x24/fourfivefour-assembler.png' -> `assembly/share/apps/gsAssembler/icons/24x24/fourfivefour-assembler.png'
`gsAssembler/share/apps/gsAssembler/icons/16x16' -> `assembly/share/apps/gsAssembler/icons/16x16'
`gsAssembler/share/apps/gsAssembler/icons/16x16/fourfivefour-assembler.png' -> `assembly/share/apps/gsAssembler/icons/16x16/fourfivefour-assembler.png'
`gsAssembler/share/apps/gsAssembler/fourfivefour-gsAssembler.desktop' -> `assembly/share/apps/gsAssembler/fourfivefour-gsAssembler.desktop'
`gsAssembler/share/doc' -> `assembly/share/doc'
`gsAssembler/share/doc/NOTICE' -> `assembly/share/doc/NOTICE'
`gsAssembler/share/doc/LICENSE' -> `assembly/share/doc/LICENSE'
xfile: (/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/MIDConfig.parse)
`./MIDConfig.parse' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/MIDConfig.parse'
xfile: (/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/qualityScoreLookup_vxxlr.dat)
`./qualityScoreLookup_vxxlr.dat' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/qualityScoreLookup_vxxlr.dat'
xfile: (/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/qualityScoreLookup_flx.dat)
`./qualityScoreLookup_flx.dat' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/qualityScoreLookup_flx.dat'
xfile: (/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/qualityScoreLookup_xlr.dat)
`./qualityScoreLookup_xlr.dat' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/qualityScoreLookup_xlr.dat'
xfile: (/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/qualityScoreLookup_gs20.dat)
`./qualityScoreLookup_gs20.dat' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/qualityScoreLookup_gs20.dat'
xfile: (/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/qualityScoreLookup_xxlr.dat)
`./qualityScoreLookup_xxlr.dat' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/qualityScoreLookup_xxlr.dat'
`./gsAssembler' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/assembly/bin/gsAssembler'
=============================

=============================
[17:14:57] installRpm.sh /home/doug/DataAnalysis_2.9_All/packages/gsNewbler-2.9-1.x86_64.rpm  /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsNewbler /sw/apps/bioinfo/roche/DataAnalysis/2.9 other   --force  --relocate /opt/454/apps/mapper/bin=/bin     --relocate /opt/454/apps/mapper/config=/config     --relocate /opt/454/apps/mapper/lib=/lib     --relocate /opt/454/apps/mapper/libexec=/libexec      --relocate /opt/454/apps/mapper/share=/share

installRpm.sh: Installing: (/home/doug/DataAnalysis_2.9_All/packages/gsNewbler-2.9-1.x86_64.rpm) to: (/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsNewbler) as: (doug).
/tmp/selfgz1182812353/files_extra/star.x86_64: 5120 blocks + 0 bytes (total of 52428800 bytes = 51200.00k).
installRpm.sh: Relocating ./opt/454/apps/mapper/bin to ./bin in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsNewbler
installRpm.sh: ./opt/454/apps/mapper/bin --> ./bin
`./opt/454/apps/mapper/bin' -> `./bin'
down to current, done.
installRpm.sh: Relocating ./opt/454/apps/mapper/config to ./config in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsNewbler
installRpm.sh: Relocating ./opt/454/apps/mapper/lib to ./lib in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsNewbler
installRpm.sh: Relocating ./opt/454/apps/mapper/libexec to ./libexec in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsNewbler
installRpm.sh: Relocating ./opt/454/apps/mapper/share to ./share in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsNewbler
installRpm.sh: Relocating directory: gsNewbler -> mapper
mkdir: created directory `mapper'
`gsNewbler/bin' -> `mapper/bin'
`gsNewbler/bin/changeRef' -> `mapper/bin/changeRef'
`gsNewbler/bin/getProjAlignData' -> `mapper/bin/getProjAlignData'
`gsNewbler/bin/runAssembly' -> `mapper/bin/runAssembly'
`gsNewbler/bin/removeRun' -> `mapper/bin/removeRun'
`gsNewbler/bin/createProject' -> `mapper/bin/createProject'
`gsNewbler/bin/newMapping' -> `mapper/bin/newMapping'
`gsNewbler/bin/newbler' -> `mapper/bin/newbler'
`gsNewbler/bin/addRun' -> `mapper/bin/addRun'
`gsNewbler/bin/newAssembly' -> `mapper/bin/newAssembly'
`gsNewbler/bin/stopRun' -> `mapper/bin/stopRun'
`gsNewbler/bin/runMapping' -> `mapper/bin/runMapping'
`gsNewbler/bin/setRef' -> `mapper/bin/setRef'
`gsNewbler/bin/changeRun' -> `mapper/bin/changeRun'
`gsNewbler/bin/addSample' -> `mapper/bin/addSample'
`gsNewbler/bin/runProject' -> `mapper/bin/runProject'
`./addRun' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/addRun'
`./addSample' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/addSample'
`./changeRef' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/changeRef'
`./changeRun' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/changeRun'
`./createProject' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/createProject'
`./getProjAlignData' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/getProjAlignData'
`./newAssembly' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/newAssembly'
`./newbler' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/newbler'
`./newMapping' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/newMapping'
`./removeRun' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/removeRun'
`./runAssembly' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/runAssembly'
`./runMapping' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/runMapping'
`./runProject' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/runProject'
`./setRef' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/setRef'
`./stopRun' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/stopRun'
=============================

=============================
[17:14:59] installRpm.sh /home/doug/DataAnalysis_2.9_All/packages/gsAmplicons-2.9-1.noarch.rpm  /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsAmplicons /sw/apps/bioinfo/roche/DataAnalysis/2.9 other   --force  --relocate /opt/454/apps/amplicons/bin=/bin  --relocate /opt/454/apps/amplicons/config=/config  --relocate /opt/454/apps/amplicons/lib=/lib  --relocate /opt/454/apps/amplicons/libexec=/libexec   --relocate /opt/454/apps/amplicons/share=/share

installRpm.sh: Installing: (/home/doug/DataAnalysis_2.9_All/packages/gsAmplicons-2.9-1.noarch.rpm) to: (/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsAmplicons) as: (doug).
/tmp/selfgz1182812353/files_extra/star.x86_64: 813 blocks + 5632 bytes (total of 8330752 bytes = 8135.50k).
installRpm.sh: Relocating ./opt/454/apps/amplicons/bin to ./bin in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsAmplicons
installRpm.sh: ./opt/454/apps/amplicons/bin --> ./bin
`./opt/454/apps/amplicons/bin' -> `./bin'
installRpm.sh: Relocating ./opt/454/apps/amplicons/config to ./config in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsAmplicons
installRpm.sh: ./opt/454/apps/amplicons/config --> ./config
`./opt/454/apps/amplicons/config' -> `./config'
installRpm.sh: Relocating ./opt/454/apps/amplicons/lib to ./lib in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsAmplicons
installRpm.sh: ./opt/454/apps/amplicons/lib --> ./lib
`./opt/454/apps/amplicons/lib' -> `./lib'
installRpm.sh: Relocating ./opt/454/apps/amplicons/libexec to ./libexec in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsAmplicons
installRpm.sh: ./opt/454/apps/amplicons/libexec --> ./libexec
`./opt/454/apps/amplicons/libexec' -> `./libexec'
installRpm.sh: Relocating ./opt/454/apps/amplicons/share to ./share in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsAmplicons
installRpm.sh: ./opt/454/apps/amplicons/share --> ./share
`./opt/454/apps/amplicons/share' -> `./share'
down to current, done.
installRpm.sh: Relocating directory: gsAmplicons -> amplicons
mkdir: created directory `amplicons'
`gsAmplicons/bin' -> `amplicons/bin'
`gsAmplicons/bin/doAmplicon' -> `amplicons/bin/doAmplicon'
`gsAmplicons/bin/gsAmplicon' -> `amplicons/bin/gsAmplicon'
`gsAmplicons/config' -> `amplicons/config'
`gsAmplicons/config/log4j-cli.properties' -> `amplicons/config/log4j-cli.properties'
`gsAmplicons/config/doAmplicon.vmoptions' -> `amplicons/config/doAmplicon.vmoptions'
`gsAmplicons/config/gsAmplicon.vmoptions' -> `amplicons/config/gsAmplicon.vmoptions'
`gsAmplicons/config/log4j.properties' -> `amplicons/config/log4j.properties'
`gsAmplicons/config/lib' -> `amplicons/config/lib'
`gsAmplicons/config/lib/create454Extended_RLMIDs.ava' -> `amplicons/config/lib/create454Extended_RLMIDs.ava'
`gsAmplicons/config/lib/createPrototype_UniversalTailMultiplexer_454ExtendedMIDs.ava' -> `amplicons/config/lib/createPrototype_UniversalTailMultiplexer_454ExtendedMIDs.ava'
`gsAmplicons/config/lib/create454StandardMIDs.ava' -> `amplicons/config/lib/create454StandardMIDs.ava'
`gsAmplicons/config/lib/newProjectInit.ava' -> `amplicons/config/lib/newProjectInit.ava'
`gsAmplicons/config/lib/create454Standard_RLMIDs.ava' -> `amplicons/config/lib/create454Standard_RLMIDs.ava'
`gsAmplicons/config/lib/createPrototype_OneWayReadMultiplexer_454ExtendedMIDs.ava' -> `amplicons/config/lib/createPrototype_OneWayReadMultiplexer_454ExtendedMIDs.ava'
`gsAmplicons/config/lib/createBlueprints.ava' -> `amplicons/config/lib/createBlueprints.ava'
`gsAmplicons/config/lib/create454ExtendedMIDs.ava' -> `amplicons/config/lib/create454ExtendedMIDs.ava'
`gsAmplicons/config/lib/createPrototype_LigatedAdaptorMultiplexer_454ExtendedRLMIDs.ava' -> `amplicons/config/lib/createPrototype_LigatedAdaptorMultiplexer_454ExtendedRLMIDs.ava'
`gsAmplicons/config/help.config' -> `amplicons/config/help.config'
`gsAmplicons/lib' -> `amplicons/lib'
`gsAmplicons/lib/amplicons-2.9.one-jar.jar' -> `amplicons/lib/amplicons-2.9.one-jar.jar'
`gsAmplicons/libexec' -> `amplicons/libexec'
`gsAmplicons/libexec/getVersions' -> `amplicons/libexec/getVersions'
`gsAmplicons/share' -> `amplicons/share'
`gsAmplicons/share/apps' -> `amplicons/share/apps'
`gsAmplicons/share/apps/gsAmplicon' -> `amplicons/share/apps/gsAmplicon'
`gsAmplicons/share/apps/gsAmplicon/icons' -> `amplicons/share/apps/gsAmplicon/icons'
`gsAmplicons/share/apps/gsAmplicon/icons/64x64' -> `amplicons/share/apps/gsAmplicon/icons/64x64'
`gsAmplicons/share/apps/gsAmplicon/icons/64x64/fourfivefour-amplicons.png' -> `amplicons/share/apps/gsAmplicon/icons/64x64/fourfivefour-amplicons.png'
`gsAmplicons/share/apps/gsAmplicon/icons/32x32' -> `amplicons/share/apps/gsAmplicon/icons/32x32'
`gsAmplicons/share/apps/gsAmplicon/icons/32x32/fourfivefour-amplicons.png' -> `amplicons/share/apps/gsAmplicon/icons/32x32/fourfivefour-amplicons.png'
`gsAmplicons/share/apps/gsAmplicon/icons/128x128' -> `amplicons/share/apps/gsAmplicon/icons/128x128'
`gsAmplicons/share/apps/gsAmplicon/icons/128x128/fourfivefour-amplicons.png' -> `amplicons/share/apps/gsAmplicon/icons/128x128/fourfivefour-amplicons.png'
`gsAmplicons/share/apps/gsAmplicon/icons/48x48' -> `amplicons/share/apps/gsAmplicon/icons/48x48'
`gsAmplicons/share/apps/gsAmplicon/icons/48x48/fourfivefour-amplicons.png' -> `amplicons/share/apps/gsAmplicon/icons/48x48/fourfivefour-amplicons.png'
`gsAmplicons/share/apps/gsAmplicon/icons/24x24' -> `amplicons/share/apps/gsAmplicon/icons/24x24'
`gsAmplicons/share/apps/gsAmplicon/icons/24x24/fourfivefour-amplicons.png' -> `amplicons/share/apps/gsAmplicon/icons/24x24/fourfivefour-amplicons.png'
`gsAmplicons/share/apps/gsAmplicon/icons/16x16' -> `amplicons/share/apps/gsAmplicon/icons/16x16'
`gsAmplicons/share/apps/gsAmplicon/icons/16x16/fourfivefour-amplicons.png' -> `amplicons/share/apps/gsAmplicon/icons/16x16/fourfivefour-amplicons.png'
`gsAmplicons/share/apps/amplicons' -> `amplicons/share/apps/amplicons'
`gsAmplicons/share/apps/amplicons/fourfivefour-roche.png' -> `amplicons/share/apps/amplicons/fourfivefour-roche.png'
`gsAmplicons/share/apps/amplicons/fourfivefour-gsAmplicons.desktop' -> `amplicons/share/apps/amplicons/fourfivefour-gsAmplicons.desktop'
`gsAmplicons/share/apps/amplicons/fourfivefour-apps.directory' -> `amplicons/share/apps/amplicons/fourfivefour-apps.directory'
`gsAmplicons/share/doc' -> `amplicons/share/doc'
`gsAmplicons/share/doc/NOTICE' -> `amplicons/share/doc/NOTICE'
`gsAmplicons/share/doc/LICENSE' -> `amplicons/share/doc/LICENSE'
`./gsAmplicon' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/amplicons/bin/gsAmplicon'
`./doAmplicon' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/amplicons/bin/doAmplicon'
=============================

=============================
[17:15:01] installRpm.sh /home/doug/DataAnalysis_2.9_All/packages/gsMapper-2.9-1.noarch.rpm  /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsMapper /sw/apps/bioinfo/roche/DataAnalysis/2.9 other   --force  --relocate /opt/454/apps/mapper/bin=/bin     --relocate /opt/454/apps/mapper/config=/config     --relocate /opt/454/apps/mapper/lib=/lib     --relocate /opt/454/apps/mapper/libexec=/libexec      --relocate /opt/454/apps/mapper/share=/share

installRpm.sh: Installing: (/home/doug/DataAnalysis_2.9_All/packages/gsMapper-2.9-1.noarch.rpm) to: (/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsMapper) as: (doug).
/tmp/selfgz1182812353/files_extra/star.x86_64: 664 blocks + 4096 bytes (total of 6803456 bytes = 6644.00k).
installRpm.sh: Relocating ./opt/454/apps/mapper/bin to ./bin in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsMapper
installRpm.sh: ./opt/454/apps/mapper/bin --> ./bin
`./opt/454/apps/mapper/bin' -> `./bin'
installRpm.sh: Relocating ./opt/454/apps/mapper/config to ./config in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsMapper
installRpm.sh: ./opt/454/apps/mapper/config --> ./config
`./opt/454/apps/mapper/config' -> `./config'
installRpm.sh: Relocating ./opt/454/apps/mapper/lib to ./lib in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsMapper
installRpm.sh: ./opt/454/apps/mapper/lib --> ./lib
`./opt/454/apps/mapper/lib' -> `./lib'
installRpm.sh: Relocating ./opt/454/apps/mapper/libexec to ./libexec in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsMapper
installRpm.sh: ./opt/454/apps/mapper/libexec --> ./libexec
`./opt/454/apps/mapper/libexec' -> `./libexec'
installRpm.sh: Relocating ./opt/454/apps/mapper/share to ./share in /sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsMapper
installRpm.sh: ./opt/454/apps/mapper/share --> ./share
`./opt/454/apps/mapper/share' -> `./share'
down to current, done.
installRpm.sh: Relocating directory: gsMapper -> mapper
`gsMapper/bin/gsMapper' -> `mapper/bin/gsMapper'
`gsMapper/config' -> `mapper/config'
`gsMapper/config/gsMapper.log4j.properties' -> `mapper/config/gsMapper.log4j.properties'
`gsMapper/config/gsMapper.vmoptions' -> `mapper/config/gsMapper.vmoptions'
`gsMapper/lib' -> `mapper/lib'
`gsMapper/lib/assembly-2.9.one-jar.jar' -> `mapper/lib/assembly-2.9.one-jar.jar'
`gsMapper/libexec' -> `mapper/libexec'
`gsMapper/libexec/getVersions' -> `mapper/libexec/getVersions'
`gsMapper/share' -> `mapper/share'
`gsMapper/share/apps' -> `mapper/share/apps'
`gsMapper/share/apps/gsMapper' -> `mapper/share/apps/gsMapper'
`gsMapper/share/apps/gsMapper/fourfivefour-roche.png' -> `mapper/share/apps/gsMapper/fourfivefour-roche.png'
`gsMapper/share/apps/gsMapper/fourfivefour-apps.directory' -> `mapper/share/apps/gsMapper/fourfivefour-apps.directory'
`gsMapper/share/apps/gsMapper/icons' -> `mapper/share/apps/gsMapper/icons'
`gsMapper/share/apps/gsMapper/icons/64x64' -> `mapper/share/apps/gsMapper/icons/64x64'
`gsMapper/share/apps/gsMapper/icons/64x64/fourfivefour-mapper.png' -> `mapper/share/apps/gsMapper/icons/64x64/fourfivefour-mapper.png'
`gsMapper/share/apps/gsMapper/icons/32x32' -> `mapper/share/apps/gsMapper/icons/32x32'
`gsMapper/share/apps/gsMapper/icons/32x32/fourfivefour-mapper.png' -> `mapper/share/apps/gsMapper/icons/32x32/fourfivefour-mapper.png'
`gsMapper/share/apps/gsMapper/icons/128x128' -> `mapper/share/apps/gsMapper/icons/128x128'
`gsMapper/share/apps/gsMapper/icons/128x128/fourfivefour-mapper.png' -> `mapper/share/apps/gsMapper/icons/128x128/fourfivefour-mapper.png'
`gsMapper/share/apps/gsMapper/icons/48x48' -> `mapper/share/apps/gsMapper/icons/48x48'
`gsMapper/share/apps/gsMapper/icons/48x48/fourfivefour-mapper.png' -> `mapper/share/apps/gsMapper/icons/48x48/fourfivefour-mapper.png'
`gsMapper/share/apps/gsMapper/icons/24x24' -> `mapper/share/apps/gsMapper/icons/24x24'
`gsMapper/share/apps/gsMapper/icons/24x24/fourfivefour-mapper.png' -> `mapper/share/apps/gsMapper/icons/24x24/fourfivefour-mapper.png'
`gsMapper/share/apps/gsMapper/icons/16x16' -> `mapper/share/apps/gsMapper/icons/16x16'
`gsMapper/share/apps/gsMapper/icons/16x16/fourfivefour-mapper.png' -> `mapper/share/apps/gsMapper/icons/16x16/fourfivefour-mapper.png'
`gsMapper/share/apps/gsMapper/fourfivefour-gsMapper.desktop' -> `mapper/share/apps/gsMapper/fourfivefour-gsMapper.desktop'
`gsMapper/share/doc' -> `mapper/share/doc'
`gsMapper/share/doc/NOTICE' -> `mapper/share/doc/NOTICE'
`gsMapper/share/doc/LICENSE' -> `mapper/share/doc/LICENSE'
xfile: (/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/MIDConfig.parse)
`./MIDConfig.parse' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/MIDConfig.parse'
xfile: (/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/qualityScoreLookup_vxxlr.dat)
`./qualityScoreLookup_vxxlr.dat' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/qualityScoreLookup_vxxlr.dat'
xfile: (/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/qualityScoreLookup_flx.dat)
`./qualityScoreLookup_flx.dat' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/qualityScoreLookup_flx.dat'
xfile: (/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/qualityScoreLookup_xlr.dat)
`./qualityScoreLookup_xlr.dat' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/qualityScoreLookup_xlr.dat'
xfile: (/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/qualityScoreLookup_gs20.dat)
`./qualityScoreLookup_gs20.dat' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/qualityScoreLookup_gs20.dat'
xfile: (/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/qualityScoreLookup_xxlr.dat)
`./qualityScoreLookup_xxlr.dat' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/gsSeqTools/config/qualityScoreLookup_xxlr.dat'
`./addRun' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/addRun'
`./addSample' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/addSample'
`./changeRef' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/changeRef'
`./changeRun' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/changeRun'
`./createProject' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/createProject'
`./getProjAlignData' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/getProjAlignData'
`./gsMapper' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/gsMapper'
`./newAssembly' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/newAssembly'
`./newbler' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/newbler'
`./newMapping' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/newMapping'
`./removeRun' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/removeRun'
`./runAssembly' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/runAssembly'
`./runMapping' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/runMapping'
`./runProject' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/runProject'
`./setRef' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/setRef'
`./stopRun' -> `/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/mapper/bin/stopRun'
=============================

=============================
[17:15:02] mkdir -p "/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps"

=============================

=============================
[17:15:02] /tmp/selfgz1182812353/files_extra/star.x86_64 -oxz --nowarn C="/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps" f="/home/doug/DataAnalysis_2.9_All/packages/amplicons_CLI_2.9.i686.tgz"

/tmp/selfgz1182812353/files_extra/star.x86_64: 46 blocks + 0 bytes (total of 471040 bytes = 460.00k).
=============================

=============================
[17:15:03]  RPM_INSTALL_PREFIX0=/sw/apps/bioinfo/roche/DataAnalysis/2.9/apps/amplicons INSTALL_TYPE=local PATH=/home/doug/tools/gene-prediction:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/454/bin:/tmp/selfgz1182812353/files_extra//../xdg-utils:/tmp/selfgz1182812353/files_extra/ CREATE_LINKS=1 FILES_EXTRA=/tmp/selfgz1182812353/files_extra/ /tmp/selfgz1182812353/files_extra/ava/gsAmpliconsPostInstall.sh

=============================

=============================
[17:15:03]  INSTALL_TYPE=local FILES_EXTRA_PATH=/tmp/selfgz1182812353/files_extra/ SYSTEM_INSTALL_PATH=/sw/apps/bioinfo/roche/DataAnalysis/2.9 PATH=/home/doug/tools/gene-prediction:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/454/bin:/tmp/selfgz1182812353/files_extra//../xdg-utils:/tmp/selfgz1182812353/files_extra/ /tmp/selfgz1182812353/files_extra/dataAnalysisPostInstall.sh

Deleting files from config dir: /sw/apps/bioinfo/roche/DataAnalysis/2.9/config.
Directory does not exist, no files to delete.
Done.
=============================
~~~~
