CLUSTER=rackham
OTHERCLUSTERS="irma bianca"
TOOL=/sw/apps/bioinfo/RepeatModeler
VERSION=1.0.11

mkdir -p $TOOL/$VERSION $TOOL/src

cd $TOOL/src
wget http://www.repeatmasker.org/RepeatModeler/RepeatModeler-open-$VERSION.tar.gz
tar xf RepeatModeler-open-$VERSION.tar.gz
cd RepeatModeler-open-1.0.11

# Search and manually replace /usr/local Perl shebangs
head -1 * | grep '\#'

# Finally run
perl ./configure

# And follow instructions
# I used RMBlast as "default search engine"


