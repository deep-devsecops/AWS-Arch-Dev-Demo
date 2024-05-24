AWS Infrastructure Deployment

This repository contains CloudFormation templates for deploying a comprehensive AWS infrastructure setup. The infrastructure includes a VPC, subnets, security groups, load balancers, and Auto Scaling groups for backend and frontend services.

Prerequisites
Before deploying the stacks, ensure you have the following:

AWS CLI installed and configured.

An existing EC2 key pair for SSH access to instances.

Stack Overview

VPC Stack
The VPC stack creates the foundational network infrastructure including a VPC and an Internet Gateway.

Subnet Stack
The Subnet stack creates public and private subnets within the VPC.

Security Group Stack
The Security Group stack sets up the necessary security groups for the backend and frontend instances.

Load Balancer Stack
The Load Balancer stack creates the load balancers and target groups for both backend and frontend services.

Backend Stack
The Backend stack sets up the backend service including an EC2 Auto Scaling group, a Launch Template, IAM roles, and instance profiles.

Frontend Stack
The Frontend stack sets up the frontend service including an EC2 Auto Scaling group and a Launch Template.

Deployment Instructions
Each stack is deployed from its specific folder using a bash.sh script that executes the CloudFormation template. Below are the steps to deploy each stack.

1. Deploy VPC Stack
Navigate to the vpc folder and execute the bash.sh script.

Command:

cd vpc
./bash.sh (it will execute with .yaml file to creating the specific stack)

2. Deploy Subnet Stack
Navigate to the subnet folder and execute the bash.sh script.

Command:
sh
cd ../subnet
./bash.sh(it will execute with .yaml file to creating the specific stack)

3. Deploy Security Group Stack
Navigate to the security-group folder and execute the bash.sh script.

Command:

cd ../security-group
./bash.sh(it will execute with .yaml file to creating the specific stack)

4. Deploy Load Balancer Stack
Navigate to the load-balancer folder and execute the bash.sh script.

Command:

cd ../load-balancer
./bash.sh(it will execute with .yaml file to creating the specific stack)

5. Deploy Backend Stack
Navigate to the backend folder and execute the bash.sh script.

Command:

sh
Copy cod
cd ../backend
./bash.sh
6. Deploy Frontend Stack
Navigate to the frontend folder and execute the bash.sh script.

Command:

sh
Copy code
cd ../frontend
./bash.sh(it will execute with .yaml file to creating the specific stack)

Stack Details

VPC Stack
Creates the VPC and an Internet Gateway.

Resources: VPC, Internet Gateway
Outputs: VpcId, InternetGatewayId

Subnet Stack
Creates the public and private subnets.

Resources: Public and Private Subnets
Outputs: PublicSubnet1Id, PublicSubnet2Id, PrivateSubnet1Id, PrivateSubnet2Id

Security Group Stack
Creates security groups for the backend and frontend instances.

Resources: Backend Security Group, Frontend Security Group
Outputs: BackendSecurityGroupId, FrontendSecurityGroupId

Load Balancer Stack
Creates load balancers and target groups for backend and frontend services.

Resources: Backend Load Balancer, Frontend Load Balancer, Target Groups
Outputs: BackendLoadBalancerDNS, FrontendLoadBalancerDNS, BackendTargetGroupArn, FrontendTargetGroupArn

Backend Stack
Sets up the backend service including an Auto Scaling group, Launch Template, IAM roles, and instance profiles.

Resources: EC2 Auto Scaling Group, Launch Template, IAM Roles, Instance Profiles
Parameters: KeyName, PrivateSubnet1Id, PrivateSubnet2Id, BackendAutoScalingSecurityGroupId, BackendTargetGroupArn, BackendDeployedVersion
Outputs: BackendInstanceProfile, BackendRole, BackendLaunchTemplate, BackendAutoScalingGroup

Frontend Stack
Sets up the frontend service including an Auto Scaling group and Launch Template.

Resources: EC2 Auto Scaling Group, Launch Template
Parameters: KeyName, PublicSubnet1Id, PublicSubnet2Id, FrontendAutoScalingSecurityGroupId, FrontendTargetGroupArn, BackendLoadBalancerDNS
Outputs: FrontendLaunchTemplate, FrontendAutoScalingGroup
Cleanup
To clean up the resources created by these stacks, delete the stacks in the reverse order of their creation:
