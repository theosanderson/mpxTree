from Bio import SeqIO
import argparse

"""This script should take an input fasta and a bed file. It should mask all the ranges in the bed file with Ns."""

parser = argparse.ArgumentParser(description="This script should take an input fasta and a bed file. It should mask all the ranges in the bed file with Ns.")
parser.add_argument("-f", "--fasta", help="Input fasta file", required=True)
parser.add_argument("-b", "--bed", help="Input bed file", required=True)
parser.add_argument("-o", "--output", help="Output fasta file", required=True)
args = parser.parse_args()

fasta = args.fasta
bed = args.bed
output = args.output

def bed_to_dict(bed):
    bed_dict = {}
    for line in open(bed,'r'):
        col = line.strip('\n').split('\t')
        if col[0] not in bed_dict:
            bed_dict[col[0]] = [[int(col[1]),int(col[2])]]
        else:
            bed_dict[col[0]].append([int(col[1]),int(col[2])])
    return bed_dict

def mask_fasta(fasta,bed_dict):
    out = open(output,'w')
    for record in SeqIO.parse(fasta,'fasta'):
        for i in bed_dict["chr"]:
                record.seq = record.seq[:i[0]] + 'N'*(i[1]-i[0]) + record.seq[i[1]:]
        out.write(">" + record.id + "\n" + str(record.seq) + "\n")
    out.close()

bed_dict = bed_to_dict(bed)

mask_fasta(fasta,bed_dict)