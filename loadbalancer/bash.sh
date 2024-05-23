#!/bin/bash
aws cloudformation create-stack --stack-name LoadBalancerStack --template-body file://load-balancer.yaml --parameters \
ParameterKey=PublicSubnet1Id,ParameterValue=$(aws cloudformation describe-stacks --stack-name SubnetsStack --query "Stacks[0].Outputs[?OutputKey=='PublicSubnet1Id'].OutputValue" --output text) \
ParameterKey=PublicSubnet2Id,ParameterValue=$(aws cloudformation describe-stacks --stack-name SubnetsStack --query "Stacks[0].Outputs[?OutputKey=='PublicSubnet2Id'].OutputValue" --output text) \
ParameterKey=PrivateSubnet1Id,ParameterValue=$(aws cloudformation describe-stacks --stack-name SubnetsStack --query "Stacks[0].Outputs[?OutputKey=='PrivateSubnet1Id'].OutputValue" --output text) \
ParameterKey=PrivateSubnet2Id,ParameterValue=$(aws cloudformation describe-stacks --stack-name SubnetsStack --query "Stacks[0].Outputs[?OutputKey=='PrivateSubnet2Id'].OutputValue" --output text) \
ParameterKey=FrontendLoadBalancerSecurityGroupId,ParameterValue=$(aws cloudformation describe-stacks --stack-name SecurityGroupsStack --query "Stacks[0].Outputs[?OutputKey=='FrontendLoadBalancerSecurityGroupId'].OutputValue" --output text) \
ParameterKey=BackendLoadBalancerSecurityGroupId,ParameterValue=$(aws cloudformation describe-stacks --stack-name SecurityGroupsStack --query "Stacks[0].Outputs[?OutputKey=='BackendLoadBalancerSecurityGroupId'].OutputValue" --output text)
