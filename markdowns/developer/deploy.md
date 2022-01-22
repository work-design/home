# 部署

## 部署准备
* 配置 bundler
  - `bundle config set --local deployment true`
  - `bundle config set --local path vendor/bundle`
  - `bundle config set --local without development test`
* 配置文件结构
  - 进入irb: `irb`
  - `require './deploy.rb'`
  - 初始化共享文件夹：`Deploy.init_shared_paths`

## 编译静态资源
由于 webpack 的编译比较消耗资源，在服务端编译很容易引起内存紧张，故在本地编译完成之后上传服务端

* 编译：`env RAILS_ENV=staging rake webpacker:compile`
* 上传编译后的静态文件：`scp -rv public/packs webuser@one.work:/var/www/one_work/shared/public`

## 部署
简单起见，未使用 mina 等部署工具，部署过程如下：

* ssh 登陆服务器，进入项目目录；
* 执行：`ruby deploy.rb`

## 设置sidekiq

假设用户为 webuser

1. 将用户的服务常驻：`sudo loginctl enable-linger webuser`
1.1. 查看用户： `sudo loginctl list-users`
2. 在 `~/.config/systemd/user` 目录下创建 `sidekiq.service`
3. 启用 `sidekiq.service`：`systemctl --user enable sidekiq.service`
4. 使用：`systemctl --user status|start|stop sidekiq`
5. 查看日志：`journalctl -n -f -u sidekiq`

说明：如果 service 文件改变之后，执行：`systemctl --user daemon-reload`

