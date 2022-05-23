wget "https://mpox-lapis.gen-spectrum.org/v1/sample/fasta-aligned?downloadAsFile=true" -O out.fa
bedtools maskfasta -fi out.fa -bed mask.bed  -fo masked.fa
# convert fasta to tsv
./fasta2tbl masked.fa | grep -v UNKNOWN | grep -v UNKNOWN | grep -v ITM_MPX_1_Belgium > masked.tsv
./tbl2fasta masked.tsv > masked.fa

sed -i "s/[']//g" masked.fa
