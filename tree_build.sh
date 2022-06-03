#! /bin/bash
./raxml-ng --msa masked.fa --threads 2  --model GTR+G -prefix raxml/out.fa --redo --tree pars{2},rand{2}
