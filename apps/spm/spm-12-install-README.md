spm/12
===========

<https://www.fil.ion.ucl.ac.uk/spm/software/spm12/>

LOG
---


SPM is mainly a directory of .m files and .mexa64 files, together with some wrappers and things. 

It is installed by downloading and unzipping the file at http://www.fil.ion.ucl.ac.uk/spm/download/restricted/eldorado/spm12.zip and https://www.fil.ion.ucl.ac.uk/spm/download/spm12_updates/spm12_updates_r7487.zip into the appropriate directory.

   wget http://www.fil.ion.ucl.ac.uk/spm/download/restricted/eldorado/spm12.zip 
   wget https://www.fil.ion.ucl.ac.uk/spm/download/spm12_updates/spm12_updates_r7487.zip
   unzip spm12.zip -d ../rackham/
   unzip spm12_updates_r7487.zip -uo -d ../rackham/spm12/

Then (re)compile the mexa-files:
   
   cd ../rackham/spm12/src
   module load matlab/R2018a
   make distclean
   make && make install
   make external-distclean
   make external && make external-install
