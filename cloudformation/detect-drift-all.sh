#!/bin/bash

stackNames=$(aws cloudformation list-stacks | jq '.StackSummaries | .[] | .select(.StackStatus != "DELETE_COMPLETE").StackName')

for stackName in $stackNames
do
    aws cloudformation detect-stack-drift --stack-name $(echo $stackName | sed 's/"//g') > /dev/null
done


