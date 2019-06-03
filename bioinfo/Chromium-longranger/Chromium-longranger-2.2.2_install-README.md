Chromium-longranger/2.2.2
========================

<https://support.10xgenomics.com/genome-exome/software/pipelines/latest/what-is-long-ranger>

Used under license:
Misc non-commercial

LOG
---

    TOOL=Chromium-longranger
    VERSION=2.2.2
    CLUSTER=rackham
    VERSIONDIR=/sw/bioinfo/$TOOL/$VERSION
    PREFIX=/sw/bioinfo/$TOOL/$VERSION/$CLUSTER
    ./makeroom_Chromium-longranger_2.2.2.sh

Structure creating script (makeroom_Chromium-longranger_2.2.2.sh) made with makeroom.sh (Author: Jonas Söderberg) and moved to /sw/bioinfo/Chromium-longranger/makeroom_2.2.2.sh

    cd /sw/bioinfo/$TOOL/$VERSION/src
    [[ -f longranger-$VERSION.tar.gz ]] || wget -O longranger-2.2.2.tar.gz "http://cf.10xgenomics.com/releases/genome/longranger-2.2.2.tar.gz?Expires=1559003708&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cDovL2NmLjEweGdlbm9taWNzLmNvbS9yZWxlYXNlcy9nZW5vbWUvbG9uZ3Jhbmdlci0yLjIuMi50YXIuZ3oiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE1NTkwMDM3MDh9fX1dfQ__&Signature=VwJPHTNyj22P6psstFUunTzwmALA3OK-HO0~dLe72jupr54~m3PPctgEeOXHXH1iYpYcZ6r2uzTFU-dcdAflGjiDUY03KU1LoewZ9njkcUC20JRuEx0GWWVlwyIw6qJV8llhkmvF8ch1VXBBnJMbuQFapcNoZ2-C5biuEk92jie4WZsgvOONo~R6m3KVFMCl4N1uQJPy~7fbTRayMk~u4vkgMlGPY-70KhccuYMJl6XxU1hxtMiKxzNB6RNu2mvauBXp4q9CPOC0CK9aBSnwiqa9zPdYIBAeT44u1dmLSbt1OcJuTyjouEiWjpp4~3PcOeTw02oOY7-d2wjgxMliTQ__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"
    [[ -f longranger-$VERSION.tar.gz ]]
    tar xvf longranger-$VERSION.tar.gz
    make

