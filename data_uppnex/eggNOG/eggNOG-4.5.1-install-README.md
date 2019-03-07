eggNOG databases 4.5.1
======================

Following the info at

<https://github.com/jhcepas/eggnog-mapper/wiki/Installation#eggnog-database-retrieval>

The initial set of databases was populated with the optimised ones, which are described as

<blockquote> The three optimized databases include all HMM models from their corresponding taxonomic levels in eggNOG (euNOG, bactNOG, arNOG) plus additional models spliting large alignments into taxonomically restricted (smaller) HMM models. In particular, HMM models with more than 500 (euk) or 50 (bact) sequences are expanded. The arch database includes all models from all archeal taxonomic levels in eggNOG.</blockquote>

together with a virus-specific database.  The commands to download those are:

    module load bioinfo-tools eggNOG-mapper/1.0.3
    download_eggnog_data.py -y --data_dir /sw/data/uppnex/eggNOG/4.5.1 euk bact arch viruses


Then we downloaded all taxon-specific databases.  The command for that is

    download_eggnog_data.py -y --data_dir /sw/data/uppnex/eggNOG/4.5.1 NOG aciNOG acidNOG acoNOG actNOG agaNOG agarNOG apiNOG aproNOG aquNOG arNOG arcNOG artNOG arthNOG ascNOG aveNOG bacNOG bactNOG bacteNOG basNOG bctoNOG biNOG bproNOG braNOG carNOG chaNOG chlNOG chlaNOG chloNOG chlorNOG chloroNOG chorNOG chrNOG cloNOG cocNOG creNOG cryNOG cyaNOG cytNOG debNOG defNOG dehNOG deiNOG delNOG dipNOG dotNOG dproNOG droNOG eproNOG eryNOG euNOG eurNOG euroNOG eurotNOG fiNOG firmNOG flaNOG fuNOG fusoNOG gproNOG haeNOG halNOG homNOG hymNOG hypNOG inNOG kinNOG lepNOG lilNOG maNOG magNOG meNOG metNOG methNOG methaNOG necNOG negNOG nemNOG onyNOG opiNOG perNOG plaNOG pleNOG poaNOG prNOG proNOG rhaNOG roNOG sacNOG saccNOG sorNOG sordNOG sphNOG spiNOG spriNOG strNOG synNOG tenNOG thaNOG theNOG therNOG thermNOG treNOG veNOG verNOG verrNOG virNOG

and the database names and contents are below.  This is available in the eggNOG-mapper module help as well.

    NOG          All organisms
    aciNOG       Acidobacteria
    acidNOG      Acidobacteriia
    acoNOG       Aconoidasida
    actNOG       Actinobacteria
    agaNOG       Agaricales
    agarNOG      Agaricomycetes
    apiNOG       Apicomplexa
    aproNOG      Proteobacteria_alpha
    aquNOG       Aquificae
    arNOG        Archaea
    arcNOG       Archaeoglobi
    artNOG       Arthropoda
    arthNOG      Arthrodermataceae
    ascNOG       Ascomycota
    aveNOG       Aves
    bacNOG       Bacilli
    bactNOG      Bacteria
    bacteNOG     Bacteroidia
    basNOG       Basidiomycota
    bctoNOG      Bacteroidetes
    biNOG        Bilateria
    bproNOG      Proteobacteria_beta
    braNOG       Brassicales
    carNOG       Carnivora
    chaNOG       Chaetomiaceae
    chlNOG       Chlorobi
    chlaNOG      Chlamydiae
    chloNOG      Chloroflexi
    chlorNOG     Chloroflexi
    chloroNOG    Chlorophyta
    chorNOG      Chordata
    chrNOG       Chromadorea
    cloNOG       Clostridia
    cocNOG       Coccidia
    creNOG       Crenarchaeota
    cryNOG       Cryptosporidiidae
    cyaNOG       Cyanobacteria
    cytNOG       Cytophagia
    debNOG       Debaryomycetaceae
    defNOG       Deferribacteres
    dehNOG       Dehalococcoidetes
    deiNOG       Deinococcusthermus
    delNOG       delta/epsilon
    dipNOG       Diptera
    dotNOG       Dothideomycetes
    dproNOG      Proteobacteria_delta
    droNOG       Drosophilidae
    eproNOG      Proteobacteria_epsilon
    eryNOG       Erysipelotrichi
    euNOG        Eukaryotes
    eurNOG       Euryarchaeota
    euroNOG      Eurotiomycetes
    eurotNOG     Eurotiales
    fiNOG        Fishes
    firmNOG      Firmicutes
    flaNOG       Flavobacteriia
    fuNOG        Fungi
    fusoNOG      Fusobacteria
    gproNOG      Proteobacteria_gamma
    haeNOG       Haemosporida
    halNOG       Halobacteria
    homNOG       Hominidae
    hymNOG       Hymenoptera
    hypNOG       Hypocreales
    inNOG        Insects
    kinNOG       Kinetoplastida
    lepNOG       Lepidoptera
    lilNOG       Liliopsida
    maNOG        Mammals
    magNOG       Magnaporthales
    meNOG        Animals
    metNOG       Methanobacteria
    methNOG      Methanococci
    methaNOG     Methanomicrobia
    necNOG       Nectriaceae
    negNOG       Negativicutes
    nemNOG       Nematodes
    onyNOG       Onygenales
    opiNOG       Opisthokonts
    perNOG       Peronosporales
    plaNOG       Planctomycetes
    pleNOG       Pleosporales
    poaNOG       Poales
    prNOG        Primates
    proNOG       Proteobacteria
    rhaNOG       Rhabditida
    roNOG        Rodents
    sacNOG       Saccharomycetaceae
    saccNOG      Saccharomycetes
    sorNOG       Sordariales
    sordNOG      Sordariomycetes
    sphNOG       Sphingobacteriia
    spiNOG       Spirochaetes
    spriNOG      Supraprimates
    strNOG       Streptophyta
    synNOG       Synergistetes
    tenNOG       Tenericutes
    thaNOG       Thaumarchaeota
    theNOG       Thermoplasmata
    therNOG      Thermotogae
    thermNOG     Thermococci
    treNOG       Tremellales
    veNOG        Vertebrates
    verNOG       Verrucomicrobia
    verrNOG      Verrucomicrobiae
    virNOG       Viridiplantae
