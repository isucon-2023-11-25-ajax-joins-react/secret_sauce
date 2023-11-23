# Tips

## EXPLAINの見方
[こちら](https://nishinatoshiharu.com/explain_overview/)の記事が参考になります。
isuconでは基本的には以下の項目が重要です。

|項目|見るポイント|
|--|--|
|type(結合型)|一番早いのがconstで、const -> eq_ref -> ref -> range -> index -> allの順。index(フルインデックススキャン)やall(フルテーブルスキャン)は要改善|
|possible_keys(選択可能なインデックス)|ここにindexがなければそもそも利用可能なindexが存在しないので追加を検討する。ここにあってもkeysになければ利用されるように工夫が必要(mysqlバージョンの違いによる動作の差異の確認や強制的にindexを使用するように指定など)|
|key(選択されたインデックス)|意図したインデックスが選択されていることを確認する|
|Extra|Using filesort(order byでインデックス適用できていない等)とUsing Temporary(JOINしたデータが大きく一時テーブルが作成されている等)が出ていたら要改善|

## topコマンドの見方
isuconでは主にCPU利用割合が重要です。
topコマンドを実行するとCPU利用割合については以下のように表示されます。

```
...
%Cpu(s):  0.0 us,  0.3 sy,  0.0 ni, 99.0 id,  0.3 wa,  0.0 hi,  0.0 si,  0.3 st
...
```

特に重要なのは`us(ユーザプロセス使用割合)`と`id(アイドル状態)`です。(usはコア数によっては100を超えます。）
ベンチマークの点数があがらないうちにusが高ければ、CPUがボトルネックになっている可能性があります。
また、idが大きい場合はより多くの処理をCPUにさせることでベンチマークの点数が上がる可能性があります。


そのほか、`htop`コマンドを利用すると少しグラフィカルにCPU利用割合を確認することができます。
```
$ sudo apt-get install htop
$ htop
```
 
## pt-query-digestの見方
mysqlが出力したスロークエリログをpt-query-digestで解析してみることができます。

重要なのは、以下の項目で表示される重いクエリのランキングです。
```
# Profile
# Rank Query ID           Response time Calls R/Call V/M   Item
```

クエリの詳細は下部に記載が続いているので、それを確認しながらクエリ改善していきます。

## alpの見方
nginxが出力したアクセスログをalpで解析してみることができます。

オプションなしで実行すると横に長く見にくいので、表示カラムを絞ると良いです。

```
$ alp json --file log_file -o count,method,uri,min,avg,max
```
countはログファイル中でのアクセス回数、min, avg, maxはかかった秒数です。

## ブランチの切り方
作業ブランチでスコア改善をした際、pushする前にブランチ名にスコアの点数を付けておくのも良いと思います。
