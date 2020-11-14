# sample_docker_vuejs
Vue Cli を含む開発環境、ビルドした資産を Nginx で Docker 化したサーバ環境の、サンプル Docker Compose です。
本リポジトリに、 Vue.js は含めません。

## 開発環境セットアップ方法
```bash
cp .env.docker-compose_example .env
docker-compose up -d
docker-compose exec app bash
vue create .
```

`vue create` で Vue.js プロジェクトを作成すると、本 README.md ファイルは上書きされて内容が消失します。

## サーバ環境セットアップ方法
```bash
cp .env.docker-compose_example .env
```

`.env` を次のように修正してください。

```diff
$ diff -up .env.docker-compose_example .env
--- .env.docker-compose_example 2020-11-14 21:13:48.000000000 +0900
+++ .env        2020-11-14 21:13:59.000000000 +0900
@@ -1,6 +1,6 @@
 COMPOSE_PATH_SEPARATOR=:

 # develop
-COMPOSE_FILE=docker-compose.yml:.devcontainer/docker-compose.yml
+#COMPOSE_FILE=docker-compose.yml:.devcontainer/docker-compose.yml
 # server
-#COMPOSE_FILE=docker-compose.yml:docker-compose.server.yml
+COMPOSE_FILE=docker-compose.yml:docker-compose.server.yml
$
```

続いて、イメージをビルドし、コンテナを起動します。

```bash
docker-compose up -d
```
