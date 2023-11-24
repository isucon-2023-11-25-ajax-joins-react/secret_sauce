## このファイルは、リモートサーバーのrootディレクトリに配置する

#!/bin/bash

DIR="bench_results"

# スクリプトのファイルパスに移動する（どのディレクトリから実行しても冪等な結果になる。）
cd $(dirname $0)/

sudo mkdir -p $DIR

cd /home/isucon/bench

# 以下のbenchコマンドの記述は本番時はいい感じに書き換える
./bench -all-addresses 127.0.0.11 -target 127.0.0.11:443 -tls -jia-service-url http://127.0.0.1:4999 > ${DIR}/bench_output_$(date +"%Y%m%d_%H%M").txt
