#!/bin/bash
aws cloudformation create-stack --stack-name WorkShop-FrontendStack --profile workshop-admin --template-body file://frontend.yaml --parameters \
ParameterKey=KeyName,ParameterValue=workshop \
ParameterKey=PrivateSubnet1Id,ParameterValue=$(aws cloudformation describe-stacks --stack-name WorkShop-SubnetsStack --query "Stacks[0].Outputs[?OutputKey=='PrivateSubnet1Id'].OutputValue" --output text --profile workshop-admin) \
ParameterKey=PrivateSubnet2Id,ParameterValue=$(aws cloudformation describe-stacks --stack-name WorkShop-SubnetsStack --query "Stacks[0].Outputs[?OutputKey=='PrivateSubnet2Id'].OutputValue" --output text --profile workshop-admin) \
ParameterKey=FrontendAutoScalingSecurityGroupId,ParameterValue=$(aws cloudformation describe-stacks --stack-name WorkShop-SecurityGroupsStack --query "Stacks[0].Outputs[?OutputKey=='FrontendAutoScalingSecurityGroupId'].OutputValue" --output text --profile workshop-admin) \
ParameterKey=FrontendTargetGroupArn,ParameterValue=$(aws cloudformation describe-stacks --stack-name WorkShop-LoadBalancerStack --query "Stacks[0].Outputs[?OutputKey=='FrontendTargetGroupArn'].OutputValue" --output text --profile workshop-admin) \
ParameterKey=BackendLoadBalancerDNS,ParameterValue=$(aws cloudformation describe-stacks --stack-name WorkShop-LoadBalancerStack --query "Stacks[0].Outputs[?OutputKey=='BackendLoadBalancerDNS'].OutputValue" --output text --profile workshop-admin) \
--capabilities CAPABILITY_NAMED_IAM
