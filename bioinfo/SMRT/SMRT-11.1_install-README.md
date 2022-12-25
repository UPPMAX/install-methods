SMRT/11.1
========================

<https://www.pacb.com/support/software-downloads>

Used under license:



Structure creating script (makeroom_SMRT_11.1.sh) moved to /sw/bioinfo/SMRT/makeroom_11.1.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh "-t" "SMRT" "-v" "11.1" "-w" "https://www.pacb.com/support/software-downloads" "-d" "PacBios open-source SMRT Analysis software suite is designed for use with Single Molecule\, Real-Time SMRT Sequencing data." "-f"
    ./makeroom_SMRT_11.1.sh

    TOOL=SMRT
    version=11.1
    source /sw/bioinfo/${TOOL}/SOURCEME_${TOOL}_${version}

    cd $SRCDIR
    wget https://downloads.pacbcloud.com/public/software/installers/smrtlink_11.1.0.166339.zip
    unzip smrtlink_11.1.0.166339.zip && rm smrtlink_11.1.0.166339.zip


# smrtlink wont install if the directory exists. rmdir $PREFIX and install to $PREFIX.
    export SMRT_ROOT=$PREFIX
    rmdir $PREFIX
    #./smrtlink_11.1.0.166339.run --rootdir $SMRT_ROOT --smrttools-only
    ./smrtlink_11.1.0.166339.run --rootdir $SMRT_ROOT | tee  $TOOLDIR/SMRT-11.1.out

# for answers during the install check $TOOLDIR/SMRT-11.1.out






















SMRT/9.0.0
========================

<https://www.pacb.com/support/software-downloads>

Used under license:

<>

Structure creating script (makeroom_SMRT_9.0.0.sh) moved to /sw/bioinfo/SMRT/makeroom_9.0.0.sh

LOG
---

    /home/bjornv/git/install-methods/makeroom.sh -t "SMRT" -v "9.0.0" -w "https://www.pacb.com/support/software-downloads" -d "PacBios open-source SMRT Analysis software suite is designed for use with Single Molecule\, Real-Time SMRT Sequencing data." -f""
    ./makeroom_SMRT_9.0.0.sh
    TOOL=SMRT
    version=9.0.0
    source /sw/bioinfo/${TOOL}/SOURCEME_${TOOL}_${version}

    cd $SRCDIR
    wget https://downloads.pacbcloud.com/public/software/installers/smrtlink_9.0.0.92188.zip
    unzip smrtlink_9.0.0.92188.zip && rm smrtlink_9.0.0.92188.zip


# smrtlink wont install if the directory exists. rmdir $PREFIX and install to $PREFIX.
    export SMRT_ROOT=$PREFIX
    rmdir $PREFIX
    #./smrtlink_9.0.0.92188.run --rootdir $SMRT_ROOT --smrttools-only
    ./smrtlink_9.0.0.92188.run --rootdir $SMRT_ROOT




==== Start Install: 1619173128: Fri Apr 23 12:18:48 CEST 2021

Install versionstr: smrtlink-release_9.0.0.92188
Install cmdline options: --rootdir /sw/bioinfo/SMRT/9.0.0/rackham


Detected Total Memory: 277025390592 bytes (from DirectMap, meminfo)

Extracting bundles...
  Extracting smrtinub bundle....
Starting smrtinub-release_9.0.0.92188 self-extraction...
Creating install directory (/sw/bioinfo/SMRT/9.0.0/rackham/install/smrtlink-release_9.0.0.92188/bundles/smrtinub/install/smrtinub-release_9.0.0.92188)...
Extracting smrtinub-release_9.0.0.92188...
Invoking smrtinub-release_9.0.0.92188 install...
Pacific Biosciences SMRT InstallerNub Batch Installer (smrtinub-release_9.0.0.92188)
  Extracting smrttools bundle....
Starting smrttools-release_9.0.0.92188 self-extraction...
Creating install directory (/sw/bioinfo/SMRT/9.0.0/rackham/install/smrtlink-release_9.0.0.92188/bundles/smrttools/install/smrttools-release_9.0.0.92188)...
Extracting smrttools-release_9.0.0.92188...
Invoking smrttools-release_9.0.0.92188 install...
Pacific Biosciences SMRTAnalysis Batch Installer (smrttools-release_9.0.0.92188)
Checking for group/other readability...
Checking runtimebin.log writability...
  Extracting smrtlink-analysisservices-gui bundle....
