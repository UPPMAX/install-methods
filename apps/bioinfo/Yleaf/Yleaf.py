#!/usr/bin/env python

#-- Kaiyin and Diego Montiel 2017
#-- Genetics Identification Group @ Erasmus MC  --
#-- YLeaf detection of Y-Haplogroups in Human genome DNA 

import time
import subprocess
import string
import random
import argparse, os
from argparse   import ArgumentParser
from subprocess import Popen

def get_arguments():

    parser = ArgumentParser(description="ERASMUS MC \n Y-Leaf for Human Genome ")    
    parser.add_argument("-bam", "--Bamfile",
        dest="Bamfile", required=False, type=extant_file,
        help="input BAM file or folder path", metavar="FILE")    
    parser.add_argument("-fastq", "--Fastq",
            dest="Fastq", required=False, type=extant_file,                        
            help="input FastQ file or folder path", metavar="FILE")
    
    parser.add_argument("-out", "--Outfile",
            dest="Outputfile", required=True,                        
            help="Output file name", metavar="FILE")
    
    parser.add_argument("-r", "--Reads_thresh",
            help="The minimum number of reads for each base",
            type=int,
            default=50)
    
    parser.add_argument("-q", "--Quality_thresh",
            help="Minimum quality for each read, integer between 10 and 39, inclusive \n [10-40]",
            type=int, required=True)
    
    parser.add_argument("-b", "--Base_majority",
            help="The minimum percentage of a base result for acceptance \n [50-99]",
            type=int, required=True)
        
    parser.add_argument("-t", "--Threads",
            help="Set number of additional threads to use [CPUs]",
            type=int,
            default=2)
    
    args = parser.parse_args()    
    return args

def extant_file(x):
    """
    'Type' for argparse - checks that file exists but does not open.
    """
    if not os.path.exists(x):
        # Argparse uses the ArgumentTypeError to give a rejection message like:
        # error: argument input: x does not exist
        raise argparse.ArgumentTypeError("{0} does not exist".format(x))
    return x
    
        
def execute_mpileup(header, bam_file, pileupfile, Quality_thresh):
    
    if header == "Y":
        if not os.path.exists('tmp'):
            os.makedirs('tmp')
        tmp_pu = "tmp/tmp.pu"
        
        cmd = "samtools mpileup -AQ{} -r {} {} > {}".format(Quality_thresh, header, bam_file, tmp_pu)
        #print cmd
        subprocess.call(cmd, shell=True)        
        
        cmd = " awk  '{{$1="'"chrY"'"; print}}' {} > {}".format(tmp_pu, pileupfile)
        print "Converting header..."
    
        subprocess.call(cmd, shell=True)
        
        cmd = "rm "+tmp_pu
        subprocess.call(cmd, shell=True)
    else:
        cmd = "samtools mpileup -AQ{} -r {} {} > {}".format(Quality_thresh, header, bam_file, pileupfile)
        #print cmd
        subprocess.call(cmd, shell=True)
    
def chromosome_table(bam_file,bam_folder,file_name):
    
    cmd = subprocess.Popen(["samtools", "idxstats", bam_file], stdout=subprocess.PIPE)
    
    out, err = cmd.communicate()
    dictionary = {}
    for i in out.split('\n'):
        line = i.split('\t')
        
        if line[0] is not '*' and len(line[0]) > 0:
            dictionary[line[0]] = float(line[2])
    
    total_perc = sum(dictionary.values())
    total = 0
    output = bam_folder+'/'+file_name+'.chr'
    output_handel = open(output, "w")
    output_handel.write( 'chr\treads\tperc')
    output_handel.write('\n')
    for key,value in dictionary.items():
        perc = (float(value)/total_perc)*100
        #print 'chr {} reads {} perc {}'.format(key, value, round(perc,2))
        output_handel.write('{}\t{}\t{}%'.format(key, int(value), round(perc,2)))
        output_handel.write('\n')
        total += perc
    
    output_handel.write('total:\t{}% '.format(total))
    
    out = out.split()
    if 'Y' in out:
        return "Y"
    
    elif 'chrY' in out:
        return "chrY"
    
