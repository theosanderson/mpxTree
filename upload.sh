sed  "s/MYSECRETKEY/$MYKEY/g" s3cfg > s3cfg2
s3cmd put -P mpx.jsonl.gz -c s3cfg2 s3://cov2tree/mpx.jsonl.gz 


