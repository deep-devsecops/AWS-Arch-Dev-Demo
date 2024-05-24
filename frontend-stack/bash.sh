#!/bin/bash
aws cloudformation create-stack --stack-name FrontendStack --template-body file://frontend.yaml --parameters \ 
ParameterKey=KeyName,ParameterValue=key \
ParameterKey=PublicSubnet1Id,ParameterValue=$(aws cloudformation describe-stacks --stack-name SubnetsStack --query "Stacks[0].Outputs[?OutputKey=='PublicSubnet1Id'].OutputValue" --output text) \
ParameterKey=PublicSubnet2Id,ParameterValue=$(aws cloudformation describe-stacks --stack-name SubnetsStack --query "Stacks[0].Outputs[?OutputKey=='PublicSubnet2Id'].OutputValue" --output text) \
ParameterKey=FrontendAutoScalingSecurityGroupId,ParameterValue=$(aws cloudformation describe-stacks --stack-name SecurityGroupsStack --query "Stacks[0].Outputs[?OutputKey=='FrontendAutoScalingSecurityGroupId'].OutputValue" --output text) \
ParameterKey=FrontendTargetGroupArn,ParameterValue=$(aws cloudformation describe-stacks --stack-name LoadBalancerStack --query "Stacks[0].Outputs[?OutputKey=='FrontendTargetGroupArn'].OutputValue" --output text) \
ParameterKey=BackendLoadBalancerDNS,ParameterValue=$(aws cloudformation describe-stacks --stack-name LoadBalancerStack --query "Stacks[0].Outputs[?OutputKey=='BackendLoadBalancerDNS'].OutputValue" --output text) \
--capabilities CAPABILITY_IAM
