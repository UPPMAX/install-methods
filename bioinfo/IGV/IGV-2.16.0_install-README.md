IGV/2.16.0
==========

<http://software.broadinstitute.org/software/igv/home>

Used under license:
MIT


Structure creating script (makeroom_IGV_2.16.0.sh) moved to /sw/bioinfo/IGV/makeroom_2.16.0.sh


Requires java 11.  Download the IGV/IGVtools bundle without Java 11, and load
the new java/OpenJDK_11.0.2.  Move IGVtools to IGVtools/2.8.13.

There was an IGV/3.0-beta module, but all features were placed in IGV/2.4.2, so I disabled the module.

From <https://software.broadinstitute.org/software/igv/download>:
<blockquote>
If you are looking for IGV 3.0 Early Access or IGV 3.0 Beta, note that all new features introduced in that version have been released in IGV 2.4
</blockquote>



LOG
---

    makeroom.sh "-f" "-t" "IGV" "-v" "2.16.0" "-l" "MIT" "-w" "http://software.broadinstitute.org/software/igv/home" "-d" "high-performance, easy-to-use, interactive tool for the visual exploration of genomic data"
    ./makeroom_IGV_2.16.0.sh
    source SOURCEME_IGV_2.16.0

    cd $SRCDIR

rsync IGV files from desktop to $SRCDIR, then.

    unzip -q IGV_2.16.0.zip 
    rmdir $PREFIX
    mv IGV_2.16.0 $PREFIX
    cd $PREFIX

We leave igvtools here, but also create IGVtools/2.16.0 for them separately.  Change -Xmx1500m to -Xmx5g.

    vi igvtools igvtools_gui igvtools_gui_hidpi

And set up igv-core, igv-node, igv_hidpi-core and igv_hidpi-node.
The *-core files should specify -Xmx5g. The *-node files should specify -Xmx100g.

    cp igv.sh igv-core
    cp igv.sh igv-node 
    cp igv_hidpi.sh igv_hidpi-core
    cp igv_hidpi.sh igv_hidpi-node

Change `-Xmx8g` to `-Xmx5g`.

    vi igv-core igv_hidpi-core

Change `-Xmx8g` to `-Xmx100g`.

    vi igv-node igv_hidpi-node

Load java/OpenJDK_11.0.2 in the mf file.

