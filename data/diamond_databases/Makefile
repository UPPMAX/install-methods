all: DIAMOND-DBs.html

# Thanks to
# http://stackoverflow.com/questions/13109242/cannot-call-bash-function-inside-makefile
# for a start on getting module load to work here.  My bash load is a bit noisy
# so trash stdout.

%.html: %.md
	bash -l -c "module load pandoc/2.10.1 && pandoc -f markdown_phpextra -i $< -o $@" >/dev/null

# Updates are handled by the update script on cron, but for documentation purposes:

update:
	./diamond-update-dbs.sh

