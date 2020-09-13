## PHP

php バージョンを7.4にする
```
php -v
brew install php@7.4
```

PATHを通す
```
echo 'export PATH="/usr/local/opt/php@7.4/bin:$PATH"' >> ~/.bash_profile
echo 'export PATH="/usr/local/opt/php@7.4/sbin:$PATH"' >> ~/.bash_profile
```

再起動
```
brew services start php
```

Terminal再起動してphpバージョンを確認
```
php -v
```

## ECCUBEのパッケージをインストール準備

composerをインストール
```
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
```

## ローカル環境コマンド
```
cd etc
sh manage.sh

 <<< local docker >>>
   0 : up
   1 : start
   2 : stop
   3 : remove
 <<< local >>>
  10 : login-mysql
  11 : migration
  12 : db-dump
 <<< ec-cube >>>
  20 : bash
  21 : create-oauth-key
  22 : eccube-install
  23 : plugin-install
  24 : insert-dummy-data
 <<< api >>>
  30 : regist-oauth-client
  31 : token-oauth
  32 : request-api
 <<< other >>>
  90 : api-document
  91 : generate-db-schema

(input on your console)
What is your favorite task? (number):
```
|Task No|Description|
|---|---|
|0|Dockerでコンテナを構築&起動|
|1|Dockerでコンテナを起動|
|2|Dockerでコンテナを停止|
|3|Dockerでコンテナを削除|
|10|Dockerで起動中のDBにログイン|
|11|Dockerで起動中のDBにマイグレーション(DB作成&ユーザ権限追加)|
|12|Dockerで起動中のDBのデータをExport|
|20|Dockerで起動中のEC-CUBEの中身に接続|
|21|OAuth認証キーを作成|
|22|EC-CUBEの初期インストール|
|23|プラグインインストール、インストール時にPlugin Codeを入力|
|24|DBにダミーデータを登録|
|30|OAuthクライアントを作成|
|31|OAuthトークンを取得、Codeは```http://localhost:28080/admin/authorize?response_type=code&client_id=client_identifier&scope=read&state=hogehoge```でログインしてURLに返却されるもの|
|32|31実行後、トークンを取得できるので、そのままこちらを実行し、APIテスト(商品取得)|
|90|InsomniaでExportしたRequestファイルを```etc/resources/insomnia/api.json```として保存し、こちらを実行するとAPIドキュメントが作成される ※実行前に```etc/tools/insomnia-documenter```でnpm iするのをお忘れなく|
|91|Dockerで起動中のDBのスキーマをドキュメントとして生成|

## EC-CUBE

Dockerで起動すると、eccubeフォルダと起動中EC-CUBEコンテナのファイルは常に同期されるので、eccubeフォルダのファイルに対して変更を行うと、即時反映される。

プラグインの開発については```eccube/app/Plugin```で行ってください。

トップ  
http://localhost:28080

管理画面  
http://localhost:28080/admin
