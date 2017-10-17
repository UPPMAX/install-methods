rnammer/1.2
===========

Requires `hmmsearch` from `hmmer/2.3.2-gcc`, so recompiled that module and
copied the tool over to this module as `hmmsearch2`.  Rewrote a bit of the perl
scripts to look for it here, and to find perl using `which` for commands and to
use the `#!/usr/bin/env perl` for the interpreter.