Starting smrtlink-analysisservices-gui-release_9.0.0.92188 self-extraction...
Creating install directory (/sw/bioinfo/SMRT/9.0.0/rackham/install/smrtlink-release_9.0.0.92188/bundles/smrtlink-analysisservices-gui/install/smrtlink-analysisservices-gui-release_9.0.0.92188)...
Extracting smrtlink-analysisservices-gui-release_9.0.0.92188...
Invoking smrtlink-analysisservices-gui-release_9.0.0.92188 install...
Pacific Biosciences SMRTLink Analysis Services GUI Batch Installer (smrtlink-analysisservices-gui-release_9.0.0.92188)
System sanity check...
  Checking locale...
  Checking uname...
  Checking libc...
  Checking mount points...
  No hung mount points detected.


                         PacBio SMRT Link Installer
                      (smrtlink-release_9.0.0.92188) 



----- Part 0 of 10: System Prerequisite Check -----

Checking system configuration against minimum memory, processor and
user limit (ulimit) requirements.  SMRT Link requires at least 32
processors and 64GB of memory.  The soft user limits when starting
SMRT Link services must be at least 8192 for open files ('ulimit -Sn')
and 8192 for max number of processes ('ulimit -Su').

  Checking requirements...

    System Physical Memory (min: 64):   258.00 GB (270532608 kB)  [OK]  
    Number of Processors   (min: 32):       40                    [OK]  

    Open Files User Limit ('ulimit -n'):
      Soft Limit (min: 8192):            16384                    [OK]  
      Hard Limit (min: 8192):            16384                    [OK]  

    Open Files User Limit ('ulimit -u'):
      Soft Limit (min: 8192):             4096                    [ERR] 
      Hard Limit (min: 8192):          1029442                    [OK]  


  This error WILL prevent smrtlink services from starting:

      ERROR!  Minimum 'Max Processes' soft limit requirement not met.

Continue the installation? [Y/n]: 

----- Part 1 of 10: SMRT Analysis User ----

It is recommended to run this script as a designated SMRT Analysis
user (e.g. smrtanalysis) who will own all smrtpipe jobs and daemon
processes.

Current user is 'bjornv' (primary group: bjornv)

Use the 'bjornv' as the SMRT Analysis user? [Y/n]: 

Using install user (computed): bjornv
Using install group (computed): bjornv
Using smrtlink uuid (computed default): 094cc519-b547-4046-bdb8-ebfcc466574d


----- Part 2 of 10: SMRT Link Server DNS -----

The DNS name of the SMRT Link host server is used for creating SMRT
Link URLs (e.g. http://smrtlink.example.com:9090), ensuring
an SSL certificate will validate.  If the Domain Name System (DNS)
does not resolve to the expected address, then an IP address must
be used.

Detecting DNS names...

Pick an option:
    1) rackham5.uppmax.uu.se
    2) rackham5
    3) 89.44.250.86 (bond0)
    4) 10.1.10.54 (ib1)
    5) 10.0.10.54 (ib1)
    6) Specify an alternate DNS name
Choice [1]: 

Using dnsname (selected interactively): rackham5.uppmax.uu.se


----- Part 3 of 10: SMRT Link Setup  ----

SMRT Link requires two ports for proper operation. These ports cannot
be used for listening by any other processes.  The SMRT Link GUI port
serves to redirect from an unencrypted http connection to the login
page using secure https.

  Enter the SMRT Link GUI (http) port [9090]: 
  Enter the SMRT Link Services port [9091]: 

Memory settings must be preset for SMRT Link.  By default, we set the
initial (-Xms) and maximum (-Xmx) Java heap sizes to the same values.
The default for SMRT Link services is 25% of the total memory with a
maximum of 32768 MB.  The default for SMRT Link GUI is 5% of the total
memory with a maximum of 8192 MB.  We recommend using the defaults.

  Enter the SMRT Link Services initial memory (in MB) [32768]: 
  Enter the SMRT Link Services maximum memory (in MB) [32768]: 

Using GUI port (default, accepted): 9090
Using services port (computed default, accepted): 9091
Using services initial memory (computed default, accepted): 32768
Using services maximum memory (computed default, accepted): 32768


----- Part 4 of 10: Database Setup  -----

The SMRT Link server uses a database which will need access to
a network port and a directory to store database data files.

The port will only be used to access the database from the install
host.

The database data directory should be located on a local (not shared)
disk partition.  The default location will be in the SMRT Link Local
File System Root Directory, specified above.

  Enter the SMRT Link Database port [9095]: 
  Enter the full path to the 'db_datadir' directory [/sw/bioinfo/SMRT/9.0.0/rackham/userdata/db_datadir.default]: 
  Directory '/sw/bioinfo/SMRT/9.0.0/rackham/userdata/db_datadir.default' does not exist.  Create it? [Y/n]: 

    Creating directory '/sw/bioinfo/SMRT/9.0.0/rackham/userdata/db_datadir.default'...

WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!

