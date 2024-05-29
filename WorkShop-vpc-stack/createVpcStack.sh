#!/bin/bash

aws cloudformation create-stack --stack-name WorkShop-VPCStack --template-body file://vpc.yaml --profile workshop-admin
