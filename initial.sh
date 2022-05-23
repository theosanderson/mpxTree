#! /bin/bash
wget "https://mpox-lapis.gen-spectrum.org/v1/sample/fasta-aligned?downloadAsFile=true" -O out.fa
pip install Bio
python mask.py -f out.fa -b mask.bed -o masked.fa
# convert fasta to tsv
./fasta2tbl masked.fa | grep -v UNKNOWN | grep -v UNKNOWN | grep -v ITM_MPX_1_Belgium |grep -v MPXV_TNP_2017_North_Ponan | grep -v Sudan_2005_01 > masked.tsv
./tbl2fasta masked.tsv > masked.fa

sed -i "s/[']//g" masked.fa
