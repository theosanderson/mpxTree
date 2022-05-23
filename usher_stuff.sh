faToVcf -ref=MPXV-UK_P2 ./masked.fa ./merged.vcf
usher -t masked.fa.raxml.bestTreeCollapsed --vcf merged.vcf --collapse-tree --save-mutation-annotated-tree mpx.pb
pip install taxoniumtools
wget https://raw.githubusercontent.com/nextstrain/monkeypox/master/config/reference.gb
wget "https://mpox-lapis.gen-spectrum.org/v1/sample/details?downloadAsFile=true&dataFormat=csv" -O metadata.csv
usher_to_taxonium -i mpx.pb -g reference.gb -o mpx.jsonl.gz -m metadata.csv

