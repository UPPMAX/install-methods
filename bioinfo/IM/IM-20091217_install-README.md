IM/20091217
===========

    wget http://lifesci.rutgers.edu/~heylab/ProgramsandData/Programs/IM/IM_12_17_2009.zip

unzipped the source - but there are no compilation instructions
on google group page: https://groups.google.com/forum/?fromgroups=#!searchin/isolation-with-migration/compile/isolation-with-migration/cGh7pdfUHOA/Xi8zbRQ67UUJ

we find very simple compilation instructions, and reason compilation fails for IMa:
need to skip the msdirent.c

for IM:
    gcc *.c -lm -o im

for IMa:

    gcc -fPIC build_genealogy.c      ima_main.c  surface_call_functions.c    treeprint.c         utilities.c calc_prob_data.c surface_search_functions.c update_genealogy.c get_data_initialize.c output.c swapchains.c update_mc_params.c -o ima -lm


then made "bin" directory and softlinked the binaries there


