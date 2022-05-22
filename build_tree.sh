curl https://mpox-lapis.gen-spectrum.org/v1/sample/fasta-aligned?downloadAsFile=true -o out.fa
./FastTree -nt -gtr out.fa > out.nwk
wget https://mpox-lapis.gen-spectrum.org/v1/sample/details?downloadAsFile=true&dataFormat=csv -O out.csv