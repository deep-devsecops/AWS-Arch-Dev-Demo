#!/bin/bash
aws cloudformation create-stack --stack-name WorkShop-BackendStack --profile workshop-admin --template-body file://backend.yaml --parameters \
ParameterKey=KeyName,ParameterValue=workshop \
ParameterKey=PrivateSubnet1Id,ParameterValue=$(aws cloudformation describe-stacks --stack-name WorkShop-SubnetsStack --query "Stacks[0].Outputs[?OutputKey=='PrivateSubnet1Id'].OutputValue" --output text --profile workshop-admin) \
ParameterKey=PrivateSubnet2Id,ParameterValue=$(aws cloudformation describe-stacks --stack-name WorkShop-SubnetsStack --query "Stacks[0].Outputs[?OutputKey=='PrivateSubnet2Id'].OutputValue" --output text --profile workshop-admin) \
ParameterKey=BackendAutoScalingSecurityGroupId,ParameterValue=$(aws cloudformation describe-stacks --stack-name WorkShop-SecurityGroupsStack --query "Stacks[0].Outputs[?OutputKey=='BackendAutoScalingSecurityGroupId'].OutputValue" --output text --profile workshop-admin) \
ParameterKey=BackendTargetGroupArn,ParameterValue=$(aws cloudformation describe-stacks --stack-name WorkShop-LoadBalancerStack --query "Stacks[0].Outputs[?OutputKey=='BackendTargetGroupArn'].OutputValue" --output text --profile workshop-admin) \
ParameterKey=BackendDeployedVersion,ParameterValue=1.0.0 \
ParameterKey=IndexHTMLContent,ParameterValue="Hello From Backend!! You have Deployed Stressed App now asg will spike up and more nodes bring up soon!!" \
--capabilities CAPABILITY_IAM
