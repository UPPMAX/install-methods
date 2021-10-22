blobtools2/2.6.3
========================

<https://github.com/blobtoolkit/blobtools2>

Used under license:
MIT License


Structure creating script (makeroom_blobtools2_2.6.3.sh) moved to /sw/bioinfo/blobtools2/makeroom_2.6.3.sh

LOG
---

    /home/niharika/install-methods/makeroom.sh -f" -t "blobtools2" -v "2.6.3" -s "misc" -w "https://github.com/blobtoolkit/blobtools2" -l "MIT License" -d "A new implementation of BlobTools with support for interactive data exploration via the BlobToolKit viewer"
    ./makeroom_blobtools2_2.6.3.sh
    cd $SRCDIR

   create singularity image, blobtools, using the blobtools.def file given at $SRCDIR
   cd $PREFIX
   copy blobtools.sif here
   mkdir bin
   create blobtools and make it executable.
