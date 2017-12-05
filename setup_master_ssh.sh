echo Creating keys on master and copying to slave
ssh ubuntu@master 'ssh-keygen -f ~/.ssh/id_rsa -t rsa -P ""'
scp ubuntu@master:/home/ubuntu/.ssh/id_rsa.pub master_key.pub
ssh-copy-id -f -i master_key ubuntu@slave0
ssh-copy-id -f -i master_key ubuntu@slave1
