#! /bin/bash
cat raxml/out.fa.raxml.bestTreeCollapsed | ./gotree reroot outgroup DRC_07_0104 DRC_07_0354 Ikubi A6_contig_SPADES > rooted.nwk
sleep 10
faToVcf -ref=MPXV-UK_P2 ./masked.fa ./merged.vcf
usher -t rooted.nwk --vcf merged.vcf --collapse-tree --save-mutation-annotated-tree mpx.pb
pip install -U taxoniumtools
wget -N https://raw.githubusercontent.com/nextstrain/monkeypox/master/config/reference.gb
wget "https://mpox-lapis.gen-spectrum.org/v1/sample/details?downloadAsFile=true&dataFormat=csv" -O metadata.csv
usher_to_taxonium -i mpx.pb -g reference.gb -o mpx2.jsonl.gz -m metadata.csv --columns date,country,region,clade,host,sraAccession --only_variable_sites

