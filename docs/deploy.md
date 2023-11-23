# デプロイの手順
## 1. ローカルでコードを変更し、Githubリポジトリ上でPRを作成する
## 2. approved後、deploy用のシェルスクリプトを実行する
以下のように、シェルスクリプトを実行してください。
```bash
# 第一引数に秘密鍵のパス、第二引数に接続先となるホスト名を指定して実行する
bash deploy.sh ~/Downloads/isucon12-qualify.pem ec2-3-112-67-40.ap-northeast-1.compute.amazonaws.com
```
## 3. リモートサーバーにSSH接続して、実際に差分が反映されているか確認
確認方法は、`git log`コマンドがいいかと思います。
