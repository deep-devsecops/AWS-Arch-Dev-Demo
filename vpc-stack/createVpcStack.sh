#!/bin/bash
aws cloudformation create-stack --stack-name VPCStack --template-body file://vpc.yaml