def id_generator(size=6, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for x in range(size))

def check_if_folder(path,ext):
    
    list_files = []
    if os.path.isdir(path):
        dirpath = os.walk(path)
        for dirpath, dirnames, filenames in dirpath:
            for filename in [f for f in filenames if f.endswith(ext)]:
                files = os.path.join(dirpath, filename)
                list_files.append(files)
        return list_files
    else:
        return [path]

def get_folder_name(path_file):

    folder      = path_file.split('/')[-1]
    folder_name = os.path.splitext(folder)[0]        
    return folder_name

def create_tmp_dirs(folder):

    if os.path.isdir(folder):            
            print "Error!, "+folder+" folder already exists! This sample was ignored"
            return True
    else:
        cmd = 'mkdir '+folder
        subprocess.call(cmd, shell=True)
        tmp_dir = os.path.join(folder, 'tmp')    # UPPMAX
        if os.path.exists(tmp_dir):    # UPPMAX
            cmd = 'rm -r '+tmp_dir    # UPPMAX
            subprocess.call(cmd, shell=True)
            cmd = 'mkdir '+tmp_dir    # UPPMAX
            subprocess.call(cmd, shell=True)                
        else:
            cmd = 'mkdir '+tmp_dir    # UPPMAX
            subprocess.call(cmd, shell=True)        
        #if os.path.exists('tmp'):
        #    cmd = 'rm -r tmp'
        #    subprocess.call(cmd, shell=True)
        #    cmd = 'mkdir tmp'
        #    subprocess.call(cmd, shell=True)                
        #else:
        #    cmd = 'mkdir tmp'
        #    subprocess.call(cmd, shell=True)        
        return False
    
def samtools(threads, folder, folder_name, bam_file, Quality_thresh):
    
    #Change this file to Concatenate from the parameter you give    
    #args.Markerfile =  'data/positions.txt'    # UPPMAX
    args.Markerfile =  os.path.join(app_folder, 'data/positions.txt')    # UPPMAX
    
    #Reads the file clean_tree.r from the root folder
    rsource = os.path.join(app_folder, 'yleaf.r')
    
    #rscriptn     = '{}/tmp/main.r'.format(app_folder)      # UPPMAX
    #rscriptchr   = '{}/tmp/chrtable.r'.format(app_folder)  # UPPMAX
    #pileupfile   = '{}/tmp/out.pu'.format(app_folder)      # UPPMAX
    #chr_y_bam    = '{}/tmp/chrY.bam'.format(app_folder)    # UPPMAX
    rscriptn      = '{}/tmp/main.r'.format(folder)      # UPPMAX
    rscriptchr    = '{}/tmp/chrtable.r'.format(folder)  # UPPMAX
    pileupfile    = '{}/tmp/out.pu'.format(folder)      # UPPMAX
    chr_y_bam     = '{}/tmp/chrY.bam'.format(folder)    # UPPMAX
    
    #Adds the files to the pileup command 
    start_time = time.time()
    
    if not os.path.exists(bam_file+'.bai'): 
        
        bam_file_order = folder+"/"+folder_name+".order.bam"                        
        cmd = "samtools sort -m 2G -@ {} {} > {}".format(threads, bam_file, bam_file_order)
        print(cmd)
        subprocess.call(cmd, shell=True)
        pileup_cmd = "samtools index -@ {} {}".format(threads, bam_file_order)
        print(pileup_cmd)
        subprocess.call(pileup_cmd, shell=True)        
        bam_file = bam_file_order
    file_name = folder_name
    header = chromosome_table(bam_file,folder,file_name)
    execute_mpileup(header, bam_file, pileupfile, Quality_thresh)    
    print("--- %s seconds in run PileUp ---" % (time.time() - start_time))
    
    start_time = time.time()
    args.Outputfile = folder+"/"+folder_name+".out"
    roptions1 = """
    Markerfile = '{Markerfile}'
    Outputfile = '{Outputfile}'
    Reads_thresh = {Reads_thresh}
    Base_majority = {Base_majority}
    """.format(**vars(args))
    roptions2 = "Pileupfile = '{}'\n\n".format(pileupfile)
    
    #Concatenate the files and the script and execute
    rfile = roptions1 + roptions2 + open(rsource).read()
    with open(rscriptn, 'w') as r_out:
        r_out.write(rfile)
    rcmd = 'Rscript --vanilla {}'.format(rscriptn)
    subprocess.call(rcmd, shell=True)
    
    print("--- %s seconds in extracting haplogroups ---" % (time.time() - start_time))
    print("--- %s seconds to run Yleaf  ---" % (time.time() - whole_time))
    
