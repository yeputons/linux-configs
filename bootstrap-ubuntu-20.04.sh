#!/bin/bash
set -uexo pipefail

for i in /etc/ssh/ssh_host_*.pub; do ssh-keygen -lf $i; done
 
echo Edit all TODO in this file and re-run && exit 1
hostnamectl set-hostname TODO-HOSTNAME

adduser --disabled-password --gecos "" yeputons
usermod -aG sudo yeputons
[ -d /home/yeputons ]
chmod 750 /home/yeputons
mkdir -p /home/yeputons/.ssh
cat << EOF >>/home/yeputons/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDqSrxU1jizi+ywYfUHrOk1Ttd/ZEzVGZeZKXwVGpWBa2QsH6k/i6xpIi5Lw7xXmZd7FXiA7vjz95pAskXS3ojiDiomG6W9hC+ETToZNna32Sws77+fqv9CW7ocz/8Mvip3rFTLEfwHEJyEQQn++uYMRJGbx0cc6aVmSgo4/FfC/OTplO0MubjGucyIdRiB5OrjotTZVedl41famIkjljumy6/Wim8T1mTc/h+7qjlaa0t2jwRSHr3xOr/uqZT1zdx6u9qh5Zz3vCzoeewqXBfKWJ34DMzZnb8lbfha/3D9Yhqywtoi8iR7XwtSVokhUFIRfMGIcmg5kgBb7d0Afj79uJqYZDlx2YS7JAX4MAHvy1FENev73x2GSfU2LXWewcVVsM2cK7JM9ZfM9+QZ/MPtp1IZQ+eQtZ40NxRkku1O7tvP7MhDh+iUTcyPayHzqQqPB7cMbuxULQjDS6yO8w6IvVcYrFWMR2IEYxwdIGrzbw13yQTe24a8UMAVADsWrFIHsjuPggkxfrEjeroV3RukHMu3mDOwP6MgJP5HBKZ4QUIoTnF4tEOFr4tVZvU8fad0bzqyPZuiEhKlg0Lsiq2ai26cJAPFG7o16WbLpUmM6RwXVkTFixfreWUmdNx8MPhXibLhRrcDKZnAZEYS5PDM9ZDhmfO2z/VUED50psdlXQ== yeputons00
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINCCS9Dpn8Rpny2ginbZfAvjH1Ll7lrLVdAHC2rLwxa0 yeputons06
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICvwkW01HNL5tKM90jWXv520ypP1SMfnJTVYCgEbI9f4 yeputons05
EOF
chown -R yeputons:yeputons /home/yeputons/.ssh

cat << EOF > /etc/ssh/sshd_config.d/00-yeputons.conf
Port 220
PermitRootLogin no
PasswordAuthentication no
EOF
systemctl reload ssh

passwd yeputons
sudo -u yeputons -i ssh-keygen -t ed25519 -C $(hostname)
echo -e '\e[33;1mTEST NEW SSH SETTINGS FIRST!\e[0m'
ssh-keygen -l -E md5 -f /etc/ssh/ssh_host_ecdsa_key
ssh-keygen -l -E sha256 -f /etc/ssh/ssh_host_ecdsa_key

passwd -d root
