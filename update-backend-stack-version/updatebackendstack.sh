#!/bin/bash

# Define stack names with WorkShop prefix
STACK_NAME="WorkShop-BackendStack"
SUBNETS_STACK_NAME="WorkShop-SubnetsStack"
SECURITY_GROUPS_STACK_NAME="WorkShop-SecurityGroupsStack"
LOAD_BALANCER_STACK_NAME="WorkShop-LoadBalancerStack"

# Update the stack with the specified parameters
aws cloudformation update-stack --stack-name $STACK_NAME --profile workshop-admin --template-body file://backend.yaml --parameters \
ParameterKey=KeyName,ParameterValue=workshop \
ParameterKey=PrivateSubnet1Id,ParameterValue=$(aws cloudformation describe-stacks --stack-name $SUBNETS_STACK_NAME --query "Stacks[0].Outputs[?OutputKey=='PrivateSubnet1Id'].OutputValue" --output text --profile workshop-admin) \
ParameterKey=PrivateSubnet2Id,ParameterValue=$(aws cloudformation describe-stacks --stack-name $SUBNETS_STACK_NAME --query "Stacks[0].Outputs[?OutputKey=='PrivateSubnet2Id'].OutputValue" --output text --profile workshop-admin) \
ParameterKey=BackendAutoScalingSecurityGroupId,ParameterValue=$(aws cloudformation describe-stacks --stack-name $SECURITY_GROUPS_STACK_NAME --query "Stacks[0].Outputs[?OutputKey=='BackendAutoScalingSecurityGroupId'].OutputValue" --output text --profile workshop-admin) \
ParameterKey=BackendTargetGroupArn,ParameterValue=$(aws cloudformation describe-stacks --stack-name $LOAD_BALANCER_STACK_NAME --query "Stacks[0].Outputs[?OutputKey=='BackendTargetGroupArn'].OutputValue" --output text --profile workshop-admin) \
ParameterKey=BackendDeployedVersion,ParameterValue=2.0.0 \
ParameterKey=IndexHTMLContent,ParameterValue="Hello From Backend!! You have Deployed Version 2.0.0!!" \
--capabilities CAPABILITY_IAM
