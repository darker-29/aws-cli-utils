#!/bin/bash

profiles=$(aws configure list-profiles)

for profile in $profiles;
do
    echo ''
    echo $profile
    echo ''

    # EC2 describe-nat-gateways でNATゲートウェイが残っていない確認
    echo 'NATゲートウェイの一覧'
    aws ec2 describe-nat-gateways --profile $profile
    echo ''
    echo ''



    # EC2 describe-instances でインスタンスが残っていないか確認
    echo 'EC2インスタンスの一覧'
    aws ec2 describe-instances --profile $profile
    echo ''
    echo ''


    # EC2 describe-addresses でElasticIPが残っていないか確認
    echo 'ElasticIPの一覧'
    aws ec2 describe-addresses --profile $profile
    echo ''
    echo ''



    # RDS describe-clusters でDB Clusterが残っていないか確認
    echo 'DB Clusterの一覧'
    aws rds describe-db-clusters --profile $profile
    echo ''
    echo ''


    # RDS describe-instances でDB Instanceが残っていないか確認
    echo 'DB Instanceの一覧'
    aws rds describe-db-instances --profile $profile
    echo ''
    echo ''


    # ALB describe-load-balancers でLoadBalancerが残っていないか確認
    echo 'ALB の一覧'
    aws elbv2 describe-load-balancers --profile $profile
    echo ''
    echo ''

done

