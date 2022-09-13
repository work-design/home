# 安装软件

## Fish

* [安装fish](https://launchpad.net/~fish-shell/+archive/ubuntu/release-3)
* [配置](https://fishshell.com/docs/current/tutorial.html#switching-to-fish)
```shell
chsh -s /usr/bin/fish
```

## Nginx
* [pkg安装](http://nginx.org/en/linux_packages.html#Ubuntu)

## Rbenv

* [安装 rbenv](https://github.com/rbenv/rbenv#basic-github-checkout)
* 安装ruby
  * `sudo apt install libreadline-dev`
  * openssl库，ssl安全协议：`sudo apt install libssl-dev`
  * 数据压缩，zlib：`sudo apt install zlib1g-dev`

## Postgresql
* [Ubuntu](https://www.postgresql.org/download/linux/ubuntu)

安装之后，默认创建 postgres 用户，为管理员。

### 新建用户
1. 切换至 postgres 用户：`sudo su postgres`
2. 进入 console：`psql`
3. 新建用户：`CREATE ROLE ubuntu;`，也可以在命令行执行 `createuser ubuntu`
  * 查询新建的角色： `select * from pg_roles;`
  * 给角色登陆权限： `ALTER ROLE ubuntu WITH LOGIN;`
  * 给角色创建数据库权限： `ALTER ROLE ubuntu WITH CREATEDB;`
4. 设置密码：`\password ubuntu`

## Bundle 依赖
* pg: `sudo apt install libpq-dev`
* unf_ext: `sudo apt install g++`
* nio4r: `sudo apt install libev`
* nokogiri: `sudo apt install libxml2-dev libxslt-dev`
* mysql2: `apt install libmysqlclient-dev`

## Rails 准备
* 初始化数据库: `env RAILS_ENV=production bin/rails db:create`

