# 新机器部署 Rails 程序步骤

## 新建用户

```bash
# 新建一个用户
useradd -m -s /usr/bin/zsh webuser

# 设置密码
passwd webuser

# 将用户放到sudors列表
```

## Install Dependencies

- git
- curl
- nodejs

## 安装软件
- postgresql

#### 设置 Postgresql

```bash
su postgres  # 选择 `postgres` 账户

psql  #

create user <username> with password '<password>'
create database <db_name>;
grant all privileges on database <db_name> to <username>;
```

## Install Nginx
```bash
  wget https://github.com/agentzh/headers-more-nginx-module/archive/v0.23.tar.gz -O headers-more-nginx-module-0.23.tar.gz
  wget http://ftp.cs.stanford.edu/pub/exim/pcre/pcre-8.31.tar.gz
  wget http://nginx.org/download/nginx-1.9.3.tar.gz

  ./configure --prefix=/usr/local/nginx --with-http_ssl_module --with-http_gzip_static_module --with-cc-opt=-Wno-error --add-module=/home/ubuntu/source/headers-more-nginx-module-0.23 --with-pcre=/home/ubuntu/source/pcre-8.31    --add-module=/usr/local/ruby/lib/ruby/gems/2.2.0/gems/passenger-5.0.14/ext/nginx --with-http_spdy_module
  make
  make install
```

#### 设置nginx
```bash
  cp API/deploy/nginx/nginx.conf /usr/local/nginx/conf/nginx.conf
```

#### 设置启动脚本
```
  cp API/deploy/startup_scripts/default /etc/default/nginx
  cp API/deploy/startup_scripts/nginx /etc/init.d/nginx
  chmod 0755 /etc/init.d/nginx
  sudo update-rc.d -f nginx defaults
  sudo /etc/init.d/nginx start
```

#### Mina
#### deploy staging
```bash
  mina deploy
```

#### config your mina envionment
1. 通过ssh连接至服务器(ssh to server without password)

- 将你本机`~/.ssh/id_rsa.pub`添加到服务器`~/.ssh/authorized_keys`

2. 设置ssh代理连接, 即让服务器可以使用你本机的ssh key去登陆或者通过ssh连接获取git文档

- 配置ssh, 配置文件为 `~/.ssh/config`, 如果没有则新建这个文件, 配置内容如下;

```
Host 121.42.26.180 120.27.94.250
  ForwardAgent yes
```
其中, Host是你允许使用你本机ssh连接的服务器,如果有多个,用空格隔开

- 确保你本机的 ssh-agent服务已经启动

```bash
echo $SSH_AUTH_SOCK
```

- 允许 ssh-agent 使用你的ssh key

```bash
ssh-add ~/.ssh/id_rsa # 临时, 在mac中, 重启之后就失效了
ssh-add -K ~/.ssh/id_rsa # 永久, for mac
ssh-add -l # 检测是否添加成功
```

- 登陆到服务器, 测试ssh连接, 这一步很重要,因为将将你测试的地址添加到服务器的 known_hosts 文件中

```
ssh -T git@git.coding.net
ssh -T git@github.com
```


#### 参考资料
[SSH agent forward](https://developer.github.com/guides/using-ssh-agent-forwarding/)
