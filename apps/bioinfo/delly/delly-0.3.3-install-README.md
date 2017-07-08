DELLY dependencies
------------------
* BamTools (https://github.com/pezmaster31/bamtools)
* Boost C++ Libraries (www.boost.org)
* OpenMP (www.openmp.org)
* zlib compression library (www.zlib.net)
* kseq library to parse FASTA/FASTQ (http://lh3lh3.users.sourceforge.net/parsefastq.shtml)


Actions
-------
Bamtools installed as separate module
Boost/system (1.41.0) too old (need "multiprecision"). Using module version 1.55.0
OpenMP in gcc as confirmed with trivial C prog with "#pragma omp parallel num_threads(9)"
zlib/1.2.3 confirmed with "rpm -qi zlib"
kseq downloaded and installed locally (within app)

Update Makefile manually to fix hardcoded links
  BOOST=/sw/apps/build/boost/1.55.0/milou
  BAMTOOLS=/sw/apps/bioinfo/bamtools/2.3.0/milou
  KSEQ=../kseq

module load bioinfo-tools bamtools/2.3.0 gcc/4.8 boost/1.55.0
make PARALLEL=1 -B

Copy executables (delly,iover,cov,spancov,iMerge,extract) to "milou". Skip bin subfolder to match old version.

Advise users to set OMP_NUM_THREADS for MP usage (note, not mpi).

/wesleys 2014-03-25
