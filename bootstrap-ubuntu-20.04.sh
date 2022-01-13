#!/bin/bash
set -uexo pipefail

echo Edit all TODO in this file and re-run && exit 1
hostnamectl set-hostname TODO-HOSTNAME

adduser --disabled-password --gecos "" yeputons
usermod -aG sudo yeputons
[ -d /home/yeputons ]
chmod 750 /home/yeputons
mkdir -p /home/yeputons/.ssh
cat << EOF >>/home/yeputons/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDqSrxU1jizi+ywYfUHrOk1Ttd/ZEzVGZeZKXwVGpWBa2QsH6k/i6xpIi5Lw7xXmZd7FXiA7vjz95pAskXS3ojiDiomG6W9hC+ETToZNna32Sws77+fqv9CW7ocz/8Mvip3rFTLEfwHEJyEQQn++uYMRJGbx0cc6aVmSgo4/FfC/OTplO0MubjGucyIdRiB5OrjotTZVedl41famIkjljumy6/Wim8T1mTc/h+7qjlaa0t2jwRSHr3xOr/uqZT1zdx6u9qh5Zz3vCzoeewqXBfKWJ34DMzZnb8lbfha/3D9Yhqywtoi8iR7XwtSVokhUFIRfMGIcmg5kgBb7d0Afj79uJqYZDlx2YS7JAX4MAHvy1FENev73x2GSfU2LXWewcVVsM2cK7JM9ZfM9+QZ/MPtp1IZQ+eQtZ40NxRkku1O7tvP7MhDh+iUTcyPayHzqQqPB7cMbuxULQjDS6yO8w6IvVcYrFWMR2IEYxwdIGrzbw13yQTe24a8UMAVADsWrFIHsjuPggkxfrEjeroV3RukHMu3mDOwP6MgJP5HBKZ4QUIoTnF4tEOFr4tVZvU8fad0bzqyPZuiEhKlg0Lsiq2ai26cJAPFG7o16WbLpUmM6RwXVkTFixfreWUmdNx8MPhXibLhRrcDKZnAZEYS5PDM9ZDhmfO2z/VUED50psdlXQ== yeputons00
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDClMwxOgdxus1EktyV64J1fr4cZ2X09ZPXYesBV5tfe+LTTiiEfoeBuV2EGu6gM77kdEQVJf5T9VEMJFjrXxsZwC36S2EL4h8vZL0K0dpjAJgVgvgTR2NTJuPF7kbpM2RFvAxmK/a/FTiIGMzStlSKgcssvOds5CY0DXIq1EGubjTf/YP/cE58FA8N8up8os8FCwAX9Ns7XJOvxOht0aUSir90UEumpb4Z9HyLyEFEse8aGUmeO4sQkoZDk+17EhXQ1xd0/PKby7Jakm4t5fRPWSfg80z+w1/ILBoIh1NB6EzQP1CKnFNT8faiCsyq8aGze/Hkrtxox2+cfKnkEuAbY2k8R/mwGI9kUDkCxsY7QgNZzlDIIKyDRy2UXX2I4vL+hkhmXu9xzWXlOD5oPbd2ff1XQZ5R+APd7kcqMzYgZd/noSx5dYS8RyVoAo8XqAAx6pnVevMjkUPwKjdySmRDcDukKSReSoQPuGeCOpOY/sw38DryHhkiu9z7Nk249XU= yeputons05
EOF
chown -R yeputons:yeputons /home/yeputons/.ssh

cat << EOF > /etc/ssh/sshd_config.d/00-yeputons.conf
Port 220
PermitRootLogin no
PasswordAuthentication no
EOF
systemctl reload ssh

passwd yeputons
sudo -u yeputons -i ssh-keygen -t ed25519 -C "TODO@email"
echo -e '\e[33;1mTEST NEW SSH SETTINGS FIRST!\e[0m'
ssh-keygen -l -E md5 -f /etc/ssh/ssh_host_ecdsa_key
ssh-keygen -l -E sha256 -f /etc/ssh/ssh_host_ecdsa_key
