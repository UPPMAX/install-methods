all:
	( echo '. /etc/profile.modules; module load pandoc; pandoc -f markdown_mmd -t html webpage.md -o webpage.html' | bash )
	@echo "*** Adjusting table widths"
	sed -i 's/style="width:[0-9]\+%;"/style="width:100%;"/' webpage.html
	perl -0777 -pi -e 's{<colgroup>\n<col width="[0-9]+%" />\n<col width="[0-9]+%" />\n<col width="[0-9]+%" />\n</colgroup>}{<colgroup>\n<col width="25%" />\n<col width="25%" />\n<col width="50%" />\n</colgroup>}igs' webpage.html
	perl -0777 -pi -e 's{<table>}{<table style="width:100%;">\n<colgroup>\n<col width="25%" />\n<col width="25%" />\n<col width="50%" />\n</colgroup>}igs' webpage.html

