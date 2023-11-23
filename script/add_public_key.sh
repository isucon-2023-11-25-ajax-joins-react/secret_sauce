#!/bin/bash

# コマンドライン引数からSSHキーのパスとホスト名を取得する
SSH_KEY_PATH=$1
REMOTE_HOST=$2

# SSHを使用してリモートマシン上でcurlコマンドを実行する
ssh -i "${SSH_KEY_PATH}" ubuntu@"${REMOTE_HOST}" << 'EOF'
sudo su isucon
curl https://github.com/{Ochi-Shoichi5539,kouki-isoya,fkejrr}.keys >> ~/.ssh/authorized_keys
EOF
