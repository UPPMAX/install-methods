blastdbdir=/sw/data/uppnex/blast_tmp/uniprot/blastdb
fastadir=/sw/data/uppnex/blast_tmp/uniprot

# Sizes, as of 2017-10-27:
# Database		Segments
# uniref100:		45
# sptrembl:		31
# trembl:		31
# uniref90:		21
# uniref50:		8
# sprot:		1
# sprot_varsplic:	1

blastdbs= \
    uniprot_uniref100 \
    uniprot_sptrembl \
    uniprot_trembl \
    uniprot_uniref90 \
    uniprot_uniref50 \
    uniprot_sprot \
    uniprot_sprot_varsplic

release = $(shell xml_grep --text_only '//version' $(fastadir)/RELEASE.metalink)

.PHONY:	all

all:	$(blastdbs:%=$(blastdbdir)/%.timestamp)

$(blastdbdir)/uniprot_sprot.timestamp: title="UniProt release $(release): UniProt Knowledgebase Swiss-Prot)"
$(blastdbdir)/uniprot_sprot_varsplic.timestamp: title="UniProt release $(release): UniProt Knowledgebase (Swiss-Prot Splice Variants)"
$(blastdbdir)/uniprot_sptrembl.timestamp: title="UniProt release $(release): UniProt Knowledgebase (Swiss-Prot + TrEMBL)"
$(blastdbdir)/uniprot_trembl.timestamp: title="UniProt release $(release): UniProt Knowledgebase (TrEMBL)"
$(blastdbdir)/uniprot_uniref100.timestamp: title="UniProt release $(release): UniProt Reference Clusters (UniRef100)"
$(blastdbdir)/uniprot_uniref90.timestamp: title="UniProt release $(release): UniProt Reference Clusters (UniRef90)"
$(blastdbdir)/uniprot_uniref50.timestamp: title="UniProt release $(release): UniProt Reference Clusters (UniRef50)"

$(blastdbdir)/uniprot_sprot.timestamp: $(fastadir)/uniprot_sprot.fasta.gz
$(blastdbdir)/uniprot_sprot_varsplic.timestamp: $(fastadir)/uniprot_sprot_varsplic.fasta.gz
$(blastdbdir)/uniprot_sptrembl.timestamp: $(fastadir)/uniprot_sprot.fasta.gz $(fastadir)/uniprot_trembl.fasta.gz
$(blastdbdir)/uniprot_trembl.timestamp: $(fastadir)/uniprot_trembl.fasta.gz
$(blastdbdir)/uniprot_uniref100.timestamp: $(fastadir)/uniref100.fasta.gz
$(blastdbdir)/uniprot_uniref100.timestamp: $(fastadir)/uniref100.fasta.gz
$(blastdbdir)/uniprot_uniref90.timestamp: $(fastadir)/uniref90.fasta.gz
$(blastdbdir)/uniprot_uniref50.timestamp: $(fastadir)/uniref50.fasta.gz

%.timestamp:
	nice -n 5 gzip -cd $^ | \
	nice -n 10 makeblastdb -parse_seqids -hash_index -dbtype prot -title $(title) -out $*
	date >$*.timestamp
