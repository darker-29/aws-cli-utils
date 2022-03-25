#!/bin/bash

stackNames=$(aws cloudformation list-stacks | jq '.StackSummaries | .[] | select(.DriftInformation.StackDriftStatus == "DRIFTED").StackName')

for stackName in $stackNames
do
    echo $stackName | sed 's/"//g'
done
