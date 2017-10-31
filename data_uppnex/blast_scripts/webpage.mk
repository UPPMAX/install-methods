all:
	( echo '. /etc/profile.modules; module load pandoc; pandoc -f markdown_mmd -t html webpage.md -o webpage.html' | bash )
