Generate a key pair on master and copy it back to local with

    localhost$ scp ubuntu@master-public-dns:/home/ubuntu/.ssh/id_rsa.pub master_public_key

Create a new `authorized_keys` by combining my AWS key pair with this:

    localhost$ cat .ssh/macbook.pem > authorized_keys
    localhost$ cat master_public_key >> authorized_keys

Copy it across to the slave

    localhost$ scp authorized_keys ubuntu@slave-public-dns:/home/ubuntu/.ssh/authorized_keys

Actually it might be possible to do this more easily with

    localhost$ ssh-copy-id -i master_public_key ubuntu@slave-public-dns
