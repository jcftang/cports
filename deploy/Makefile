default: setup

setup:
	ansible-playbook setup.yml -i "192.168.179.254," --verbose --private-key=~/.vagrant.d/insecure_private_key -u vagrant

up:
	ansible-playbook up.yml -i "127.0.0.1," -c local --verbose

destroy:
	ansible-playbook destroy.yml -i "127.0.0.1," -c local --verbose
