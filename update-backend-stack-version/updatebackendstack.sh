#!/bin/bash

aws cloudformation update-stack --stack-name BackendStack --template-body file://backend.yaml --parameters \
ParameterKey=KeyName,ParameterValue=key \
ParameterKey=PrivateSubnet1Id,ParameterValue=$(aws cloudformation describe-stacks --stack-name SubnetsStack --query "Stacks[0].Outputs[?OutputKey=='PrivateSubnet1Id'].OutputValue" --output text) \
ParameterKey=PrivateSubnet2Id,ParameterValue=$(aws cloudformation describe-stacks --stack-name SubnetsStack --query "Stacks[0].Outputs[?OutputKey=='PrivateSubnet2Id'].OutputValue" --output text) \
ParameterKey=BackendAutoScalingSecurityGroupId,ParameterValue=$(aws cloudformation describe-stacks --stack-name SecurityGroupsStack --query "Stacks[0].Outputs[?OutputKey=='BackendAutoScalingSecurityGroupId'].OutputValue" --output text) \
ParameterKey=BackendTargetGroupArn,ParameterValue=$(aws cloudformation describe-stacks --stack-name LoadBalancerStack --query "Stacks[0].Outputs[?OutputKey=='BackendTargetGroupArn'].OutputValue" --output text) \
ParameterKey=BackendDeployedVersion,ParameterValue=2.0.0 \
ParameterKey=IndexHTMLContent,ParameterValue="Hello From Backend!! You have Deployed Version 2.0.0!!" \
--capabilities CAPABILITY_IAM

