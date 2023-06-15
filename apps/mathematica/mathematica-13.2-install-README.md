mathematica-11.2
================

LOG
---

Run the installer called Mathematica_11.2.0_LINUX.sh. This is a bash script with a .tar appended to it, and will install the program. It will ask for a target directory for the install and the binaries.

It is up to each user to provide activation/license information.

No sense in making a Bianca version because of the network license.


---------------------------------------------------------------------------------------------------------------------------------------------
                                                    Wolfram Mathematica 13.2 Installer 
---------------------------------------------------------------------------------------------------------------------------------------------

Copyright (c) 1988-2023 Wolfram Research, Inc. All rights reserved.

WARNING: Wolfram Mathematica is protected by copyright law and international treaties. Unauthorized reproduction or distribution may
result in severe civil and criminal penalties and will be prosecuted to the maximum extent possible under law.

Enter the installation directory, or press ENTER to select /usr/local/Wolfram/Mathematica/13.2:
> /sw/apps/mathematica/13.2/rackham

Now installing...

[******************************************************************************************************************************************]

Type the directory path in which the Wolfram Mathematica script(s) will be created, or press ENTER to select /usr/local/bin:
> /sw/apps/mathematica/13.2/rackham/bin

Create directory (y/n)?
> y


WolframScript allows Wolfram Language code to be run from the command line and from self-executing script files. It is always available
from /sw/apps/mathematica/13.2/rackham/Executables/wolframscript. WolframScript system integration makes the wolframscript binary
accessible from any terminal, and allows .wls script files to be executed by double-clicking them in the file manager.

NOTE: Because you are not logged in with root privileges, you cannot install the optional WolframScript system integration at this time.
To do this after installation, run

    rpm -Uvh "/sw/apps/mathematica/13.2/rackham/SystemFiles/Installation/wolframscript-1.9-20230124604.x86_64.rpm"

as root.

WARNING: No Avahi Daemon was detected so some Kernel Discovery features will not be available. You can install Avahi Daemon using
your distribution's package management system.

For Red Hat based distributions, try running (as root):

yum install avahi

