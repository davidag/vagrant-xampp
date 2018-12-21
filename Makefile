
.PHONY: start
start:
	vagrant up 

.PHONY: stop
stop:
	vagrant ssh -c 'sudo shutdown -h now'

.PHONY: restart 
restart:
	vagrant ssh -c 'sudo shutdown -r now'

.PHONY: sync
sync:
	vagrant rsync

.PHONY: ssh
ssh:
	vagrant ssh

.PHONY: reset-full
reset-full:
	vagrant destroy
	vagrant up
