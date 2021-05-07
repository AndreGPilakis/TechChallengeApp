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