The database directory appears to be on a remote filesystem
(fstype: nfs).  Depending on network and disk perfomance,
this may cause performance problems in the SMRT Link system.

WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!

  Directory '/sw/bioinfo/SMRT/9.0.0/rackham/userdata/db_datadir.default' appears to be a remote disk, fstype 'nfs'.  Ignore warning? [Y/n]: 

Using SMRT Link Database port (computed default, accepted): 9095
Using Database data dir (computed default, accepted): /sw/bioinfo/SMRT/9.0.0/rackham/userdata/db_datadir.default


----- Part 5 of 10: Cromwell Server Setup  ----

The Cromwell Workflow Engine Server requires one port for proper
operation.  This port cannot be used for listening by any other
process.  Select a port number which does not conflict with any
other programs.

  Enter the Cromwell Server port [9096]: 

Using Cromwell port (computed default, accepted): 9096


----- Part 6 of 10: User-specific Directories Setup  -----

The following directories should be configured to point to the
actual locations:

    jobs_root
    tmp_dir

jobs_root - This directory stores output from SMRT Analysis and needs
            to be large (> 15TB).

  Enter the full path to the 'jobs_root' directory [/sw/bioinfo/SMRT/9.0.0/rackham/userdata/jobs_root.default]: 
  Directory '/sw/bioinfo/SMRT/9.0.0/rackham/userdata/jobs_root.default' does not exist.  Create it? [Y/n]: 

    Creating directory '/sw/bioinfo/SMRT/9.0.0/rackham/userdata/jobs_root.default'...

tmp_dir - This directory is used for fast I/O operations, and should be
          a local directory (not NFS mounted) and needs to be large for
          large genome assembly jobs (>500GB minimum, 1TB recommended).
          This directory will be automatically created, as needed, on
          compute cluster nodes.

          The directory must exist on each cluster node and be writable
          to the SMRT Link user. If missing, SMRT Link will attempt to
          create this destination if permissions permit.

  Enter the full path to the 'tmp_dir' directory [/tmp/smrtlink]: 
  Directory '/tmp/smrtlink' does not exist.  Create it? [Y/n]: 

    Creating directory '/tmp/smrtlink'...

Using jobs_root (computed default, accepted): /sw/bioinfo/SMRT/9.0.0/rackham/userdata/jobs_root.default
Using tmp_dir (default, accepted): /tmp/smrtlink


---- Part 7 of 10: Remote Service Setup ----

The 'SMRT Link Event Service' provides the ability to send to PacBio:
1) installation troubleshooting logs, 2) analysis failure logs, and
3) SMRT Link usage information, not including sample names or sequence
data.

The 'SMRT Link Update Service' will provide automatic notification and
installation of chemistry bundle files compatible with new PacBio
consumables.

Note: SMRT Link Event Services will be configured in browser UI on first
      access after install or upgrade.
  Checking remote service URLs...
    Checking SMRT Link Event Service URL... unavailable
    Checking SMRT Link Update Service URL... ok

    Checking internet connection... ok

  The following URL is unavailable: 

    SMRT Link Event Service:  https://smrtlink-eve.pacbcloud.com:8083/status

  Test Command:

    curl --max-time 5 --head --fail --insecure "https://smrtlink-eve.pacbcloud.com:8083/status"

    WARNING - Connection with PacBio Event Service failed. You can install
              SMRT Link, but you will not be able to send troubleshooting
              information, if needed, through SMRT Link.  Consult the
              Network Diagram in the Site Preparation Guide and ask your
              network administrator to open outbound connections to:
                  https://smrtlink-eve.pacbcloud.com:8083

There appears to be a connection to the internet, but the remote server
is temporarily unavailable.

  Enable the 'SMRT Link Update Service'? [Y/n]: n

Using 'SMRT Link Update Service' Enable (configured interactively): false


---- Part 8 of 10: SMRT Link Analysis Job Email Notification ----

SMRT Link can be configured to send email notifications of completed
analysis jobs to the user who launched the analysis (for both successful
and failed jobs).

SMRT Link only supports connections to SMTP Relays without encryption.
Servers using basic authentication, SSL/TLS, or STARTTLS are not
supported.

Email notification is disabled if the outgoing mail server host is
empty.

Configure the SMTP mail host and port settings below.

  Enter the SMRT Link notification outgoing mail server host []: 

    No mail host specified.  SMRT Link mail notification disabled.

Using SMRT Link notification outgoing mail server host (default, accepted): 
Using SMRT Link notification mail port (default): 25


----- Part 9 of 10: SMRT Link Compute Configuration  -----

SMRT Link allows for one or more compute configurations to be
defined for processing analysis jobs.  Each compute configuration
can specify unique workflow and Job Management System settings,
completely independent from other compute configurations.

