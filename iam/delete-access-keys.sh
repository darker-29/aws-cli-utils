#!/bin/bash

profiles=$(aws configure list-profiles)

for profile in $profiles;
do
    echo ''
    echo $profile
    echo ''

    aws iam delete-access-key \
        --user-name $USER_NAME \
        --access-key-id $(aws configure get aws_access_key_id --profile $profile) \
        --profile $profile
done
