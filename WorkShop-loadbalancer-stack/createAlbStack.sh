#!/bin/bash

aws cloudformation create-stack --stack-name WorkShop-LoadBalancerStack --profile workshop-admin --template-body file://load-balancer.yaml --parameters \
ParameterKey=PublicSubnet1Id,ParameterValue=$(aws cloudformation describe-stacks --stack-name WorkShop-SubnetsStack --query "Stacks[0].Outputs[?OutputKey=='PublicSubnet1Id'].OutputValue" --output text --profile workshop-admin) \
ParameterKey=PublicSubnet2Id,ParameterValue=$(aws cloudformation describe-stacks --stack-name WorkShop-SubnetsStack --query "Stacks[0].Outputs[?OutputKey=='PublicSubnet2Id'].OutputValue" --output text --profile workshop-admin) \
ParameterKey=PrivateSubnet1Id,ParameterValue=$(aws cloudformation describe-stacks --stack-name WorkShop-SubnetsStack --query "Stacks[0].Outputs[?OutputKey=='PrivateSubnet1Id'].OutputValue" --output text --profile workshop-admin) \
ParameterKey=PrivateSubnet2Id,ParameterValue=$(aws cloudformation describe-stacks --stack-name WorkShop-SubnetsStack --query "Stacks[0].Outputs[?OutputKey=='PrivateSubnet2Id'].OutputValue" --output text --profile workshop-admin) \
ParameterKey=FrontendLoadBalancerSecurityGroupId,ParameterValue=$(aws cloudformation describe-stacks --stack-name WorkShop-SecurityGroupsStack --query "Stacks[0].Outputs[?OutputKey=='FrontendLoadBalancerSecurityGroupId'].OutputValue" --output text --profile workshop-admin) \
ParameterKey=BackendLoadBalancerSecurityGroupId,ParameterValue=$(aws cloudformation describe-stacks --stack-name WorkShop-SecurityGroupsStack --query "Stacks[0].Outputs[?OutputKey=='BackendLoadBalancerSecurityGroupId'].OutputValue" --output text --profile workshop-admin)
