#! /bin/bash
#cat raxml/out.fa.raxml.bestTreeCollapsed | ./gotree reroot outgroup DRC_07_0104 DRC_07_0354 Ikubi A6_contig_SPADES > rooted.nwk
sleep 10
faToVcf -ref=MT903344 ./masked.fa ./merged.vcf
usher -t rooted.nwk --vcf merged.vcf --collapse-tree --save-mutation-annotated-tree mpx.pb
pip install -U taxoniumtools
wget -N https://raw.githubusercontent.com/nextstrain/monkeypox/master/config/reference.gb
wget "https://mpox-lapis.genspectrum.org/v1/sample/details?downloadAsFile=true&dataFormat=csv" -O metadata.csv
usher_to_taxonium -i mpx.pb -g NC_063383.gb -o mpx.jsonl.gz -m metadata.csv --columns date,strain,country,region,clade,host,institution --only_variable_sites --key_column=accession
rm masked.fa out.fa masked.tsv merged.vcf