When configuring a SMRT Analysis job, a drop-down menu under the
"Advanced Parameter Settings" allows selecting one of multiple
compute configurations. The selected configuration will be used for
all JMS cluster submissions of the analysis job.


Configuring 'SMRT Analysis Compute Configuration' (computecfg_00)
-----------------------------------------------------------------

NAME - Specifies a unique name for the compute configuration.

  Enter the compute config 'NAME' [SMRT Analysis Compute Configuration]: 

NPROC - Specifies the maximum number of slots each task may request
        upon job submissions to a JMS cluster.  The suggested value
        is based on the processor count of the SMRT Link head node,
        but should be set as needed to optimize cluster usage.  One
        processor core per slot is assumed.

  Enter the number of processors per task 'NPROC' [7]: 20

MAXCHUNKS - Specify the maximum number of parallel chunks when
            breaking up large dataset files.

  Enter the number of parallel chunks per task 'MAXCHUNKS' [24]: 

Specify the Cromwell Log Level.


Specify the global 'concurrent_job_limit' for Cromwell.

  Select the Cromwell concurrent_job_limit: [500]: 

A Job Management System may be used to dispatch jobs to a distributed
compute environment.  If no Job Management System is specified, the
system will run in Non-Distributed Mode and all compute jobs will be
run on locally on the install host.  Available Job Management Systems
will be detected from the PATH environment variable, but may also
be selected manually.

  Auto-detected the following Job Management Systems:

      Slurm       (From PATH: /usr/bin)

Pick an option:
    1) Slurm
    2) Other JMS
    3) None (Non-Distributed Mode)
Choice [1]: 

Detected the following settings:

   SLURM_BINDIR=/usr/bin
   SLURM_PARTITION=     (Use Slurm default partition, currently: 'core')
   SLURM_STARTARGS=

   Where detected:
      SLURM_BINDIR        (from 'PATH environment variable, default')
      SLURM_PARTITION     (from 'default')
      SLURM_STARTARGS     (from 'default')

Are these correct? [Y/n]: 

Using NAME (computed default, accepted): SMRT Analysis Compute Configuration
Using MENUORDER (computed default): 1
Using NPROC (configured interactively): 20
Using MAXCHUNKS (default, accepted): 24
Using Cromwell Log Level (default): INFO
Using Cromwell concurrent_job_limit (default, accepted): 500
Using jmstype (selected interactively): Slurm
Using SLURM_BINDIR (PATH environment variable, default): /usr/bin
Using SLURM_PARTITION (default): 
Using SLURM_STARTARGS (default): 

Current compute configurations:

    SMRT Analysis Compute Configuration (computecfg_00) [default]

Modify or add compute configuration? [N/y]: 


----- Part 10 of 10: SMRT Link Analysis Configuration  -----

NWORKERS - Specifies the maximum number of simultaneous SMRT Analysis
           jobs that can be run by the SMRT Link server.  This should
           be set to no more than the number of processors available
           on the SMRT Link install machine.  The default is the min
           of 32 and number of processors on the system.

  Enter the max number of workers 'NWORKERS' [32]: 20

Using NWORKERS (configured interactively): 20

Updating smrtlink install configuration...

Applying settings...
  Applying JMS settings....
    Applying computecfg_00 settings...
      Generating cromwell_00.json ...
      Generating jmsenv_00.ish ...
    Creating user.jmsenv.ish file...
  Applying smrtlink settings....
    Creating smrtlink-system-config.json...
  Applying cromwell settings....
    Creating cromwell.conf...
      Applying JMS settings to cromwell config...
    Creating cromwell_cli.conf...
      Applying JMS settings to cromwell config...
  Applying dirlinks settings....
  Applying database settings....
Installing settings...
    Installing generated configs...
    Installing smrtlink-system-config.json...
    Validating smrtlink-system-config.json...
Successfully validated config /sw/bioinfo/SMRT/9.0.0/rackham/install/smrtlink-release_9.0.0.92188/bundles/smrtlink-analysisservices-gui/current/private/pacbio/smrtlink-analysisservices-gui/smrtlink-system-config.json
Successfully completed (exit code 0) running smrtflow.tools.bundler_config v0.1.2 in 1 sec.

Running services and ui upgrade...
  Running smrtlink-analysisservices-gui upgrade...
    Installing replacement 404 redirect...
    Running apply-config...
    Setting up database...
    Starting database...
    Stopping database...
  Updating smrtcmds link....
  Installing manifests....
  Clean up legacy configurations...

SMRT Link Install successful.

==== Duration Install: 778 seconds
==== End Install: 1619173906: Fri Apr 23 12:31:46 CEST 2021
