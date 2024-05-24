#!/bin/bash
aws cloudformation create-stack \
    --stack-name BackendStack \
    --template-body file://backend.yaml \
    --parameters ParameterKey=KeyName,ParameterValue=your-key-name \
                 ParameterKey=PrivateSubnet1Id,ParameterValue=subnet-xxxxxxxx \
                 ParameterKey=PrivateSubnet2Id,ParameterValue=subnet-xxxxxxxx \
                 ParameterKey=BackendAutoScalingSecurityGroupId,ParameterValue=sg-xxxxxxxx \
                 ParameterKey=BackendTargetGroupArn,ParameterValue=arn:aws:elasticloadbalancing:region:account-id:targetgroup/target-group-name/xxxxxxxxxxxx \
                 ParameterKey=BackendDeployedVersion,ParameterValue=1.0.0 \
                 ParameterKey=IndexHTMLContent,ParameterValue="Hello From Backend!! You have Deployed Version 1.0.0;"
