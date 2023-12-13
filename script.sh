#!/bin/bash

# Оновлення та встановлення apache2
apt update -y
apt install apache2 -y

# Зміна параметрів конфігураційного файлу sshd_config для дозволу віддаленого доступу через ssh
sudo sed -i 's/GatewayPorts no/GatewayPorts yes/' /etc/ssh/sshd_config
sudo sed -i 's/#GatewayPorts yes/GatewayPorts yes/' /etc/ssh/sshd_config

# Перезапуск служби ssh
systemctl restart ssh

# Налаштування правил безпеки групи для дозволу вхідного трафіку на порт 9898
aws ec2 authorize-security-group-ingress --group-id sg-0b763d3f870f058ae --protocol tcp --port 9898 --cidr 0.0.0.0/0