def logo():
    print("20"*6+"7C").decode("hex")
    print("20"*5+"2F7C5C").decode("hex")
    print("20"*4+"2F5C7C2F5C").decode("hex")
    print("20"*3+"5C"*3+"7C"+"2F"*3).decode("hex")
    print("20"*4+"5C"*2+"7C"+"2F"*2).decode("hex")
    print("20"*5+"7C"*3).decode("hex")
    print("20"*5+"7C"*3).decode("hex")
    print("20"*5+"7C"*3).decode("hex")
    
if __name__ == "__main__":

    whole_time = time.time()
    print "\tErasmus MC Department of Genetic Identification \n\n\tYleaf: software tool for human Y-chromosomal \n\tphylogenetic analysis and haplogroup inference v1.0\n"    

    args = get_arguments()    
    app_folder = os.path.dirname(os.path.realpath(__file__))
    sam_file = ''
    threads = args.Threads
    folder_name = ''
    folder      = ''
    cwd_folder  = os.getcwd()  # UPPMAX
    logo()    
    if args.Fastq:                        
            files = check_if_folder(args.Fastq,'.fastq')         
            for path_file in files: 
                print "Starting..."
                print path_file
                folder_name = get_folder_name(path_file)
                #folder = os.path.join(app_folder,folder_name)        # UPPMAX
                folder = os.path.join(cwd_folder,folder_name)        # UPPMAX
                if create_tmp_dirs(folder):
                    continue
                start_time = time.time()
                sam_file = folder+"/"+folder_name+".sam"                                    
                fastq_cmd = "bwa mem -t {} {}/index_hg19/hg19.fa {} > {}".format(threads, app_folder, path_file, sam_file)                                    
                print(fastq_cmd)
                subprocess.call(fastq_cmd, shell=True)
                print("--- %s seconds in Indexing reads to reference ---" % (time.time()-start_time))                
                start_time = time.time()
                bam_file = folder+"/"+folder_name+".bam"                        
                cmd = "samtools view -@ {} -bS {} | samtools sort -@ {} -m 2G -o {}".format(threads, sam_file, threads, bam_file)
                print(cmd)
                subprocess.call(cmd, shell=True)
                print("--- %s seconds in convertin Sam to Bam ---" % (time.time()-start_time))                                
                cmd = "samtools index -@ {} {}".format(threads, bam_file)
                subprocess.call(cmd, shell=True)        
                samtools(threads, folder, folder_name, bam_file, args.Quality_thresh)
            
    elif args.Bamfile:
            files = check_if_folder(args.Bamfile,'.bam')
            for path_file in files:            
                print "Starting..."
                print path_file
                bam_file = path_file
                folder_name = get_folder_name(path_file)
                #folder = os.path.join(app_folder,folder_name)        # UPPMAX
                folder = os.path.join(cwd_folder,folder_name)        # UPPMAX
                if create_tmp_dirs(folder):
                    continue                
                samtools(threads, folder, folder_name, bam_file, args.Quality_thresh)
    
