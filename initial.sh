#! /bin/bash
wget "https://mpox-lapis.gen-spectrum.org/v1/sample/fasta-aligned?downloadAsFile=true" -O out.fa
pip install Bio
python mask.py -f out.fa -b mask.bed -o masked.fa
# convert fasta to tsv
#wget -N https://raw.githubusercontent.com/nextstrain/monkeypox/master/config/exclude_overview.txt
#wget -N https://raw.githubusercontent.com/nextstrain/monkeypox/master/config/exclude.txt

cat exclude* > all_exclude.txt
# remove anything after a hash in all_exclude.txt
sed -i 's/ *\#.*//' all_exclude.txt
# remove empty lines
sed -i '/^$/d' all_exclude.txt

./fasta2tbl masked.fa | grep -v -f all_exclude.txt  > masked.tsv
./tbl2fasta masked.tsv > masked.fa

sed -i "s/[']//g" masked.fa
