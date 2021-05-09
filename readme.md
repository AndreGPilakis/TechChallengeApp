# Servian DevOps Tech Challenge - Tech Challenge App

## Overview
This is Andre's rendition of the Servian Tech Challenge App. The project aims to fully automate the deployment of this application in a manner that meets the criteria specified on the [Assestment page](https://github.com/AndreGPilakis/TechChallengeApp/blob/master/ASSESSMENT.md). This page will detail how I aimed to address all of the assessment criteria.

Disclaimer: I have previously attempted a similar challenge while studying at R.M.I.T as part of a coruse run by [Tom Winses](https://github.com/TWinsnes). If you wish to view that project, you may view it [here](https://github.com/AndreGPilakis/Servian-tech-test-app)

## Dependencies
In order to run this application you will need:
- The latest version of [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html)
- A stable version of [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- valid AWS credentials

## Deployment instructions
To Deploy this application:
- Ensure you have configured valid AWS credentials.
- Clone or download this project via github.
- Unzip the project to your desired directory
- cd to the the extracted directory and navigate to the 'infra' folder
- run `$ make up`
    - This will initialise, plan and apply via terraform and then run our ansible playbook to deploy the server and seed the database.
- To view the application, navigate to the IP address output from the ansible script on port 80 in a web browser. Alternatively, you may enter the load balancer endpoint given from `terraform output`.

## Cleanup
To tear-down the infastructure that was created with ansible: 
- navigate back to the infra folder you ran `$ make up`
- run `$ make down`
    - This will destroy all of the deployed terraform infastructure.
<<<<<<< HEAD

## Architecture overview
### VPC
A VPC has been created and divided into 3 layers: Public for the load balancer, private for the ec2 instance, and data for the database. This has been done so that there is no direct connection from an end user to the ec2 instance or database.

Each layer has been split into 3 availibility zones, this is to help with load balancing under large amounts or stress, or in the event one AWS region goes out.

### Security group
2 security groups have been created, 'allow_http_ssh' has been made to allow http and ssh to the ec2 instance, and 'allow_postgres' has been created to allow access to the database.

### Key pair
A key pair object is created for authentication to the ec2 instance, this looks in the directory `~/.ssh/id_rsa.pub` by default, this will need to be changed if your key is stored somewhere else.

### EC2 instance
An EC2 instance is created, this is what will be hosting the application and serving requests. It is running the latest suitible free linux distribution.

### Load balancer
A load balancer has been created to connect to the EC2 instance, it has a listener attatched to it to target the web VPC which will connect it to the EC2 instance. This is done so that no users have a direct connection to the EC2 instance

### Database
A postgress database is created in order to store the tasks created within the app.
=======
>>>>>>> 3de53a2f5569ec1bd984204e8a84e310e09462bb
