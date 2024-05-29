#!/bin/bash
aws cloudformation create-stack --stack-name WorkShop-SecurityGroupsStack --profile workshop-admin --template-body file://security-groups.yaml --parameters \
ParameterKey=VpcId,ParameterValue=$(aws cloudformation describe-stacks --stack-name WorkShop-VPCStack --query "Stacks[0].Outputs[?OutputKey=='VpcId'].OutputValue" --output text --profile workshop-admin)
