#!/bin/bash

# コマンドライン引数からSSHキーのパスとホスト名を取得する
SSH_KEY_PATH=$1
REMOTE_HOST=$2

# SSHを使用してリモートマシン上でコマンドを実行する
ssh -i "${SSH_KEY_PATH}" ubuntu@"${REMOTE_HOST}" << 'EOF'
sudo cd ~/
# mainブランチにチェックアウトし、pullする
sudo git checkout main
sudo git pull
# webappサービスの再起動
sudo systemctl disable --now isucondition.ruby.service
sudo systemctl enable --now isucondition.ruby.service
sudo systemctl status isucondition.ruby.service
# mysqlサービスの再起動
sudo systemctl restart mysql.service
# nginxサービスの再起動（nginxを再起動するため、正しいサービス名を指定する）
sudo systemctl restart nginx.service
EOF

