# Assessment

Bellow is the outlined grading criteria, and how I aimed to address each criteria.

## Assessment Grading Criteria

### Key Criteria

Candidates should take care to ensure that their submission meets the following criteria:

- Must be able to start from a cloned git repo.
    - You can run the make file as soon as you clone the repo.
- Must document any pre-requisites clearly.
    - This has been done in this document.
- Must be contained within a GitHub repository.
    - code can be pulled from https://github.com/AndreGPilakis/TechChallengeApp
- Must deploy via an automated process.
    - Code is deployed automatically via ansible. I did not notice the circleci files were in there until after I had completed the project. I was slightly out of time, So i figured the ansible deployment method was suitible.
- Must deploy infrastructure using code.
    - All infrastructure is deployed and managed via terraform and ansible.
### Grading

#### Coding Style

- Clarity of code
    - Code has been kept as clean and clear as possible.
- Comments where relevant
    - Comments where anything is confusing.
- Consistency of Coding
    - Same naming conentions have been followed throughout project.

#### Security
- Network segmentation (if applicable to the implementation)
    - App has been deployed onto a VPC with 3 layers, Public, Private and data. This allowed the LB, EC2 Instance and DB to function on different subnets.
- Secret storage
    TODO
- Platform security features
    - I wasn't too sure what was meant by this, however security features include a key pair being generated in order to access the EC2 instance, and the postgress database is secured via a password.

#### Simplicity
- No superfluous dependencies
    - Nothing other than terraform, ansible and make is required to run this.
- Do not overengineer the solution
    - Have tried to keep it as simple as possible, Nothing outrageous is being done.

#### Resiliency

- Auto scaling and highly available frontend
    - No real autoscaling, LB with multiple availibility zones has been used incase of failover.
- Highly available Database
    - Database is highly availible.
