# Githubのキーペアを使用してSSHログインできるようにする
## Githubの公開鍵をリモートサーバーに登録する
以下のようにシェルスクリプトを実行し、
(コピペしてスクリプトを使用する場合は、シェルスクリプトをchmodする必要があります。)
```bash
# 第一引数に秘密鍵のパス、第二引数に接続先となるホスト名を指定して実行する
$ script/add_public_key.sh ~/Downloads/isucon12-qualify.pem ec2-54-249-200-162.ap-northeast-1.compute.amazonaws.com
```
## Githubの秘密鍵を用いてリモートサーバーにSSH接続する
以下のコマンドでログインできるようになります。
```bash
$ ssh isucon@ec2-54-249-200-162.ap-northeast-1.compute.amazonaws.com
```
