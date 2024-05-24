#!/bin/bash
aws cloudformation create-stack --stack-name SecurityGroupsStack --template-body file://security-groups.yaml --parameters ParameterKey=VpcId,ParameterValue=$(aws cloudformation describe-stacks --stack-name VPCStack --query "Stacks[0].Outputs[?OutputKey=='VpcId'].OutputValue" --output text)

