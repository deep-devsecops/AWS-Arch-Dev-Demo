#!/bin/bash
aws cloudformation create-stack --stack-name WorkShop-BackendStack --template-body file://backend.yaml --parameters \
ParameterKey=KeyName,ParameterValue=key \
ParameterKey=PrivateSubnet1Id,ParameterValue=$(aws cloudformation describe-stacks --stack-name WorkShop-SubnetsStack --query "Stacks[0].Outputs[?OutputKey=='PrivateSubnet1Id'].OutputValue" --output text) \
ParameterKey=PrivateSubnet2Id,ParameterValue=$(aws cloudformation describe-stacks --stack-name WorkShop-SubnetsStack --query "Stacks[0].Outputs[?OutputKey=='PrivateSubnet2Id'].OutputValue" --output text) \
ParameterKey=BackendAutoScalingSecurityGroupId,ParameterValue=$(aws cloudformation describe-stacks --stack-name WorkShop-SecurityGroupsStack --query "Stacks[0].Outputs[?OutputKey=='BackendAutoScalingSecurityGroupId'].OutputValue" --output text) \
ParameterKey=BackendTargetGroupArn,ParameterValue=$(aws cloudformation describe-stacks --stack-name WorkShop-LoadBalancerStack --query "Stacks[0].Outputs[?OutputKey=='BackendTargetGroupArn'].OutputValue" --output text) \
ParameterKey=BackendDeployedVersion,ParameterValue=1.0.0 \
ParameterKey=IndexHTMLContent,ParameterValue="Hello From Backend!! You have Deployed Stressed App now asg will spike up and more nodes bring up soon!!" \
--capabilities CAPABILITY_IAM

