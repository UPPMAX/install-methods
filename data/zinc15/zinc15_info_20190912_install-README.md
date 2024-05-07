zinc15
======

<http://wiki.docking.org/index.php/Rsyncing_zinc15>

We are pretty sure we can do better, but that is the best we've figured out so far. If you come up with a better command, please tell us.
 

(We cant make a true mirror yet due to political reasons, but I figured if we have the complete db here atleast all users in Sweden would have a good place to get the data from without putting load on your server)

Currently I have  a 102687 db2.gz files and with this subset

    “[C-E][A-G][A-C][A-D][RM]*.db2.gz"

I get 70900 files

What is the correct number for the above subset?


I estimate 96,424. per the following 

    [xyz@gimel sdi.2019-07-26]$ wc -l [cde][12]-tranche
      18207 c1-tranche
       3500 c2-tranche
      37065 d1-tranche
      13248 d2-tranche
      20396 e1-tranche
       4008 e2-tranche
      96424 total
     
    all sdis:
        621 a1-tranche
        134 a2-tranche
         61 a3-tranche
       2290 b1-tranche
        644 b2-tranche
        172 b3-tranche
      18207 c1-tranche
       3500 c2-tranche
        951 c3-tranche
      37065 d1-tranche
      13248 d2-tranche
       1192 d3-tranche
      20396 e1-tranche
       4008 e2-tranche
       1844 e3-tranche
       5753 f1-tranche
       5151 f2-tranche
       1102 f3-tranche
       2244 g1-tranche
        833 g2-tranche
       2584 g3-tranche
        646 h1-tranche
        281 h2-tranche
       1322 h3-tranche
        551 i1-tranche
        223 i2-tranche
        240 i3-tranche

    [xyz@gimel sdi.2019-07-26]$ more README
    #
    ## regular:
    ls /nfs/ex3/published/3D/A[A-E]/[ABCE][ABCD][RM]?/*.db2.gz > a1-tranche
    ls /nfs/ex3/published/3D/B[A-E]/[ABCE][ABCD][RM]?/*.db2.gz > b1-tranche
    ls /nfs/ex3/published/3D/C[A-E]/[ABCE][ABCD][RM]?/*.db2.gz > c1-tranche
    ls /nfs/ex3/published/3D/D[A-E]/[ABCE][ABCD][RM]?/*.db2.gz > d1-tranche
    ls /nfs/ex3/published/3D/E[A-E]/[ABCE][ABCD][RM]?/*.db2.gz > e1-tranche
    ls /nfs/ex3/published/3D/F[A-E]/[ABCE][ABCD][RM]?/*.db2.gz > f1-tranche
    ls /nfs/ex3/published/3D/G[A-E]/[ABCE][ABCD][RM]?/*.db2.gz > g1-tranche
    ls /nfs/ex3/published/3D/H[A-E]/[ABCE][ABCD][RM]?/*.db2.gz > h1-tranche
    ls /nfs/ex3/published/3D/I[A-E]/[ABCE][ABCD][RM]?/*.db2.gz > i1-tranche
    #
    ls /nfs/ex3/published/3D/A[FG]/[ABCE][ABCD][RM]?/*.db2.gz > a2-tranche
    ls /nfs/ex3/published/3D/B[FG]/[ABCE][ABCD][RM]?/*.db2.gz > b2-tranche
    ls /nfs/ex3/published/3D/C[FG]/[ABCE][ABCD][RM]?/*.db2.gz > c2-tranche
    ls /nfs/ex3/published/3D/D[FG]/[ABCE][ABCD][RM]?/*.db2.gz > d2-tranche
    ls /nfs/ex3/published/3D/E[FG]/[ABCE][ABCD][RM]?/*.db2.gz > e2-tranche
    ls /nfs/ex3/published/3D/F[FG]/[ABCE][ABCD][RM]?/*.db2.gz > f2-tranche
    ls /nfs/ex3/published/3D/G[FG]/[ABCE][ABCD][RM]?/*.db2.gz > g2-tranche
    ls /nfs/ex3/published/3D/H[FG]/[ABCE][ABCD][RM]?/*.db2.gz > h2-tranche
    ls /nfs/ex3/published/3D/I[FG]/[ABCE][ABCD][RM]?/*.db2.gz > i2-tranche

    ls /nfs/ex3/published/3D/A[HI]/[ABCE][ABCD][RM]?/*.db2.gz > a3-tranche
    ls /nfs/ex3/published/3D/B[HI]/[ABCE][ABCD][RM]?/*.db2.gz > b3-tranche
    ls /nfs/ex3/published/3D/C[HI]/[ABCE][ABCD][RM]?/*.db2.gz > c3-tranche
    ls /nfs/ex3/published/3D/D[HI]/[ABCE][ABCD][RM]?/*.db2.gz > d3-tranche
    ls /nfs/ex3/published/3D/E[HI]/[ABCE][ABCD][RM]?/*.db2.gz > e3-tranche
    ls /nfs/ex3/published/3D/F[HI]/[ABCE][ABCD][RM]?/*.db2.gz > f3-tranche
    ls /nfs/ex3/published/3D/G[HI]/[ABCE][ABCD][RM]?/*.db2.gz > g3-tranche
    ls /nfs/ex3/published/3D/H[HI]/[ABCE][ABCD][RM]?/*.db2.gz > h3-tranche
    ls /nfs/ex3/published/3D/I[HI]/[ABCE][ABCD][RM]?/*.db2.gz > i3-tranche

This was from July. I will have changed a bit, but not more than 10% probably.

I recommend letting rsync tell you when you've got it all.
I  recommend C-G  for mwt. (lead-like).  The rest are fine. 
Jens might also benefit from A-B in the first position, corresponding to molecules with 50-250 g/mol.
