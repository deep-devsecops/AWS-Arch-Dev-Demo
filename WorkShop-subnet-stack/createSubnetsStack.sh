#!/bin/bash
aws cloudformation create-stack --stack-name WorkShop-SubnetsStack --template-body file://subnet.yaml --parameters \
ParameterKey=VpcId,ParameterValue=$(aws cloudformation describe-stacks --stack-name WorkShop-VPCStack --query "Stacks[0].Outputs[?OutputKey=='VpcId'].OutputValue" --output text)

