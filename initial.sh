#! /bin/bash
wget "https://mpox-lapis.gen-spectrum.org/v1/sample/fasta-aligned?downloadAsFile=true" -O out.fa
pip install Bio
python mask.py -f out.fa -b mask.bed -o masked.fa
# convert fasta to tsv
wget -N https://raw.githubusercontent.com/nextstrain/monkeypox/master/config/exclude_overview.txt

./fasta2tbl masked.fa | grep -v -f exclude_overview.txt  > masked.tsv
./tbl2fasta masked.tsv > masked.fa

sed -i "s/[']//g" masked.fa
