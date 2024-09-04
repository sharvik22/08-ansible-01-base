#!/bin/bash

echo_red_bold() {
    echo -e "\033[1;31m$1\033[0m"
}

echo_red_bold "Ls Container"
sudo docker container ls

echo_red_bold "Start Container"
sudo docker compose up -d

echo_red_bold "Ls Container"
sudo docker container ls

sleep 20

echo_red_bold "Start Playbook"
sudo ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass

echo_red_bold "Stop Container"
sudo docker stop $(docker ps -a -q)

sleep 20

echo_red_bold "Ls Container"
sudo docker container ls
