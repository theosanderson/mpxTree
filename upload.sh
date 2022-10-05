sed  "s/MYSECRETKEY/$MYKEY/g" ../s3cfg > s3cfg
s3cmd put -P mpx.jsonl.gz -c s3cfg s3://cov2tree/mpx.jsonl.gz 


