#!/bin/bash
set +ex

echo "all:" > inventory.yml 
echo "  hosts:" >> inventory.yml 
echo "    \"$(cd ../infra && terraform output instance_public_ip)\"" >> inventory.yml
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory.yml -e 'record_host_keys=True' -u ec2-user --private-key ../keys/ec2-key  ../ansible/playbook.yml
