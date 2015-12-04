# fastPHASE-xxx-install-README.md, douglas.scofield@ebc.uu.se

TITLE
=====

    fastPHASE haplotype phasing

DESCRIPTION
-----------

    fastPHASE, perform haplotype phasing

    Scheet, P and Stephens, M (2006) "A fast and flexible statistical model for
        large-scale population genotype data: applications to inferring missing
        genotypes and haplotypic phase." Am J Hum Genet 78(4):629-44.

WEBSITE
-------

First I went to <http://stephenslab.uchicago.edu/software.html#fastphase>
which directed me to get an academic license at
<https://c4c.uwc4c.com/licenses/16>

I then received two emails, the first is the Academic License:

<blockquote>
Academic Software License Agreement
The University of Washington (UW) and Professor Matthew Stephens and his laboratory (Developers) give permission for you and your laboratory (Institution) to use the fastPHASE Version 1 software (fastPHASE). fastPHASE is a program implementing the method for reconstructing haplotypes from population data. UW and the Developers allow researchers at your Institution to copy and modify fastPHASE, for internal, non-profit research purposes, on the following conditions: 

1. The fastPHASE software remains at your Institution and is not published, distributed, or otherwise transferred or made available to other than Institution employees and students involved in research under your supervision. 

If you wish to obtain fastPHASE for any commercial purposes, you will need to execute a separate licensing agreement with the University of Washington and pay a fee. This includes, but is not limited to, using fastPHASE to provide services to outside parties for a fee. In that case please contact: 

Express Licensing Team
UW Center for Commercialization
University of Washington
4311 11th Avenue NE Suite 500
Seattle, WA 98105-4608
(206) 543-3970
license@u.washington.edu

2. You retain in fastPHASE and any modifications to fastPHASE, the copyright, trademark, or other notices pertaining to fastPHASE as provided by UW. 

3. You provide the Developers with feedback on the use of the fastPHASE software in your research, and that the Developers and UW are permitted to use any information you provide in making changes to the fastPHASE software. All bug reports and technical questions shall be sent to Dr. Paul Scheet, email: statrat@washington.edu.

4. You acknowledge that the Developers, UW and its licensees may develop modifications to fastPHASE that may be substantially similar to your modifications of fastPHASE, and that the Developers, UW and its licensees shall not be constrained in any way by you in UW's or its licensees' use or management of such modifications. You acknowledge the right of the Developers and UW to prepare and publish modifications to fastPHASE that may be substantially similar or functionally equivalent to your modifications and improvements, and if you obtain patent protection for any modification or improvement to fastPHASE you agree not to allege or enjoin infringement of your patent by the Developers, the UW or by any of UW's licensees obtaining modifications or improvements to fastPHASE from the University of Washington or the Developers. 

5. If utilization of the fastPHASE software results in outcomes which will be
published, please specify the version of fastPHASE you used and cite source [A] below.

[A] Scheet, P and Stephens, M (2006) "A fast and flexible statistical model for large-scale population genotype data: applications to inferring missing genotypes and haplotypic phase." Am J Hum Genet 78(4):629-44.

6. Any risk associated with using the fastPHASE software at your institution is with you and your Institution. fastPHASE is experimental in nature and is made available as a research courtesy "AS IS," without obligation by UW to provide accompanying services or support. UW AND THE AUTHORS EXPRESSLY DISCLAIM ANY AND ALL WARRANTIES REGARDING THE SOFTWARE, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO WARRANTIES PERTAINING TO MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.
</blockquote>

The second contains instructions for download.

    Go to: http://depts.washington.edu/fphase/download/
    Username: fastPHASEuser
    Password: 24minutes

which ultimately gets me this address:

    http://depts.washington.edu/fphase/download/fastPHASE_Linux.gz


MODULE REQUIREMENTS
-------------------

    Add to the user PATH:
        $CLUSTERDIR/bin
        $CLUSTERDIR/misc
        $CLUSTERDIR/scripts
    Add to the user MANPATH:
        $CLUSTERDIR/man

LOG
---

    TOOL=/sw/apps/bioinfo/fastPHASE
    VERSION=1.4.0
    cd $TOOL/$VERSION
    mkdir src
    cd src
    wget --user=fastPHASEuser --password=24minutes http://depts.washington.edu/fphase/download/fastPHASE_Linux.gz
    gunzip fastPHASE_Linux.gz
    chmod +x fastPHASE_Linux
    mv fastPHASE_Linux fastPHASE
    wget --user=fastPHASEuser --password=24minutes http://depts.washington.edu/fphase/download/fastphase.inp
    wget --user=fastPHASEuser --password=24minutes http://depts.washington.edu/fphase/download/fastphase_haplotypes.inp
    wget --user=fastPHASEuser --password=24minutes http://depts.washington.edu/fphase/download/fastphase_subpoplabels.inp
    wget --user=fastPHASEuser --password=24minutes http://depts.washington.edu/fphase/download/fastphase_subpoplabels2.inp

To test operation:

    ./fastPHASE

This should produce several files using the above *.inp files.  Clean up:

    rm -f *hoods *out *elect *chars

Set up for both tintin and milou

    CLUSTER=tintin
    CLUSTERDIR=$TOOL/$VERSION/$CLUSTER
    mkdir -p $CLUSTERDIR
    cp fastPHASE $CLUSTERDIR
    CLUSTER=milou
    CLUSTERDIR=$TOOL/$VERSION/$CLUSTER
    mkdir -p $CLUSTERDIR
    cp fastPHASE $CLUSTERDIR
    cd ..

    mkdir -p doc
    cd doc
    wget --user=fastPHASEuser --password=24minutes http://depts.washington.edu/fphase/download/fastphase_doc_1.2.pdf

Set perms so others in sw can work on it.

    cd $TOOL
    chgrp -R sw .
    chmod -R g+w .

Steal an mf from another project and implement module requirements as described
above.

    mkdir mf
    cd $TOOL/mf
    cp ../../fasta/mf/36.3.6d 1.4.0
    vi 1.4.0

