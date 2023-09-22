#!/bin/bash

#USAGE : ./PITR.sh table-name1 table-name2 table-name3 
#USAGE : make sure the region is correct
for table in "$@"
do
  aws dynamodb update-continuous-backups \
    --table-name "$table" \
    --point-in-time-recovery-specification PointInTimeRecoveryEnabled=true \
    --region us-east-1
done