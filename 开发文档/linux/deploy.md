# 部署

部署基于 [Kamal](https://kamal-deploy.org/) 实现，Kamal 能够实现从裸机 0 配置快速上线。

## 提示
* 以下所有命令执行前，须进入到项目目录下；

## 首次部署

* 服务器准备:
  * 为 root 账号设置 ssh 登录授权；
  * 安全策略，开放 80/443 端口；
  * [非 root 用户](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user)
* 开始部署：
  * `bin/kamal setup`

## 后续部署

* 拉取最新代码（如需要）：
  * `git pull`
  * 更新子模块：`git submodule update --rebase`
* 更新依赖（如需要）
  * 安装 gems：`bundle install`
  * 安装 js 依赖：`npm install`
* 执行部署：`bin/kamal deploy`

## 部署至其他机器
* `bin/kamal deploy -c config/deploy_other.yml`

## 将部署的服务启动在非 80/433 端口：

* `bin/kamal proxy boot_config set --http_port 8080 --https_port 4431`


## 应用相关 Docker 服务

### 直接使用 docker 启动

```
docker run --detach --restart unless-stopped --env RAILS_ENV="production" --env RAILS_MAX_THREADS="20"  --log-opt max-size="10m" --volume ~/app/acme:/rails/acme --volume ~/app/storage:/rails/storage --publish 3000:3000
```

### Docker 数据持久化目录位于家(linux user)目录的 app 目录下，如有需要可对该目录进行定期备份，包含：
  * storage: 默认为数据所在目录, 取决于 database.yml 配置；
  * tmp/storage: 上传文件所在目录, 取决于 storage.yml 配置;
